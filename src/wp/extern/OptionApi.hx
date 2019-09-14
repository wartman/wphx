package wp.extern;

extern class OptionApi implements wp.util.ApiFunctions {
  /**
    
     Retrieves an option value based on an option name.
    
     If the option does not exist or does not have a value, then the return value
     will be false. This is useful to check whether you need to install an option
     and is commonly used during installation of plugin options and to test
     whether upgrading is required.
    
     If the option was serialized then it will be unserialized when it is returned.
    
     Any scalar values will be returned as strings. You may coerce the return type of
     a given option by registering an {@see 'option_$option'} filter callback.
    
     @since 1.5.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $option  Name of option to retrieve. Expected to not be SQL-escaped.
     @param mixed  $default Optional. Default value to return if the option does not exist.
     @return mixed Value set for the option.
    
  **/
  public function get_option(option:String, default:Dynamic = false):Dynamic;
  /**
    
     Protect WordPress special option from being modified.
    
     Will die if $option is in protected list. Protected options are 'alloptions'
     and 'notoptions' options.
    
     @since 2.2.0
    
     @param string $option Option name.
    
  **/
  public function wp_protect_special_option(option:String):Void;
  /**
    
     Print option value after sanitizing for forms.
    
     @since 1.5.0
    
     @param string $option Option name.
    
  **/
  public function form_option(option:String):Void;
  /**
    
     Loads and caches all autoloaded options, if available or all options.
    
     @since 2.2.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @return array List of all options.
    
  **/
  public function wp_load_alloptions():php.NativeArray;
  /**
    
     Loads and caches certain often requested site options if is_multisite() and a persistent cache is not being used.
    
     @since 3.0.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int $network_id Optional site ID for which to query the options. Defaults to the current site.
    
  **/
  public function wp_load_core_site_options(network_id:Int = null):Void;
  /**
    
     Update the value of an option that was already added.
    
     You do not need to serialize values. If the value needs to be serialized, then
     it will be serialized before it is inserted into the database. Remember,
     resources can not be serialized or added as an option.
    
     If the option does not exist, then the option will be added with the option value,
     with an `$autoload` value of 'yes'.
    
     @since 1.0.0
     @since 4.2.0 The `$autoload` parameter was added.
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string      $option   Option name. Expected to not be SQL-escaped.
     @param mixed       $value    Option value. Must be serializable if non-scalar. Expected to not be SQL-escaped.
     @param string|bool $autoload Optional. Whether to load the option when WordPress starts up. For existing options,
                                  `$autoload` can only be updated using `update_option()` if `$value` is also changed.
                                  Accepts 'yes'|true to enable or 'no'|false to disable. For non-existent options,
                                  the default value is 'yes'. Default null.
     @return bool False if value was not updated and true if value was updated.
    
  **/
  public function update_option(option:String, value:Dynamic, autoload:haxe.extern.EitherType<String, Bool> = null):Bool;
  /**
    
     Add a new option.
    
     You do not need to serialize values. If the value needs to be serialized, then
     it will be serialized before it is inserted into the database. Remember,
     resources can not be serialized or added as an option.
    
     You can create options without values and then update the values later.
     Existing options will not be updated and checks are performed to ensure that you
     aren't adding a protected WordPress option. Care should be taken to not name
     options the same as the ones which are protected.
    
     @since 1.0.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string         $option      Name of option to add. Expected to not be SQL-escaped.
     @param mixed          $value       Optional. Option value. Must be serializable if non-scalar. Expected to not be SQL-escaped.
     @param string         $deprecated  Optional. Description. Not used anymore.
     @param string|bool    $autoload    Optional. Whether to load the option when WordPress starts up.
                                        Default is enabled. Accepts 'no' to disable for legacy reasons.
     @return bool False if option was not added and true if option was added.
    
  **/
  public function add_option(option:String, value:Dynamic = '', deprecated:String = '', autoload:haxe.extern.EitherType<String, Bool> = 'yes'):Bool;
  /**
    
     Removes option by name. Prevents removal of protected WordPress options.
    
     @since 1.2.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $option Name of option to remove. Expected to not be SQL-escaped.
     @return bool True, if option is successfully deleted. False on failure.
    
  **/
  public function delete_option(option:String):Bool;
  /**
    
     Delete a transient.
    
     @since 2.8.0
    
     @param string $transient Transient name. Expected to not be SQL-escaped.
     @return bool true if successful, false otherwise
    
  **/
  public function delete_transient(transient:String):Bool;
  /**
    
     Get the value of a transient.
    
     If the transient does not exist, does not have a value, or has expired,
     then the return value will be false.
    
     @since 2.8.0
    
     @param string $transient Transient name. Expected to not be SQL-escaped.
     @return mixed Value of transient.
    
  **/
  public function get_transient(transient:String):Dynamic;
  /**
    
     Set/update the value of a transient.
    
     You do not need to serialize values. If the value needs to be serialized, then
     it will be serialized before it is set.
    
     @since 2.8.0
    
     @param string $transient  Transient name. Expected to not be SQL-escaped. Must be
                               172 characters or fewer in length.
     @param mixed  $value      Transient value. Must be serializable if non-scalar.
                               Expected to not be SQL-escaped.
     @param int    $expiration Optional. Time until expiration in seconds. Default 0 (no expiration).
     @return bool False if value was not set and true if value was set.
    
  **/
  public function set_transient(transient:String, value:Dynamic, expiration:Int = 0):Bool;
  /**
    
     Deletes all expired transients.
    
     The multi-table delete syntax is used to delete the transient record
     from table a, and the corresponding transient_timeout record from table b.
    
     @since 4.9.0
    
     @param bool $force_db Optional. Force cleanup to run against the database even when an external object cache is used.
    
  **/
  public function delete_expired_transients(force_db:Bool = false):Void;
  /**
    
     Saves and restores user interface settings stored in a cookie.
    
     Checks if the current user-settings cookie is updated and stores it. When no
     cookie exists (different browser used), adds the last saved cookie restoring
     the settings.
    
     @since 2.7.0
    
  **/
  public function wp_user_settings():Void;
  /**
    
     Retrieve user interface setting value based on setting name.
    
     @since 2.7.0
    
     @param string $name    The name of the setting.
     @param string $default Optional default value to return when $name is not set.
     @return mixed the last saved user setting or the default value/false if it doesn't exist.
    
  **/
  public function get_user_setting(name:String, default:String = false):Dynamic;
  /**
    
     Add or update user interface setting.
    
     Both $name and $value can contain only ASCII letters, numbers and underscores.
    
     This function has to be used before any output has started as it calls setcookie().
    
     @since 2.8.0
    
     @param string $name  The name of the setting.
     @param string $value The value for the setting.
     @return bool|null True if set successfully, false if not. Null if the current user can't be established.
    
  **/
  public function set_user_setting(name:String, value:String):Bool;
  /**
    
     Delete user interface settings.
    
     Deleting settings would reset them to the defaults.
    
     This function has to be used before any output has started as it calls setcookie().
    
     @since 2.7.0
    
     @param string $names The name or array of names of the setting to be deleted.
     @return bool|null True if deleted successfully, false if not. Null if the current user can't be established.
    
  **/
  public function delete_user_setting(names:String):Bool;
  /**
    
     Retrieve all user interface settings.
    
     @since 2.7.0
    
     @global array $_updated_user_settings
    
     @return array the last saved user settings or empty array.
    
  **/
  public function get_all_user_settings():php.NativeArray;
  /**
    
     Private. Set all user interface settings.
    
     @since 2.8.0
     @access private
    
     @global array $_updated_user_settings
    
     @param array $user_settings User settings.
     @return bool|null False if the current user can't be found, null if the current
                       user is not a super admin or a member of the site, otherwise true.
    
  **/
  public function wp_set_all_user_settings(user_settings:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Delete the user settings of the current user.
    
     @since 2.7.0
    
  **/
  public function delete_all_user_settings():Void;
  /**
    
     Retrieve an option value for the current network based on name of option.
    
     @since 2.8.0
     @since 4.4.0 The `$use_cache` parameter was deprecated.
     @since 4.4.0 Modified into wrapper for get_network_option()
    
     @see get_network_option()
    
     @param string $option     Name of option to retrieve. Expected to not be SQL-escaped.
     @param mixed  $default    Optional value to return if option doesn't exist. Default false.
     @param bool   $deprecated Whether to use cache. Multisite only. Always set to true.
     @return mixed Value set for the option.
    
  **/
  public function get_site_option(option:String, default:Dynamic = false, deprecated:Bool = true):Dynamic;
  /**
    
     Add a new option for the current network.
    
     Existing options will not be updated. Note that prior to 3.3 this wasn't the case.
    
     @since 2.8.0
     @since 4.4.0 Modified into wrapper for add_network_option()
    
     @see add_network_option()
    
     @param string $option Name of option to add. Expected to not be SQL-escaped.
     @param mixed  $value  Option value, can be anything. Expected to not be SQL-escaped.
     @return bool False if the option was not added. True if the option was added.
    
  **/
  public function add_site_option(option:String, value:Dynamic):Bool;
  /**
    
     Removes a option by name for the current network.
    
     @since 2.8.0
     @since 4.4.0 Modified into wrapper for delete_network_option()
    
     @see delete_network_option()
    
     @param string $option Name of option to remove. Expected to not be SQL-escaped.
     @return bool True, if succeed. False, if failure.
    
  **/
  public function delete_site_option(option:String):Bool;
  /**
    
     Update the value of an option that was already added for the current network.
    
     @since 2.8.0
     @since 4.4.0 Modified into wrapper for update_network_option()
    
     @see update_network_option()
    
     @param string $option Name of option. Expected to not be SQL-escaped.
     @param mixed  $value  Option value. Expected to not be SQL-escaped.
     @return bool False if value was not updated. True if value was updated.
    
  **/
  public function update_site_option(option:String, value:Dynamic):Bool;
  /**
    
     Retrieve a network's option value based on the option name.
    
     @since 4.4.0
    
     @see get_option()
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int      $network_id ID of the network. Can be null to default to the current network ID.
     @param string   $option     Name of option to retrieve. Expected to not be SQL-escaped.
     @param mixed    $default    Optional. Value to return if the option doesn't exist. Default false.
     @return mixed Value set for the option.
    
  **/
  public function get_network_option(network_id:Int, option:String, default:Dynamic = false):Dynamic;
  /**
    
     Add a new network option.
    
     Existing options will not be updated.
    
     @since 4.4.0
    
     @see add_option()
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int    $network_id ID of the network. Can be null to default to the current network ID.
     @param string $option     Name of option to add. Expected to not be SQL-escaped.
     @param mixed  $value      Option value, can be anything. Expected to not be SQL-escaped.
     @return bool False if option was not added and true if option was added.
    
  **/
  public function add_network_option(network_id:Int, option:String, value:Dynamic):Bool;
  /**
    
     Removes a network option by name.
    
     @since 4.4.0
    
     @see delete_option()
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int    $network_id ID of the network. Can be null to default to the current network ID.
     @param string $option     Name of option to remove. Expected to not be SQL-escaped.
     @return bool True, if succeed. False, if failure.
    
  **/
  public function delete_network_option(network_id:Int, option:String):Bool;
  /**
    
     Update the value of a network option that was already added.
    
     @since 4.4.0
    
     @see update_option()
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int      $network_id ID of the network. Can be null to default to the current network ID.
     @param string   $option     Name of option. Expected to not be SQL-escaped.
     @param mixed    $value      Option value. Expected to not be SQL-escaped.
     @return bool False if value was not updated and true if value was updated.
    
  **/
  public function update_network_option(network_id:Int, option:String, value:Dynamic):Bool;
  /**
    
     Delete a site transient.
    
     @since 2.9.0
    
     @param string $transient Transient name. Expected to not be SQL-escaped.
     @return bool True if successful, false otherwise
    
  **/
  public function delete_site_transient(transient:String):Bool;
  /**
    
     Get the value of a site transient.
    
     If the transient does not exist, does not have a value, or has expired,
     then the return value will be false.
    
     @since 2.9.0
    
     @see get_transient()
    
     @param string $transient Transient name. Expected to not be SQL-escaped.
     @return mixed Value of transient.
    
  **/
  public function get_site_transient(transient:String):Dynamic;
  /**
    
     Set/update the value of a site transient.
    
     You do not need to serialize values, if the value needs to be serialize, then
     it will be serialized before it is set.
    
     @since 2.9.0
    
     @see set_transient()
    
     @param string $transient  Transient name. Expected to not be SQL-escaped. Must be
                               167 characters or fewer in length.
     @param mixed  $value      Transient value. Expected to not be SQL-escaped.
     @param int    $expiration Optional. Time until expiration in seconds. Default 0 (no expiration).
     @return bool False if value was not set and true if value was set.
    
  **/
  public function set_site_transient(transient:String, value:Dynamic, expiration:Int = 0):Bool;
  /**
    
     Register default settings available in WordPress.
    
     The settings registered here are primarily useful for the REST API, so this
     does not encompass all settings available in WordPress.
    
     @since 4.7.0
    
  **/
  public function register_initial_settings():Void;
  /**
    
     Register a setting and its data.
    
     @since 2.7.0
     @since 4.7.0 `$args` can be passed to set flags on the setting, similar to `register_meta()`.
    
     @global array $new_whitelist_options
     @global array $wp_registered_settings
    
     @param string $option_group A settings group name. Should correspond to a whitelisted option key name.
      Default whitelisted option key names include "general," "discussion," and "reading," among others.
     @param string $option_name The name of an option to sanitize and save.
     @param array  $args {
         Data used to describe the setting when registered.
    
         @type string   $type              The type of data associated with this setting.
                                           Valid values are 'string', 'boolean', 'integer', and 'number'.
         @type string   $description       A description of the data attached to this setting.
         @type callable $sanitize_callback A callback function that sanitizes the option's value.
         @type bool     $show_in_rest      Whether data associated with this setting should be included in the REST API.
         @type mixed    $default           Default value when calling `get_option()`.
     }
    
  **/
  public function register_setting(option_group:String, option_name:String, ?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Unregister a setting.
    
     @since 2.7.0
     @since 4.7.0 `$sanitize_callback` was deprecated. The callback from `register_setting()` is now used instead.
    
     @global array $new_whitelist_options
     @global array $wp_registered_settings
    
     @param string   $option_group      The settings group name used during registration.
     @param string   $option_name       The name of the option to unregister.
     @param callable $deprecated        Deprecated.
    
  **/
  public function unregister_setting(option_group:String, option_name:String, deprecated:Dynamic = ''):Void;
  /**
    
     Retrieves an array of registered settings.
    
     @since 4.7.0
    
     @global array $wp_registered_settings
    
     @return array List of registered settings, keyed by option name.
    
  **/
  public function get_registered_settings():php.NativeArray;
  /**
    
     Filter the default value for the option.
    
     For settings which register a default setting in `register_setting()`, this
     function is added as a filter to `default_option_{$option}`.
    
     @since 4.7.0
    
     @param mixed $default Existing default value to return.
     @param string $option Option name.
     @param bool $passed_default Was `get_option()` passed a default value?
     @return mixed Filtered default value.
    
  **/
  public function filter_default_option(default:Dynamic, option:String, passed_default:Bool):Dynamic;
}
