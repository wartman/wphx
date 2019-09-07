package wp.util;

#if !macro
  import haxe.extern.EitherType;

  using tink.CoreApi;
#end

class Util {

  macro public static function buffer(e:haxe.macro.Expr):haxe.macro.Expr {
    return macro {
      php.Syntax.code('ob_start()');
      $e;
      php.Syntax.code('ob_end_flush()');
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

  #if !macro

    public static function toOutcome<T>(either:EitherType<T, WpError>):Outcome<T, WpError> {
      if (Std.is(either, wp.WpError)) {
        return Failure(either);
      }
      return Success(either);
    }

  #end

}
