package wp.parser;

using StringTools;
using haxe.io.Path;

class NameTools {
  
  public static function toHxClassName(name:String) {
    if (name.startsWith('WP_')) {
      name = name.substr(3);
    }
    return name.split('_').join('');
  }

  public static function toQualifiedHxClassName(name:String) {
    return 'wp.extern.${toHxClassName(name)}';
  }

  public static function isWpClass(name:String) {
    return name.startsWith('WP_');
  }

  public static function toHxFieldName(field:String, ?cls:String) {
    if (field == 'ID') {
      return 'id';
    }
    var prefix = '';
    if (cls != null) {
      prefix = cls.toLowerCase() + '_';
    }
    if (field.startsWith(prefix)) {
      field = field.substr(prefix.length);
    }
    return toCammelCase(field);
  }

  public static function toCammelCase(str:String) {
    if (str.startsWith('__')) {
      return '__' + toCammelCase(str.substr(2));
    }

    if (str.startsWith('_')) {
      return '_' + toCammelCase(str.substr(1));
    }

    var parts = str.split('_');
    var first = parts.shift();
    if (parts.length == 0) {
      return first;
    }

    var out = parts.map(part -> {
      return part.charAt(0).toUpperCase() + part.substring(1);
    }).join('');

    return first + out;
  }

  public static function toHxClassNameFromFileName(name:String) {
    var isClass = false;
    if (name.startsWith('class.') || name.startsWith('class-')) {
      isClass = true;
      name = name.substr(6);
    }
    if (name.startsWith('functions.')) {
      name = toCammelCase('Functions_' + name.substr('functions.'.length));
    }
    return name
      .withoutExtension()
      .split('-')
      .map(n -> {
        n.charAt(0).toUpperCase() + n.substr(1);
      }).join('') + (isClass ? '' : 'Api');
  }

}
