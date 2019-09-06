package wp.core.macro;

import haxe.macro.Expr;
import haxe.macro.Context;

using Lambda;

class ComponentBuilder {

  public static function build() {
    var fields:Array<Field> = Context.getBuildFields();
    var registerBody:Array<Expr> = [];

    fields = fields.map(function (field) switch (field.kind) {
      case FFun(f):
        var meta = field.meta.find(function (m) return m.name == ':on');
        if (meta != null) {
          if (meta.params.length == 0) {
            Context.error('@:on requires an action name', field.pos);
          }
          
          var tag = meta.params[0];
          switch (tag.expr) {
            case EConst(CString(_)):
              registerBody.push(macro wp.api.ActionApi.add($e{tag}, $p{['this', field.name]}));
            default:
              Context.error('@:on may only contain strings', tag.pos);
          }
        }
        return field;
      default: return field;
    });

    return fields.concat((macro class {

      override public function register() {
        registered = true;
        $b{registerBody};
      }

    }).fields);
  }

}