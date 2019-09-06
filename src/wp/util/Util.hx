package wp.util;

#if macro
  import haxe.macro.Expr;
#end

using StringTools;

class Util {

  macro public static function buffer(e:Expr):Expr {
    return macro {
      php.Syntax.code('ob_start()');
      $e;
      return php.Syntax.code('ob_end_flush()');
    }
  }

  public static function toCammelCase(str:String) {
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

}
