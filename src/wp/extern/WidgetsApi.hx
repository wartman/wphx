package wp.extern;

extern class WidgetsApi implements wp.util.ApiFunctions {
  /**
    
     Register a widget
    
     Registers a WP_Widget widget
    
     @since 2.8.0
     @since 4.6.0 Updated the `$widget` parameter to also accept a WP_Widget instance object
                  instead of simply a `WP_Widget` subclass name.
    
     @see WP_Widget
    
     @global WP_Widget_Factory $wp_widget_factory
    
     @param string|WP_Widget $widget Either the name of a `WP_Widget` subclass or an instance of a `WP_Widget` subclass.
    
  **/
  public function register_widget(widget:haxe.extern.EitherType<String, wp.extern.Widget>):Void;
  /**
    
     Unregisters a widget.
    
     Unregisters a WP_Widget widget. Useful for un-registering default widgets.
     Run within a function hooked to the {@see 'widgets_init'} action.
    
     @since 2.8.0
     @since 4.6.0 Updated the `$widget` parameter to also accept a WP_Widget instance object
                  instead of simply a `WP_Widget` subclass name.
    
     @see WP_Widget
    
     @global WP_Widget_Factory $wp_widget_factory
    
     @param string|WP_Widget $widget Either the name of a `WP_Widget` subclass or an instance of a `WP_Widget` subclass.
    
  **/
  public function unregister_widget(widget:haxe.extern.EitherType<String, wp.extern.Widget>):Void;
  /**
    
     Creates multiple sidebars.
    
     If you wanted to quickly create multiple sidebars for a theme or internally.
     This function will allow you to do so. If you don't pass the 'name' and/or
     'id' in `$args`, then they will be built for you.
    
     @since 2.2.0
    
     @see register_sidebar() The second parameter is documented by register_sidebar() and is the same here.
    
     @global array $wp_registered_sidebars The new sidebars are stored in this array by sidebar ID.
    
     @param int          $number Optional. Number of sidebars to create. Default 1.
     @param array|string $args {
         Optional. Array or string of arguments for building a sidebar.
    
         @type string $id   The base string of the unique identifier for each sidebar. If provided, and multiple
                            sidebars are being defined, the id will have "-2" appended, and so on.
                            Default 'sidebar-' followed by the number the sidebar creation is currently at.
         @type string $name The name or title for the sidebars displayed in the admin dashboard. If registering
                            more than one sidebar, include '%d' in the string as a placeholder for the uniquely
                            assigned number for each sidebar.
                            Default 'Sidebar' for the first sidebar, otherwise 'Sidebar %d'.
     }
    
  **/
  public function register_sidebars(number:Int = 1, ?args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):Void;
  /**
    
     Builds the definition for a single sidebar and returns the ID.
    
     Accepts either a string or an array and then parses that against a set
     of default arguments for the new sidebar. WordPress will automatically
     generate a sidebar ID and name based on the current number of registered
     sidebars if those arguments are not included.
    
     When allowing for automatic generation of the name and ID parameters, keep
     in mind that the incrementor for your sidebar can change over time depending
     on what other plugins and themes are installed.
    
     If theme support for 'widgets' has not yet been added when this function is
     called, it will be automatically enabled through the use of add_theme_support()
    
     @since 2.2.0
    
     @global array $wp_registered_sidebars Stores the new sidebar in this array by sidebar ID.
    
     @param array|string $args {
         Optional. Array or string of arguments for the sidebar being registered.
    
         @type string $name          The name or title of the sidebar displayed in the Widgets
                                     interface. Default 'Sidebar $instance'.
         @type string $id            The unique identifier by which the sidebar will be called.
                                     Default 'sidebar-$instance'.
         @type string $description   Description of the sidebar, displayed in the Widgets interface.
                                     Default empty string.
         @type string $class         Extra CSS class to assign to the sidebar in the Widgets interface.
                                     Default empty.
         @type string $before_widget HTML content to prepend to each widget's HTML output when
                                     assigned to this sidebar. Default is an opening list item element.
         @type string $after_widget  HTML content to append to each widget's HTML output when
                                     assigned to this sidebar. Default is a closing list item element.
         @type string $before_title  HTML content to prepend to the sidebar title when displayed.
                                     Default is an opening h2 element.
         @type string $after_title   HTML content to append to the sidebar title when displayed.
                                     Default is a closing h2 element.
     }
     @return string Sidebar ID added to $wp_registered_sidebars global.
    
  **/
  public function register_sidebar(?args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):String;
  /**
    
     Removes a sidebar from the list.
    
     @since 2.2.0
    
     @global array $wp_registered_sidebars Removes the sidebar from this array by sidebar ID.
    
     @param string|int $sidebar_id The ID of the sidebar when it was registered.
    
  **/
  public function unregister_sidebar(sidebar_id:haxe.extern.EitherType<String, Int>):Void;
  /**
    
     Checks if a sidebar is registered.
    
     @since 4.4.0
    
     @global array $wp_registered_sidebars Registered sidebars.
    
     @param string|int $sidebar_id The ID of the sidebar when it was registered.
     @return bool True if the sidebar is registered, false otherwise.
    
  **/
  public function is_registered_sidebar(sidebar_id:haxe.extern.EitherType<String, Int>):Bool;
  /**
    
     Register an instance of a widget.
    
     The default widget option is 'classname' that can be overridden.
    
     The function can also be used to un-register widgets when `$output_callback`
     parameter is an empty string.
    
     @since 2.2.0
    
     @global array $wp_registered_widgets            Uses stored registered widgets.
     @global array $wp_registered_widget_controls    Stores the registered widget controls (options).
     @global array $wp_registered_widget_updates
     @global array $_wp_deprecated_widgets_callbacks
    
     @param int|string $id              Widget ID.
     @param string     $name            Widget display title.
     @param callable   $output_callback Run when widget is called.
     @param array      $options {
         Optional. An array of supplementary widget options for the instance.
    
         @type string $classname   Class name for the widget's HTML container. Default is a shortened
                                   version of the output callback name.
         @type string $description Widget description for display in the widget administration
                                   panel and/or theme.
     }
    
  **/
  public function wp_register_sidebar_widget(id:haxe.extern.EitherType<Int, String>, name:String, output_callback:Dynamic, ?options:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Retrieve description for widget.
    
     When registering widgets, the options can also include 'description' that
     describes the widget for display on the widget administration panel or
     in the theme.
    
     @since 2.5.0
    
     @global array $wp_registered_widgets
    
     @param int|string $id Widget ID.
     @return string|void Widget description, if available.
    
  **/
  public function wp_widget_description(id:haxe.extern.EitherType<Int, String>):String;
  /**
    
     Retrieve description for a sidebar.
    
     When registering sidebars a 'description' parameter can be included that
     describes the sidebar for display on the widget administration panel.
    
     @since 2.9.0
    
     @global array $wp_registered_sidebars Registered sidebars.
    
     @param string $id sidebar ID.
     @return string|void Sidebar description, if available.
    
  **/
  public function wp_sidebar_description(id:String):String;
  /**
    
     Remove widget from sidebar.
    
     @since 2.2.0
    
     @param int|string $id Widget ID.
    
  **/
  public function wp_unregister_sidebar_widget(id:haxe.extern.EitherType<Int, String>):Void;
  /**
    
     Registers widget control callback for customizing options.
    
     @since 2.2.0
    
     @todo `$params` parameter?
    
     @global array $wp_registered_widget_controls
     @global array $wp_registered_widget_updates
     @global array $wp_registered_widgets
     @global array $_wp_deprecated_widgets_callbacks
    
     @param int|string   $id               Sidebar ID.
     @param string       $name             Sidebar display name.
     @param callable     $control_callback Run when sidebar is displayed.
     @param array $options {
         Optional. Array or string of control options. Default empty array.
    
         @type int        $height  Never used. Default 200.
         @type int        $width   Width of the fully expanded control form (but try hard to use the default width).
                                   Default 250.
         @type int|string $id_base Required for multi-widgets, i.e widgets that allow multiple instances such as the
                                   text widget. The widget id will end up looking like `{$id_base}-{$unique_number}`.
     }
    
  **/
  public function wp_register_widget_control(id:haxe.extern.EitherType<Int, String>, name:String, control_callback:Dynamic, ?options:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Registers the update callback for a widget.
    
     @since 2.8.0
    
     @global array $wp_registered_widget_updates
    
     @param string   $id_base         The base ID of a widget created by extending WP_Widget.
     @param callable $update_callback Update callback method for the widget.
     @param array    $options         Optional. Widget control options. See wp_register_widget_control().
                                      Default empty array.
    
  **/
  public function _register_widget_update_callback(id_base:String, update_callback:Dynamic, ?options:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Registers the form callback for a widget.
    
     @since 2.8.0
    
     @global array $wp_registered_widget_controls
    
     @param int|string $id            Widget ID.
     @param string     $name          Name attribute for the widget.
     @param callable   $form_callback Form callback.
     @param array      $options       Optional. Widget control options. See wp_register_widget_control().
                                      Default empty array.
    
  **/
  public function _register_widget_form_callback(id:haxe.extern.EitherType<Int, String>, name:String, form_callback:Dynamic, ?options:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Remove control callback for widget.
    
     @since 2.2.0
    
     @param int|string $id Widget ID.
    
  **/
  public function wp_unregister_widget_control(id:haxe.extern.EitherType<Int, String>):Void;
  /**
    
     Display dynamic sidebar.
    
     By default this displays the default sidebar or 'sidebar-1'. If your theme specifies the 'id' or
     'name' parameter for its registered sidebars you can pass an id or name as the $index parameter.
     Otherwise, you can pass in a numerical index to display the sidebar at that index.
    
     @since 2.2.0
    
     @global array $wp_registered_sidebars Registered sidebars.
     @global array $wp_registered_widgets
    
     @param int|string $index Optional, default is 1. Index, name or ID of dynamic sidebar.
     @return bool True, if widget sidebar was found and called. False if not found or not called.
    
  **/
  public function dynamic_sidebar(index:haxe.extern.EitherType<Int, String> = 1):Bool;
  /**
    
     Determines whether a given widget is displayed on the front end.
    
     Either $callback or $id_base can be used
     $id_base is the first argument when extending WP_Widget class
     Without the optional $widget_id parameter, returns the ID of the first sidebar
     in which the first instance of the widget with the given callback or $id_base is found.
     With the $widget_id parameter, returns the ID of the sidebar where
     the widget with that callback/$id_base AND that ID is found.
    
     NOTE: $widget_id and $id_base are the same for single widgets. To be effective
     this function has to run after widgets have initialized, at action {@see 'init'} or later.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.2.0
    
     @global array $wp_registered_widgets
    
     @param string|false $callback      Optional, Widget callback to check. Default false.
     @param int|false    $widget_id     Optional. Widget ID. Optional, but needed for checking. Default false.
     @param string|false $id_base       Optional. The base ID of a widget created by extending WP_Widget. Default false.
     @param bool         $skip_inactive Optional. Whether to check in 'wp_inactive_widgets'. Default true.
     @return string|false False if widget is not active or id of sidebar in which the widget is active.
    
  **/
  public function is_active_widget(callback:haxe.extern.EitherType<String, Bool> = false, widget_id:haxe.extern.EitherType<Int, Bool> = false, id_base:haxe.extern.EitherType<String, Bool> = false, skip_inactive:Bool = true):haxe.extern.EitherType<String, Bool>;
  /**
    
     Determines whether the dynamic sidebar is enabled and used by the theme.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.2.0
    
     @global array $wp_registered_widgets
     @global array $wp_registered_sidebars Registered sidebars.
    
     @return bool True, if using widgets. False, if not using widgets.
    
  **/
  public function is_dynamic_sidebar():Bool;
  /**
    
     Determines whether a sidebar is in use.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.8.0
    
     @param string|int $index Sidebar name, id or number to check.
     @return bool true if the sidebar is in use, false otherwise.
    
  **/
  public function is_active_sidebar(index:haxe.extern.EitherType<String, Int>):Bool;
  /**
    
     Retrieve full list of sidebars and their widget instance IDs.
    
     Will upgrade sidebar widget list, if needed. Will also save updated list, if
     needed.
    
     @since 2.2.0
     @access private
    
     @global array $_wp_sidebars_widgets
     @global array $sidebars_widgets
    
     @param bool $deprecated Not used (argument deprecated).
     @return array Upgraded list of widgets to version 3 array format when called from the admin.
    
  **/
  public function wp_get_sidebars_widgets(deprecated:Bool = true):php.NativeArray;
  /**
    
     Set the sidebar widget option to update sidebars.
    
     @since 2.2.0
     @access private
    
     @global array $_wp_sidebars_widgets
     @param array $sidebars_widgets Sidebar widgets and their settings.
    
  **/
  public function wp_set_sidebars_widgets(sidebars_widgets:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Retrieve default registered sidebars list.
    
     @since 2.2.0
     @access private
    
     @global array $wp_registered_sidebars Registered sidebars.
    
     @return array
    
  **/
  public function wp_get_widget_defaults():php.NativeArray;
  /**
    
     Convert the widget settings from single to multi-widget format.
    
     @since 2.8.0
    
     @global array $_wp_sidebars_widgets
    
     @param string $base_name
     @param string $option_name
     @param array  $settings
     @return array
    
  **/
  public function wp_convert_widget_settings(base_name:String, option_name:String, settings:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Output an arbitrary widget as a template tag.
    
     @since 2.8.0
    
     @global WP_Widget_Factory $wp_widget_factory
    
     @param string $widget   The widget's PHP class name (see class-wp-widget.php).
     @param array  $instance Optional. The widget's instance settings. Default empty array.
     @param array  $args {
         Optional. Array of arguments to configure the display of the widget.
    
         @type string $before_widget HTML content that will be prepended to the widget's HTML output.
                                     Default `<div class="widget %s">`, where `%s` is the widget's class name.
         @type string $after_widget  HTML content that will be appended to the widget's HTML output.
                                     Default `</div>`.
         @type string $before_title  HTML content that will be prepended to the widget's title when displayed.
                                     Default `<h2 class="widgettitle">`.
         @type string $after_title   HTML content that will be appended to the widget's title when displayed.
                                     Default `</h2>`.
     }
    
  **/
  public function the_widget(widget:String, ?instance:php.NativeStructArray<Dynamic>, ?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Retrieves the widget ID base value.
    
     @since 2.8.0
    
     @param string $id Widget ID.
     @return string Widget ID base.
    
  **/
  public function _get_widget_id_base(id:String):String;
  /**
    
     Handle sidebars config after theme change
    
     @access private
     @since 3.3.0
    
     @global array $sidebars_widgets
    
  **/
  public function _wp_sidebars_changed():Void;
  /**
    
     Look for "lost" widgets, this has to run at least on each theme change.
    
     @since 2.8.0
    
     @global array $wp_registered_sidebars Registered sidebars.
     @global array $sidebars_widgets
     @global array $wp_registered_widgets
    
     @param string|bool $theme_changed Whether the theme was changed as a boolean. A value
                                       of 'customize' defers updates for the Customizer.
     @return array Updated sidebars widgets.
    
  **/
  public function retrieve_widgets(theme_changed:haxe.extern.EitherType<String, Bool> = false):php.NativeArray;
  /**
    
     Compares a list of sidebars with their widgets against a whitelist.
    
     @since 4.9.0
     @since 4.9.2 Always tries to restore widget assignments from previous data, not just if sidebars needed mapping.
    
     @param array $existing_sidebars_widgets List of sidebars and their widget instance IDs.
     @return array Mapped sidebars widgets.
    
  **/
  public function wp_map_sidebars_widgets(existing_sidebars_widgets:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Compares a list of sidebars with their widgets against a whitelist.
    
     @since 4.9.0
    
     @param array $sidebars_widgets List of sidebars and their widget instance IDs.
     @param array $whitelist        Optional. List of widget IDs to compare against. Default: Registered widgets.
     @return array Sidebars with whitelisted widgets.
    
  **/
  public function _wp_remove_unregistered_widgets(sidebars_widgets:php.NativeStructArray<Dynamic>, ?whitelist:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Display the RSS entries in a list.
    
     @since 2.5.0
    
     @param string|array|object $rss RSS url.
     @param array $args Widget arguments.
    
  **/
  public function wp_widget_rss_output(rss:haxe.extern.EitherType<String, haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Dynamic>>, ?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Display RSS widget options form.
    
     The options for what fields are displayed for the RSS form are all booleans
     and are as follows: 'url', 'title', 'items', 'show_summary', 'show_author',
     'show_date'.
    
     @since 2.5.0
    
     @param array|string $args Values for input fields.
     @param array $inputs Override default display options.
    
  **/
  public function wp_widget_rss_form(args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>, inputs:php.NativeStructArray<Dynamic> = null):Void;
  /**
    
     Process RSS feed widget data and optionally retrieve feed items.
    
     The feed widget can not have more than 20 items or it will reset back to the
     default, which is 10.
    
     The resulting array has the feed title, feed url, feed link (from channel),
     feed items, error (if any), and whether to show summary, author, and date.
     All respectively in the order of the array elements.
    
     @since 2.5.0
    
     @param array $widget_rss RSS widget feed data. Expects unescaped data.
     @param bool $check_feed Optional, default is true. Whether to check feed for errors.
     @return array
    
  **/
  public function wp_widget_rss_process(widget_rss:php.NativeStructArray<Dynamic>, check_feed:Bool = true):php.NativeArray;
  /**
    
     Registers all of the default WordPress widgets on startup.
    
     Calls {@see 'widgets_init'} action after all of the WordPress widgets have been registered.
    
     @since 2.2.0
    
  **/
  public function wp_widgets_init():Void;
}
