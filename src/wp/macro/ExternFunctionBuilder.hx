package wp.macro;

import haxe.macro.Expr;
import haxe.macro.Context;

using Lambda;
using haxe.macro.Tools;
using wp.util.Util;

class ExternFunctionBuilder {

  public static function build() {
    var fields:Array<Field> = Context.getBuildFields();

    return fields.map(function (field) switch (field.kind) {
      case FFun(f):
        // var meta = field.meta.find(function (m) return m.name == ':target');
        // if (meta == null) return field;
        // if (meta.params.length == 0) {
        //   Context.error('@:target requires a target name', field.pos);
        // }

        var meta = field.meta.find(m -> m.name == ':skip');
        if (meta != null) return field;

        var target = field.name;
        var args:Array<Expr> = f.args.map(function (a) {
          return { expr: EConst(CIdent(a.name)), pos: field.pos };
        });
        var code = target + '(' + [for (index in 0...f.args.length) "{" + index + "}"].join(', ') + ')';
        args.unshift({ expr: EConst(CString(code)), pos: field.pos });
        f.expr = macro return cast php.Syntax.code($a{args});
        
        field.name = target.toCammelCase();
        field.access = [ AStatic, AInline, APublic ];
        
        return field;
      default: return field;
    });
  }

}
