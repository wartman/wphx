package wp;

import haxe.extern.EitherType;
import wp.api.TaxonomyApi;

@:native('WP_Taxonomy')
extern class TaxonomyObject {
  public var name:String;
  public var label:String;
  public var labels:Array<String>;
  public var description:String;
  @:native('public') public var isPublic:Bool;
  @:native('publicly_queryable') public var isPubliclyQueryable:Bool;
  public var hierarchical:Bool;
  @:native('show_ui') public var showUi:Bool;
  @:native('show_in_menu') public var showInMenu:Bool;
  @:native('show_in_nav_menus') public var showInNavMenus:Bool;
  @:native('show_tagcloud') public var showTagCloud:Bool;
  @:native('show_in_quick_edit') public var showInQuickEdit:Bool;
  @:native('show_admin_column') public var showAdminColumn:Bool;
  @:native('meta_box_cb') public var metaBoxCb:Dynamic;
  @:native('meta_box_sanitize_cb') public var metaBoxSanitizeCb:Dynamic;
  @:native('object_type') public var objectType:Dynamic;
  public var cap:Dynamic;
  public var rewrite:Dynamic;
  @:native('query_var') public var queryVar:EitherType<String, Bool>;
  @:native('show_in_rest') public var showInRest:Bool;
  @:native('rest_base') public var restBase:EitherType<String, Bool>;
  @:native('rest_controller_class') public var restControllerClass:EitherType<String, Bool>;
  public var _builtin:Bool;
  public function new(taxonomy:String, objectType:EitherType<Array<String>, String>, args:EitherType<Dynamic, String>);
  @:native('set_props') public function setProps(objectType:EitherType<Array<String>, String>, args:EitherType<Dynamic, String>):Void;
  @:native('add_rewrite_rules') public function addRewriteRules():Void;
  @:native('remove_rewrite_rules') public function removeRewriteRules():Void;
  @:native('add_hooks') public function addHooks():Bool;
  @:native('remove_hooks') public function removeHooks():Bool;
}

@:forward
abstract Taxonomy(TaxonomyObject) from TaxonomyObject to TaxonomyObject {

  public inline function new(taxonomy:String, objectType:EitherType<Array<String>, String>, args:EitherType<Dynamic, String>)
    this = new TaxonomyObject(taxonomy, objectType, args);

  public inline function register()
    return TaxonomyApi.registerTaxonomy(this.name, this.objectType, this);

}
