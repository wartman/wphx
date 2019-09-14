package wp.parser;

import wp.parser.Info.InfoAccess;

using Lambda;
using StringTools;

class Parser {

  final source:String;
  var position:Int = 0;

  public function new(source:String) {
    this.source = source;
  }

  public function parse():Info {
    position = 0;
    var top = parseInfo();
    if (top == null) {
      var methods = [ while (!isAtEnd()) parseInfo() ].filter(i -> i != null);
      if (methods.length == 1) switch methods[0].kind {
        case ClassInfo(_): return methods[0];
        default:
      }
      return {
        name: null,
        doc: null,
        kind: ApiInfo(methods)
      };
    }
    return top;
  }

  function parseInfo() {
    if (match('/**')) {
      return info();
    }
    advance();
    return null;
  }

  function info():Info {
    var name:String = '';
    var args:Array<Info.InfoArgument> = [];
    var ret:Info.InfoType = null;
    var start = position;

    while (!match('*/') && !isAtEnd()) {
      if (match('@param')) {
        args.push(arg());
      } else if (match('@var')) {
        whitespace();
        ret = type();
      } else if (match('@return')) {
        ret = this.ret(); 
      } else {
        advance();
      }
    }

    var doc = getDoc(start, position - 2);

    whitespace();

    if (peek() == '/**') {
      return info();
    }

    ignore([ 'final' ]);
    if (match('class')) {
      whitespace();
      name = ident();
      while(!match('{') && !isAtEnd()) advance();
      whitespace();
      return {
        name: name,
        doc: doc,
        kind: ClassInfo([ while (!isAtEnd()) parseInfo() ].filter(i -> i != null)),
      } 
    }

    var access:Array<Info.InfoAccess> = access();
    whitespace();

    if (match('$') && access.length > 0) {
      var name = ident();
      return {
        name: name,
        doc: doc,
        kind: VarInfo(ret, access)
      };
    } else if (match('function')) {
      whitespace();
      while (peek() != '(' && !isAtEnd()) {
        name += advance();
      }
      whitespace();
      if (match('(')) while (!match(')') && !isAtEnd()) {
        realArg(args);
        if (!match(',')) break;
      }
      return {
        name: name,
        doc: doc,
        kind: FuncInfo(args, ret, access)
      };
    }
    
    return null;
  }

  function access() {
    var out:Array<Info.InfoAccess> = [];
    while (!isAtEnd()) {
      whitespace();
      if (match(InfoAccess.Public)) out.push(InfoAccess.Public);
      else if (match(InfoAccess.Private)) out.push(InfoAccess.Private);
      else if (match('protected')) out.push(InfoAccess.Private);
      else if (match(InfoAccess.Static)) out.push(InfoAccess.Static);
      else break;
    }
    return out;
  }

  function getDoc(start:Int, end:Int) {
    return source.substring(start, end)
      .split('\n')
      .map(s -> {
        s = s.trim();
        if (s.startsWith('*')) {
          s = s.substr(1);
        }
        return s;
      })
      .join('\n');
  }

  function realArg(args:Array<Info.InfoArgument>) {
    whitespace();
    if (!match('$')) return false;
    var name = ident();
    if (name.length == 0) return false;
    var arg = args.find(f -> f.name == name);
    if (arg == null) {
      arg = {
        name: name,
        type: null,
        defaultValue: null,
        isOptional: false
      };
      args.push(arg);
    }
    whitespace();
    if (match('=')) {
      whitespace();
      arg.isOptional = true;
      arg.defaultValue = value(); 
    }
    return true;
  }

  function value() {
    if (match('"')) return '"' + str('"') + '"';
    if (match("'")) return "'" + str("'") + "'";
    var value = ident();
    match('()'); // consume if needed -- for things like 'array()'
    return value;
  }

  function str(delimiter:String) {
    return [ while (!match(delimiter) && !isAtEnd()) advance() ].join('');
  }

  function arg():Info.InfoArgument {
    var arg:Info.InfoArgument = {
      name: '',
      type: null,
      defaultValue: null,
      isOptional: false
    };
    whitespace();
    arg.type = type();
    whitespace();
    if (match('$')) {
      arg.name = ident();
    } else {
      arg.name = '<annon>';
    }
    return arg;
  }

  function type():Info.InfoType {
    var name = ident();
    var t:Info.InfoType = if (match('[]')) {
      TypeArray(name);
    } else {
      TypeBasic(name);
    }
    if (match('|')) {
      return TypeMixed(t, type());
    }
    return t;
  }

  function ret() {
    whitespace();
    return type();
  }

  function ident() {
    return [ 
      while (isAlphaNumeric(peek()) && !isAtEnd()) advance() 
    ].join('');
  }

  function whitespace() {
    while (isWhitespace(peek()) && !isAtEnd()) advance();
  }

  function isWhitespace(c:String) {
    return c == ' ' || c == '\n' || c == '\r' || c == '\t';
  }

  function isDigit(c:String):Bool {
    return c >= '0' && c <= '9';
  }

  function isUcAlpha(c:String):Bool {
    return (c >= 'A' && c <= 'Z');
  }

  function isAlpha(c:String):Bool {
    return (c >= 'a' && c <= 'z') ||
           (c >= 'A' && c <= 'Z') ||
            c == '_';
  }

  function isAlphaNumeric(c:String) {
    return isAlpha(c) || isDigit(c);
  }

  function ignore(names:Array<String>) {
    for (name in names) {
      match(name);
      whitespace();
    }
  }

  function match(value:String) {
    var check = source.substr(position, value.length);
    if (check == value) {
      position = position + value.length;
      return true;
    }
    return false;
  }

  function peek() {
    return source.charAt(position);
  }

  function advance() {
    if (!isAtEnd()) position++;
    return previous();
  }

  function previous() {
    return source.charAt(position - 1);
  }

  function isAtEnd() {
    return position == source.length;
  }

  function error(msg:String) {
    trace(source.substr(position - 100, 200));
    throw msg;
  } 

}
