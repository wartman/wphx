package wp.extern;

@:native("WP_Customize_Nav_Menus")
extern class CustomizeNavMenus {
  /**
    
     WP_Customize_Manager instance.
    
     @since 4.3.0
     @var WP_Customize_Manager
    
  **/
  @:native("manager") public var manager:wp.extern.CustomizeManager;
  /**
    
     Constructor.
    
     @since 4.3.0
    
     @param object $manager An instance of the WP_Customize_Manager class.
    
  **/
  public function new(manager:Dynamic):Void;
  /**
    
     Adds a nonce for customizing menus.
    
     @since 4.5.0
    
     @param string[] $nonces Array of nonces.
     @return string[] $nonces Modified array of nonces.
    
  **/
  @:native("filter_nonces") public function filterNonces(nonces:php.NativeIndexedArray<String>):php.NativeIndexedArray<String>;
  /**
    
     Ajax handler for loading available menu items.
    
     @since 4.3.0
    
  **/
  @:native("ajax_load_available_items") public function ajaxLoadAvailableItems():Void;
  /**
    
     Performs the post_type and taxonomy queries for loading available menu items.
    
     @since 4.3.0
    
     @param string $type   Optional. Accepts any custom object type and has built-in support for
                             'post_type' and 'taxonomy'. Default is 'post_type'.
     @param string $object Optional. Accepts any registered taxonomy or post type name. Default is 'page'.
     @param int    $page   Optional. The page number used to generate the query offset. Default is '0'.
     @return WP_Error|array Returns either a WP_Error object or an array of menu items.
    
  **/
  @:native("load_available_items_query") public function loadAvailableItemsQuery(type:String = 'post_type', object:String = 'page', page:Int = 0):haxe.extern.EitherType<wp.extern.Error, php.NativeStructArray<Dynamic>>;
  /**
    
     Ajax handler for searching available menu items.
    
     @since 4.3.0
    
  **/
  @:native("ajax_search_available_items") public function ajaxSearchAvailableItems():Void;
  /**
    
     Performs post queries for available-item searching.
    
     Based on WP_Editor::wp_link_query().
    
     @since 4.3.0
    
     @param array $args Optional. Accepts 'pagenum' and 's' (search) arguments.
     @return array Menu items.
    
  **/
  @:native("search_available_items_query") public function searchAvailableItemsQuery(?args:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Enqueue scripts and styles for Customizer pane.
    
     @since 4.3.0
    
  **/
  @:native("enqueue_scripts") public function enqueueScripts():Void;
  /**
    
     Filters a dynamic setting's constructor args.
    
     For a dynamic setting to be registered, this filter must be employed
     to override the default false value with an array of args to pass to
     the WP_Customize_Setting constructor.
    
     @since 4.3.0
    
     @param false|array $setting_args The arguments to the WP_Customize_Setting constructor.
     @param string      $setting_id   ID for dynamic setting, usually coming from `$_POST['customized']`.
     @return array|false
    
  **/
  @:native("filter_dynamic_setting_args") public function filterDynamicSettingArgs(setting_args:haxe.extern.EitherType<Bool, php.NativeStructArray<Dynamic>>, setting_id:String):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Allow non-statically created settings to be constructed with custom WP_Customize_Setting subclass.
    
     @since 4.3.0
    
     @param string $setting_class WP_Customize_Setting or a subclass.
     @param string $setting_id    ID for dynamic setting, usually coming from `$_POST['customized']`.
     @param array  $setting_args  WP_Customize_Setting or a subclass.
     @return string
    
  **/
  @:native("filter_dynamic_setting_class") public function filterDynamicSettingClass(setting_class:String, setting_id:String, setting_args:php.NativeStructArray<Dynamic>):String;
  /**
    
     Add the customizer settings and controls.
    
     @since 4.3.0
    
  **/
  @:native("customize_register") public function customizeRegister():Void;
  /**
    
     Get the base10 intval.
    
     This is used as a setting's sanitize_callback; we can't use just plain
     intval because the second argument is not what intval() expects.
    
     @since 4.3.0
    
     @param mixed $value Number to convert.
     @return int Integer.
    
  **/
  @:native("intval_base10") public function intvalBase10(value:Dynamic):Int;
  /**
    
     Return an array of all the available item types.
    
     @since 4.3.0
     @since 4.7.0  Each array item now includes a `$type_label` in addition to `$title`, `$type`, and `$object`.
    
     @return array The available menu item types.
    
  **/
  @:native("available_item_types") public function availableItemTypes():php.NativeArray;
  /**
    
     Add a new `auto-draft` post.
    
     @since 4.7.0
    
     @param array $postarr {
         Post array. Note that post_status is overridden to be `auto-draft`.
    
     @var string $post_title   Post title. Required.
     @var string $post_type    Post type. Required.
     @var string $post_name    Post name.
     @var string $post_content Post content.
     }
     @return WP_Post|WP_Error Inserted auto-draft post object or error.
    
  **/
  @:native("insert_auto_draft_post") public function insertAutoDraftPost(postarr:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<wp.extern.Post, wp.extern.Error>;
  /**
    
     Ajax handler for adding a new auto-draft post.
    
     @since 4.7.0
    
  **/
  @:native("ajax_insert_auto_draft_post") public function ajaxInsertAutoDraftPost():Void;
  /**
    
     Print the JavaScript templates used to render Menu Customizer components.
    
     Templates are imported into the JS use wp.template.
    
     @since 4.3.0
    
  **/
  @:native("print_templates") public function printTemplates():Void;
  /**
    
     Print the html template used to render the add-menu-item frame.
    
     @since 4.3.0
    
  **/
  @:native("available_items_template") public function availableItemsTemplate():Void;
  /**
    
     Nav menu args used for each instance, keyed by the args HMAC.
    
     @since 4.3.0
     @var array
    
  **/
  @:native("preview_nav_menu_instance_args") public var previewNavMenuInstanceArgs:php.NativeStructArray<Dynamic>;
  /**
    
     Filters arguments for dynamic nav_menu selective refresh partials.
    
     @since 4.5.0
    
     @param array|false $partial_args Partial args.
     @param string      $partial_id   Partial ID.
     @return array Partial args.
    
  **/
  @:native("customize_dynamic_partial_args") public function customizeDynamicPartialArgs(partial_args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>, partial_id:String):php.NativeArray;
  /**
    
     Add hooks for the Customizer preview.
    
     @since 4.3.0
    
  **/
  @:native("customize_preview_init") public function customizePreviewInit():Void;
  /**
    
     Make the auto-draft status protected so that it can be queried.
    
     @since 4.7.0
    
     @global array $wp_post_statuses List of post statuses.
    
  **/
  @:native("make_auto_draft_status_previewable") public function makeAutoDraftStatusPreviewable():Void;
  /**
    
     Sanitize post IDs for posts created for nav menu items to be published.
    
     @since 4.7.0
    
     @param array $value Post IDs.
     @returns array Post IDs.
    
  **/
  @:native("sanitize_nav_menus_created_posts") public function sanitizeNavMenusCreatedPosts(value:php.NativeStructArray<Dynamic>):s;
  /**
    
     Publish the auto-draft posts that were created for nav menu items.
    
     The post IDs will have been sanitized by already by
     `WP_Customize_Nav_Menu_Items::sanitize_nav_menus_created_posts()` to
     remove any post IDs for which the user cannot publish or for which the
     post is not an auto-draft.
    
     @since 4.7.0
    
     @param WP_Customize_Setting $setting Customizer setting object.
    
  **/
  @:native("save_nav_menus_created_posts") public function saveNavMenusCreatedPosts(setting:wp.extern.CustomizeSetting):Void;
  /**
    
     Keep track of the arguments that are being passed to wp_nav_menu().
    
     @since 4.3.0
     @see wp_nav_menu()
     @see WP_Customize_Widgets::filter_dynamic_sidebar_params()
    
     @param array $args An array containing wp_nav_menu() arguments.
     @return array Arguments.
    
  **/
  @:native("filter_wp_nav_menu_args") public function filterWpNavMenuArgs(args:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Prepares wp_nav_menu() calls for partial refresh.
    
     Injects attributes into container element.
    
     @since 4.3.0
    
     @see wp_nav_menu()
    
     @param string $nav_menu_content The HTML content for the navigation menu.
     @param object $args             An object containing wp_nav_menu() arguments.
     @return string Nav menu HTML with selective refresh attributes added if partial can be refreshed.
    
  **/
  @:native("filter_wp_nav_menu") public function filterWpNavMenu(nav_menu_content:String, args:Dynamic):String;
  /**
    
     Hashes (hmac) the nav menu arguments to ensure they are not tampered with when
     submitted in the Ajax request.
    
     Note that the array is expected to be pre-sorted.
    
     @since 4.3.0
    
     @param array $args The arguments to hash.
     @return string Hashed nav menu arguments.
    
  **/
  @:native("hash_nav_menu_args") public function hashNavMenuArgs(args:php.NativeStructArray<Dynamic>):String;
  /**
    
     Enqueue scripts for the Customizer preview.
    
     @since 4.3.0
    
  **/
  @:native("customize_preview_enqueue_deps") public function customizePreviewEnqueueDeps():Void;
  /**
    
     Exports data from PHP to JS.
    
     @since 4.3.0
    
  **/
  @:native("export_preview_data") public function exportPreviewData():Void;
  /**
    
     Export any wp_nav_menu() calls during the rendering of any partials.
    
     @since 4.5.0
    
     @param array $response Response.
     @return array Response.
    
  **/
  @:native("export_partial_rendered_nav_menu_instances") public function exportPartialRenderedNavMenuInstances(response:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Render a specific menu via wp_nav_menu() using the supplied arguments.
    
     @since 4.3.0
    
     @see wp_nav_menu()
    
     @param WP_Customize_Partial $partial       Partial.
     @param array                $nav_menu_args Nav menu args supplied as container context.
     @return string|false
    
  **/
  @:native("render_nav_menu_partial") public function renderNavMenuPartial(partial:wp.extern.CustomizePartial, nav_menu_args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<String, Bool>;
}
