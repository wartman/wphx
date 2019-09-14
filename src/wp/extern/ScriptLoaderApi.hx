package wp.extern;

extern class ScriptLoaderApi implements wp.util.ApiFunctions {
  /**
    
     Registers TinyMCE scripts.
    
     @since 5.0.0
    
     @param WP_Scripts $scripts WP_Scripts object.
    
  **/
  public function wp_register_tinymce_scripts(scripts:wp.extern.Scripts):Void;
  /**
    
     Registers all the WordPress vendor scripts that are in the standardized
     `js/dist/vendor/` location.
    
     For the order of `$scripts->add` see `wp_default_scripts`.
    
     @since 5.0.0
    
     @param WP_Scripts $scripts WP_Scripts object.
    
  **/
  public function wp_default_packages_vendor(scripts:wp.extern.Scripts):Void;
  /**
    
     Returns contents of an inline script used in appending polyfill scripts for
     browsers which fail the provided tests. The provided array is a mapping from
     a condition to verify feature support to its polyfill script handle.
    
     @since 5.0.0
    
     @param WP_Scripts $scripts WP_Scripts object.
     @param array      $tests   Features to detect.
     @return string Conditional polyfill inline script.
    
  **/
  public function wp_get_script_polyfill(scripts:wp.extern.Scripts, tests:php.NativeStructArray<Dynamic>):String;
  /**
    
     Registers all the WordPress packages scripts that are in the standardized
     `js/dist/` location.
    
     For the order of `$scripts->add` see `wp_default_scripts`.
    
     @since 5.0.0
    
     @param WP_Scripts $scripts WP_Scripts object.
    
  **/
  public function wp_default_packages_scripts(scripts:wp.extern.Scripts):Void;
  /**
    
     Adds inline scripts required for the WordPress JavaScript packages.
    
     @since 5.0.0
    
     @param WP_Scripts $scripts WP_Scripts object.
    
  **/
  public function wp_default_packages_inline_scripts(scripts:wp.extern.Scripts):Void;
  /**
    
     Adds inline scripts required for the TinyMCE in the block editor.
    
     These TinyMCE init settings are used to extend and override the default settings
     from `_WP_Editors::default_settings()` for the Classic block.
    
     @since 5.0.0
    
     @global WP_Scripts $wp_scripts
    
  **/
  public function wp_tinymce_inline_scripts():Void;
  /**
    
     Registers all the WordPress packages scripts.
    
     @since 5.0.0
    
     @param WP_Scripts $scripts WP_Scripts object.
    
  **/
  public function wp_default_packages(scripts:wp.extern.Scripts):Void;
  /**
    
     Returns the suffix that can be used for the scripts.
    
     There are two suffix types, the normal one and the dev suffix.
    
     @since 5.0.0
    
     @param string $type The type of suffix to retrieve.
     @return string The script suffix.
    
  **/
  public function wp_scripts_get_suffix(type:String = ''):String;
  /**
    
     Register all WordPress scripts.
    
     Localizes some of them.
     args order: `$scripts->add( 'handle', 'url', 'dependencies', 'query-string', 1 );`
     when last arg === 1 queues the script for the footer
    
     @since 2.6.0
    
     @param WP_Scripts $scripts WP_Scripts object.
    
  **/
  public function wp_default_scripts(scripts:wp.extern.Scripts):Void;
  /**
    
     Assign default styles to $styles object.
    
     Nothing is returned, because the $styles parameter is passed by reference.
     Meaning that whatever object is passed will be updated without having to
     reassign the variable that was passed back to the same value. This saves
     memory.
    
     Adding default styles is not the only task, it also assigns the base_url
     property, the default version, and text direction for the object.
    
     @since 2.6.0
    
     @param WP_Styles $styles
    
  **/
  public function wp_default_styles(styles:wp.extern.Styles):Void;
  /**
    
     Reorder JavaScript scripts array to place prototype before jQuery.
    
     @since 2.3.1
    
     @param array $js_array JavaScript scripts array
     @return array Reordered array, if needed.
    
  **/
  public function wp_prototype_before_jquery(js_array:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Load localized data on print rather than initialization.
    
     These localizations require information that may not be loaded even by init.
    
     @since 2.5.0
    
  **/
  public function wp_just_in_time_script_localization():Void;
  /**
    
     Localizes the jQuery UI datepicker.
    
     @since 4.6.0
    
     @link https://api.jqueryui.com/datepicker/#options
    
     @global WP_Locale $wp_locale The WordPress date and time locale object.
    
  **/
  public function wp_localize_jquery_ui_datepicker():Void;
  /**
    
     Localizes community events data that needs to be passed to dashboard.js.
    
     @since 4.8.0
    
  **/
  public function wp_localize_community_events():Void;
  /**
    
     Administration Screen CSS for changing the styles.
    
     If installing the 'wp-admin/' directory will be replaced with './'.
    
     The $_wp_admin_css_colors global manages the Administration Screens CSS
     stylesheet that is loaded. The option that is set is 'admin_color' and is the
     color and key for the array. The value for the color key is an object with
     a 'url' parameter that has the URL path to the CSS file.
    
     The query from $src parameter will be appended to the URL that is given from
     the $_wp_admin_css_colors array value URL.
    
     @since 2.6.0
     @global array $_wp_admin_css_colors
    
     @param string $src    Source URL.
     @param string $handle Either 'colors' or 'colors-rtl'.
     @return string|false URL path to CSS stylesheet for Administration Screens.
    
  **/
  public function wp_style_loader_src(src:String, handle:String):haxe.extern.EitherType<String, Bool>;
  /**
    
     Prints the script queue in the HTML head on admin pages.
    
     Postpones the scripts that were queued for the footer.
     print_footer_scripts() is called in the footer to print these scripts.
    
     @since 2.8.0
    
     @see wp_print_scripts()
    
     @global bool $concatenate_scripts
    
     @return array
    
  **/
  public function print_head_scripts():php.NativeArray;
  /**
    
     Prints the scripts that were queued for the footer or too late for the HTML head.
    
     @since 2.8.0
    
     @global WP_Scripts $wp_scripts
     @global bool       $concatenate_scripts
    
     @return array
    
  **/
  public function print_footer_scripts():php.NativeArray;
  /**
    
     Print scripts (internal use only)
    
     @ignore
    
     @global WP_Scripts $wp_scripts
     @global bool       $compress_scripts
    
  **/
  public function _print_scripts():Void;
  /**
    
     Prints the script queue in the HTML head on the front end.
    
     Postpones the scripts that were queued for the footer.
     wp_print_footer_scripts() is called in the footer to print these scripts.
    
     @since 2.8.0
    
     @global WP_Scripts $wp_scripts
    
     @return array
    
  **/
  public function wp_print_head_scripts():php.NativeArray;
  /**
    
     Private, for use in *_footer_scripts hooks
    
     @since 3.3.0
    
  **/
  public function _wp_footer_scripts():Void;
  /**
    
     Hooks to print the scripts and styles in the footer.
    
     @since 2.8.0
    
  **/
  public function wp_print_footer_scripts():Void;
  /**
    
     Wrapper for do_action('wp_enqueue_scripts')
    
     Allows plugins to queue scripts for the front end using wp_enqueue_script().
     Runs first in wp_head() where all is_home(), is_page(), etc. functions are available.
    
     @since 2.8.0
    
  **/
  public function wp_enqueue_scripts():Void;
  /**
    
     Prints the styles queue in the HTML head on admin pages.
    
     @since 2.8.0
    
     @global bool $concatenate_scripts
    
     @return array
    
  **/
  public function print_admin_styles():php.NativeArray;
  /**
    
     Prints the styles that were queued too late for the HTML head.
    
     @since 3.3.0
    
     @global WP_Styles $wp_styles
     @global bool      $concatenate_scripts
    
     @return array|void
    
  **/
  public function print_late_styles():php.NativeArray;
  /**
    
     Print styles (internal use only)
    
     @ignore
     @since 3.3.0
    
     @global bool $compress_css
    
  **/
  public function _print_styles():Void;
  /**
    
     Determine the concatenation and compression settings for scripts and styles.
    
     @since 2.8.0
    
     @global bool $concatenate_scripts
     @global bool $compress_scripts
     @global bool $compress_css
    
  **/
  public function script_concat_settings():Void;
  /**
    
     Handles the enqueueing of block scripts and styles that are common to both
     the editor and the front-end.
    
     @since 5.0.0
    
     @global WP_Screen $current_screen
    
  **/
  public function wp_common_block_scripts_and_styles():Void;
  /**
    
     Enqueues registered block scripts and styles, depending on current rendered
     context (only enqueuing editor scripts while in context of the editor).
    
     @since 5.0.0
    
     @global WP_Screen $current_screen
    
  **/
  public function wp_enqueue_registered_block_scripts_and_styles():Void;
}
