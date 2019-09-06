package wp.core.macro;

import haxe.macro.Expr;
import haxe.macro.Type;
import haxe.macro.Context;

using Lambda;

class PostTypeBuilder {

  public static function build() {
    var fields:Array<Field> = Context.getBuildFields();
    var cls:ClassType = Context.getLocalClass().get();
    var meta = cls.meta.get();
    var nameMeta = meta.find(function (m) return m.name == ':name');
    var settingsMeta = meta.find(function (m) return m.name == ':settings');
    var registerTax:Array<Expr> = [];

    var name = nameMeta == null 
      ? { expr: EConst(CString(cls.name.toLowerCase())), pos: cls.pos }
      : nameMeta.params[0];

    var settings = settingsMeta == null
      ? macro {}
      : settingsMeta.params[0];

    for (field in fields) switch (field.kind) {
      case FVar(t, e):
        if (field.meta.find(function (f) return f.name == ':taxonomy') != null) {
          if (e == null) {
            Context.error('Taxonomy fields must be initialized.', field.pos);
          }
          var name = { expr: EConst(CString(field.name)), pos: field.pos };
          registerTax.push(macro wp.api.TaxonomyApi.registerTaxonomy(${name}, [ type ], $i{field.name}));
        }
      default:
    }

    fields = fields.concat((macro class {
      
      public function new() {
        super(${name}, ${settings});
      }

      override public function register() {
        wp.api.PostApi.registerPostType(${name}, ${settings});
        $b{registerTax};
      }

    }).fields);

    return fields;
  }

}
