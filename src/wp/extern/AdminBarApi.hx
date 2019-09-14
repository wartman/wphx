package wp.extern;

extern class AdminBarApi implements wp.util.ApiFunctions {
  /**
    
     Instantiate the admin bar object and set it up as a global for access elsewhere.
    
     UNHOOKING THIS FUNCTION WILL NOT PROPERLY REMOVE THE ADMIN BAR.
     For that, use show_admin_bar(false) or the {@see 'show_admin_bar'} filter.
    
     @since 3.1.0
     @access private
    
     @global WP_Admin_Bar $wp_admin_bar
    
     @return bool Whether the admin bar was successfully initialized.
    
  **/
  public function _wp_admin_bar_init():Bool;
  /**
    
     Renders the admin bar to the page based on the $wp_admin_bar->menu member var.
    
     This is called very late on the footer actions so that it will render after
     anything else being added to the footer.
    
     It includes the {@see 'admin_bar_menu'} action which should be used to hook in and
     add new menus to the admin bar. That way you can be sure that you are adding at most
     optimal point, right before the admin bar is rendered. This also gives you access to
     the `$post` global, among others.
    
     @since 3.1.0
    
     @global WP_Admin_Bar $wp_admin_bar
    
  **/
  public function wp_admin_bar_render():Void;
  /**
    
     Add the WordPress logo menu.
    
     @since 3.3.0
    
     @param WP_Admin_Bar $wp_admin_bar
    
  **/
  public function wp_admin_bar_wp_menu(wp_admin_bar:wp.extern.AdminBar):Void;
  /**
    
     Add the sidebar toggle button.
    
     @since 3.8.0
    
     @param WP_Admin_Bar $wp_admin_bar
    
  **/
  public function wp_admin_bar_sidebar_toggle(wp_admin_bar:wp.extern.AdminBar):Void;
  /**
    
     Add the "My Account" item.
    
     @since 3.3.0
    
     @param WP_Admin_Bar $wp_admin_bar
    
  **/
  public function wp_admin_bar_my_account_item(wp_admin_bar:wp.extern.AdminBar):Void;
  /**
    
     Add the "My Account" submenu items.
    
     @since 3.1.0
    
     @param WP_Admin_Bar $wp_admin_bar
    
  **/
  public function wp_admin_bar_my_account_menu(wp_admin_bar:wp.extern.AdminBar):Void;
  /**
    
     Add the "Site Name" menu.
    
     @since 3.3.0
    
     @param WP_Admin_Bar $wp_admin_bar
    
  **/
  public function wp_admin_bar_site_menu(wp_admin_bar:wp.extern.AdminBar):Void;
  /**
    
     Adds the "Customize" link to the Toolbar.
    
     @since 4.3.0
    
     @param WP_Admin_Bar $wp_admin_bar WP_Admin_Bar instance.
     @global WP_Customize_Manager $wp_customize
    
  **/
  public function wp_admin_bar_customize_menu(wp_admin_bar:wp.extern.AdminBar):Void;
  /**
    
     Add the "My Sites/[Site Name]" menu and all submenus.
    
     @since 3.1.0
    
     @param WP_Admin_Bar $wp_admin_bar
    
  **/
  public function wp_admin_bar_my_sites_menu(wp_admin_bar:wp.extern.AdminBar):Void;
  /**
    
     Provide a shortlink.
    
     @since 3.1.0
    
     @param WP_Admin_Bar $wp_admin_bar
    
  **/
  public function wp_admin_bar_shortlink_menu(wp_admin_bar:wp.extern.AdminBar):Void;
  /**
    
     Provide an edit link for posts and terms.
    
     @since 3.1.0
    
     @global WP_Term  $tag
     @global WP_Query $wp_the_query
     @global int      $user_id      The ID of the user being edited. Not to be confused with the
                                    global $user_ID, which contains the ID of the current user.
    
     @param WP_Admin_Bar $wp_admin_bar
    
  **/
  public function wp_admin_bar_edit_menu(wp_admin_bar:wp.extern.AdminBar):Void;
  /**
    
     Add "Add New" menu.
    
     @since 3.1.0
    
     @param WP_Admin_Bar $wp_admin_bar
    
  **/
  public function wp_admin_bar_new_content_menu(wp_admin_bar:wp.extern.AdminBar):Void;
  /**
    
     Add edit comments link with awaiting moderation count bubble.
    
     @since 3.1.0
    
     @param WP_Admin_Bar $wp_admin_bar
    
  **/
  public function wp_admin_bar_comments_menu(wp_admin_bar:wp.extern.AdminBar):Void;
  /**
    
     Add appearance submenu items to the "Site Name" menu.
    
     @since 3.1.0
    
     @param WP_Admin_Bar $wp_admin_bar
    
  **/
  public function wp_admin_bar_appearance_menu(wp_admin_bar:wp.extern.AdminBar):Void;
  /**
    
     Provide an update link if theme/plugin/core updates are available.
    
     @since 3.1.0
    
     @param WP_Admin_Bar $wp_admin_bar
    
  **/
  public function wp_admin_bar_updates_menu(wp_admin_bar:wp.extern.AdminBar):Void;
  /**
    
     Add search form.
    
     @since 3.3.0
    
     @param WP_Admin_Bar $wp_admin_bar
    
  **/
  public function wp_admin_bar_search_menu(wp_admin_bar:wp.extern.AdminBar):Void;
  /**
    
     Add secondary menus.
    
     @since 3.3.0
    
     @param WP_Admin_Bar $wp_admin_bar
    
  **/
  public function wp_admin_bar_add_secondary_groups(wp_admin_bar:wp.extern.AdminBar):Void;
  /**
    
     Style and scripts for the admin bar.
    
     @since 3.1.0
    
  **/
  public function wp_admin_bar_header():Void;
  /**
    
     Default admin bar callback.
    
     @since 3.1.0
    
  **/
  public function _admin_bar_bump_cb():Void;
  /**
    
     Sets the display status of the admin bar.
    
     This can be called immediately upon plugin load. It does not need to be called
     from a function hooked to the {@see 'init'} action.
    
     @since 3.1.0
    
     @global bool $show_admin_bar
    
     @param bool $show Whether to allow the admin bar to show.
    
  **/
  public function show_admin_bar(show:Bool):Void;
  /**
    
     Determines whether the admin bar should be showing.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 3.1.0
    
     @global bool   $show_admin_bar
     @global string $pagenow
    
     @return bool Whether the admin bar should be showing.
    
  **/
  public function is_admin_bar_showing():Bool;
  /**
    
     Retrieve the admin bar display preference of a user.
    
     @since 3.1.0
     @access private
    
     @param string $context Context of this preference check. Defaults to 'front'. The 'admin'
      preference is no longer used.
     @param int $user Optional. ID of the user to check, defaults to 0 for current user.
     @return bool Whether the admin bar should be showing for this user.
    
  **/
  public function _get_admin_bar_pref(context:String = 'front', user:Int = 0):Bool;
}
