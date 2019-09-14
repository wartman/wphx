package wp.extern;

extern class NavMenuApi implements wp.util.ApiFunctions {
  /**
    
     Returns a navigation menu object.
    
     @since 3.0.0
    
     @param int|string|WP_Term $menu Menu ID, slug, name, or object.
     @return WP_Term|false False if $menu param isn't supplied or term does not exist, menu object if successful.
    
  **/
  public function wp_get_nav_menu_object(menu:haxe.extern.EitherType<Int, haxe.extern.EitherType<String, wp.extern.Term>>):haxe.extern.EitherType<wp.extern.Term, Bool>;
  /**
    
     Check if the given ID is a navigation menu.
    
     Returns true if it is; false otherwise.
    
     @since 3.0.0
    
     @param int|string|WP_Term $menu Menu ID, slug, name, or object of menu to check.
     @return bool Whether the menu exists.
    
  **/
  public function is_nav_menu(menu:haxe.extern.EitherType<Int, haxe.extern.EitherType<String, wp.extern.Term>>):Bool;
  /**
    
     Registers navigation menu locations for a theme.
    
     @since 3.0.0
    
     @global array $_wp_registered_nav_menus
    
     @param array $locations Associative array of menu location identifiers (like a slug) and descriptive text.
    
  **/
  public function register_nav_menus(?locations:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Unregisters a navigation menu location for a theme.
    
     @since 3.1.0
     @global array $_wp_registered_nav_menus
    
     @param string $location The menu location identifier.
     @return bool True on success, false on failure.
    
  **/
  public function unregister_nav_menu(location:String):Bool;
  /**
    
     Registers a navigation menu location for a theme.
    
     @since 3.0.0
    
     @param string $location    Menu location identifier, like a slug.
     @param string $description Menu location descriptive text.
    
  **/
  public function register_nav_menu(location:String, description:String):Void;
  /**
    
     Retrieves all registered navigation menu locations in a theme.
    
     @since 3.0.0
    
     @global array $_wp_registered_nav_menus
    
     @return array Registered navigation menu locations. If none are registered, an empty array.
    
  **/
  public function get_registered_nav_menus():php.NativeArray;
  /**
    
     Retrieves all registered navigation menu locations and the menus assigned to them.
    
     @since 3.0.0
    
     @return array Registered navigation menu locations and the menus assigned them.
                   If none are registered, an empty array.
    
  **/
  public function get_nav_menu_locations():php.NativeArray;
  /**
    
     Determines whether a registered nav menu location has a menu assigned to it.
    
     @since 3.0.0
    
     @param string $location Menu location identifier.
     @return bool Whether location has a menu.
    
  **/
  public function has_nav_menu(location:String):Bool;
  /**
    
     Returns the name of a navigation menu.
    
     @since 4.9.0
    
     @param string $location Menu location identifier.
     @return string Menu name.
    
  **/
  public function wp_get_nav_menu_name(location:String):String;
  /**
    
     Determines whether the given ID is a nav menu item.
    
     @since 3.0.0
    
     @param int $menu_item_id The ID of the potential nav menu item.
     @return bool Whether the given ID is that of a nav menu item.
    
  **/
  public function is_nav_menu_item(menu_item_id:Int = 0):Bool;
  /**
    
     Creates a navigation menu.
    
     Note that `$menu_name` is expected to be pre-slashed.
    
     @since 3.0.0
    
     @param string $menu_name Menu name.
     @return int|WP_Error Menu ID on success, WP_Error object on failure.
    
  **/
  public function wp_create_nav_menu(menu_name:String):haxe.extern.EitherType<Int, wp.extern.Error>;
  /**
    
     Delete a Navigation Menu.
    
     @since 3.0.0
    
     @param int|string|WP_Term $menu Menu ID, slug, name, or object.
     @return bool|WP_Error True on success, false or WP_Error object on failure.
    
  **/
  public function wp_delete_nav_menu(menu:haxe.extern.EitherType<Int, haxe.extern.EitherType<String, wp.extern.Term>>):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Save the properties of a menu or create a new menu with those properties.
    
     Note that `$menu_data` is expected to be pre-slashed.
    
     @since 3.0.0
    
     @param int   $menu_id   The ID of the menu or "0" to create a new menu.
     @param array $menu_data The array of menu data.
     @return int|WP_Error Menu ID on success, WP_Error object on failure.
    
  **/
  public function wp_update_nav_menu_object(menu_id:Int = 0, ?menu_data:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Int, wp.extern.Error>;
  /**
    
     Save the properties of a menu item or create a new one.
    
     The menu-item-title, menu-item-description, and menu-item-attr-title are expected
     to be pre-slashed since they are passed directly into `wp_insert_post()`.
    
     @since 3.0.0
    
     @param int   $menu_id         The ID of the menu. Required. If "0", makes the menu item a draft orphan.
     @param int   $menu_item_db_id The ID of the menu item. If "0", creates a new menu item.
     @param array $menu_item_data  The menu item's data.
     @return int|WP_Error The menu item's database ID or WP_Error object on failure.
    
  **/
  public function wp_update_nav_menu_item(menu_id:Int = 0, menu_item_db_id:Int = 0, ?menu_item_data:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Int, wp.extern.Error>;
  /**
    
     Returns all navigation menu objects.
    
     @since 3.0.0
     @since 4.1.0 Default value of the 'orderby' argument was changed from 'none'
                  to 'name'.
    
     @param array $args Optional. Array of arguments passed on to get_terms().
                        Default empty array.
     @return array Menu objects.
    
  **/
  public function wp_get_nav_menus(?args:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Return if a menu item is valid.
    
     @link https://core.trac.wordpress.org/ticket/13958
    
     @since 3.2.0
     @access private
    
     @param object $item The menu item to check.
     @return bool False if invalid, otherwise true.
    
  **/
  public function _is_valid_nav_menu_item(item:Dynamic):Bool;
  /**
    
     Retrieves all menu items of a navigation menu.
    
     Note: Most arguments passed to the `$args` parameter – save for 'output_key' – are
     specifically for retrieving nav_menu_item posts from get_posts() and may only
     indirectly affect the ultimate ordering and content of the resulting nav menu
     items that get returned from this function.
    
     @since 3.0.0
    
     @staticvar array $fetched
    
     @param int|string|WP_Term $menu Menu ID, slug, name, or object.
     @param array              $args {
         Optional. Arguments to pass to get_posts().
    
         @type string $order       How to order nav menu items as queried with get_posts(). Will be ignored
                                   if 'output' is ARRAY_A. Default 'ASC'.
         @type string $orderby     Field to order menu items by as retrieved from get_posts(). Supply an orderby
                                   field via 'output_key' to affect the output order of nav menu items.
                                   Default 'menu_order'.
         @type string $post_type   Menu items post type. Default 'nav_menu_item'.
         @type string $post_status Menu items post status. Default 'publish'.
         @type string $output      How to order outputted menu items. Default ARRAY_A.
         @type string $output_key  Key to use for ordering the actual menu items that get returned. Note that
                                   that is not a get_posts() argument and will only affect output of menu items
                                   processed in this function. Default 'menu_order'.
         @type bool   $nopaging    Whether to retrieve all menu items (true) or paginate (false). Default true.
     }
     @return false|array $items Array of menu items, otherwise false.
    
  **/
  public function wp_get_nav_menu_items(menu:haxe.extern.EitherType<Int, haxe.extern.EitherType<String, wp.extern.Term>>, ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, php.NativeStructArray<Dynamic>>;
  /**
    
     Decorates a menu item object with the shared navigation menu item properties.
    
     Properties:
     - ID:               The term_id if the menu item represents a taxonomy term.
     - attr_title:       The title attribute of the link element for this menu item.
     - classes:          The array of class attribute values for the link element of this menu item.
     - db_id:            The DB ID of this item as a nav_menu_item object, if it exists (0 if it doesn't exist).
     - description:      The description of this menu item.
     - menu_item_parent: The DB ID of the nav_menu_item that is this item's menu parent, if any. 0 otherwise.
     - object:           The type of object originally represented, such as "category," "post", or "attachment."
     - object_id:        The DB ID of the original object this menu item represents, e.g. ID for posts and term_id for categories.
     - post_parent:      The DB ID of the original object's parent object, if any (0 otherwise).
     - post_title:       A "no title" label if menu item represents a post that lacks a title.
     - target:           The target attribute of the link element for this menu item.
     - title:            The title of this menu item.
     - type:             The family of objects originally represented, such as "post_type" or "taxonomy."
     - type_label:       The singular label used to describe this type of menu item.
     - url:              The URL to which this menu item points.
     - xfn:              The XFN relationship expressed in the link of this menu item.
     - _invalid:         Whether the menu item represents an object that no longer exists.
    
     @since 3.0.0
    
     @param object $menu_item The menu item to modify.
     @return object $menu_item The menu item with standard menu item properties.
    
  **/
  public function wp_setup_nav_menu_item(menu_item:Dynamic):Dynamic;
  /**
    
     Get the menu items associated with a particular object.
    
     @since 3.0.0
    
     @param int    $object_id   The ID of the original object.
     @param string $object_type The type of object, such as "taxonomy" or "post_type."
     @param string $taxonomy    If $object_type is "taxonomy", $taxonomy is the name of the tax that $object_id belongs to
     @return array The array of menu item IDs; empty array if none;
    
  **/
  public function wp_get_associated_nav_menu_items(object_id:Int = 0, object_type:String = 'post_type', taxonomy:String = ''):php.NativeArray;
  /**
    
     Callback for handling a menu item when its original object is deleted.
    
     @since 3.0.0
     @access private
    
     @param int $object_id The ID of the original object being trashed.
    
  **/
  public function _wp_delete_post_menu_item(object_id:Int = 0):Void;
  /**
    
     Serves as a callback for handling a menu item when its original object is deleted.
    
     @since 3.0.0
     @access private
    
     @param int    $object_id Optional. The ID of the original object being trashed. Default 0.
     @param int    $tt_id     Term taxonomy ID. Unused.
     @param string $taxonomy  Taxonomy slug.
    
  **/
  public function _wp_delete_tax_menu_item(object_id:Int = 0, tt_id:Int, taxonomy:String):Void;
  /**
    
     Automatically add newly published page objects to menus with that as an option.
    
     @since 3.0.0
     @access private
    
     @param string $new_status The new status of the post object.
     @param string $old_status The old status of the post object.
     @param object $post       The post object being transitioned from one status to another.
    
  **/
  public function _wp_auto_add_pages_to_menu(new_status:String, old_status:String, post:Dynamic):Void;
  /**
    
     Delete auto-draft posts associated with the supplied changeset.
    
     @since 4.8.0
     @access private
    
     @param int $post_id Post ID for the customize_changeset.
    
  **/
  public function _wp_delete_customize_changeset_dependent_auto_drafts(post_id:Int):Void;
  /**
    
     Handle menu config after theme change.
    
     @access private
     @since 4.9.0
    
  **/
  public function _wp_menus_changed():Void;
  /**
    
     Maps nav menu locations according to assignments in previously active theme.
    
     @since 4.9.0
    
     @param array $new_nav_menu_locations New nav menu locations assignments.
     @param array $old_nav_menu_locations Old nav menu locations assignments.
     @return array Nav menus mapped to new nav menu locations.
    
  **/
  public function wp_map_nav_menu_locations(new_nav_menu_locations:php.NativeStructArray<Dynamic>, old_nav_menu_locations:php.NativeStructArray<Dynamic>):php.NativeArray;
}
