package wp.extern;

extern class ThemeApi implements wp.util.ApiFunctions {
  /**
    
     Returns an array of WP_Theme objects based on the arguments.
    
     Despite advances over get_themes(), this function is quite expensive, and grows
     linearly with additional themes. Stick to wp_get_theme() if possible.
    
     @since 3.4.0
    
     @global array $wp_theme_directories
     @staticvar array $_themes
    
     @param array $args {
         Optional. The search arguments.
    
         @type mixed $errors  True to return themes with errors, false to return themes without errors, null to return all themes.
                              Defaults to false.
         @type mixed $allowed (Multisite) True to return only allowed themes for a site. False to return only disallowed themes for a site.
                              'site' to return only site-allowed themes. 'network' to return only network-allowed themes.
                              Null to return all themes. Defaults to null.
         @type int   $blog_id (Multisite) The blog ID used to calculate which themes are allowed.
                              Defaults to 0, synonymous for the current blog.
     }
     @return WP_Theme[] Array of WP_Theme objects.
    
  **/
  public function wp_get_themes(?args:php.NativeStructArray<Dynamic>):php.NativeIndexedArray<wp.extern.Theme>;
  /**
    
     Gets a WP_Theme object for a theme.
    
     @since 3.4.0
    
     @global array $wp_theme_directories
    
     @param string $stylesheet Directory name for the theme. Optional. Defaults to current theme.
     @param string $theme_root Absolute path of the theme root to look in. Optional. If not specified, get_raw_theme_root()
                               is used to calculate the theme root for the $stylesheet provided (or current theme).
     @return WP_Theme Theme object. Be sure to check the object's exists() method if you need to confirm the theme's existence.
    
  **/
  public function wp_get_theme(stylesheet:String = null, theme_root:String = null):wp.extern.Theme;
  /**
    
     Clears the cache held by get_theme_roots() and WP_Theme.
    
     @since 3.5.0
     @param bool $clear_update_cache Whether to clear the Theme updates cache
    
  **/
  public function wp_clean_themes_cache(clear_update_cache:Bool = true):Void;
  /**
    
     Whether a child theme is in use.
    
     @since 3.0.0
    
     @return bool true if a child theme is in use, false otherwise.
    
  **/
  public function is_child_theme():Bool;
  /**
    
     Retrieve name of the current stylesheet.
    
     The theme name that the administrator has currently set the front end theme
     as.
    
     For all intents and purposes, the template name and the stylesheet name are
     going to be the same for most cases.
    
     @since 1.5.0
    
     @return string Stylesheet name.
    
  **/
  public function get_stylesheet():String;
  /**
    
     Retrieve stylesheet directory path for current theme.
    
     @since 1.5.0
    
     @return string Path to current theme directory.
    
  **/
  public function get_stylesheet_directory():String;
  /**
    
     Retrieve stylesheet directory URI.
    
     @since 1.5.0
    
     @return string
    
  **/
  public function get_stylesheet_directory_uri():String;
  /**
    
     Retrieves the URI of current theme stylesheet.
    
     The stylesheet file name is 'style.css' which is appended to the stylesheet directory URI path.
     See get_stylesheet_directory_uri().
    
     @since 1.5.0
    
     @return string
    
  **/
  public function get_stylesheet_uri():String;
  /**
    
     Retrieves the localized stylesheet URI.
    
     The stylesheet directory for the localized stylesheet files are located, by
     default, in the base theme directory. The name of the locale file will be the
     locale followed by '.css'. If that does not exist, then the text direction
     stylesheet will be checked for existence, for example 'ltr.css'.
    
     The theme may change the location of the stylesheet directory by either using
     the {@see 'stylesheet_directory_uri'} or {@see 'locale_stylesheet_uri'} filters.
    
     If you want to change the location of the stylesheet files for the entire
     WordPress workflow, then change the former. If you just have the locale in a
     separate folder, then change the latter.
    
     @since 2.1.0
    
     @global WP_Locale $wp_locale
    
     @return string
    
  **/
  public function get_locale_stylesheet_uri():String;
  /**
    
     Retrieve name of the current theme.
    
     @since 1.5.0
    
     @return string Template name.
    
  **/
  public function get_template():String;
  /**
    
     Retrieve current theme directory.
    
     @since 1.5.0
    
     @return string Template directory path.
    
  **/
  public function get_template_directory():String;
  /**
    
     Retrieve theme directory URI.
    
     @since 1.5.0
    
     @return string Template directory URI.
    
  **/
  public function get_template_directory_uri():String;
  /**
    
     Retrieve theme roots.
    
     @since 2.9.0
    
     @global array $wp_theme_directories
    
     @return array|string An array of theme roots keyed by template/stylesheet or a single theme root if all themes have the same root.
    
  **/
  public function get_theme_roots():haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>;
  /**
    
     Register a directory that contains themes.
    
     @since 2.9.0
    
     @global array $wp_theme_directories
    
     @param string $directory Either the full filesystem path to a theme folder or a folder within WP_CONTENT_DIR
     @return bool
    
  **/
  public function register_theme_directory(directory:String):Bool;
  /**
    
     Search all registered theme directories for complete and valid themes.
    
     @since 2.9.0
    
     @global array $wp_theme_directories
     @staticvar array $found_themes
    
     @param bool $force Optional. Whether to force a new directory scan. Defaults to false.
     @return array|false Valid themes found
    
  **/
  public function search_theme_directories(force:Bool = false):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Retrieve path to themes directory.
    
     Does not have trailing slash.
    
     @since 1.5.0
    
     @global array $wp_theme_directories
    
     @param string $stylesheet_or_template The stylesheet or template name of the theme
     @return string Theme path.
    
  **/
  public function get_theme_root(stylesheet_or_template:String = cast false):String;
  /**
    
     Retrieve URI for themes directory.
    
     Does not have trailing slash.
    
     @since 1.5.0
    
     @global array $wp_theme_directories
    
     @param string $stylesheet_or_template Optional. The stylesheet or template name of the theme.
                                           Default is to leverage the main theme root.
     @param string $theme_root             Optional. The theme root for which calculations will be based, preventing
                                           the need for a get_raw_theme_root() call.
     @return string Themes URI.
    
  **/
  public function get_theme_root_uri(stylesheet_or_template:String = cast false, theme_root:String = cast false):String;
  /**
    
     Get the raw theme root relative to the content directory with no filters applied.
    
     @since 3.1.0
    
     @global array $wp_theme_directories
    
     @param string $stylesheet_or_template The stylesheet or template name of the theme
     @param bool   $skip_cache             Optional. Whether to skip the cache.
                                           Defaults to false, meaning the cache is used.
     @return string Theme root
    
  **/
  public function get_raw_theme_root(stylesheet_or_template:String, skip_cache:Bool = false):String;
  /**
    
     Display localized stylesheet link element.
    
     @since 2.1.0
    
  **/
  public function locale_stylesheet():Void;
  /**
    
     Switches the theme.
    
     Accepts one argument: $stylesheet of the theme. It also accepts an additional function signature
     of two arguments: $template then $stylesheet. This is for backward compatibility.
    
     @since 2.5.0
    
     @global array                $wp_theme_directories
     @global WP_Customize_Manager $wp_customize
     @global array                $sidebars_widgets
    
     @param string $stylesheet Stylesheet name
    
  **/
  public function switch_theme(stylesheet:String):Void;
  /**
    
     Checks that current theme files 'index.php' and 'style.css' exists.
    
     Does not initially check the default theme, which is the fallback and should always exist.
     But if it doesn't exist, it'll fall back to the latest core default theme that does exist.
     Will switch theme to the fallback theme if current theme does not validate.
    
     You can use the {@see 'validate_current_theme'} filter to return false to
     disable this functionality.
    
     @since 1.5.0
     @see WP_DEFAULT_THEME
    
     @return bool
    
  **/
  public function validate_current_theme():Bool;
  /**
    
     Retrieve all theme modifications.
    
     @since 3.1.0
    
     @return array|void Theme modifications.
    
  **/
  public function get_theme_mods():php.NativeArray;
  /**
    
     Retrieve theme modification value for the current theme.
    
     If the modification name does not exist, then the $default will be passed
     through {@link https://secure.php.net/sprintf sprintf()} PHP function with the first
     string the template directory URI and the second string the stylesheet
     directory URI.
    
     @since 2.1.0
    
     @param string      $name    Theme modification name.
     @param bool|string $default
     @return mixed
    
  **/
  public function get_theme_mod(name:String, default_:haxe.extern.EitherType<Bool, String> = false):Dynamic;
  /**
    
     Update theme modification value for the current theme.
    
     @since 2.1.0
    
     @param string $name  Theme modification name.
     @param mixed  $value Theme modification value.
    
  **/
  public function set_theme_mod(name:String, value:Dynamic):Void;
  /**
    
     Remove theme modification name from current theme list.
    
     If removing the name also removes all elements, then the entire option will
     be removed.
    
     @since 2.1.0
    
     @param string $name Theme modification name.
    
  **/
  public function remove_theme_mod(name:String):Void;
  /**
    
     Remove theme modifications option for current theme.
    
     @since 2.1.0
    
  **/
  public function remove_theme_mods():Void;
  /**
    
     Retrieves the custom header text color in 3- or 6-digit hexadecimal form.
    
     @since 2.1.0
    
     @return string Header text color in 3- or 6-digit hexadecimal form (minus the hash symbol).
    
  **/
  public function get_header_textcolor():String;
  /**
    
     Displays the custom header text color in 3- or 6-digit hexadecimal form (minus the hash symbol).
    
     @since 2.1.0
    
  **/
  public function header_textcolor():Void;
  /**
    
     Whether to display the header text.
    
     @since 3.4.0
    
     @return bool
    
  **/
  public function display_header_text():Bool;
  /**
    
     Check whether a header image is set or not.
    
     @since 4.2.0
    
     @see get_header_image()
    
     @return bool Whether a header image is set or not.
    
  **/
  public function has_header_image():Bool;
  /**
    
     Retrieve header image for custom header.
    
     @since 2.1.0
    
     @return string|false
    
  **/
  public function get_header_image():haxe.extern.EitherType<String, Bool>;
  /**
    
     Create image tag markup for a custom header image.
    
     @since 4.4.0
    
     @param array $attr Optional. Additional attributes for the image tag. Can be used
                                  to override the default attributes. Default empty.
     @return string HTML image element markup or empty string on failure.
    
  **/
  public function get_header_image_tag(?attr:php.NativeStructArray<Dynamic>):String;
  /**
    
     Display the image markup for a custom header image.
    
     @since 4.4.0
    
     @param array $attr Optional. Attributes for the image markup. Default empty.
    
  **/
  public function the_header_image_tag(?attr:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Get random header image data from registered images in theme.
    
     @since 3.4.0
    
     @access private
    
     @global array  $_wp_default_headers
     @staticvar object $_wp_random_header
    
     @return object
    
  **/
  public function _get_random_header_data():Dynamic;
  /**
    
     Get random header image url from registered images in theme.
    
     @since 3.2.0
    
     @return string Path to header image
    
  **/
  public function get_random_header_image():String;
  /**
    
     Check if random header image is in use.
    
     Always true if user expressly chooses the option in Appearance > Header.
     Also true if theme has multiple header images registered, no specific header image
     is chosen, and theme turns on random headers with add_theme_support().
    
     @since 3.2.0
    
     @param string $type The random pool to use. any|default|uploaded
     @return bool
    
  **/
  public function is_random_header_image(type:String = 'any'):Bool;
  /**
    
     Display header image URL.
    
     @since 2.1.0
    
  **/
  public function header_image():Void;
  /**
    
     Get the header images uploaded for the current theme.
    
     @since 3.2.0
    
     @return array
    
  **/
  public function get_uploaded_header_images():php.NativeArray;
  /**
    
     Get the header image data.
    
     @since 3.4.0
    
     @global array $_wp_default_headers
    
     @return object
    
  **/
  public function get_custom_header():Dynamic;
  /**
    
     Register a selection of default headers to be displayed by the custom header admin UI.
    
     @since 3.0.0
    
     @global array $_wp_default_headers
    
     @param array $headers Array of headers keyed by a string id. The ids point to arrays containing 'url', 'thumbnail_url', and 'description' keys.
    
  **/
  public function register_default_headers(headers:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Unregister default headers.
    
     This function must be called after register_default_headers() has already added the
     header you want to remove.
    
     @see register_default_headers()
     @since 3.0.0
    
     @global array $_wp_default_headers
    
     @param string|array $header The header string id (key of array) to remove, or an array thereof.
     @return bool|void A single header returns true on success, false on failure.
                       There is currently no return value for multiple headers.
    
  **/
  public function unregister_default_headers(header:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):Bool;
  /**
    
     Check whether a header video is set or not.
    
     @since 4.7.0
    
     @see get_header_video_url()
    
     @return bool Whether a header video is set or not.
    
  **/
  public function has_header_video():Bool;
  /**
    
     Retrieve header video URL for custom header.
    
     Uses a local video if present, or falls back to an external video.
    
     @since 4.7.0
    
     @return string|false Header video URL or false if there is no video.
    
  **/
  public function get_header_video_url():haxe.extern.EitherType<String, Bool>;
  /**
    
     Display header video URL.
    
     @since 4.7.0
    
  **/
  public function the_header_video_url():Void;
  /**
    
     Retrieve header video settings.
    
     @since 4.7.0
    
     @return array
    
  **/
  public function get_header_video_settings():php.NativeArray;
  /**
    
     Check whether a custom header is set or not.
    
     @since 4.7.0
    
     @return bool True if a custom header is set. False if not.
    
  **/
  public function has_custom_header():Bool;
  /**
    
     Checks whether the custom header video is eligible to show on the current page.
    
     @since 4.7.0
    
     @return bool True if the custom header video should be shown. False if not.
    
  **/
  public function is_header_video_active():Bool;
  /**
    
     Retrieve the markup for a custom header.
    
     The container div will always be returned in the Customizer preview.
    
     @since 4.7.0
    
     @return string The markup for a custom header on success.
    
  **/
  public function get_custom_header_markup():String;
  /**
    
     Print the markup for a custom header.
    
     A container div will always be printed in the Customizer preview.
    
     @since 4.7.0
    
  **/
  public function the_custom_header_markup():Void;
  /**
    
     Retrieve background image for custom background.
    
     @since 3.0.0
    
     @return string
    
  **/
  public function get_background_image():String;
  /**
    
     Display background image path.
    
     @since 3.0.0
    
  **/
  public function background_image():Void;
  /**
    
     Retrieve value for custom background color.
    
     @since 3.0.0
    
     @return string
    
  **/
  public function get_background_color():String;
  /**
    
     Display background color value.
    
     @since 3.0.0
    
  **/
  public function background_color():Void;
  /**
    
     Default custom background callback.
    
     @since 3.0.0
    
  **/
  public function _custom_background_cb():Void;
  /**
    
     Render the Custom CSS style element.
    
     @since 4.7.0
    
  **/
  public function wp_custom_css_cb():Void;
  /**
    
     Fetch the `custom_css` post for a given theme.
    
     @since 4.7.0
    
     @param string $stylesheet Optional. A theme object stylesheet name. Defaults to the current theme.
     @return WP_Post|null The custom_css post or null if none exists.
    
  **/
  public function wp_get_custom_css_post(stylesheet:String = ''):wp.extern.Post;
  /**
    
     Fetch the saved Custom CSS content for rendering.
    
     @since 4.7.0
    
     @param string $stylesheet Optional. A theme object stylesheet name. Defaults to the current theme.
     @return string The Custom CSS Post content.
    
  **/
  public function wp_get_custom_css(stylesheet:String = ''):String;
  /**
    
     Update the `custom_css` post for a given theme.
    
     Inserts a `custom_css` post when one doesn't yet exist.
    
     @since 4.7.0
    
     @param string $css CSS, stored in `post_content`.
     @param array  $args {
         Args.
    
         @type string $preprocessed Pre-processed CSS, stored in `post_content_filtered`. Normally empty string. Optional.
         @type string $stylesheet   Stylesheet (child theme) to update. Optional, defaults to current theme/stylesheet.
     }
     @return WP_Post|WP_Error Post on success, error on failure.
    
  **/
  public function wp_update_custom_css_post(css:String, ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<wp.extern.Post, wp.extern.Error>;
  /**
    
     Add callback for custom TinyMCE editor stylesheets.
    
     The parameter $stylesheet is the name of the stylesheet, relative to
     the theme root. It also accepts an array of stylesheets.
     It is optional and defaults to 'editor-style.css'.
    
     This function automatically adds another stylesheet with -rtl prefix, e.g. editor-style-rtl.css.
     If that file doesn't exist, it is removed before adding the stylesheet(s) to TinyMCE.
     If an array of stylesheets is passed to add_editor_style(),
     RTL is only added for the first stylesheet.
    
     Since version 3.4 the TinyMCE body has .rtl CSS class.
     It is a better option to use that class and add any RTL styles to the main stylesheet.
    
     @since 3.0.0
    
     @global array $editor_styles
    
     @param array|string $stylesheet Optional. Stylesheet name or array thereof, relative to theme root.
                                     Defaults to 'editor-style.css'
    
  **/
  public function add_editor_style(stylesheet:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = 'editor-style.css'):Void;
  /**
    
     Removes all visual editor stylesheets.
    
     @since 3.1.0
    
     @global array $editor_styles
    
     @return bool True on success, false if there were no stylesheets to remove.
    
  **/
  public function remove_editor_styles():Bool;
  /**
    
     Retrieve any registered editor stylesheets
    
     @since 4.0.0
    
     @global array $editor_styles Registered editor stylesheets
    
     @return array If registered, a list of editor stylesheet URLs.
    
  **/
  public function get_editor_stylesheets():php.NativeArray;
  /**
    
     Expand a theme's starter content configuration using core-provided data.
    
     @since 4.7.0
    
     @return array Array of starter content.
    
  **/
  public function get_theme_starter_content():php.NativeArray;
  /**
    
     Registers theme support for a given feature.
    
     Must be called in the theme's functions.php file to work.
     If attached to a hook, it must be {@see 'after_setup_theme'}.
     The {@see 'init'} hook may be too late for some features.
    
     @since 2.9.0
     @since 3.6.0 The `html5` feature was added
     @since 3.9.0 The `html5` feature now also accepts 'gallery' and 'caption'
     @since 4.1.0 The `title-tag` feature was added
     @since 4.5.0 The `customize-selective-refresh-widgets` feature was added
     @since 4.7.0 The `starter-content` feature was added
     @since 5.0.0 The `responsive-embeds`, `align-wide`, `dark-editor-style`, `disable-custom-colors`,
                  `disable-custom-font-sizes`, `editor-color-pallete`, `editor-font-sizes`,
                  `editor-styles`, and `wp-block-styles` features were added.
    
     @global array $_wp_theme_features
    
     @param string $feature  The feature being added. Likely core values include 'post-formats',
                             'post-thumbnails', 'html5', 'custom-logo', 'custom-header-uploads',
                             'custom-header', 'custom-background', 'title-tag', 'starter-content',
                             'responsive-embeds', etc.
     @param mixed  $args,... Optional extra arguments to pass along with certain features.
     @return void|bool False on failure, void otherwise.
    
  **/
  public function add_theme_support(feature:String, args:Dynamic):Bool;
  /**
    
     Registers the internal custom header and background routines.
    
     @since 3.4.0
     @access private
    
     @global Custom_Image_Header $custom_image_header
     @global Custom_Background   $custom_background
    
  **/
  public function _custom_header_background_just_in_time():Void;
  /**
    
     Adds CSS to hide header text for custom logo, based on Customizer setting.
    
     @since 4.5.0
     @access private
    
  **/
  public function _custom_logo_header_styles():Void;
  /**
    
     Gets the theme support arguments passed when registering that support
    
     @since 3.1.0
    
     @global array $_wp_theme_features
    
     @param string $feature the feature to check
     @return mixed The array of extra arguments or the value for the registered feature.
    
  **/
  public function get_theme_support(feature:String):Dynamic;
  /**
    
     Allows a theme to de-register its support of a certain feature
    
     Should be called in the theme's functions.php file. Generally would
     be used for child themes to override support from the parent theme.
    
     @since 3.0.0
     @see add_theme_support()
     @param string $feature the feature being added
     @return bool|void Whether feature was removed.
    
  **/
  public function remove_theme_support(feature:String):Bool;
  /**
    
     Do not use. Removes theme support internally, ignorant of the blacklist.
    
     @access private
     @since 3.1.0
    
     @global array               $_wp_theme_features
     @global Custom_Image_Header $custom_image_header
     @global Custom_Background   $custom_background
    
     @param string $feature
    
  **/
  public function _remove_theme_support(feature:String):Void;
  /**
    
     Checks a theme's support for a given feature
    
     @since 2.9.0
    
     @global array $_wp_theme_features
    
     @param string $feature the feature being checked
     @return bool
    
  **/
  public function current_theme_supports(feature:String):Bool;
  /**
    
     Checks a theme's support for a given feature before loading the functions which implement it.
    
     @since 2.9.0
    
     @param string $feature The feature being checked.
     @param string $include Path to the file.
     @return bool True if the current theme supports the supplied feature, false otherwise.
    
  **/
  public function require_if_theme_supports(feature:String, include:String):Bool;
  /**
    
     Checks an attachment being deleted to see if it's a header or background image.
    
     If true it removes the theme modification which would be pointing at the deleted
     attachment.
    
     @access private
     @since 3.0.0
     @since 4.3.0 Also removes `header_image_data`.
     @since 4.5.0 Also removes custom logo theme mods.
    
     @param int $id The attachment id.
    
  **/
  public function _delete_attachment_theme_mod(id:Int):Void;
  /**
    
     Checks if a theme has been changed and runs 'after_switch_theme' hook on the next WP load.
    
     See {@see 'after_switch_theme'}.
    
     @since 3.3.0
    
  **/
  public function check_theme_switched():Void;
  /**
    
     Includes and instantiates the WP_Customize_Manager class.
    
     Loads the Customizer at plugins_loaded when accessing the customize.php admin
     page or when any request includes a wp_customize=on param or a customize_changeset
     param (a UUID). This param is a signal for whether to bootstrap the Customizer when
     WordPress is loading, especially in the Customizer preview
     or when making Customizer Ajax requests for widgets or menus.
    
     @since 3.4.0
    
     @global WP_Customize_Manager $wp_customize
    
  **/
  public function _wp_customize_include():Void;
  /**
    
     Publishes a snapshot's changes.
    
     @since 4.7.0
     @access private
    
     @global wpdb                 $wpdb         WordPress database abstraction object.
     @global WP_Customize_Manager $wp_customize Customizer instance.
    
     @param string  $new_status     New post status.
     @param string  $old_status     Old post status.
     @param WP_Post $changeset_post Changeset post object.
    
  **/
  public function _wp_customize_publish_changeset(new_status:String, old_status:String, changeset_post:wp.extern.Post):Void;
  /**
    
     Filters changeset post data upon insert to ensure post_name is intact.
    
     This is needed to prevent the post_name from being dropped when the post is
     transitioned into pending status by a contributor.
    
     @since 4.7.0
     @see wp_insert_post()
    
     @param array $post_data          An array of slashed post data.
     @param array $supplied_post_data An array of sanitized, but otherwise unmodified post data.
     @returns array Filtered data.
    
  **/
  public function _wp_customize_changeset_filter_insert_post_data(post_data:php.NativeStructArray<Dynamic>, supplied_post_data:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Adds settings for the customize-loader script.
    
     @since 3.4.0
    
  **/
  public function _wp_customize_loader_settings():Void;
  /**
    
     Returns a URL to load the Customizer.
    
     @since 3.4.0
    
     @param string $stylesheet Optional. Theme to customize. Defaults to current theme.
                               The theme's stylesheet will be urlencoded if necessary.
     @return string
    
  **/
  public function wp_customize_url(stylesheet:String = null):String;
  /**
    
     Prints a script to check whether or not the Customizer is supported,
     and apply either the no-customize-support or customize-support class
     to the body.
    
     This function MUST be called inside the body tag.
    
     Ideally, call this function immediately after the body tag is opened.
     This prevents a flash of unstyled content.
    
     It is also recommended that you add the "no-customize-support" class
     to the body tag by default.
    
     @since 3.4.0
     @since 4.7.0 Support for IE8 and below is explicitly removed via conditional comments.
    
  **/
  public function wp_customize_support_script():Void;
  /**
    
     Whether the site is being previewed in the Customizer.
    
     @since 4.0.0
    
     @global WP_Customize_Manager $wp_customize Customizer instance.
    
     @return bool True if the site is being previewed in the Customizer, false otherwise.
    
  **/
  public function is_customize_preview():Bool;
}
