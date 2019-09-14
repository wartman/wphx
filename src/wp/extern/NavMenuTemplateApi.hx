package wp.extern;

extern class NavMenuTemplateApi implements wp.util.ApiFunctions {
  /**
    
     Displays a navigation menu.
    
     @since 3.0.0
     @since 4.7.0 Added the `item_spacing` argument.
    
     @staticvar array $menu_id_slugs
    
     @param array $args {
         Optional. Array of nav menu arguments.
    
         @type int|string|WP_Term $menu            Desired menu. Accepts a menu ID, slug, name, or object. Default empty.
         @type string             $menu_class      CSS class to use for the ul element which forms the menu. Default 'menu'.
         @type string             $menu_id         The ID that is applied to the ul element which forms the menu.
                                                   Default is the menu slug, incremented.
         @type string             $container       Whether to wrap the ul, and what to wrap it with. Default 'div'.
         @type string             $container_class Class that is applied to the container. Default 'menu-{menu slug}-container'.
         @type string             $container_id    The ID that is applied to the container. Default empty.
         @type callable|bool      $fallback_cb     If the menu doesn't exists, a callback function will fire.
                                                   Default is 'wp_page_menu'. Set to false for no fallback.
         @type string             $before          Text before the link markup. Default empty.
         @type string             $after           Text after the link markup. Default empty.
         @type string             $link_before     Text before the link text. Default empty.
         @type string             $link_after      Text after the link text. Default empty.
         @type bool               $echo            Whether to echo the menu or return it. Default true.
         @type int                $depth           How many levels of the hierarchy are to be included. 0 means all. Default 0.
         @type object             $walker          Instance of a custom walker class. Default empty.
         @type string             $theme_location  Theme location to be used. Must be registered with register_nav_menu()
                                                   in order to be selectable by the user.
         @type string             $items_wrap      How the list items should be wrapped. Default is a ul with an id and class.
                                                   Uses printf() format with numbered placeholders.
         @type string             $item_spacing    Whether to preserve whitespace within the menu's HTML. Accepts 'preserve' or 'discard'. Default 'preserve'.
     }
     @return string|false|void Menu output if $echo is false, false if there are no items or no menu was found.
    
  **/
  public function wp_nav_menu(?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<String, Bool>;
  /**
    
     Add the class property classes for the current context, if applicable.
    
     @access private
     @since 3.0.0
    
     @global WP_Query   $wp_query
     @global WP_Rewrite $wp_rewrite
    
     @param array $menu_items The current menu item objects to which to add the class property information.
    
  **/
  public function _wp_menu_item_classes_by_context(menu_items:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Retrieve the HTML list content for nav menu items.
    
     @uses Walker_Nav_Menu to create HTML list content.
     @since 3.0.0
    
     @param array    $items The menu items, sorted by each menu item's menu order.
     @param int      $depth Depth of the item in reference to parents.
     @param stdClass $r     An object containing wp_nav_menu() arguments.
     @return string The HTML list content for the menu items.
    
  **/
  public function walk_nav_menu_tree(items:php.NativeStructArray<Dynamic>, depth:Int, r:Dynamic):String;
  /**
    
     Prevents a menu item ID from being used more than once.
    
     @since 3.0.1
     @access private
    
     @staticvar array $used_ids
     @param string $id
     @param object $item
     @return string
    
  **/
  public function _nav_menu_item_id_use_once(id:String, item:Dynamic):String;
}
