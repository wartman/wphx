package wp.extern;

@:native("WP_Theme")
extern class Theme {
  /**
    
     Whether the theme has been marked as updateable.
    
     @since 4.4.0
     @var bool
    
     @see WP_MS_Themes_List_Table
    
  **/
  @:native("update") public var update:Bool;
  /**
    
     Constructor for WP_Theme.
    
     @since  3.4.0
    
     @global array $wp_theme_directories
    
     @param string $theme_dir Directory of the theme within the theme_root.
     @param string $theme_root Theme root.
     @param WP_Error|void $_child If this theme is a parent theme, the child may be passed for validation purposes.
    
  **/
  public function new(theme_dir:String, theme_root:String, _child:wp.extern.Error = null):Void;
  /**
    
     When converting the object to a string, the theme name is returned.
    
     @since  3.4.0
    
     @return string Theme name, ready for display (translated)
    
  **/
  @:native("__toString") public function __toString():String;
  /**
    
     __isset() magic method for properties formerly returned by current_theme_info()
    
     @staticvar array $properties
    
     @since  3.4.0
    
     @param string $offset Property to check if set.
     @return bool Whether the given property is set.
    
  **/
  @:native("__isset") public function __isset(offset:String):Bool;
  /**
    
     __get() magic method for properties formerly returned by current_theme_info()
    
     @since  3.4.0
    
     @param string $offset Property to get.
     @return mixed Property value.
    
  **/
  @:native("__get") public function __get(offset:String):Dynamic;
  /**
    
     Method to implement ArrayAccess for keys formerly returned by get_themes()
    
     @since  3.4.0
    
     @param mixed $offset
     @param mixed $value
    
  **/
  @:native("offsetSet") public function offsetSet(offset:Dynamic, value:Dynamic):Void;
  /**
    
     Method to implement ArrayAccess for keys formerly returned by get_themes()
    
     @since  3.4.0
    
     @param mixed $offset
    
  **/
  @:native("offsetUnset") public function offsetUnset(offset:Dynamic):Void;
  /**
    
     Method to implement ArrayAccess for keys formerly returned by get_themes()
    
     @staticvar array $keys
    
     @since  3.4.0
    
     @param mixed $offset
     @return bool
    
  **/
  @:native("offsetExists") public function offsetExists(offset:Dynamic):Bool;
  /**
    
     Method to implement ArrayAccess for keys formerly returned by get_themes().
    
     Author, Author Name, Author URI, and Description did not previously return
     translated data. We are doing so now as it is safe to do. However, as
     Name and Title could have been used as the key for get_themes(), both remain
     untranslated for back compatibility. This means that ['Name'] is not ideal,
     and care should be taken to use `$theme::display( 'Name' )` to get a properly
     translated header.
    
     @since  3.4.0
    
     @param mixed $offset
     @return mixed
    
  **/
  @:native("offsetGet") public function offsetGet(offset:Dynamic):Dynamic;
  /**
    
     Returns errors property.
    
     @since 3.4.0
    
     @return WP_Error|false WP_Error if there are errors, or false.
    
  **/
  @:native("errors") public function errors():haxe.extern.EitherType<wp.extern.Error, Bool>;
  /**
    
     Whether the theme exists.
    
     A theme with errors exists. A theme with the error of 'theme_not_found',
     meaning that the theme's directory was not found, does not exist.
    
     @since 3.4.0
    
     @return bool Whether the theme exists.
    
  **/
  @:native("exists") public function exists():Bool;
  /**
    
     Returns reference to the parent theme.
    
     @since 3.4.0
    
     @return WP_Theme|false Parent theme, or false if the current theme is not a child theme.
    
  **/
  @:native("parent") public function parent():haxe.extern.EitherType<wp.extern.Theme, Bool>;
  /**
    
     Clears the cache for the theme.
    
     @since 3.4.0
    
  **/
  @:native("cache_delete") public function cacheDelete():Void;
  /**
    
     Get a raw, unformatted theme header.
    
     The header is sanitized, but is not translated, and is not marked up for display.
     To get a theme header for display, use the display() method.
    
     Use the get_template() method, not the 'Template' header, for finding the template.
     The 'Template' header is only good for what was written in the style.css, while
     get_template() takes into account where WordPress actually located the theme and
     whether it is actually valid.
    
     @since 3.4.0
    
     @param string $header Theme header. Name, Description, Author, Version, ThemeURI, AuthorURI, Status, Tags.
     @return string|false String on success, false on failure.
    
  **/
  @:native("get") public function get(header:String):haxe.extern.EitherType<String, Bool>;
  /**
    
     Gets a theme header, formatted and translated for display.
    
     @since 3.4.0
    
     @param string $header Theme header. Name, Description, Author, Version, ThemeURI, AuthorURI, Status, Tags.
     @param bool $markup Optional. Whether to mark up the header. Defaults to true.
     @param bool $translate Optional. Whether to translate the header. Defaults to true.
     @return string|false Processed header, false on failure.
    
  **/
  @:native("display") public function display(header:String, markup:Bool = true, translate:Bool = true):haxe.extern.EitherType<String, Bool>;
  /**
    
     The directory name of the theme's "stylesheet" files, inside the theme root.
    
     In the case of a child theme, this is directory name of the child theme.
     Otherwise, get_stylesheet() is the same as get_template().
    
     @since 3.4.0
    
     @return string Stylesheet
    
  **/
  @:native("get_stylesheet") public function getStylesheet():String;
  /**
    
     The directory name of the theme's "template" files, inside the theme root.
    
     In the case of a child theme, this is the directory name of the parent theme.
     Otherwise, the get_template() is the same as get_stylesheet().
    
     @since 3.4.0
    
     @return string Template
    
  **/
  @:native("get_template") public function getTemplate():String;
  /**
    
     Returns the absolute path to the directory of a theme's "stylesheet" files.
    
     In the case of a child theme, this is the absolute path to the directory
     of the child theme's files.
    
     @since 3.4.0
    
     @return string Absolute path of the stylesheet directory.
    
  **/
  @:native("get_stylesheet_directory") public function getStylesheetDirectory():String;
  /**
    
     Returns the absolute path to the directory of a theme's "template" files.
    
     In the case of a child theme, this is the absolute path to the directory
     of the parent theme's files.
    
     @since 3.4.0
    
     @return string Absolute path of the template directory.
    
  **/
  @:native("get_template_directory") public function getTemplateDirectory():String;
  /**
    
     Returns the URL to the directory of a theme's "stylesheet" files.
    
     In the case of a child theme, this is the URL to the directory of the
     child theme's files.
    
     @since 3.4.0
    
     @return string URL to the stylesheet directory.
    
  **/
  @:native("get_stylesheet_directory_uri") public function getStylesheetDirectoryUri():String;
  /**
    
     Returns the URL to the directory of a theme's "template" files.
    
     In the case of a child theme, this is the URL to the directory of the
     parent theme's files.
    
     @since 3.4.0
    
     @return string URL to the template directory.
    
  **/
  @:native("get_template_directory_uri") public function getTemplateDirectoryUri():String;
  /**
    
     The absolute path to the directory of the theme root.
    
     This is typically the absolute path to wp-content/themes.
    
     @since 3.4.0
    
     @return string Theme root.
    
  **/
  @:native("get_theme_root") public function getThemeRoot():String;
  /**
    
     Returns the URL to the directory of the theme root.
    
     This is typically the absolute URL to wp-content/themes. This forms the basis
     for all other URLs returned by WP_Theme, so we pass it to the public function
     get_theme_root_uri() and allow it to run the {@see 'theme_root_uri'} filter.
    
     @since 3.4.0
    
     @return string Theme root URI.
    
  **/
  @:native("get_theme_root_uri") public function getThemeRootUri():String;
  /**
    
     Returns the main screenshot file for the theme.
    
     The main screenshot is called screenshot.png. gif and jpg extensions are also allowed.
    
     Screenshots for a theme must be in the stylesheet directory. (In the case of child
     themes, parent theme screenshots are not inherited.)
    
     @since 3.4.0
    
     @param string $uri Type of URL to return, either 'relative' or an absolute URI. Defaults to absolute URI.
     @return string|false Screenshot file. False if the theme does not have a screenshot.
    
  **/
  @:native("get_screenshot") public function getScreenshot(uri:String = 'uri'):haxe.extern.EitherType<String, Bool>;
  /**
    
     Return files in the theme's directory.
    
     @since 3.4.0
    
     @param mixed $type Optional. Array of extensions to return. Defaults to all files (null).
     @param int $depth Optional. How deep to search for files. Defaults to a flat scan (0 depth). -1 depth is infinite.
     @param bool $search_parent Optional. Whether to return parent files. Defaults to false.
     @return array Array of files, keyed by the path to the file relative to the theme's directory, with the values
                   being absolute paths.
    
  **/
  @:native("get_files") public function getFiles(type:Dynamic = null, depth:Int = 0, search_parent:Bool = false):php.NativeArray;
  /**
    
     Returns the theme's post templates.
    
     @since 4.7.0
    
     @return array Array of page templates, keyed by filename and post type,
                   with the value of the translated header name.
    
  **/
  @:native("get_post_templates") public function getPostTemplates():php.NativeArray;
  /**
    
     Returns the theme's post templates for a given post type.
    
     @since 3.4.0
     @since 4.7.0 Added the `$post_type` parameter.
    
     @param WP_Post|null $post      Optional. The post being edited, provided for context.
     @param string       $post_type Optional. Post type to get the templates for. Default 'page'.
                                    If a post is provided, its post type is used.
     @return array Array of page templates, keyed by filename, with the value of the translated header name.
    
  **/
  @:native("get_page_templates") public function getPageTemplates(post:wp.extern.Post = null, post_type:String = 'page'):php.NativeArray;
  /**
    
     Loads the theme's textdomain.
    
     Translation files are not inherited from the parent theme. Todo: if this fails for the
     child theme, it should probably try to load the parent theme's translations.
    
     @since 3.4.0
    
     @return bool True if the textdomain was successfully loaded or has already been loaded.
      False if no textdomain was specified in the file headers, or if the domain could not be loaded.
    
  **/
  @:native("load_textdomain") public function loadTextdomain():Bool;
  /**
    
     Whether the theme is allowed (multisite only).
    
     @since 3.4.0
    
     @param string $check Optional. Whether to check only the 'network'-wide settings, the 'site'
      settings, or 'both'. Defaults to 'both'.
     @param int $blog_id Optional. Ignored if only network-wide settings are checked. Defaults to current site.
     @return bool Whether the theme is allowed for the network. Returns true in single-site.
    
  **/
  @:native("is_allowed") public function isAllowed(check:String = 'both', blog_id:Int = null):Bool;
  /**
    
     Determines the latest WordPress default theme that is installed.
    
     This hits the filesystem.
    
     @since  4.4.0
    
     @return WP_Theme|false Object, or false if no theme is installed, which would be bad.
    
  **/
  @:native("get_core_default_theme") public static function getCoreDefaultTheme():haxe.extern.EitherType<wp.extern.Theme, Bool>;
  /**
    
     Returns array of stylesheet names of themes allowed on the site or network.
    
     @since 3.4.0
    
     @param int $blog_id Optional. ID of the site. Defaults to the current site.
     @return string[] Array of stylesheet names.
    
  **/
  @:native("get_allowed") public static function getAllowed(blog_id:Int = null):php.NativeIndexedArray<String>;
  /**
    
     Returns array of stylesheet names of themes allowed on the network.
    
     @since 3.4.0
    
     @staticvar array $allowed_themes
    
     @return string[] Array of stylesheet names.
    
  **/
  @:native("get_allowed_on_network") public static function getAllowedOnNetwork():php.NativeIndexedArray<String>;
  /**
    
     Returns array of stylesheet names of themes allowed on the site.
    
     @since 3.4.0
    
     @staticvar array $allowed_themes
    
     @param int $blog_id Optional. ID of the site. Defaults to the current site.
     @return string[] Array of stylesheet names.
    
  **/
  @:native("get_allowed_on_site") public static function getAllowedOnSite(blog_id:Int = null):php.NativeIndexedArray<String>;
  /**
    
     Enables a theme for all sites on the current network.
    
     @since 4.6.0
    
     @param string|string[] $stylesheets Stylesheet name or array of stylesheet names.
    
  **/
  @:native("network_enable_theme") public static function networkEnableTheme(stylesheets:haxe.extern.EitherType<String, php.NativeIndexedArray<String>>):Void;
  /**
    
     Disables a theme for all sites on the current network.
    
     @since 4.6.0
    
     @param string|string[] $stylesheets Stylesheet name or array of stylesheet names.
    
  **/
  @:native("network_disable_theme") public static function networkDisableTheme(stylesheets:haxe.extern.EitherType<String, php.NativeIndexedArray<String>>):Void;
  /**
    
     Sorts themes by name.
    
     @since 3.4.0
    
     @param WP_Theme[] $themes Array of theme objects to sort (passed by reference).
    
  **/
  @:native("sort_by_name") public static function sortByName(themes:php.NativeIndexedArray<wp.extern.Theme>):Void;
}
