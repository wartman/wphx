package wp.extern;

extern class PluginApi implements wp.util.ApiFunctions {
  /**
    
     Hook a function or method to a specific filter action.
    
     WordPress offers filter hooks to allow plugins to modify
     various types of internal data at runtime.
    
     A plugin can modify data by binding a callback to a filter hook. When the filter
     is later applied, each bound callback is run in order of priority, and given
     the opportunity to modify a value by returning a new value.
    
     The following example shows how a callback function is bound to a filter hook.
    
     Note that `$example` is passed to the callback, (maybe) modified, then returned:
    
         function example_callback( $example ) {
             // Maybe modify $example in some way.
             return $example;
         }
         add_filter( 'example_filter', 'example_callback' );
    
     Bound callbacks can accept from none to the total number of arguments passed as parameters
     in the corresponding apply_filters() call.
    
     In other words, if an apply_filters() call passes four total arguments, callbacks bound to
     it can accept none (the same as 1) of the arguments or up to four. The important part is that
     the `$accepted_args` value must reflect the number of arguments the bound callback *actually*
     opted to accept. If no arguments were accepted by the callback that is considered to be the
     same as accepting 1 argument. For example:
    
         // Filter call.
         $value = apply_filters( 'hook', $value, $arg2, $arg3 );
    
         // Accepting zero/one arguments.
         function example_callback() {
             ...
             return 'some value';
         }
         add_filter( 'hook', 'example_callback' ); // Where $priority is default 10, $accepted_args is default 1.
    
         // Accepting two arguments (three possible).
         function example_callback( $value, $arg2 ) {
             ...
             return $maybe_modified_value;
         }
         add_filter( 'hook', 'example_callback', 10, 2 ); // Where $priority is 10, $accepted_args is 2.
    
     *Note:* The function will return true whether or not the callback is valid.
     It is up to you to take care. This is done for optimization purposes, so
     everything is as quick as possible.
    
     @since 0.71
    
     @global array $wp_filter      A multidimensional array of all hooks and the callbacks hooked to them.
    
     @param string   $tag             The name of the filter to hook the $function_to_add callback to.
     @param callable $function_to_add The callback to be run when the filter is applied.
     @param int      $priority        Optional. Used to specify the order in which the functions
                                      associated with a particular action are executed. Default 10.
                                      Lower numbers correspond with earlier execution,
                                      and functions with the same priority are executed
                                      in the order in which they were added to the action.
     @param int      $accepted_args   Optional. The number of arguments the function accepts. Default 1.
     @return true
    
  **/
  public function add_filter(tag:String, function_to_add:Dynamic, priority:Int = 10, accepted_args:Int = 1):Bool;
  /**
    
     Check if any filter has been registered for a hook.
    
     @since 2.5.0
    
     @global array $wp_filter Stores all of the filters.
    
     @param string        $tag               The name of the filter hook.
     @param callable|bool $function_to_check Optional. The callback to check for. Default false.
     @return false|int If $function_to_check is omitted, returns boolean for whether the hook has
                       anything registered. When checking a specific function, the priority of that
                       hook is returned, or false if the function is not attached. When using the
                       $function_to_check argument, this function may return a non-boolean value
                       that evaluates to false (e.g.) 0, so use the === operator for testing the
                       return value.
    
  **/
  public function has_filter(tag:String, function_to_check:haxe.extern.EitherType<Dynamic, Bool> = false):haxe.extern.EitherType<Bool, Int>;
  /**
    
     Call the functions added to a filter hook.
    
     The callback functions attached to filter hook $tag are invoked by calling
     this function. This function can be used to create a new filter hook by
     simply calling this function with the name of the new hook specified using
     the $tag parameter.
    
     The function allows for additional arguments to be added and passed to hooks.
    
         // Our filter callback function
         function example_callback( $string, $arg1, $arg2 ) {
             // (maybe) modify $string
             return $string;
         }
         add_filter( 'example_filter', 'example_callback', 10, 3 );
    
         /*
          * Apply the filters by calling the 'example_callback' function we
          * "hooked" to 'example_filter' using the add_filter() function above.
          * - 'example_filter' is the filter hook $tag
          * - 'filter me' is the value being filtered
          * - $arg1 and $arg2 are the additional arguments passed to the callback.
         $value = apply_filters( 'example_filter', 'filter me', $arg1, $arg2 );
    
     @since 0.71
    
     @global array $wp_filter         Stores all of the filters.
     @global array $wp_current_filter Stores the list of current filters with the current one last.
    
     @param string $tag     The name of the filter hook.
     @param mixed  $value   The value on which the filters hooked to `$tag` are applied on.
     @param mixed  $var,... Additional variables passed to the functions hooked to `$tag`.
     @return mixed The filtered value after all hooked functions are applied to it.
    
  **/
  public function apply_filters(tag:String, value:Dynamic, ?var_:Dynamic):Dynamic;
  /**
    
     Execute functions hooked on a specific filter hook, specifying arguments in an array.
    
     @since 3.0.0
    
     @see apply_filters() This function is identical, but the arguments passed to the
     functions hooked to `$tag` are supplied using an array.
    
     @global array $wp_filter         Stores all of the filters
     @global array $wp_current_filter Stores the list of current filters with the current one last
    
     @param string $tag  The name of the filter hook.
     @param array  $args The arguments supplied to the functions hooked to $tag.
     @return mixed The filtered value after all hooked functions are applied to it.
    
  **/
  public function apply_filters_ref_array(tag:String, args:php.NativeStructArray<Dynamic>):Dynamic;
  /**
    
     Removes a function from a specified filter hook.
    
     This function removes a function attached to a specified filter hook. This
     method can be used to remove default functions attached to a specific filter
     hook and possibly replace them with a substitute.
    
     To remove a hook, the $function_to_remove and $priority arguments must match
     when the hook was added. This goes for both filters and actions. No warning
     will be given on removal failure.
    
     @since 1.2.0
    
     @global array $wp_filter         Stores all of the filters
    
     @param string   $tag                The filter hook to which the function to be removed is hooked.
     @param callable $function_to_remove The name of the function which should be removed.
     @param int      $priority           Optional. The priority of the function. Default 10.
     @return bool    Whether the function existed before it was removed.
    
  **/
  public function remove_filter(tag:String, function_to_remove:Dynamic, priority:Int = 10):Bool;
  /**
    
     Remove all of the hooks from a filter.
    
     @since 2.7.0
    
     @global array $wp_filter  Stores all of the filters
    
     @param string   $tag      The filter to remove hooks from.
     @param int|bool $priority Optional. The priority number to remove. Default false.
     @return true True when finished.
    
  **/
  public function remove_all_filters(tag:String, priority:haxe.extern.EitherType<Int, Bool> = false):Bool;
  /**
    
     Retrieve the name of the current filter or action.
    
     @since 2.5.0
    
     @global array $wp_current_filter Stores the list of current filters with the current one last
    
     @return string Hook name of the current filter or action.
    
  **/
  public function current_filter():String;
  /**
    
     Retrieve the name of the current action.
    
     @since 3.9.0
    
     @return string Hook name of the current action.
    
  **/
  public function current_action():String;
  /**
    
     Retrieve the name of a filter currently being processed.
    
     The function current_filter() only returns the most recent filter or action
     being executed. did_action() returns true once the action is initially
     processed.
    
     This function allows detection for any filter currently being
     executed (despite not being the most recent filter to fire, in the case of
     hooks called from hook callbacks) to be verified.
    
     @since 3.9.0
    
     @see current_filter()
     @see did_action()
     @global array $wp_current_filter Current filter.
    
     @param null|string $filter Optional. Filter to check. Defaults to null, which
                                checks if any filter is currently being run.
     @return bool Whether the filter is currently in the stack.
    
  **/
  public function doing_filter(filter:String = null):Bool;
  /**
    
     Retrieve the name of an action currently being processed.
    
     @since 3.9.0
    
     @param string|null $action Optional. Action to check. Defaults to null, which checks
                                if any action is currently being run.
     @return bool Whether the action is currently in the stack.
    
  **/
  public function doing_action(action:String = null):Bool;
  /**
    
     Hooks a function on to a specific action.
    
     Actions are the hooks that the WordPress core launches at specific points
     during execution, or when specific events occur. Plugins can specify that
     one or more of its PHP functions are executed at these points, using the
     Action API.
    
     @since 1.2.0
    
     @param string   $tag             The name of the action to which the $function_to_add is hooked.
     @param callable $function_to_add The name of the function you wish to be called.
     @param int      $priority        Optional. Used to specify the order in which the functions
                                      associated with a particular action are executed. Default 10.
                                      Lower numbers correspond with earlier execution,
                                      and functions with the same priority are executed
                                      in the order in which they were added to the action.
     @param int      $accepted_args   Optional. The number of arguments the function accepts. Default 1.
     @return true Will always return true.
    
  **/
  public function add_action(tag:String, function_to_add:Dynamic, priority:Int = 10, accepted_args:Int = 1):Bool;
  /**
    
     Execute functions hooked on a specific action hook.
    
     This function invokes all functions attached to action hook `$tag`. It is
     possible to create new action hooks by simply calling this function,
     specifying the name of the new hook using the `$tag` parameter.
    
     You can pass extra arguments to the hooks, much like you can with apply_filters().
    
     @since 1.2.0
    
     @global array $wp_filter         Stores all of the filters
     @global array $wp_actions        Increments the amount of times action was triggered.
     @global array $wp_current_filter Stores the list of current filters with the current one last
    
     @param string $tag     The name of the action to be executed.
     @param mixed  $arg,... Optional. Additional arguments which are passed on to the
                            functions hooked to the action. Default empty.
    
  **/
  public function do_action(tag:String, arg:Dynamic = ''):Void;
  /**
    
     Retrieve the number of times an action is fired.
    
     @since 2.1.0
    
     @global array $wp_actions Increments the amount of times action was triggered.
    
     @param string $tag The name of the action hook.
     @return int The number of times action hook $tag is fired.
    
  **/
  public function did_action(tag:String):Int;
  /**
    
     Execute functions hooked on a specific action hook, specifying arguments in an array.
    
     @since 2.1.0
    
     @see do_action() This function is identical, but the arguments passed to the
                      functions hooked to $tag< are supplied using an array.
     @global array $wp_filter         Stores all of the filters
     @global array $wp_actions        Increments the amount of times action was triggered.
     @global array $wp_current_filter Stores the list of current filters with the current one last
    
     @param string $tag  The name of the action to be executed.
     @param array  $args The arguments supplied to the functions hooked to `$tag`.
    
  **/
  public function do_action_ref_array(tag:String, args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Check if any action has been registered for a hook.
    
     @since 2.5.0
    
     @see has_filter() has_action() is an alias of has_filter().
    
     @param string        $tag               The name of the action hook.
     @param callable|bool $function_to_check Optional. The callback to check for. Default false.
     @return bool|int If $function_to_check is omitted, returns boolean for whether the hook has
                      anything registered. When checking a specific function, the priority of that
                      hook is returned, or false if the function is not attached. When using the
                      $function_to_check argument, this function may return a non-boolean value
                      that evaluates to false (e.g.) 0, so use the === operator for testing the
                      return value.
    
  **/
  public function has_action(tag:String, function_to_check:haxe.extern.EitherType<Dynamic, Bool> = false):haxe.extern.EitherType<Bool, Int>;
  /**
    
     Removes a function from a specified action hook.
    
     This function removes a function attached to a specified action hook. This
     method can be used to remove default functions attached to a specific filter
     hook and possibly replace them with a substitute.
    
     @since 1.2.0
    
     @param string   $tag                The action hook to which the function to be removed is hooked.
     @param callable $function_to_remove The name of the function which should be removed.
     @param int      $priority           Optional. The priority of the function. Default 10.
     @return bool Whether the function is removed.
    
  **/
  public function remove_action(tag:String, function_to_remove:Dynamic, priority:Int = 10):Bool;
  /**
    
     Remove all of the hooks from an action.
    
     @since 2.7.0
    
     @param string   $tag      The action to remove hooks from.
     @param int|bool $priority The priority number to remove them from. Default false.
     @return true True when finished.
    
  **/
  public function remove_all_actions(tag:String, priority:haxe.extern.EitherType<Int, Bool> = false):Bool;
  /**
    
     Fires functions attached to a deprecated filter hook.
    
     When a filter hook is deprecated, the apply_filters() call is replaced with
     apply_filters_deprecated(), which triggers a deprecation notice and then fires
     the original filter hook.
    
     Note: the value and extra arguments passed to the original apply_filters() call
     must be passed here to `$args` as an array. For example:
    
         // Old filter.
         return apply_filters( 'wpdocs_filter', $value, $extra_arg );
    
         // Deprecated.
         return apply_filters_deprecated( 'wpdocs_filter', array( $value, $extra_arg ), '4.9', 'wpdocs_new_filter' );
    
     @since 4.6.0
    
     @see _deprecated_hook()
    
     @param string $tag         The name of the filter hook.
     @param array  $args        Array of additional function arguments to be passed to apply_filters().
     @param string $version     The version of WordPress that deprecated the hook.
     @param string $replacement Optional. The hook that should have been used. Default false.
     @param string $message     Optional. A message regarding the change. Default null.
    
  **/
  public function apply_filters_deprecated(tag:String, args:php.NativeStructArray<Dynamic>, version:String, replacement:String = cast false, message:String = null):Void;
  /**
    
     Fires functions attached to a deprecated action hook.
    
     When an action hook is deprecated, the do_action() call is replaced with
     do_action_deprecated(), which triggers a deprecation notice and then fires
     the original hook.
    
     @since 4.6.0
    
     @see _deprecated_hook()
    
     @param string $tag         The name of the action hook.
     @param array  $args        Array of additional function arguments to be passed to do_action().
     @param string $version     The version of WordPress that deprecated the hook.
     @param string $replacement Optional. The hook that should have been used.
     @param string $message     Optional. A message regarding the change.
    
  **/
  public function do_action_deprecated(tag:String, args:php.NativeStructArray<Dynamic>, version:String, replacement:String = cast false, message:String = null):Void;
  /**
    
     Gets the basename of a plugin.
    
     This method extracts the name of a plugin from its filename.
    
     @since 1.5.0
    
     @global array $wp_plugin_paths
    
     @param string $file The filename of plugin.
     @return string The name of a plugin.
    
  **/
  public function plugin_basename(file:String):String;
  /**
    
     Register a plugin's real path.
    
     This is used in plugin_basename() to resolve symlinked paths.
    
     @since 3.9.0
    
     @see wp_normalize_path()
    
     @global array $wp_plugin_paths
    
     @staticvar string $wp_plugin_path
     @staticvar string $wpmu_plugin_path
    
     @param string $file Known path to the file.
     @return bool Whether the path was able to be registered.
    
  **/
  public function wp_register_plugin_realpath(file:String):Bool;
  /**
    
     Get the filesystem directory path (with trailing slash) for the plugin __FILE__ passed in.
    
     @since 2.8.0
    
     @param string $file The filename of the plugin (__FILE__).
     @return string the filesystem path of the directory that contains the plugin.
    
  **/
  public function plugin_dir_path(file:String):String;
  /**
    
     Get the URL directory path (with trailing slash) for the plugin __FILE__ passed in.
    
     @since 2.8.0
    
     @param string $file The filename of the plugin (__FILE__).
     @return string the URL path of the directory that contains the plugin.
    
  **/
  public function plugin_dir_url(file:String):String;
  /**
    
     Set the activation hook for a plugin.
    
     When a plugin is activated, the action 'activate_PLUGINNAME' hook is
     called. In the name of this hook, PLUGINNAME is replaced with the name
     of the plugin, including the optional subdirectory. For example, when the
     plugin is located in wp-content/plugins/sampleplugin/sample.php, then
     the name of this hook will become 'activate_sampleplugin/sample.php'.
    
     When the plugin consists of only one file and is (as by default) located at
     wp-content/plugins/sample.php the name of this hook will be
     'activate_sample.php'.
    
     @since 2.0.0
    
     @param string   $file     The filename of the plugin including the path.
     @param callable $function The function hooked to the 'activate_PLUGIN' action.
    
  **/
  public function register_activation_hook(file:String, function_:Dynamic):Void;
  /**
    
     Set the deactivation hook for a plugin.
    
     When a plugin is deactivated, the action 'deactivate_PLUGINNAME' hook is
     called. In the name of this hook, PLUGINNAME is replaced with the name
     of the plugin, including the optional subdirectory. For example, when the
     plugin is located in wp-content/plugins/sampleplugin/sample.php, then
     the name of this hook will become 'deactivate_sampleplugin/sample.php'.
    
     When the plugin consists of only one file and is (as by default) located at
     wp-content/plugins/sample.php the name of this hook will be
     'deactivate_sample.php'.
    
     @since 2.0.0
    
     @param string   $file     The filename of the plugin including the path.
     @param callable $function The function hooked to the 'deactivate_PLUGIN' action.
    
  **/
  public function register_deactivation_hook(file:String, function_:Dynamic):Void;
  /**
    
     Set the uninstallation hook for a plugin.
    
     Registers the uninstall hook that will be called when the user clicks on the
     uninstall link that calls for the plugin to uninstall itself. The link won't
     be active unless the plugin hooks into the action.
    
     The plugin should not run arbitrary code outside of functions, when
     registering the uninstall hook. In order to run using the hook, the plugin
     will have to be included, which means that any code laying outside of a
     function will be run during the uninstallation process. The plugin should not
     hinder the uninstallation process.
    
     If the plugin can not be written without running code within the plugin, then
     the plugin should create a file named 'uninstall.php' in the base plugin
     folder. This file will be called, if it exists, during the uninstallation process
     bypassing the uninstall hook. The plugin, when using the 'uninstall.php'
     should always check for the 'WP_UNINSTALL_PLUGIN' constant, before
     executing.
    
     @since 2.7.0
    
     @param string   $file     Plugin file.
     @param callable $callback The callback to run when the hook is called. Must be
                               a static method or function.
    
  **/
  public function register_uninstall_hook(file:String, callback:Dynamic):Void;
  /**
    
     Call the 'all' hook, which will process the functions hooked into it.
    
     The 'all' hook passes all of the arguments or parameters that were used for
     the hook, which this function was called for.
    
     This function is used internally for apply_filters(), do_action(), and
     do_action_ref_array() and is not meant to be used from outside those
     functions. This function does not check for the existence of the all hook, so
     it will fail unless the all hook exists prior to this function call.
    
     @since 2.5.0
     @access private
    
     @global array $wp_filter  Stores all of the filters
    
     @param array $args The collected parameters from the hook that was called.
    
  **/
  public function _wp_call_all_hook(args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Build Unique ID for storage and retrieval.
    
     The old way to serialize the callback caused issues and this function is the
     solution. It works by checking for objects and creating a new property in
     the class to keep track of the object and new objects of the same class that
     need to be added.
    
     It also allows for the removal of actions and filters for objects after they
     change class properties. It is possible to include the property $wp_filter_id
     in your class and set it to "null" or a number to bypass the workaround.
     However this will prevent you from adding new classes and any new classes
     will overwrite the previous hook by the same class.
    
     Functions and static method callbacks are just returned as strings and
     shouldn't have any speed penalty.
    
     @link https://core.trac.wordpress.org/ticket/3875
    
     @since 2.2.3
     @access private
    
     @global array $wp_filter Storage for all of the filters and actions.
     @staticvar int $filter_id_count
    
     @param string   $tag      Used in counting how many hooks were applied
     @param callable $function Used for creating unique id
     @param int|bool $priority Used in counting how many hooks were applied. If === false
                               and $function is an object reference, we return the unique
                               id only if it already has one, false otherwise.
     @return string|false Unique ID for usage as array key or false if $priority === false
                          and $function is an object reference, and it does not already have
                          a unique id.
    
  **/
  public function _wp_filter_build_unique_id(tag:String, function_:Dynamic, priority:haxe.extern.EitherType<Int, Bool>):haxe.extern.EitherType<String, Bool>;
}
