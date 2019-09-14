package wp.parser;

import wp.parser.Info.InfoAccess;

using wp.parser.NameTools;

enum GeneratorMode {
  ModeClass(name:String);
  ModeApi;
  ModeNone;
}

class Generator {
  
  static final ucase:EReg = ~/[A-Z]/g;
  static final typeMap:haxe.ds.Map<String, String> = [
    'array' => 'php.NativeArray',
    'int' => 'Int',
    'integer' => 'Int',
    'float' => 'Int',
    'bool' => 'Bool',
    'boolean' => 'Bool',
    'true' => 'Bool',
    'false' => 'Bool',
    'string' => 'String',
    'mixed' => 'Dynamic',
    'null' => 'Void',
    'void' => 'Void',
    'object' => 'Dynamic',
    'callable' => 'Dynamic',
    'resource' => 'Dynamic',
    'stdClass' => 'Dynamic',
  ];
  static final nameMap:haxe.ds.Map<String, String> = [
    'operator' => 'operator_',
    'class' => 'class_',
    'public' => 'public_',
    'private' => 'private_',
    'function' => 'function_',
    'var' => 'var_',
  ];
  final info:Info;
  final fileName:String;
  var mode:GeneratorMode = ModeNone;
  var append:Array<Output> = [];

  public function new(info:Info, fileName:String) {
    this.info = info;
    this.fileName = fileName;
  }

  public function generate():Array<Output> {
    append = [];
    return [ generateInfo(info) ].concat(append);
  }

  function generateInfo(info:Info):Output {
    return switch info.kind {
      case ClassInfo(methods):
        var name = info.name.toHxClassName();
        mode = ModeClass(name);
        var content = [
          'package wp.extern;',
          '',
          '@:native("${info.name}")',
          'extern class ${name} {',
          [ for (info in methods) generateMethod(info) ]
            .filter(n -> n != null)
            .join('\n'),
          '}',
          ''
        ].join('\n');
        { name: name, content: content };
      case ApiInfo(methods):
        var name = fileName.toHxClassNameFromFileName();
        mode = ModeApi;
        var content = [
          'package wp.extern;',
          '',
          'extern class ${name} implements wp.util.ApiFunctions {',
          [ for (info in methods) generateMethod(info) ]
            .filter(n -> n != null)
            .join('\n'),
          '}',
          ''
        ].join('\n');
        { name: name, content: content };
      default:
        throw 'Top-level info must be ApiInfo or ClassInfo';
    }
  }

  function generateMethod(info:Info) {
    if (info == null) return null;
    var markNative = false;

    var name = switch mode {
      case ModeClass(cls): 
        markNative = true;
        info.name.toHxFieldName(cls);
      default:
        info.name;
    }

    if (nameMap.exists(name)) {
      markNative = true;
      name = nameMap.get(name);
    }

    if (info.name == '__construct') {
      switch mode {
        case ModeApi: return null;
        default:
      }
      markNative = false;
      name = 'new';
    }

    return switch info.kind {
      case ClassInfo(_) | ApiInfo(_):
        var currentMode = mode;
        append.push(generateInfo(info));
        mode = currentMode;
        null;
      case VarInfo(type, access): 
        switch mode {
          case ModeApi: return null;
          default: 
        }
        if (access.indexOf(InfoAccess.Private) > -1) return null;
        if (access.length == 0) access = [ InfoAccess.Public ];
        generateDoc(info.doc) + if (markNative)
          '\n  @:native("${info.name}") ${access.join(' ')} var ${name}:${generateType(type)};'
        else 
          '\n  ${access.join(' ')} var ${name}:${generateType(type)};';
      case FuncInfo(args, ret, access):
        if (access.indexOf(InfoAccess.Private) > -1) return null;
        if (access.length == 0) access = [ InfoAccess.Public ];
        var decl = if (markNative)
          '@:native("${info.name}") ${access.join(' ')} function ${name}'
        else 
          '${access.join(' ')} function ${name}';
        return generateDoc(info.doc) + '\n  ${decl}(${ [
          for (arg in args) generateArg(arg)
        ].join(', ') }):${generateType(ret, true)};';
    }
  }

  function generateDoc(doc:String) {
    return '  /**\n' + doc
      .split('\n')
      .map(s -> '    ${s}')
      .join('\n') + '\n  **/';
  }
  
  function generateArg(arg:Info.InfoArgument) {
    var name = nameMap.exists(arg.name)
      ? nameMap.get(arg.name)
      : arg.name;
    var out = '${name}:${generateType(arg.type)}';
    if (arg.defaultValue == 'array' || ucase.match(arg.defaultValue)) {
      arg.defaultValue = null;
    }
    if (arg.isOptional && arg.defaultValue == null) {
      out = '?' + out;
    }
    if (arg.defaultValue != null) {
      // if (ucase.match(arg.defaultValue)) {
      //   out += ' = php.Global.constant("${arg.defaultValue}")';
      // } else {
        out += ' = ${arg.defaultValue}';
      // }
    }
    return out;
  }

  function generateType(type:Info.InfoType, isRet:Bool = false) {
    if (type == null) return isRet ? 'Void' : 'Dynamic';
    return switch type {
      case TypeBasic(id):
        if (id == 'array' && !isRet) {
          // Special case for args
          return 'php.NativeStructArray<Dynamic>';
        }
        if (typeMap.exists(id)) {
          var type = typeMap.get(id);
          if (!isRet && type == 'Void') return 'Dynamic';
          return type;
        }
        if (id.isWpClass()) return id.toQualifiedHxClassName();
        return id;
      case TypeArray(id):
        return 'php.NativeIndexedArray<${generateType(TypeBasic(id))}>';
      case TypeMixed(a, b):
        var ta = generateType(a, true);
        var tb = generateType(b, true);
        if (ta == 'Void') {
          return tb;
        }
        if (tb == 'Void') {
          return ta;
        }
        return 'haxe.extern.EitherType<${generateType(a)}, ${generateType(b)}>';
    }
  }

}
