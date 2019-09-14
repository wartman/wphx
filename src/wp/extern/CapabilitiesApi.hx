package wp.extern;

extern class CapabilitiesApi implements wp.util.ApiFunctions {
  /**
    
     Map meta capabilities to primitive capabilities.
    
     This does not actually compare whether the user ID has the actual capability,
     just what the capability or capabilities are. Meta capability list value can
     be 'delete_user', 'edit_user', 'remove_user', 'promote_user', 'delete_post',
     'delete_page', 'edit_post', 'edit_page', 'read_post', or 'read_page'.
    
     @since 2.0.0
    
     @global array $post_type_meta_caps Used to get post type meta capabilities.
    
     @param string $cap       Capability name.
     @param int    $user_id   User ID.
     @param int    $object_id Optional. ID of the specific object to check against if `$cap` is a "meta" cap.
                              "Meta" capabilities, e.g. 'edit_post', 'edit_user', etc., are capabilities used
                              by map_meta_cap() to map to other "primitive" capabilities, e.g. 'edit_posts',
                              'edit_others_posts', etc. The parameter is accessed via func_get_args().
     @return array Actual capabilities for meta capability.
    
  **/
  public function map_meta_cap(cap:String, user_id:Int, object_id:Int):php.NativeArray;
  /**
    
     Whether the current user has a specific capability.
    
     While checking against particular roles in place of a capability is supported
     in part, this practice is discouraged as it may produce unreliable results.
    
     Note: Will always return true if the current user is a super admin, unless specifically denied.
    
     @since 2.0.0
    
     @see WP_User::has_cap()
     @see map_meta_cap()
    
     @param string $capability Capability name.
     @param int    $object_id  Optional. ID of the specific object to check against if `$capability` is a "meta" cap.
                               "Meta" capabilities, e.g. 'edit_post', 'edit_user', etc., are capabilities used
                               by map_meta_cap() to map to other "primitive" capabilities, e.g. 'edit_posts',
                               'edit_others_posts', etc. Accessed via func_get_args() and passed to WP_User::has_cap(),
                               then map_meta_cap().
     @return bool Whether the current user has the given capability. If `$capability` is a meta cap and `$object_id` is
                  passed, whether the current user has the given meta capability for the given object.
    
  **/
  public function current_user_can(capability:String, object_id:Int):Bool;
  /**
    
     Whether the current user has a specific capability for a given site.
    
     @since 3.0.0
    
     @param int    $blog_id    Site ID.
     @param string $capability Capability name.
     @return bool Whether the user has the given capability.
    
  **/
  public function current_user_can_for_blog(blog_id:Int, capability:String):Bool;
  /**
    
     Whether the author of the supplied post has a specific capability.
    
     @since 2.9.0
    
     @param int|WP_Post $post       Post ID or post object.
     @param string      $capability Capability name.
     @return bool Whether the post author has the given capability.
    
  **/
  public function author_can(post:haxe.extern.EitherType<Int, wp.extern.Post>, capability:String):Bool;
  /**
    
     Whether a particular user has a specific capability.
    
     @since 3.1.0
    
     @param int|WP_User $user       User ID or object.
     @param string      $capability Capability name.
     @return bool Whether the user has the given capability.
    
  **/
  public function user_can(user:haxe.extern.EitherType<Int, wp.extern.User>, capability:String):Bool;
  /**
    
     Retrieves the global WP_Roles instance and instantiates it if necessary.
    
     @since 4.3.0
    
     @global WP_Roles $wp_roles WP_Roles global instance.
    
     @return WP_Roles WP_Roles global instance if not already instantiated.
    
  **/
  public function wp_roles():wp.extern.Roles;
  /**
    
     Retrieve role object.
    
     @since 2.0.0
    
     @param string $role Role name.
     @return WP_Role|null WP_Role object if found, null if the role does not exist.
    
  **/
  public function get_role(role:String):wp.extern.Role;
  /**
    
     Add role, if it does not exist.
    
     @since 2.0.0
    
     @param string $role Role name.
     @param string $display_name Display name for role.
     @param array $capabilities List of capabilities, e.g. array( 'edit_posts' => true, 'delete_posts' => false );
     @return WP_Role|null WP_Role object if role is added, null if already exists.
    
  **/
  public function add_role(role:String, display_name:String, ?capabilities:php.NativeStructArray<Dynamic>):wp.extern.Role;
  /**
    
     Remove role, if it exists.
    
     @since 2.0.0
    
     @param string $role Role name.
    
  **/
  public function remove_role(role:String):Void;
  /**
    
     Retrieve a list of super admins.
    
     @since 3.0.0
    
     @global array $super_admins
    
     @return array List of super admin logins
    
  **/
  public function get_super_admins():php.NativeArray;
  /**
    
     Determine if user is a site admin.
    
     @since 3.0.0
    
     @param int $user_id (Optional) The ID of a user. Defaults to the current user.
     @return bool True if the user is a site admin.
    
  **/
  public function is_super_admin(user_id:Int = false):Bool;
  /**
    
     Grants Super Admin privileges.
    
     @since 3.0.0
    
     @global array $super_admins
    
     @param int $user_id ID of the user to be granted Super Admin privileges.
     @return bool True on success, false on failure. This can fail when the user is
                  already a super admin or when the `$super_admins` global is defined.
    
  **/
  public function grant_super_admin(user_id:Int):Bool;
  /**
    
     Revokes Super Admin privileges.
    
     @since 3.0.0
    
     @global array $super_admins
    
     @param int $user_id ID of the user Super Admin privileges to be revoked from.
     @return bool True on success, false on failure. This can fail when the user's email
                  is the network admin email or when the `$super_admins` global is defined.
    
  **/
  public function revoke_super_admin(user_id:Int):Bool;
  /**
    
     Filters the user capabilities to grant the 'install_languages' capability as necessary.
    
     A user must have at least one out of the 'update_core', 'install_plugins', and
     'install_themes' capabilities to qualify for 'install_languages'.
    
     @since 4.9.0
    
     @param bool[] $allcaps An array of all the user's capabilities.
     @return bool[] Filtered array of the user's capabilities.
    
  **/
  public function wp_maybe_grant_install_languages_cap(allcaps:php.NativeIndexedArray<Bool>):php.NativeIndexedArray<Bool>;
}
