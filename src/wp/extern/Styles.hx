package wp.extern;

@:native("WP_Styles")
extern class Styles {
  /**
    
     Base URL for styles.
    
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
    
     Default version string for stylesheets.
    
     @since 2.6.0
     @var string
    
  **/
  @:native("default_version") public var defaultVersion:String;
  /**
    
     The current text direction.
    
     @since 2.6.0
     @var string
    
  **/
  @:native("text_direction") public var textDirection:String;
  /**
    
     Holds a list of style handles which will be concatenated.
    
     @since 2.8.0
     @var string
    
  **/
  @:native("concat") public var concat:String;
  /**
    
     Holds a string which contains style handles and their version.
    
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
    
     Holds HTML markup of styles and additional data if concatenation
     is enabled.
    
     @since 2.8.0
     @var string
    
  **/
  @:native("print_html") public var printHtml:String;
  /**
    
     Holds inline styles if concatenation is enabled.
    
     @since 3.3.0
     @var string
    
  **/
  @:native("print_code") public var printCode:String;
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
    
     Processes a style dependency.
    
     @since 2.6.0
    
     @see WP_Dependencies::do_item()
    
     @param string $handle The style's registered handle.
     @return bool True on success, false on failure.
    
  **/
  @:native("do_item") public function doItem(handle:String):Bool;
  /**
    
     Adds extra CSS styles to a registered stylesheet.
    
     @since 3.3.0
    
     @param string $handle The style's registered handle.
     @param string $code   String containing the CSS styles to be added.
     @return bool True on success, false on failure.
    
  **/
  @:native("add_inline_style") public function addInlineStyle(handle:String, code:String):Bool;
  /**
    
     Prints extra CSS styles of a registered stylesheet.
    
     @since 3.3.0
    
     @param string $handle The style's registered handle.
     @param bool   $echo   Optional. Whether to echo the inline style instead of just returning it.
                           Default true.
     @return string|bool False if no data exists, inline styles if `$echo` is true, true otherwise.
    
  **/
  @:native("print_inline_style") public function printInlineStyle(handle:String, echo:Bool = true):haxe.extern.EitherType<String, Bool>;
  /**
    
     Determines style dependencies.
    
     @since 2.6.0
    
     @see WP_Dependencies::all_deps()
    
     @param mixed     $handles   Item handle and argument (string) or item handles and arguments (array of strings).
     @param bool      $recursion Internal flag that function is calling itself.
     @param int|false $group     Group level: (int) level, (false) no groups.
     @return bool True on success, false on failure.
    
  **/
  @:native("all_deps") public function allDeps(handles:Dynamic, recursion:Bool = false, group:haxe.extern.EitherType<Int, Bool> = false):Bool;
  /**
    
     Generates an enqueued style's fully-qualified URL.
    
     @since 2.6.0
    
     @param string $src The source of the enqueued style.
     @param string $ver The version of the enqueued style.
     @param string $handle The style's registered handle.
     @return string Style's fully-qualified URL.
    
  **/
  @:native("_css_href") public function _cssHref(src:String, ver:String, handle:String):String;
  /**
    
     Whether a handle's source is in a default directory.
    
     @since 2.8.0
    
     @param string $src The source of the enqueued style.
     @return bool True if found, false if not.
    
  **/
  @:native("in_default_dir") public function inDefaultDir(src:String):Bool;
  /**
    
     Processes items and dependencies for the footer group.
    
     HTML 5 allows styles in the body, grab late enqueued items and output them in the footer.
    
     @since 3.3.0
    
     @see WP_Dependencies::do_items()
    
     @return array Handles of items that have been processed.
    
  **/
  @:native("do_footer_items") public function doFooterItems():php.NativeArray;
  /**
    
     Resets class properties.
    
     @since 3.3.0
    
  **/
  @:native("reset") public function reset():Void;
}
