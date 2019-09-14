package wp.extern;

@:native("WP_Customize_Widgets")
extern class CustomizeWidgets {
  /**
    
     WP_Customize_Manager instance.
    
     @since 3.9.0
     @var WP_Customize_Manager
    
  **/
  @:native("manager") public var manager:wp.extern.CustomizeManager;
  /**
    
     Initial loader.
    
     @since 3.9.0
    
     @param WP_Customize_Manager $manager Customize manager bootstrap instance.
    
  **/
  public function new(manager:wp.extern.CustomizeManager):Void;
  /**
    
     List whether each registered widget can be use selective refresh.
    
     If the theme does not support the customize-selective-refresh-widgets feature,
     then this will always return an empty array.
    
     @since 4.5.0
    
     @global WP_Widget_Factory $wp_widget_factory
    
     @return array Mapping of id_base to support. If theme doesn't support
                   selective refresh, an empty array is returned.
    
  **/
  @:native("get_selective_refreshable_widgets") public function getSelectiveRefreshableWidgets():php.NativeArray;
  /**
    
     Determines if a widget supports selective refresh.
    
     @since 4.5.0
    
     @param string $id_base Widget ID Base.
     @return bool Whether the widget can be selective refreshed.
    
  **/
  @:native("is_widget_selective_refreshable") public function isWidgetSelectiveRefreshable(id_base:String):Bool;
  /**
    
     Inspects the incoming customized data for any widget settings, and dynamically adds
     them up-front so widgets will be initialized properly.
    
     @since 4.2.0
    
  **/
  @:native("register_settings") public function registerSettings():Void;
  /**
    
     Determines the arguments for a dynamically-created setting.
    
     @since 4.2.0
    
     @param false|array $args       The arguments to the WP_Customize_Setting constructor.
     @param string      $setting_id ID for dynamic setting, usually coming from `$_POST['customized']`.
     @return false|array Setting arguments, false otherwise.
    
  **/
  @:native("filter_customize_dynamic_setting_args") public function filterCustomizeDynamicSettingArgs(args:haxe.extern.EitherType<Bool, php.NativeStructArray<Dynamic>>, setting_id:String):haxe.extern.EitherType<Bool, php.NativeStructArray<Dynamic>>;
  /**
    
     Override sidebars_widgets for theme switch.
    
     When switching a theme via the Customizer, supply any previously-configured
     sidebars_widgets from the target theme as the initial sidebars_widgets
     setting. Also store the old theme's existing settings so that they can
     be passed along for storing in the sidebars_widgets theme_mod when the
     theme gets switched.
    
     @since 3.9.0
    
     @global array $sidebars_widgets
     @global array $_wp_sidebars_widgets
    
  **/
  @:native("override_sidebars_widgets_for_theme_switch") public function overrideSidebarsWidgetsForThemeSwitch():Void;
  /**
    
     Filters old_sidebars_widgets_data Customizer setting.
    
     When switching themes, filter the Customizer setting old_sidebars_widgets_data
     to supply initial $sidebars_widgets before they were overridden by retrieve_widgets().
     The value for old_sidebars_widgets_data gets set in the old theme's sidebars_widgets
     theme_mod.
    
     @since 3.9.0
    
     @see WP_Customize_Widgets::handle_theme_switch()
    
     @param array $old_sidebars_widgets
     @return array
    
  **/
  @:native("filter_customize_value_old_sidebars_widgets_data") public function filterCustomizeValueOldSidebarsWidgetsData(old_sidebars_widgets:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Filters sidebars_widgets option for theme switch.
    
     When switching themes, the retrieve_widgets() function is run when the Customizer initializes,
     and then the new sidebars_widgets here get supplied as the default value for the sidebars_widgets
     option.
    
     @since 3.9.0
    
     @see WP_Customize_Widgets::handle_theme_switch()
     @global array $sidebars_widgets
    
     @param array $sidebars_widgets
     @return array
    
  **/
  @:native("filter_option_sidebars_widgets_for_theme_switch") public function filterOptionSidebarsWidgetsForThemeSwitch(sidebars_widgets:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Ensures all widgets get loaded into the Customizer.
    
     Note: these actions are also fired in wp_ajax_update_widget().
    
     @since 3.9.0
    
  **/
  @:native("customize_controls_init") public function customizeControlsInit():Void;
  /**
    
     Ensures widgets are available for all types of previews.
    
     When in preview, hook to {@see 'customize_register'} for settings after WordPress is loaded
     so that all filters have been initialized (e.g. Widget Visibility).
    
     @since 3.9.0
    
  **/
  @:native("schedule_customize_register") public function scheduleCustomizeRegister():Void;
  /**
    
     Registers Customizer settings and controls for all sidebars and widgets.
    
     @since 3.9.0
    
     @global array $wp_registered_widgets
     @global array $wp_registered_widget_controls
     @global array $wp_registered_sidebars
    
  **/
  @:native("customize_register") public function customizeRegister():Void;
  /**
    
     Determines whether the widgets panel is active, based on whether there are sidebars registered.
    
     @since 4.4.0
    
     @see WP_Customize_Panel::$active_callback
    
     @global array $wp_registered_sidebars
     @return bool Active.
    
  **/
  @:native("is_panel_active") public function isPanelActive():Bool;
  /**
    
     Converts a widget_id into its corresponding Customizer setting ID (option name).
    
     @since 3.9.0
    
     @param string $widget_id Widget ID.
     @return string Maybe-parsed widget ID.
    
  **/
  @:native("get_setting_id") public function getSettingId(widget_id:String):String;
  /**
    
     Determines whether the widget is considered "wide".
    
     Core widgets which may have controls wider than 250, but can still be shown
     in the narrow Customizer panel. The RSS and Text widgets in Core, for example,
     have widths of 400 and yet they still render fine in the Customizer panel.
    
     This method will return all Core widgets as being not wide, but this can be
     overridden with the {@see 'is_wide_widget_in_customizer'} filter.
    
     @since 3.9.0
    
     @global $wp_registered_widget_controls
    
     @param string $widget_id Widget ID.
     @return bool Whether or not the widget is a "wide" widget.
    
  **/
  @:native("is_wide_widget") public function isWideWidget(widget_id:String):Bool;
  /**
    
     Converts a widget ID into its id_base and number components.
    
     @since 3.9.0
    
     @param string $widget_id Widget ID.
     @return array Array containing a widget's id_base and number components.
    
  **/
  @:native("parse_widget_id") public function parseWidgetId(widget_id:String):php.NativeArray;
  /**
    
     Converts a widget setting ID (option path) to its id_base and number components.
    
     @since 3.9.0
    
     @param string $setting_id Widget setting ID.
     @return WP_Error|array Array containing a widget's id_base and number components,
                            or a WP_Error object.
    
  **/
  @:native("parse_widget_setting_id") public function parseWidgetSettingId(setting_id:String):haxe.extern.EitherType<wp.extern.Error, php.NativeStructArray<Dynamic>>;
  /**
    
     Calls admin_print_styles-widgets.php and admin_print_styles hooks to
     allow custom styles from plugins.
    
     @since 3.9.0
    
  **/
  @:native("print_styles") public function printStyles():Void;
  /**
    
     Calls admin_print_scripts-widgets.php and admin_print_scripts hooks to
     allow custom scripts from plugins.
    
     @since 3.9.0
    
  **/
  @:native("print_scripts") public function printScripts():Void;
  /**
    
     Enqueues scripts and styles for Customizer panel and export data to JavaScript.
    
     @since 3.9.0
    
     @global WP_Scripts $wp_scripts
     @global array $wp_registered_sidebars
     @global array $wp_registered_widgets
    
  **/
  @:native("enqueue_scripts") public function enqueueScripts():Void;
  /**
    
     Renders the widget form control templates into the DOM.
    
     @since 3.9.0
    
  **/
  @:native("output_widget_control_templates") public function outputWidgetControlTemplates():Void;
  /**
    
     Calls admin_print_footer_scripts and admin_print_scripts hooks to
     allow custom scripts from plugins.
    
     @since 3.9.0
    
  **/
  @:native("print_footer_scripts") public function printFooterScripts():Void;
  /**
    
     Retrieves common arguments to supply when constructing a Customizer setting.
    
     @since 3.9.0
    
     @param string $id        Widget setting ID.
     @param array  $overrides Array of setting overrides.
     @return array Possibly modified setting arguments.
    
  **/
  @:native("get_setting_args") public function getSettingArgs(id:String, ?overrides:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Ensures sidebar widget arrays only ever contain widget IDS.
    
     Used as the 'sanitize_callback' for each $sidebars_widgets setting.
    
     @since 3.9.0
    
     @param string[] $widget_ids Array of widget IDs.
     @return string[] Array of sanitized widget IDs.
    
  **/
  @:native("sanitize_sidebar_widgets") public function sanitizeSidebarWidgets(widget_ids:php.NativeIndexedArray<String>):php.NativeIndexedArray<String>;
  /**
    
     Builds up an index of all available widgets for use in Backbone models.
    
     @since 3.9.0
    
     @global array $wp_registered_widgets
     @global array $wp_registered_widget_controls
     @staticvar array $available_widgets
    
     @see wp_list_widgets()
    
     @return array List of available widgets.
    
  **/
  @:native("get_available_widgets") public function getAvailableWidgets():php.NativeArray;
  /**
    
     Retrieves the widget control markup.
    
     @since 3.9.0
    
     @param array $args Widget control arguments.
     @return string Widget control form HTML markup.
    
  **/
  @:native("get_widget_control") public function getWidgetControl(args:php.NativeStructArray<Dynamic>):String;
  /**
    
     Retrieves the widget control markup parts.
    
     @since 4.4.0
    
     @param array $args Widget control arguments.
     @return array {
         @type string $control Markup for widget control wrapping form.
         @type string $content The contents of the widget form itself.
     }
    
  **/
  @:native("get_widget_control_parts") public function getWidgetControlParts(args:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Adds hooks for the Customizer preview.
    
     @since 3.9.0
    
  **/
  @:native("customize_preview_init") public function customizePreviewInit():Void;
  /**
    
     Refreshes the nonce for widget updates.
    
     @since 4.2.0
    
     @param  array $nonces Array of nonces.
     @return array $nonces Array of nonces.
    
  **/
  @:native("refresh_nonces") public function refreshNonces(nonces:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     When previewing, ensures the proper previewing widgets are used.
    
     Because wp_get_sidebars_widgets() gets called early at {@see 'init' } (via
     wp_convert_widget_settings()) and can set global variable `$_wp_sidebars_widgets`
     to the value of `get_option( 'sidebars_widgets' )` before the Customizer preview
     filter is added, it has to be reset after the filter has been added.
    
     @since 3.9.0
    
     @param array $sidebars_widgets List of widgets for the current sidebar.
     @return array
    
  **/
  @:native("preview_sidebars_widgets") public function previewSidebarsWidgets(sidebars_widgets:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Enqueues scripts for the Customizer preview.
    
     @since 3.9.0
    
  **/
  @:native("customize_preview_enqueue") public function customizePreviewEnqueue():Void;
  /**
    
     Inserts default style for highlighted widget at early point so theme
     stylesheet can override.
    
     @since 3.9.0
    
  **/
  @:native("print_preview_css") public function printPreviewCss():Void;
  /**
    
     Communicates the sidebars that appeared on the page at the very end of the page,
     and at the very end of the wp_footer,
    
     @since 3.9.0
    
     @global array $wp_registered_sidebars
     @global array $wp_registered_widgets
    
  **/
  @:native("export_preview_data") public function exportPreviewData():Void;
  /**
    
     Tracks the widgets that were rendered.
    
     @since 3.9.0
    
     @param array $widget Rendered widget to tally.
    
  **/
  @:native("tally_rendered_widgets") public function tallyRenderedWidgets(widget:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Determine if a widget is rendered on the page.
    
     @since 4.0.0
    
     @param string $widget_id Widget ID to check.
     @return bool Whether the widget is rendered.
    
  **/
  @:native("is_widget_rendered") public function isWidgetRendered(widget_id:String):Bool;
  /**
    
     Determines if a sidebar is rendered on the page.
    
     @since 4.0.0
    
     @param string $sidebar_id Sidebar ID to check.
     @return bool Whether the sidebar is rendered.
    
  **/
  @:native("is_sidebar_rendered") public function isSidebarRendered(sidebar_id:String):Bool;
  /**
    
     Tallies the sidebars rendered via is_active_sidebar().
    
     Keep track of the times that is_active_sidebar() is called in the template,
     and assume that this means that the sidebar would be rendered on the template
     if there were widgets populating it.
    
     @since 3.9.0
    
     @param bool   $is_active  Whether the sidebar is active.
     @param string $sidebar_id Sidebar ID.
     @return bool Whether the sidebar is active.
    
  **/
  @:native("tally_sidebars_via_is_active_sidebar_calls") public function tallySidebarsViaIsActiveSidebarCalls(is_active:Bool, sidebar_id:String):Bool;
  /**
    
     Tallies the sidebars rendered via dynamic_sidebar().
    
     Keep track of the times that dynamic_sidebar() is called in the template,
     and assume this means the sidebar would be rendered on the template if
     there were widgets populating it.
    
     @since 3.9.0
    
     @param bool   $has_widgets Whether the current sidebar has widgets.
     @param string $sidebar_id  Sidebar ID.
     @return bool Whether the current sidebar has widgets.
    
  **/
  @:native("tally_sidebars_via_dynamic_sidebar_calls") public function tallySidebarsViaDynamicSidebarCalls(has_widgets:Bool, sidebar_id:String):Bool;
  /**
    
     Sanitizes a widget instance.
    
     Unserialize the JS-instance for storing in the options. It's important that this filter
     only get applied to an instance *once*.
    
     @since 3.9.0
    
     @param array $value Widget instance to sanitize.
     @return array|void Sanitized widget instance.
    
  **/
  @:native("sanitize_widget_instance") public function sanitizeWidgetInstance(value:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Converts a widget instance into JSON-representable format.
    
     @since 3.9.0
    
     @param array $value Widget instance to convert to JSON.
     @return array JSON-converted widget instance.
    
  **/
  @:native("sanitize_widget_js_instance") public function sanitizeWidgetJsInstance(value:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Strips out widget IDs for widgets which are no longer registered.
    
     One example where this might happen is when a plugin orphans a widget
     in a sidebar upon deactivation.
    
     @since 3.9.0
    
     @global array $wp_registered_widgets
    
     @param array $widget_ids List of widget IDs.
     @return array Parsed list of widget IDs.
    
  **/
  @:native("sanitize_sidebar_widgets_js_instance") public function sanitizeSidebarWidgetsJsInstance(widget_ids:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Finds and invokes the widget update and control callbacks.
    
     Requires that `$_POST` be populated with the instance data.
    
     @since 3.9.0
    
     @global array $wp_registered_widget_updates
     @global array $wp_registered_widget_controls
    
     @param  string $widget_id Widget ID.
     @return WP_Error|array Array containing the updated widget information.
                            A WP_Error object, otherwise.
    
  **/
  @:native("call_widget_update") public function callWidgetUpdate(widget_id:String):haxe.extern.EitherType<wp.extern.Error, php.NativeStructArray<Dynamic>>;
  /**
    
     Updates widget settings asynchronously.
    
     Allows the Customizer to update a widget using its form, but return the new
     instance info via Ajax instead of saving it to the options table.
    
     Most code here copied from wp_ajax_save_widget().
    
     @since 3.9.0
    
     @see wp_ajax_save_widget()
    
  **/
  @:native("wp_ajax_update_widget") public function wpAjaxUpdateWidget():Void;
  /**
    
     Filters arguments for dynamic widget partials.
    
     @since 4.5.0
    
     @param array|false $partial_args Partial arguments.
     @param string      $partial_id   Partial ID.
     @return array (Maybe) modified partial arguments.
    
  **/
  @:native("customize_dynamic_partial_args") public function customizeDynamicPartialArgs(partial_args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>, partial_id:String):php.NativeArray;
  /**
    
     Adds hooks for selective refresh.
    
     @since 4.5.0
    
  **/
  @:native("selective_refresh_init") public function selectiveRefreshInit():Void;
  /**
    
     Inject selective refresh data attributes into widget container elements.
    
     @since 4.5.0
    
     @param array $params {
         Dynamic sidebar params.
    
         @type array $args        Sidebar args.
         @type array $widget_args Widget args.
     }
     @see WP_Customize_Nav_Menus::filter_wp_nav_menu_args()
    
     @return array Params.
    
  **/
  @:native("filter_dynamic_sidebar_params") public function filterDynamicSidebarParams(params:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Ensures the HTML data-* attributes for selective refresh are allowed by kses.
    
     This is needed in case the `$before_widget` is run through wp_kses() when printed.
    
     @since 4.5.0
    
     @param array $allowed_html Allowed HTML.
     @return array (Maybe) modified allowed HTML.
    
  **/
  @:native("filter_wp_kses_allowed_data_attributes") public function filterWpKsesAllowedDataAttributes(allowed_html:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Begins keeping track of the current sidebar being rendered.
    
     Insert marker before widgets are rendered in a dynamic sidebar.
    
     @since 4.5.0
    
     @param int|string $index Index, name, or ID of the dynamic sidebar.
    
  **/
  @:native("start_dynamic_sidebar") public function startDynamicSidebar(index:haxe.extern.EitherType<Int, String>):Void;
  /**
    
     Finishes keeping track of the current sidebar being rendered.
    
     Inserts a marker after widgets are rendered in a dynamic sidebar.
    
     @since 4.5.0
    
     @param int|string $index Index, name, or ID of the dynamic sidebar.
    
  **/
  @:native("end_dynamic_sidebar") public function endDynamicSidebar(index:haxe.extern.EitherType<Int, String>):Void;
  /**
    
     Filters sidebars_widgets to ensure the currently-rendered widget is the only widget in the current sidebar.
    
     @since 4.5.0
    
     @param array $sidebars_widgets Sidebars widgets.
     @return array Filtered sidebars widgets.
    
  **/
  @:native("filter_sidebars_widgets_for_rendering_widget") public function filterSidebarsWidgetsForRenderingWidget(sidebars_widgets:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Renders a specific widget using the supplied sidebar arguments.
    
     @since 4.5.0
    
     @see dynamic_sidebar()
    
     @param WP_Customize_Partial $partial Partial.
     @param array                $context {
         Sidebar args supplied as container context.
    
         @type string $sidebar_id              ID for sidebar for widget to render into.
         @type int    $sidebar_instance_number Disambiguating instance number.
     }
     @return string|false
    
  **/
  @:native("render_widget_partial") public function renderWidgetPartial(partial:wp.extern.CustomizePartial, context:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<String, Bool>;
  /**
    
     Pre-filters captured option values before updating.
    
     @since 3.9.0
    
     @param mixed  $new_value   The new option value.
     @param string $option_name Name of the option.
     @param mixed  $old_value   The old option value.
     @return mixed Filtered option value.
    
  **/
  @:native("capture_filter_pre_update_option") public function captureFilterPreUpdateOption(new_value:Dynamic, option_name:String, old_value:Dynamic):Dynamic;
  /**
    
     Pre-filters captured option values before retrieving.
    
     @since 3.9.0
    
     @param mixed $value Value to return instead of the option value.
     @return mixed Filtered option value.
    
  **/
  @:native("capture_filter_pre_get_option") public function captureFilterPreGetOption(value:Dynamic):Dynamic;
  /**
    
     {@internal Missing Summary}
    
     See the {@see 'customize_dynamic_setting_args'} filter.
    
     @since 3.9.0
     @deprecated 4.2.0 Deprecated in favor of the {@see 'customize_dynamic_setting_args'} filter.
    
  **/
  @:native("setup_widget_addition_previews") public function setupWidgetAdditionPreviews():Void;
  /**
    
     {@internal Missing Summary}
    
     See the {@see 'customize_dynamic_setting_args'} filter.
    
     @since 3.9.0
     @deprecated 4.2.0 Deprecated in favor of the {@see 'customize_dynamic_setting_args'} filter.
    
  **/
  @:native("prepreview_added_sidebars_widgets") public function prepreviewAddedSidebarsWidgets():Void;
  /**
    
     {@internal Missing Summary}
    
     See the {@see 'customize_dynamic_setting_args'} filter.
    
     @since 3.9.0
     @deprecated 4.2.0 Deprecated in favor of the {@see 'customize_dynamic_setting_args'} filter.
    
  **/
  @:native("prepreview_added_widget_instance") public function prepreviewAddedWidgetInstance():Void;
  /**
    
     {@internal Missing Summary}
    
     See the {@see 'customize_dynamic_setting_args'} filter.
    
     @since 3.9.0
     @deprecated 4.2.0 Deprecated in favor of the {@see 'customize_dynamic_setting_args'} filter.
    
  **/
  @:native("remove_prepreview_filters") public function removePrepreviewFilters():Void;
}
