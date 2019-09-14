package wp.util;

class Util {

  macro public static function buffer(e:haxe.macro.Expr):haxe.macro.Expr {
    return macro {
      php.Syntax.code('ob_start()');
      $e;
      php.Syntax.code('ob_end_flush()');
    }
  }

}
