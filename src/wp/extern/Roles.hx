package wp.extern;

@:native("WP_Roles")
extern class Roles {
  /**
    
     List of roles and capabilities.
    
     @since 2.0.0
     @var array[]
    
  **/
  @:native("roles") public var roles:php.NativeIndexedArray<php.NativeStructArray<Dynamic>>;
  /**
    
     List of the role objects.
    
     @since 2.0.0
     @var WP_Role[]
    
  **/
  @:native("role_objects") public var roleObjects:php.NativeIndexedArray<wp.extern.Role>;
  /**
    
     List of role names.
    
     @since 2.0.0
     @var string[]
    
  **/
  @:native("role_names") public var roleNames:php.NativeIndexedArray<String>;
  /**
    
     Option name for storing role list.
    
     @since 2.0.0
     @var string
    
  **/
  @:native("role_key") public var roleKey:String;
  /**
    
     Whether to use the database for retrieval and storage.
    
     @since 2.1.0
     @var bool
    
  **/
  @:native("use_db") public var useDb:Bool;
  /**
    
     Constructor
    
     @since 2.0.0
     @since 4.9.0 The `$site_id` argument was added.
    
     @global array $wp_user_roles Used to set the 'roles' property value.
    
     @param int $site_id Site ID to initialize roles for. Default is the current site.
    
  **/
  public function new(site_id:Int = null):Void;
  /**
    
     Make private/protected methods readable for backward compatibility.
    
     @since 4.0.0
    
     @param string   $name      Method to call.
     @param array    $arguments Arguments to pass when calling.
     @return mixed|false Return value of the callback, false otherwise.
    
  **/
  @:native("__call") public function __call(name:String, arguments:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Dynamic, Bool>;
  /**
    
     Reinitialize the object
    
     Recreates the role objects. This is typically called only by switch_to_blog()
     after switching wpdb to a new site ID.
    
     @since 3.5.0
     @deprecated 4.7.0 Use WP_Roles::for_site()
    
  **/
  @:native("reinit") public function reinit():Void;
  /**
    
     Add role name with capabilities to list.
    
     Updates the list of roles, if the role doesn't already exist.
    
     The capabilities are defined in the following format `array( 'read' => true );`
     To explicitly deny a role a capability you set the value for that capability to false.
    
     @since 2.0.0
    
     @param string $role Role name.
     @param string $display_name Role display name.
     @param array $capabilities List of role capabilities in the above format.
     @return WP_Role|void WP_Role object, if role is added.
    
  **/
  @:native("add_role") public function addRole(role:String, display_name:String, ?capabilities:php.NativeStructArray<Dynamic>):wp.extern.Role;
  /**
    
     Remove role by name.
    
     @since 2.0.0
    
     @param string $role Role name.
    
  **/
  @:native("remove_role") public function removeRole(role:String):Void;
  /**
    
     Add capability to role.
    
     @since 2.0.0
    
     @param string $role Role name.
     @param string $cap Capability name.
     @param bool $grant Optional, default is true. Whether role is capable of performing capability.
    
  **/
  @:native("add_cap") public function addCap(role:String, cap:String, grant:Bool = true):Void;
  /**
    
     Remove capability from role.
    
     @since 2.0.0
    
     @param string $role Role name.
     @param string $cap Capability name.
    
  **/
  @:native("remove_cap") public function removeCap(role:String, cap:String):Void;
  /**
    
     Retrieve role object by name.
    
     @since 2.0.0
    
     @param string $role Role name.
     @return WP_Role|null WP_Role object if found, null if the role does not exist.
    
  **/
  @:native("get_role") public function getRole(role:String):wp.extern.Role;
  /**
    
     Retrieve list of role names.
    
     @since 2.0.0
    
     @return string[] List of role names.
    
  **/
  @:native("get_names") public function getNames():php.NativeIndexedArray<String>;
  /**
    
     Whether role name is currently in the list of available roles.
    
     @since 2.0.0
    
     @param string $role Role name to look up.
     @return bool
    
  **/
  @:native("is_role") public function isRole(role:String):Bool;
  /**
    
     Initializes all of the available roles.
    
     @since 4.9.0
    
  **/
  @:native("init_roles") public function initRoles():Void;
  /**
    
     Sets the site to operate on. Defaults to the current site.
    
     @since 4.9.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int $site_id Site ID to initialize roles for. Default is the current site.
    
  **/
  @:native("for_site") public function forSite(site_id:Int = null):Void;
  /**
    
     Gets the ID of the site for which roles are currently initialized.
    
     @since 4.9.0
    
     @return int Site ID.
    
  **/
  @:native("get_site_id") public function getSiteId():Int;
}
