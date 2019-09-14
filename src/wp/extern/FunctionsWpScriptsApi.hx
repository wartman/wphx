package wp.extern;

extern class FunctionsWpScriptsApi implements wp.util.ApiFunctions {
  /**
    
     Initialize $wp_scripts if it has not been set.
    
     @global WP_Scripts $wp_scripts
    
     @since 4.2.0
    
     @return WP_Scripts WP_Scripts instance.
    
  **/
  public function wp_scripts():wp.extern.Scripts;
  /**
    
     Helper function to output a _doing_it_wrong message when applicable.
    
     @ignore
     @since 4.2.0
    
     @param string $function Function name.
    
  **/
  public function _wp_scripts_maybe_doing_it_wrong(function_:String):Void;
  /**
    
     Prints scripts in document head that are in the $handles queue.
    
     Called by admin-header.php and {@see 'wp_head'} hook. Since it is called by wp_head on every page load,
     the function does not instantiate the WP_Scripts object unless script names are explicitly passed.
     Makes use of already-instantiated $wp_scripts global if present. Use provided {@see 'wp_print_scripts'}
     hook to register/enqueue new scripts.
    
     @see WP_Scripts::do_items()
     @global WP_Scripts $wp_scripts The WP_Scripts object for printing scripts.
    
     @since 2.1.0
    
     @param string|bool|array $handles Optional. Scripts to be printed. Default 'false'.
     @return array On success, a processed array of WP_Dependencies items; otherwise, an empty array.
    
  **/
  public function wp_print_scripts(handles:haxe.extern.EitherType<String, haxe.extern.EitherType<Bool, php.NativeStructArray<Dynamic>>> = false):php.NativeArray;
  /**
    
     Adds extra code to a registered script.
    
     Code will only be added if the script is already in the queue.
     Accepts a string $data containing the Code. If two or more code blocks
     are added to the same script $handle, they will be printed in the order
     they were added, i.e. the latter added code can redeclare the previous.
    
     @since 4.5.0
    
     @see WP_Scripts::add_inline_script()
    
     @param string $handle   Name of the script to add the inline script to.
     @param string $data     String containing the javascript to be added.
     @param string $position Optional. Whether to add the inline script before the handle
                             or after. Default 'after'.
     @return bool True on success, false on failure.
    
  **/
  public function wp_add_inline_script(handle:String, data:String, position:String = 'after'):Bool;
  /**
    
     Register a new script.
    
     Registers a script to be enqueued later using the wp_enqueue_script() function.
    
     @see WP_Dependencies::add()
     @see WP_Dependencies::add_data()
    
     @since 2.1.0
     @since 4.3.0 A return value was added.
    
     @param string           $handle    Name of the script. Should be unique.
     @param string|bool      $src       Full URL of the script, or path of the script relative to the WordPress root directory.
                                        If source is set to false, script is an alias of other scripts it depends on.
     @param array            $deps      Optional. An array of registered script handles this script depends on. Default empty array.
     @param string|bool|null $ver       Optional. String specifying script version number, if it has one, which is added to the URL
                                        as a query string for cache busting purposes. If version is set to false, a version
                                        number is automatically added equal to current installed WordPress version.
                                        If set to null, no version is added.
     @param bool             $in_footer Optional. Whether to enqueue the script before </body> instead of in the <head>.
                                        Default 'false'.
     @return bool Whether the script has been registered. True on success, false on failure.
    
  **/
  public function wp_register_script(handle:String, src:haxe.extern.EitherType<String, Bool>, ?deps:php.NativeStructArray<Dynamic>, ver:haxe.extern.EitherType<String, Bool> = false, in_footer:Bool = false):Bool;
  /**
    
     Localize a script.
    
     Works only if the script has already been added.
    
     Accepts an associative array $l10n and creates a JavaScript object:
    
         "$object_name" = {
             key: value,
             key: value,
             ...
         }
    
     @see WP_Dependencies::localize()
     @link https://core.trac.wordpress.org/ticket/11520
     @global WP_Scripts $wp_scripts The WP_Scripts object for printing scripts.
    
     @since 2.2.0
    
     @todo Documentation cleanup
    
     @param string $handle      Script handle the data will be attached to.
     @param string $object_name Name for the JavaScript object. Passed directly, so it should be qualified JS variable.
                                Example: '/[a-zA-Z0-9_]+/'.
     @param array $l10n         The data itself. The data can be either a single or multi-dimensional array.
     @return bool True if the script was successfully localized, false otherwise.
    
  **/
  public function wp_localize_script(handle:String, object_name:String, l10n:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Sets translated strings for a script.
    
     Works only if the script has already been added.
    
     @see WP_Scripts::set_translations()
     @global WP_Scripts $wp_scripts The WP_Scripts object for printing scripts.
    
     @since 5.0.0
     @since 5.1.0 The `$domain` parameter was made optional.
    
     @param string $handle Script handle the textdomain will be attached to.
     @param string $domain Optional. Text domain. Default 'default'.
     @param string $path   Optional. The full file path to the directory containing translation files.
     @return bool True if the text domain was successfully localized, false otherwise.
    
  **/
  public function wp_set_script_translations(handle:String, domain:String = 'default', path:String = null):Bool;
  /**
    
     Remove a registered script.
    
     Note: there are intentional safeguards in place to prevent critical admin scripts,
     such as jQuery core, from being unregistered.
    
     @see WP_Dependencies::remove()
    
     @since 2.1.0
    
     @param string $handle Name of the script to be removed.
    
  **/
  public function wp_deregister_script(handle:String):Void;
  /**
    
     Enqueue a script.
    
     Registers the script if $src provided (does NOT overwrite), and enqueues it.
    
     @see WP_Dependencies::add()
     @see WP_Dependencies::add_data()
     @see WP_Dependencies::enqueue()
    
     @since 2.1.0
    
     @param string           $handle    Name of the script. Should be unique.
     @param string           $src       Full URL of the script, or path of the script relative to the WordPress root directory.
                                        Default empty.
     @param array            $deps      Optional. An array of registered script handles this script depends on. Default empty array.
     @param string|bool|null $ver       Optional. String specifying script version number, if it has one, which is added to the URL
                                        as a query string for cache busting purposes. If version is set to false, a version
                                        number is automatically added equal to current installed WordPress version.
                                        If set to null, no version is added.
     @param bool             $in_footer Optional. Whether to enqueue the script before </body> instead of in the <head>.
                                        Default 'false'.
    
  **/
  public function wp_enqueue_script(handle:String, src:String = '', ?deps:php.NativeStructArray<Dynamic>, ver:haxe.extern.EitherType<String, Bool> = false, in_footer:Bool = false):Void;
  /**
    
     Remove a previously enqueued script.
    
     @see WP_Dependencies::dequeue()
    
     @since 3.1.0
    
     @param string $handle Name of the script to be removed.
    
  **/
  public function wp_dequeue_script(handle:String):Void;
  /**
    
     Determines whether a script has been added to the queue.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.8.0
     @since 3.5.0 'enqueued' added as an alias of the 'queue' list.
    
     @param string $handle Name of the script.
     @param string $list   Optional. Status of the script to check. Default 'enqueued'.
                           Accepts 'enqueued', 'registered', 'queue', 'to_do', and 'done'.
     @return bool Whether the script is queued.
    
  **/
  public function wp_script_is(handle:String, list:String = 'enqueued'):Bool;
  /**
    
     Add metadata to a script.
    
     Works only if the script has already been added.
    
     Possible values for $key and $value:
     'conditional' string Comments for IE 6, lte IE 7, etc.
    
     @since 4.2.0
    
     @see WP_Dependencies::add_data()
    
     @param string $handle Name of the script.
     @param string $key    Name of data point for which we're storing a value.
     @param mixed  $value  String containing the data to be added.
     @return bool True on success, false on failure.
    
  **/
  public function wp_script_add_data(handle:String, key:String, value:Dynamic):Bool;
}
