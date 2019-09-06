package wp.core.macro;

import haxe.macro.Expr;
import haxe.macro.Context;

using Lambda;
using haxe.macro.Tools;

class ExternFunctionBuilder {

  public static function build() {
    var fields:Array<Field> = Context.getBuildFields();

    return fields.map(function (field) switch (field.kind) {
      case FFun(f):
        var meta = field.meta.find(function (m) return m.name == ':target');
        if (meta == null) return field;
        if (meta.params.length == 0) {
          Context.error('@:target requires a target name', field.pos);
        }

        var target = meta.params[0];
        switch (target.expr) {
          case EConst(CString(_)):
            var args:Array<Expr> = f.args.map(function (a) {
              return { expr: EConst(CIdent(a.name)), pos: target.pos };
            });
            args.unshift(target);
            f.expr = macro return (untyped __call__($a{args}));
            field.access = field.access.concat([ AStatic, AInline ]);
            return field;
          default: 
            Context.error('@:target may only contain strings', target.pos);
            return field;
        }
      default: return field;
    });
  }

}
