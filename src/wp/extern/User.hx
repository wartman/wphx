package wp.extern;

@:native("WP_User")
extern class User {
  /**
    
     User data container.
    
     @since 2.0.0
     @var object
    
  **/
  @:native("data") public var data:Dynamic;
  /**
    
     The user's ID.
    
     @since 2.1.0
     @var int
    
  **/
  @:native("ID") public var id:Int;
  /**
    
     The individual capabilities the user has been given.
    
     @since 2.0.0
     @var array
    
  **/
  @:native("caps") public var caps:php.NativeStructArray<Dynamic>;
  /**
    
     User metadata option name.
    
     @since 2.0.0
     @var string
    
  **/
  @:native("cap_key") public var capKey:String;
  /**
    
     The roles the user is part of.
    
     @since 2.0.0
     @var array
    
  **/
  @:native("roles") public var roles:php.NativeStructArray<Dynamic>;
  /**
    
     All capabilities the user has, including individual and role based.
    
     @since 2.0.0
     @var bool[] Array of key/value pairs where keys represent a capability name and boolean values
                 represent whether the user has that capability.
    
  **/
  @:native("allcaps") public var allcaps:php.NativeIndexedArray<Bool>;
  /**
    
     The filter context applied to user data fields.
    
     @since 2.9.0
     @var string
    
  **/
  @:native("filter") public var filter:String;
  /**
    
     Constructor.
    
     Retrieves the userdata and passes it to WP_User::init().
    
     @since 2.0.0
    
     @param int|string|stdClass|WP_User $id User's ID, a WP_User object, or a user object from the DB.
     @param string $name Optional. User's username
     @param int $site_id Optional Site ID, defaults to current site.
    
  **/
  public function new(id:haxe.extern.EitherType<Int, haxe.extern.EitherType<String, haxe.extern.EitherType<Dynamic, wp.extern.User>>> = 0, name:String = '', site_id:Int = ''):Void;
  /**
    
     Sets up object properties, including capabilities.
    
     @since  3.3.0
    
     @param object $data    User DB row object.
     @param int    $site_id Optional. The site ID to initialize for.
    
  **/
  @:native("init") public function init(data:Dynamic, site_id:Int = ''):Void;
  /**
    
     Return only the main user fields
    
     @since 3.3.0
     @since 4.4.0 Added 'ID' as an alias of 'id' for the `$field` parameter.
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $field The field to query against: 'id', 'ID', 'slug', 'email' or 'login'.
     @param string|int $value The field value
     @return object|false Raw user object
    
  **/
  @:native("get_data_by") public static function getDataBy(field:String, value:haxe.extern.EitherType<String, Int>):haxe.extern.EitherType<Dynamic, Bool>;
  /**
    
     Magic method for checking the existence of a certain custom field.
    
     @since 3.3.0
    
     @param string $key User meta key to check if set.
     @return bool Whether the given user meta key is set.
    
  **/
  @:native("__isset") public function __isset(key:String):Bool;
  /**
    
     Magic method for accessing custom fields.
    
     @since 3.3.0
    
     @param string $key User meta key to retrieve.
     @return mixed Value of the given user meta key (if set). If `$key` is 'id', the user ID.
    
  **/
  @:native("__get") public function __get(key:String):Dynamic;
  /**
    
     Magic method for setting custom user fields.
    
     This method does not update custom fields in the database. It only stores
     the value on the WP_User instance.
    
     @since 3.3.0
    
     @param string $key   User meta key.
     @param mixed  $value User meta value.
    
  **/
  @:native("__set") public function __set(key:String, value:Dynamic):Void;
  /**
    
     Magic method for unsetting a certain custom field.
    
     @since 4.4.0
    
     @param string $key User meta key to unset.
    
  **/
  @:native("__unset") public function __unset(key:String):Void;
  /**
    
     Determine whether the user exists in the database.
    
     @since 3.4.0
    
     @return bool True if user exists in the database, false if not.
    
  **/
  @:native("exists") public function exists():Bool;
  /**
    
     Retrieve the value of a property or meta key.
    
     Retrieves from the users and usermeta table.
    
     @since 3.3.0
    
     @param string $key Property
     @return mixed
    
  **/
  @:native("get") public function get(key:String):Dynamic;
  /**
    
     Determine whether a property or meta key is set
    
     Consults the users and usermeta tables.
    
     @since 3.3.0
    
     @param string $key Property
     @return bool
    
  **/
  @:native("has_prop") public function hasProp(key:String):Bool;
  /**
    
     Return an array representation.
    
     @since 3.5.0
    
     @return array Array representation.
    
  **/
  @:native("to_array") public function toArray():php.NativeArray;
  /**
    
     Makes private/protected methods readable for backward compatibility.
    
     @since 4.3.0
    
     @param string   $name      Method to call.
     @param array    $arguments Arguments to pass when calling.
     @return mixed|false Return value of the callback, false otherwise.
    
  **/
  @:native("__call") public function __call(name:String, arguments:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Dynamic, Bool>;
  /**
    
     Retrieves all of the capabilities of the roles of the user, and merges them with individual user capabilities.
    
     All of the capabilities of the roles of the user are merged with the user's individual capabilities. This means
     that the user can be denied specific capabilities that their role might have, but the user is specifically denied.
    
     @since 2.0.0
    
     @return bool[] Array of key/value pairs where keys represent a capability name and boolean values
                    represent whether the user has that capability.
    
  **/
  @:native("get_role_caps") public function getRoleCaps():php.NativeIndexedArray<Bool>;
  /**
    
     Add role to user.
    
     Updates the user's meta data option with capabilities and roles.
    
     @since 2.0.0
    
     @param string $role Role name.
    
  **/
  @:native("add_role") public function addRole(role:String):Void;
  /**
    
     Remove role from user.
    
     @since 2.0.0
    
     @param string $role Role name.
    
  **/
  @:native("remove_role") public function removeRole(role:String):Void;
  /**
    
     Set the role of the user.
    
     This will remove the previous roles of the user and assign the user the
     new one. You can set the role to an empty string and it will remove all
     of the roles from the user.
    
     @since 2.0.0
    
     @param string $role Role name.
    
  **/
  @:native("set_role") public function setRole(role:String):Void;
  /**
    
     Choose the maximum level the user has.
    
     Will compare the level from the $item parameter against the $max
     parameter. If the item is incorrect, then just the $max parameter value
     will be returned.
    
     Used to get the max level based on the capabilities the user has. This
     is also based on roles, so if the user is assigned the Administrator role
     then the capability 'level_10' will exist and the user will get that
     value.
    
     @since 2.0.0
    
     @param int $max Max level of user.
     @param string $item Level capability name.
     @return int Max Level.
    
  **/
  @:native("level_reduction") public function levelReduction(max:Int, item:String):Int;
  /**
    
     Update the maximum user level for the user.
    
     Updates the 'user_level' user metadata (includes prefix that is the
     database table prefix) with the maximum user level. Gets the value from
     the all of the capabilities that the user has.
    
     @since 2.0.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
  **/
  @:native("update_user_level_from_caps") public function updateUserLevelFromCaps():Void;
  /**
    
     Add capability and grant or deny access to capability.
    
     @since 2.0.0
    
     @param string $cap Capability name.
     @param bool $grant Whether to grant capability to user.
    
  **/
  @:native("add_cap") public function addCap(cap:String, grant:Bool = true):Void;
  /**
    
     Remove capability from user.
    
     @since 2.0.0
    
     @param string $cap Capability name.
    
  **/
  @:native("remove_cap") public function removeCap(cap:String):Void;
  /**
    
     Remove all of the capabilities of the user.
    
     @since 2.1.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
  **/
  @:native("remove_all_caps") public function removeAllCaps():Void;
  /**
    
     Whether the user has a specific capability.
    
     While checking against a role in place of a capability is supported in part, this practice is discouraged as it
     may produce unreliable results.
    
     @since 2.0.0
    
     @see map_meta_cap()
    
     @param string $cap           Capability name.
     @param int    $object_id,... Optional. ID of a specific object to check against if `$cap` is a "meta" capability.
                                  Meta capabilities such as `edit_post` and `edit_user` are capabilities used by
                                  by the `map_meta_cap()` function to map to primitive capabilities that a user or
                                  role has, such as `edit_posts` and `edit_others_posts`.
     @return bool Whether the user has the given capability, or, if `$object_id` is passed, whether the user has
                  the given capability for that object.
    
  **/
  @:native("has_cap") public function hasCap(cap:String, object_id:Int):Bool;
  /**
    
     Convert numeric level to level capability name.
    
     Prepends 'level_' to level number.
    
     @since 2.0.0
    
     @param int $level Level number, 1 to 10.
     @return string
    
  **/
  @:native("translate_level_to_cap") public function translateLevelToCap(level:Int):String;
  /**
    
     Set the site to operate on. Defaults to the current site.
    
     @since 3.0.0
     @deprecated 4.9.0 Use WP_User::for_site()
    
     @param int $blog_id Optional. Site ID, defaults to current site.
    
  **/
  @:native("for_blog") public function forBlog(blog_id:Int = ''):Void;
  /**
    
     Sets the site to operate on. Defaults to the current site.
    
     @since 4.9.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int $site_id Site ID to initialize user capabilities for. Default is the current site.
    
  **/
  @:native("for_site") public function forSite(site_id:Int = ''):Void;
  /**
    
     Gets the ID of the site for which the user's capabilities are currently initialized.
    
     @since 4.9.0
    
     @return int Site ID.
    
  **/
  @:native("get_site_id") public function getSiteId():Int;
}
