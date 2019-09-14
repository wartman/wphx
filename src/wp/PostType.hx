package wp;

import wp.util.PossibleError;
import php.*;
import wp.extern.*;
import wp.extern.PostType as WpPostType;

using php.Lib;

@:forward
abstract PostType(WpPostType) from WpPostType to WpPostType {

  public inline static function add(name:String, args:NativeStructArray<Dynamic>):PossibleError<PostType> {
    return PostApi.registerPostType(name, args);
  }
  
  public inline static function get(name:String):PostType
    return PostApi.getPostTypeObject(name);

  public inline static function find(query:Dynamic):Array<PostType>
    return PostApi.getPostTypes(query, 'objects')
      .toHaxeArray().map(t -> (t:PostType));
    
  public inline static function exists(name)
    return PostApi.postTypeExists(name);

  public inline function new(name:String = '')
    this = new WpPostType(name);

  public inline function isRegistered()
    return PostApi.postTypeExists(this.name);

  public inline function unregister()
    return PostApi.unregisterPostType(this.name);

  public inline function registerMetaKey(key:String, args:NativeStructArray<Dynamic>) {
    Reflect.setProperty(args, 'object_subtype', this.name);
    MetaApi.registerMeta('post', key, args);
    return this;
  }

  public function registerMetaKeys(keys:Map<String, NativeStructArray<Dynamic>>) {
    for (key in keys.keys()) {
      registerMetaKey(key, keys.get(key));
    }
    return this;
  }

}


// import php.NativeStructArray;
// import haxe.ds.Map;
// import haxe.extern.EitherType;
// import wp.api.PostApi;
// import wp.api.MetaApi;

// typedef PostTypeLabels = {
//   ?name:String,
//   ?singular_name:String,
//   ?add_new:String,
//   ?add_new_item:String,
//   ?edit_item:String,
//   ?new_item:String,
//   ?view_item:String,
//   ?view_items:String,
//   ?search_items:String,
//   ?not_found:String,
//   ?not_found_in_trash:String,
//   ?parent_item_colon:String,
//   ?all_items:String,
//   ?archives:String,
//   ?attributes:String,
//   ?insert_into_item:String,
//   ?uploaded_to_this_item:String,
//   ?featured_image:String,
//   ?set_featured_image:String,
//   ?remove_featured_image:String,
//   ?use_featured_image:String,
//   ?menu_name:String,
//   ?filter_items_list:String,
//   ?items_list_navigation:String,
//   ?items_list:String,
//   ?name_admin_bar:String
// }

// @:native('WP_Post_Type')
// extern class PostTypeObject {

//   public var name:String;
//   public var label:String;
//   public var labels:PostTypeLabels;
//   public var description:String;
//   @:native('public') public var isPublic:Bool;
//   public var hierarchical:Bool;
//   @:native('exclude_from_search') public var excludeFromSearch:Bool;
//   @:native('publicly_queryable') public var isPubliclyQueryable:Bool;
//   @:native('show_ui') public var showUi:Bool;
//   @:native('show_in_menu') public var showInMenu:Bool;
//   @:native('show_in_nav_menus') public var showInNavMenus:Bool;
//   @:native('show_in_admin_bar') public var showInAdminBar:Bool;
//   @:native('menu_position') public var menuPosition:Int;
//   @:native('menu_icon') public var menuIcon:String;
//   @:native('capability_type') public var capabilityType:String;
//   @:native('map_meta_cap') public var mapMetaCap:Bool;
//   @:native('register_meta_box_cb') public var registerMetaBoxCb:String;
//   public var taxonomies:Dynamic;
//   @:native('has_archive') public var hasArchive:Bool;
//   @:native('query_var') public var queryVar:EitherType<String, Bool>;
//   @:native('can_export') public var canExport:Bool;
//   @:native('delete_with_user') public var deleteWithUser:Bool;
//   public var _builtin:Bool;
//   @:native('_edit_link') public var _editLink:String;
//   public var cap:Dynamic;
//   public var rewrite:EitherType<NativeStructArray<Dynamic>, Bool>;
//   public var supports:EitherType<Array<String>, Bool>;
//   @:native('show_in_rest') public var showInRest:Bool;
//   @:native('rest_base') public var restBase:EitherType<String, Bool>;
//   @:native('rest_controller_class') public var restControllerClass:EitherType<String, Bool>;

//   public function new(postType:String, ?args:EitherType<Dynamic, String>);

//   @:native('set_props') 
//   public function setProps(args:EitherType<Dynamic, String>):Void;
  
//   @:native('add_supports')
//   public function addSupports():Void;

//   @:native('add_rewrite_rules')
//   public function addRewriteRules():Void;

//   @:native('register_meta_boxes')
//   public function registerMetaBoxes():Void;

//   @:native('add_hooks')
//   public function addHooks():Void;
  
//   @:native('register_taxonomies')
//   public function registerTaxonomies():Void;

//   @:native('remove_supports')
//   public function removeSupports():Void;
  
//   @:native('remove_rewrite_rules')
//   public function removeRewriteRules():Void;
  
//   @:native('unregister_meta_boxes')
//   public function unregisterMetaBoxes():Void;
  
//   @:native('unregister_taxonomies')
//   public function unregisterTaxonomies():Void;
  
//   @:native('remove_hooks')
//   public function removeHooks():Void;

// }

// @:forward
// abstract PostType(PostTypeObject) from PostTypeObject to PostTypeObject {

//   public static function add(name:String, args:NativeStructArray<Dynamic>):Outcome<PostType, WpError> {
//     var type = PostApi.registerPostType(name, args);
//     if (Std.is(type, WpError)) {
//       return Failure(type);
//     }
//     return Success(cast type);
//   }

//   public inline static function get(name:String)
//     return PostApi.getPostTypeObject(name);

//   public inline static function find(query:Dynamic):Array<PostType>
//     return PostApi.getPostTypes(query, 'objects');
    
//   public inline static function exists(name)
//     return PostApi.postTypeExists(name);

//   public inline function new(name:String = '')
//     this = new PostTypeObject(name);

//   public inline function isRegistered()
//     return PostApi.postTypeExists(this.name);

//   public inline function unregister()
//     return PostApi.unregisterPostType(this.name);

//   public inline function registerMetaKey(key:String, args:MetaDescriptor) {
//     args.object_subtype = this.name;
//     MetaApi.registerMeta(MetaKind.MPost, key, args);
//     return this;
//   }

//   public function registerMetaKeys(keys:Map<String, MetaDescriptor>) {
//     for (key in keys.keys()) {
//       registerMetaKey(key, keys.get(key));
//     }
//     return this;
//   }

// }
