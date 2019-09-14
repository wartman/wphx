package wp.extern;

@:native("WP_Post_Type")
extern class PostType {
  /**
    
     Post type key.
    
     @since 4.6.0
     @var string $name
    
  **/
  @:native("name") public var name:String;
  /**
    
     Name of the post type shown in the menu. Usually plural.
    
     @since 4.6.0
     @var string $label
    
  **/
  @:native("label") public var label:String;
  /**
    
     Labels object for this post type.
    
     If not set, post labels are inherited for non-hierarchical types
     and page labels for hierarchical ones.
    
     @see get_post_type_labels()
    
     @since 4.6.0
     @var object $labels
    
  **/
  @:native("labels") public var labels:Dynamic;
  /**
    
     A short descriptive summary of what the post type is.
    
     Default empty.
    
     @since 4.6.0
     @var string $description
    
  **/
  @:native("description") public var description:String;
  /**
    
     Whether a post type is intended for use publicly either via the admin interface or by front-end users.
    
     While the default settings of $exclude_from_search, $publicly_queryable, $show_ui, and $show_in_nav_menus
     are inherited from public, each does not rely on this relationship and controls a very specific intention.
    
     Default false.
    
     @since 4.6.0
     @var bool $public
    
  **/
  @:native("public") public var public_:Bool;
  /**
    
     Whether the post type is hierarchical (e.g. page).
    
     Default false.
    
     @since 4.6.0
     @var bool $hierarchical
    
  **/
  @:native("hierarchical") public var hierarchical:Bool;
  /**
    
     Whether to exclude posts with this post type from front end search
     results.
    
     Default is the opposite value of $public.
    
     @since 4.6.0
     @var bool $exclude_from_search
    
  **/
  @:native("exclude_from_search") public var excludeFromSearch:Bool;
  /**
    
     Whether queries can be performed on the front end for the post type as part of `parse_request()`.
    
     Endpoints would include:
     - `?post_type={post_type_key}`
     - `?{post_type_key}={single_post_slug}`
     - `?{post_type_query_var}={single_post_slug}`
    
     Default is the value of $public.
    
     @since 4.6.0
     @var bool $publicly_queryable
    
  **/
  @:native("publicly_queryable") public var publiclyQueryable:Bool;
  /**
    
     Whether to generate and allow a UI for managing this post type in the admin.
    
     Default is the value of $public.
    
     @since 4.6.0
     @var bool $show_ui
    
  **/
  @:native("show_ui") public var showUi:Bool;
  /**
    
     Where to show the post type in the admin menu.
    
     To work, $show_ui must be true. If true, the post type is shown in its own top level menu. If false, no menu is
     shown. If a string of an existing top level menu (eg. 'tools.php' or 'edit.php?post_type=page'), the post type
     will be placed as a sub-menu of that.
    
     Default is the value of $show_ui.
    
     @since 4.6.0
     @var bool $show_in_menu
    
  **/
  @:native("show_in_menu") public var showInMenu:Bool;
  /**
    
     Makes this post type available for selection in navigation menus.
    
     Default is the value $public.
    
     @since 4.6.0
     @var bool $show_in_nav_menus
    
  **/
  @:native("show_in_nav_menus") public var showInNavMenus:Bool;
  /**
    
     Makes this post type available via the admin bar.
    
     Default is the value of $show_in_menu.
    
     @since 4.6.0
     @var bool $show_in_admin_bar
    
  **/
  @:native("show_in_admin_bar") public var showInAdminBar:Bool;
  /**
    
     The position in the menu order the post type should appear.
    
     To work, $show_in_menu must be true. Default null (at the bottom).
    
     @since 4.6.0
     @var int $menu_position
    
  **/
  @:native("menu_position") public var menuPosition:Int;
  /**
    
     The URL to the icon to be used for this menu.
    
     Pass a base64-encoded SVG using a data URI, which will be colored to match the color scheme.
     This should begin with 'data:image/svg+xml;base64,'. Pass the name of a Dashicons helper class
     to use a font icon, e.g. 'dashicons-chart-pie'. Pass 'none' to leave div.wp-menu-image empty
     so an icon can be added via CSS.
    
     Defaults to use the posts icon.
    
     @since 4.6.0
     @var string $menu_icon
    
  **/
  @:native("menu_icon") public var menuIcon:String;
  /**
    
     The string to use to build the read, edit, and delete capabilities.
    
     May be passed as an array to allow for alternative plurals when using
     this argument as a base to construct the capabilities, e.g.
     array( 'story', 'stories' ). Default 'post'.
    
     @since 4.6.0
     @var string $capability_type
    
  **/
  @:native("capability_type") public var capabilityType:String;
  /**
    
     Whether to use the internal default meta capability handling.
    
     Default false.
    
     @since 4.6.0
     @var bool $map_meta_cap
    
  **/
  @:native("map_meta_cap") public var mapMetaCap:Bool;
  /**
    
     Provide a callback function that sets up the meta boxes for the edit form.
    
     Do `remove_meta_box()` and `add_meta_box()` calls in the callback. Default null.
    
     @since 4.6.0
     @var string $register_meta_box_cb
    
  **/
  @:native("register_meta_box_cb") public var registerMetaBoxCb:String;
  /**
    
     An array of taxonomy identifiers that will be registered for the post type.
    
     Taxonomies can be registered later with `register_taxonomy()` or `register_taxonomy_for_object_type()`.
    
     Default empty array.
    
     @since 4.6.0
     @var array $taxonomies
    
  **/
  @:native("taxonomies") public var taxonomies:php.NativeStructArray<Dynamic>;
  /**
    
     Whether there should be post type archives, or if a string, the archive slug to use.
    
     Will generate the proper rewrite rules if $rewrite is enabled. Default false.
    
     @since 4.6.0
     @var bool|string $has_archive
    
  **/
  @:native("has_archive") public var hasArchive:haxe.extern.EitherType<Bool, String>;
  /**
    
     Sets the query_var key for this post type.
    
     Defaults to $post_type key. If false, a post type cannot be loaded at `?{query_var}={post_slug}`.
     If specified as a string, the query `?{query_var_string}={post_slug}` will be valid.
    
     @since 4.6.0
     @var string|bool $query_var
    
  **/
  @:native("query_var") public var queryVar:haxe.extern.EitherType<String, Bool>;
  /**
    
     Whether to allow this post type to be exported.
    
     Default true.
    
     @since 4.6.0
     @var bool $can_export
    
  **/
  @:native("can_export") public var canExport:Bool;
  /**
    
     Whether to delete posts of this type when deleting a user.
    
     If true, posts of this type belonging to the user will be moved to trash when then user is deleted.
     If false, posts of this type belonging to the user will *not* be trashed or deleted.
     If not set (the default), posts are trashed if post_type_supports( 'author' ).
     Otherwise posts are not trashed or deleted. Default null.
    
     @since 4.6.0
     @var bool $delete_with_user
    
  **/
  @:native("delete_with_user") public var deleteWithUser:Bool;
  /**
    
     Whether this post type is a native or "built-in" post_type.
    
     Default false.
    
     @since 4.6.0
     @var bool $_builtin
    
  **/
  @:native("_builtin") public var _builtin:Bool;
  /**
    
     URL segment to use for edit link of this post type.
    
     Default 'post.php?post=%d'.
    
     @since 4.6.0
     @var string $_edit_link
    
  **/
  @:native("_edit_link") public var _editLink:String;
  /**
    
     Post type capabilities.
    
     @since 4.6.0
     @var object $cap
    
  **/
  @:native("cap") public var cap:Dynamic;
  /**
    
     Triggers the handling of rewrites for this post type.
    
     Defaults to true, using $post_type as slug.
    
     @since 4.6.0
     @var array|false $rewrite
    
  **/
  @:native("rewrite") public var rewrite:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     The features supported by the post type.
    
     @since 4.6.0
     @var array|bool $supports
    
  **/
  @:native("supports") public var supports:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Whether this post type should appear in the REST API.
    
     Default false. If true, standard endpoints will be registered with
     respect to $rest_base and $rest_controller_class.
    
     @since 4.7.4
     @var bool $show_in_rest
    
  **/
  @:native("show_in_rest") public var showInRest:Bool;
  /**
    
     The base path for this post type's REST API endpoints.
    
     @since 4.7.4
     @var string|bool $rest_base
    
  **/
  @:native("rest_base") public var restBase:haxe.extern.EitherType<String, Bool>;
  /**
    
     The controller for this post type's REST API endpoints.
    
     Custom controllers must extend WP_REST_Controller.
    
     @since 4.7.4
     @var string|bool $rest_controller_class
    
  **/
  @:native("rest_controller_class") public var restControllerClass:haxe.extern.EitherType<String, Bool>;
  /**
    
     Constructor.
    
     Will populate object properties from the provided arguments and assign other
     default properties based on that information.
    
     @since 4.6.0
    
     @see register_post_type()
    
     @param string       $post_type Post type key.
     @param array|string $args      Optional. Array or string of arguments for registering a post type.
                                    Default empty array.
    
  **/
  public function new(post_type:String, ?args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):Void;
  /**
    
     Sets post type properties.
    
     @since 4.6.0
    
     @param array|string $args Array or string of arguments for registering a post type.
    
  **/
  @:native("set_props") public function setProps(args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):Void;
  /**
    
     Sets the features support for the post type.
    
     @since 4.6.0
    
  **/
  @:native("add_supports") public function addSupports():Void;
  /**
    
     Adds the necessary rewrite rules for the post type.
    
     @since 4.6.0
    
     @global WP_Rewrite $wp_rewrite WordPress Rewrite Component.
     @global WP         $wp         Current WordPress environment instance.
    
  **/
  @:native("add_rewrite_rules") public function addRewriteRules():Void;
  /**
    
     Registers the post type meta box if a custom callback was specified.
    
     @since 4.6.0
    
  **/
  @:native("register_meta_boxes") public function registerMetaBoxes():Void;
  /**
    
     Adds the future post hook action for the post type.
    
     @since 4.6.0
    
  **/
  @:native("add_hooks") public function addHooks():Void;
  /**
    
     Registers the taxonomies for the post type.
    
     @since 4.6.0
    
  **/
  @:native("register_taxonomies") public function registerTaxonomies():Void;
  /**
    
     Removes the features support for the post type.
    
     @since 4.6.0
    
     @global array $_wp_post_type_features Post type features.
    
  **/
  @:native("remove_supports") public function removeSupports():Void;
  /**
    
     Removes any rewrite rules, permastructs, and rules for the post type.
    
     @since 4.6.0
    
     @global WP_Rewrite $wp_rewrite          WordPress rewrite component.
     @global WP         $wp                  Current WordPress environment instance.
     @global array      $post_type_meta_caps Used to remove meta capabilities.
    
  **/
  @:native("remove_rewrite_rules") public function removeRewriteRules():Void;
  /**
    
     Unregisters the post type meta box if a custom callback was specified.
    
     @since 4.6.0
    
  **/
  @:native("unregister_meta_boxes") public function unregisterMetaBoxes():Void;
  /**
    
     Removes the post type from all taxonomies.
    
     @since 4.6.0
    
  **/
  @:native("unregister_taxonomies") public function unregisterTaxonomies():Void;
  /**
    
     Removes the future post hook action for the post type.
    
     @since 4.6.0
    
  **/
  @:native("remove_hooks") public function removeHooks():Void;
}
