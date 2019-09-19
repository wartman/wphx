package wp.extern;

@:native("WP_Scripts")
extern class Scripts {
  /**
    
     Base URL for scripts.
    
     Full URL with trailing slash.
    
     @since 2.6.0
     @var string
    
  **/
  @:native("base_url") public var baseUrl:String;
  /**
    
     URL of the content directory.
    
     @since 2.8.0
     @var string
    
  **/
  @:native("content_url") public var contentUrl:String;
  /**
    
     Default version string for scripts.
    
     @since 2.6.0
     @var string
    
  **/
  @:native("default_version") public var defaultVersion:String;
  /**
    
     Holds handles of scripts which are enqueued in footer.
    
     @since 2.8.0
     @var array
    
  **/
  @:native("in_footer") public var inFooter:php.NativeStructArray<Dynamic>;
  /**
    
     Holds a list of script handles which will be concatenated.
    
     @since 2.8.0
     @var string
    
  **/
  @:native("concat") public var concat:String;
  /**
    
     Holds a string which contains script handles and their version.
    
     @since 2.8.0
     @deprecated 3.4.0
     @var string
    
  **/
  @:native("concat_version") public var concatVersion:String;
  /**
    
     Whether to perform concatenation.
    
     @since 2.8.0
     @var bool
    
  **/
  @:native("do_concat") public var doConcat:Bool;
  /**
    
     Holds HTML markup of scripts and additional data if concatenation
     is enabled.
    
     @since 2.8.0
     @var string
    
  **/
  @:native("print_html") public var printHtml:String;
  /**
    
     Holds inline code if concatenation is enabled.
    
     @since 2.8.0
     @var string
    
  **/
  @:native("print_code") public var printCode:String;
  /**
    
     Holds a list of script handles which are not in the default directory
     if concatenation is enabled.
    
     Unused in core.
    
     @since 2.8.0
     @var string
    
  **/
  @:native("ext_handles") public var extHandles:String;
  /**
    
     Holds a string which contains handles and versions of scripts which
     are not in the default directory if concatenation is enabled.
    
     Unused in core.
    
     @since 2.8.0
     @var string
    
  **/
  @:native("ext_version") public var extVersion:String;
  /**
    
     List of default directories.
    
     @since 2.8.0
     @var array
    
  **/
  @:native("default_dirs") public var defaultDirs:php.NativeStructArray<Dynamic>;
  /**
    
     Constructor.
    
     @since 2.6.0
    
  **/
  public function new():Void;
  /**
    
     Initialize the class.
    
     @since 3.4.0
    
  **/
  @:native("init") public function init():Void;
  /**
    
     Prints scripts.
    
     Prints the scripts passed to it or the print queue. Also prints all necessary dependencies.
    
     @since 2.1.0
     @since 2.8.0 Added the `$group` parameter.
    
     @param mixed $handles Optional. Scripts to be printed. (void) prints queue, (string) prints
                           that script, (array of strings) prints those scripts. Default false.
     @param int   $group   Optional. If scripts were queued in groups prints this group number.
                           Default false.
     @return array Scripts that have been printed.
    
  **/
  @:native("print_scripts") public function printScripts(handles:Dynamic = false, group:Int = cast false):php.NativeArray;
  /**
    
     Prints extra scripts of a registered script.
    
     @since 2.1.0
     @since 2.8.0 Added the `$echo` parameter.
     @deprecated 3.3.0
    
     @see print_extra_script()
    
     @param string $handle The script's registered handle.
     @param bool   $echo   Optional. Whether to echo the extra script instead of just returning it.
                           Default true.
     @return bool|string|void Void if no data exists, extra scripts if `$echo` is true, true otherwise.
    
  **/
  @:native("print_scripts_l10n") public function printScriptsL10n(handle:String, echo:Bool = true):haxe.extern.EitherType<Bool, String>;
  /**
    
     Prints extra scripts of a registered script.
    
     @since 3.3.0
    
     @param string $handle The script's registered handle.
     @param bool   $echo   Optional. Whether to echo the extra script instead of just returning it.
                           Default true.
     @return bool|string|void Void if no data exists, extra scripts if `$echo` is true, true otherwise.
    
  **/
  @:native("print_extra_script") public function printExtraScript(handle:String, echo:Bool = true):haxe.extern.EitherType<Bool, String>;
  /**
    
     Processes a script dependency.
    
     @since 2.6.0
     @since 2.8.0 Added the `$group` parameter.
    
     @see WP_Dependencies::do_item()
    
     @param string    $handle The script's registered handle.
     @param int|false $group  Optional. Group level: (int) level, (false) no groups. Default false.
     @return bool True on success, false on failure.
    
  **/
  @:native("do_item") public function doItem(handle:String, group:haxe.extern.EitherType<Int, Bool> = false):Bool;
  /**
    
     Adds extra code to a registered script.
    
     @since 4.5.0
    
     @param string $handle   Name of the script to add the inline script to. Must be lowercase.
     @param string $data     String containing the javascript to be added.
     @param string $position Optional. Whether to add the inline script before the handle
                             or after. Default 'after'.
     @return bool True on success, false on failure.
    
  **/
  @:native("add_inline_script") public function addInlineScript(handle:String, data:String, position:String = 'after'):Bool;
  /**
    
     Prints inline scripts registered for a specific handle.
    
     @since 4.5.0
    
     @param string $handle   Name of the script to add the inline script to. Must be lowercase.
     @param string $position Optional. Whether to add the inline script before the handle
                             or after. Default 'after'.
     @param bool   $echo     Optional. Whether to echo the script instead of just returning it.
                             Default true.
     @return string|false Script on success, false otherwise.
    
  **/
  @:native("print_inline_script") public function printInlineScript(handle:String, position:String = 'after', echo:Bool = true):haxe.extern.EitherType<String, Bool>;
  /**
    
     Localizes a script, only if the script has already been added.
    
     @since 2.1.0
    
     @param string $handle      Name of the script to attach data to.
     @param string $object_name Name of the variable that will contain the data.
     @param array  $l10n        Array of data to localize.
     @return bool True on success, false on failure.
    
  **/
  @:native("localize") public function localize(handle:String, object_name:String, l10n:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Sets handle group.
    
     @since 2.8.0
    
     @see WP_Dependencies::set_group()
    
     @param string    $handle    Name of the item. Should be unique.
     @param bool      $recursion Internal flag that calling function was called recursively.
     @param int|false $group     Optional. Group level: (int) level, (false) no groups. Default false.
     @return bool Not already in the group or a lower group
    
  **/
  @:native("set_group") public function setGroup(handle:String, recursion:Bool, group:haxe.extern.EitherType<Int, Bool> = false):Bool;
  /**
    
     Sets a translation textdomain.
    
     @since 5.0.0
     @since 5.1.0 The `$domain` parameter was made optional.
    
     @param string $handle Name of the script to register a translation domain to.
     @param string $domain Optional. Text domain. Default 'default'.
     @param string $path   Optional. The full file path to the directory containing translation files.
     @return bool True if the text domain was registered, false if not.
    
  **/
  @:native("set_translations") public function setTranslations(handle:String, domain:String = 'default', path:String = null):Bool;
  /**
    
     Prints translations set for a specific handle.
    
     @since 5.0.0
    
     @param string $handle Name of the script to add the inline script to. Must be lowercase.
     @param bool   $echo   Optional. Whether to echo the script instead of just returning it.
                           Default true.
     @return string|false Script on success, false otherwise.
    
  **/
  @:native("print_translations") public function printTranslations(handle:String, echo:Bool = true):haxe.extern.EitherType<String, Bool>;
  /**
    
     Determines script dependencies.
    
     @since 2.1.0
    
     @see WP_Dependencies::all_deps()
    
     @param mixed     $handles   Item handle and argument (string) or item handles and arguments (array of strings).
     @param bool      $recursion Internal flag that function is calling itself.
     @param int|false $group     Optional. Group level: (int) level, (false) no groups. Default false.
     @return bool True on success, false on failure.
    
  **/
  @:native("all_deps") public function allDeps(handles:Dynamic, recursion:Bool = false, group:haxe.extern.EitherType<Int, Bool> = false):Bool;
  /**
    
     Processes items and dependencies for the head group.
    
     @since 2.8.0
    
     @see WP_Dependencies::do_items()
    
     @return array Handles of items that have been processed.
    
  **/
  @:native("do_head_items") public function doHeadItems():php.NativeArray;
  /**
    
     Processes items and dependencies for the footer group.
    
     @since 2.8.0
    
     @see WP_Dependencies::do_items()
    
     @return array Handles of items that have been processed.
    
  **/
  @:native("do_footer_items") public function doFooterItems():php.NativeArray;
  /**
    
     Whether a handle's source is in a default directory.
    
     @since 2.8.0
    
     @param string $src The source of the enqueued script.
     @return bool True if found, false if not.
    
  **/
  @:native("in_default_dir") public function inDefaultDir(src:String):Bool;
  /**
    
     Resets class properties.
    
     @since 2.8.0
    
  **/
  @:native("reset") public function reset():Void;
}
