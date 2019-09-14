package wp.extern;

@:native("WP_Taxonomy")
extern class Taxonomy {
  /**
    
     Taxonomy key.
    
     @since 4.7.0
     @var string
    
  **/
  @:native("name") public var name:String;
  /**
    
     Name of the taxonomy shown in the menu. Usually plural.
    
     @since 4.7.0
     @var string
    
  **/
  @:native("label") public var label:String;
  /**
    
     An array of labels for this taxonomy.
    
     @since 4.7.0
     @var object
    
  **/
  @:native("labels") public var labels:Dynamic;
  /**
    
     A short descriptive summary of what the taxonomy is for.
    
     @since 4.7.0
     @var string
    
  **/
  @:native("description") public var description:String;
  /**
    
     Whether a taxonomy is intended for use publicly either via the admin interface or by front-end users.
    
     @since 4.7.0
     @var bool
    
  **/
  @:native("public") public var public_:Bool;
  /**
    
     Whether the taxonomy is publicly queryable.
    
     @since 4.7.0
     @var bool
    
  **/
  @:native("publicly_queryable") public var publiclyQueryable:Bool;
  /**
    
     Whether the taxonomy is hierarchical.
    
     @since 4.7.0
     @var bool
    
  **/
  @:native("hierarchical") public var hierarchical:Bool;
  /**
    
     Whether to generate and allow a UI for managing terms in this taxonomy in the admin.
    
     @since 4.7.0
     @var bool
    
  **/
  @:native("show_ui") public var showUi:Bool;
  /**
    
     Whether to show the taxonomy in the admin menu.
    
     If true, the taxonomy is shown as a submenu of the object type menu. If false, no menu is shown.
    
     @since 4.7.0
     @var bool
    
  **/
  @:native("show_in_menu") public var showInMenu:Bool;
  /**
    
     Whether the taxonomy is available for selection in navigation menus.
    
     @since 4.7.0
     @var bool
    
  **/
  @:native("show_in_nav_menus") public var showInNavMenus:Bool;
  /**
    
     Whether to list the taxonomy in the tag cloud widget controls.
    
     @since 4.7.0
     @var bool
    
  **/
  @:native("show_tagcloud") public var showTagcloud:Bool;
  /**
    
     Whether to show the taxonomy in the quick/bulk edit panel.
    
     @since 4.7.0
     @var bool
    
  **/
  @:native("show_in_quick_edit") public var showInQuickEdit:Bool;
  /**
    
     Whether to display a column for the taxonomy on its post type listing screens.
    
     @since 4.7.0
     @var bool
    
  **/
  @:native("show_admin_column") public var showAdminColumn:Bool;
  /**
    
     The callback function for the meta box display.
    
     @since 4.7.0
     @var bool|callable
    
  **/
  @:native("meta_box_cb") public var metaBoxCb:haxe.extern.EitherType<Bool, Dynamic>;
  /**
    
     The callback function for sanitizing taxonomy data saved from a meta box.
    
     @since 5.1.0
     @var callable
    
  **/
  @:native("meta_box_sanitize_cb") public var metaBoxSanitizeCb:Dynamic;
  /**
    
     An array of object types this taxonomy is registered for.
    
     @since 4.7.0
     @var array
    
  **/
  @:native("object_type") public var objectType:php.NativeStructArray<Dynamic>;
  /**
    
     Capabilities for this taxonomy.
    
     @since 4.7.0
     @var object
    
  **/
  @:native("cap") public var cap:Dynamic;
  /**
    
     Rewrites information for this taxonomy.
    
     @since 4.7.0
     @var array|false
    
  **/
  @:native("rewrite") public var rewrite:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Query var string for this taxonomy.
    
     @since 4.7.0
     @var string|false
    
  **/
  @:native("query_var") public var queryVar:haxe.extern.EitherType<String, Bool>;
  /**
    
     Function that will be called when the count is updated.
    
     @since 4.7.0
     @var callable
    
  **/
  @:native("update_count_callback") public var updateCountCallback:Dynamic;
  /**
    
     Whether this taxonomy should appear in the REST API.
    
     Default false. If true, standard endpoints will be registered with
     respect to $rest_base and $rest_controller_class.
    
     @since 4.7.4
     @var bool $show_in_rest
    
  **/
  @:native("show_in_rest") public var showInRest:Bool;
  /**
    
     The base path for this taxonomy's REST API endpoints.
    
     @since 4.7.4
     @var string|bool $rest_base
    
  **/
  @:native("rest_base") public var restBase:haxe.extern.EitherType<String, Bool>;
  /**
    
     The controller for this taxonomy's REST API endpoints.
    
     Custom controllers must extend WP_REST_Controller.
    
     @since 4.7.4
     @var string|bool $rest_controller_class
    
  **/
  @:native("rest_controller_class") public var restControllerClass:haxe.extern.EitherType<String, Bool>;
  /**
    
     Whether it is a built-in taxonomy.
    
     @since 4.7.0
     @var bool
    
  **/
  @:native("_builtin") public var _builtin:Bool;
  /**
    
     Constructor.
    
     @since 4.7.0
    
     @global WP $wp WP instance.
    
     @param string       $taxonomy    Taxonomy key, must not exceed 32 characters.
     @param array|string $object_type Name of the object type for the taxonomy object.
     @param array|string $args        Optional. Array or query string of arguments for registering a taxonomy.
                                      Default empty array.
    
  **/
  public function new(taxonomy:String, object_type:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>, ?args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):Void;
  /**
    
     Sets taxonomy properties.
    
     @since 4.7.0
    
     @param array|string $object_type Name of the object type for the taxonomy object.
     @param array|string $args        Array or query string of arguments for registering a taxonomy.
    
  **/
  @:native("set_props") public function setProps(object_type:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>, args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):Void;
  /**
    
     Adds the necessary rewrite rules for the taxonomy.
    
     @since 4.7.0
    
     @global WP $wp Current WordPress environment instance.
    
  **/
  @:native("add_rewrite_rules") public function addRewriteRules():Void;
  /**
    
     Removes any rewrite rules, permastructs, and rules for the taxonomy.
    
     @since 4.7.0
    
     @global WP $wp Current WordPress environment instance.
    
  **/
  @:native("remove_rewrite_rules") public function removeRewriteRules():Void;
  /**
    
     Registers the ajax callback for the meta box.
    
     @since 4.7.0
    
  **/
  @:native("add_hooks") public function addHooks():Void;
  /**
    
     Removes the ajax callback for the meta box.
    
     @since 4.7.0
    
  **/
  @:native("remove_hooks") public function removeHooks():Void;
}
