package wp.extern;

@:native("WP_Customize_Setting")
extern class CustomizeSetting {
  /**
    
     Customizer bootstrap instance.
    
     @since 3.4.0
     @var WP_Customize_Manager
    
  **/
  @:native("manager") public var manager:wp.extern.CustomizeManager;
  /**
    
     Unique string identifier for the setting.
    
     @since 3.4.0
     @var string
    
  **/
  @:native("id") public var id:String;
  /**
    
     Type of customize settings.
    
     @since 3.4.0
     @var string
    
  **/
  @:native("type") public var type:String;
  /**
    
     Capability required to edit this setting.
    
     @since 3.4.0
     @var string|array
    
  **/
  @:native("capability") public var capability:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>;
  /**
    
     Feature a theme is required to support to enable this setting.
    
     @since 3.4.0
     @var string
    
  **/
  @:native("theme_supports") public var themeSupports:String;
  /**
    
     The default value for the setting.
    
     @since 3.4.0
     @var string
    
  **/
  @:native("default") public var default:String;
  /**
    
     Options for rendering the live preview of changes in Theme Customizer.
    
     Set this value to 'postMessage' to enable a custom Javascript handler to render changes to this setting
     as opposed to reloading the whole page.
    
     @link https://developer.wordpress.org/themes/customize-api
    
     @since 3.4.0
     @var string
    
  **/
  @:native("transport") public var transport:String;
  /**
    
     Server-side validation callback for the setting's value.
    
     @since 4.6.0
     @var callable
    
  **/
  @:native("validate_callback") public var validateCallback:Dynamic;
  /**
    
     Callback to filter a Customize setting value in un-slashed form.
    
     @since 3.4.0
     @var callable
    
  **/
  @:native("sanitize_callback") public var sanitizeCallback:Dynamic;
  /**
    
     Callback to convert a Customize PHP setting value to a value that is JSON serializable.
    
     @since 3.4.0
     @var string
    
  **/
  @:native("sanitize_js_callback") public var sanitizeJsCallback:String;
  /**
    
     Whether or not the setting is initially dirty when created.
    
     This is used to ensure that a setting will be sent from the pane to the
     preview when loading the Customizer. Normally a setting only is synced to
     the preview if it has been changed. This allows the setting to be sent
     from the start.
    
     @since 4.2.0
     @var bool
    
  **/
  @:native("dirty") public var dirty:Bool;
  /**
    
     Constructor.
    
     Any supplied $args override class property defaults.
    
     @since 3.4.0
    
     @param WP_Customize_Manager $manager
     @param string               $id      An specific ID of the setting. Can be a
                                          theme mod or option name.
     @param array                $args    Setting arguments.
    
  **/
  public function new(manager:wp.extern.CustomizeManager, id:String, ?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Get parsed ID data for multidimensional setting.
    
     @since 4.4.0
    
     @return array {
         ID data for multidimensional setting.
    
         @type string $base ID base
         @type array  $keys Keys for multidimensional array.
     }
    
  **/
  @:native("id_data") public function idData():php.NativeArray;
  /**
    
     Reset `$aggregated_multidimensionals` static variable.
    
     This is intended only for use by unit tests.
    
     @since 4.5.0
     @ignore
    
  **/
  @:native("reset_aggregated_multidimensionals") static public function resetAggregatedMultidimensionals():Void;
  /**
    
     Return true if the current site is not the same as the previewed site.
    
     @since 4.2.0
    
     @return bool If preview() has been called.
    
  **/
  @:native("is_current_blog_previewed") public function isCurrentBlogPreviewed():Bool;
  /**
    
     Add filters to supply the setting's value when accessed.
    
     If the setting already has a pre-existing value and there is no incoming
     post value for the setting, then this method will short-circuit since
     there is no change to preview.
    
     @since 3.4.0
     @since 4.4.0 Added boolean return value.
    
     @return bool False when preview short-circuits due no change needing to be previewed.
    
  **/
  @:native("preview") public function preview():Bool;
  /**
    
     Clear out the previewed-applied flag for a multidimensional-aggregated value whenever its post value is updated.
    
     This ensures that the new value will get sanitized and used the next time
     that `WP_Customize_Setting::_multidimensional_preview_filter()`
     is called for this setting.
    
     @since 4.4.0
    
     @see WP_Customize_Manager::set_post_value()
     @see WP_Customize_Setting::_multidimensional_preview_filter()
    
  **/
  @:native("_clear_aggregated_multidimensional_preview_applied_flag") public function _clearAggregatedMultidimensionalPreviewAppliedFlag():Void;
  /**
    
     Callback function to filter non-multidimensional theme mods and options.
    
     If switch_to_blog() was called after the preview() method, and the current
     site is now not the same site, then this method does a no-op and returns
     the original value.
    
     @since 3.4.0
    
     @param mixed $original Old value.
     @return mixed New or old value.
    
  **/
  @:native("_preview_filter") public function _previewFilter(original:Dynamic):Dynamic;
  /**
    
     Callback function to filter multidimensional theme mods and options.
    
     For all multidimensional settings of a given type, the preview filter for
     the first setting previewed will be used to apply the values for the others.
    
     @since 4.4.0
    
     @see WP_Customize_Setting::$aggregated_multidimensionals
     @param mixed $original Original root value.
     @return mixed New or old value.
    
  **/
  @:native("_multidimensional_preview_filter") public function _multidimensionalPreviewFilter(original:Dynamic):Dynamic;
  /**
    
     Checks user capabilities and theme supports, and then saves
     the value of the setting.
    
     @since 3.4.0
    
     @return false|void False if cap check fails or value isn't set or is invalid.
    
  **/
  @:native("save") public function save():Bool;
  /**
    
     Fetch and sanitize the $_POST value for the setting.
    
     During a save request prior to save, post_value() provides the new value while value() does not.
    
     @since 3.4.0
    
     @param mixed $default A default value which is used as a fallback. Default is null.
     @return mixed The default value on failure, otherwise the sanitized and validated value.
    
  **/
  @:native("post_value") public function postValue(default:Dynamic = null):Dynamic;
  /**
    
     Sanitize an input.
    
     @since 3.4.0
    
     @param string|array $value    The value to sanitize.
     @return string|array|null|WP_Error Sanitized value, or `null`/`WP_Error` if invalid.
    
  **/
  @:native("sanitize") public function sanitize(value:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<String, haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>>;
  /**
    
     Validates an input.
    
     @since 4.6.0
    
     @see WP_REST_Request::has_valid_params()
    
     @param mixed $value Value to validate.
     @return true|WP_Error True if the input was validated, otherwise WP_Error.
    
  **/
  @:native("validate") public function validate(value:Dynamic):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Fetch the value of the setting.
    
     @since 3.4.0
    
     @return mixed The value.
    
  **/
  @:native("value") public function value():Dynamic;
  /**
    
     Sanitize the setting's value for use in JavaScript.
    
     @since 3.4.0
    
     @return mixed The requested escaped value.
    
  **/
  @:native("js_value") public function jsValue():Dynamic;
  /**
    
     Retrieves the data to export to the client via JSON.
    
     @since 4.6.0
    
     @return array Array of parameters passed to JavaScript.
    
  **/
  @:native("json") public function json():php.NativeArray;
  /**
    
     Validate user capabilities whether the theme supports the setting.
    
     @since 3.4.0
    
     @return bool False if theme doesn't support the setting or user can't change setting, otherwise true.
    
  **/
  @:native("check_capabilities") public function checkCapabilities():Bool;
}
