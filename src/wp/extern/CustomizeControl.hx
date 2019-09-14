package wp.extern;

@:native("WP_Customize_Control")
extern class CustomizeControl {
  /**
    
     Order in which this instance was created in relation to other instances.
    
     @since 4.1.0
     @var int
    
  **/
  @:native("instance_number") public var instanceNumber:Int;
  /**
    
     Customizer manager.
    
     @since 3.4.0
     @var WP_Customize_Manager
    
  **/
  @:native("manager") public var manager:wp.extern.CustomizeManager;
  /**
    
     Control ID.
    
     @since 3.4.0
     @var string
    
  **/
  @:native("id") public var id:String;
  /**
    
     All settings tied to the control.
    
     @since 3.4.0
     @var array
    
  **/
  @:native("settings") public var settings:php.NativeStructArray<Dynamic>;
  /**
    
     The primary setting for the control (if there is one).
    
     @since 3.4.0
     @var string
    
  **/
  @:native("setting") public var setting:String;
  /**
    
     Capability required to use this control.
    
     Normally this is empty and the capability is derived from the capabilities
     of the associated `$settings`.
    
     @since 4.5.0
     @var string
    
  **/
  @:native("capability") public var capability:String;
  /**
    
     Order priority to load the control in Customizer.
    
     @since 3.4.0
     @var int
    
  **/
  @:native("priority") public var priority:Int;
  /**
    
     Section the control belongs to.
    
     @since 3.4.0
     @var string
    
  **/
  @:native("section") public var section:String;
  /**
    
     Label for the control.
    
     @since 3.4.0
     @var string
    
  **/
  @:native("label") public var label:String;
  /**
    
     Description for the control.
    
     @since 4.0.0
     @var string
    
  **/
  @:native("description") public var description:String;
  /**
    
     List of choices for 'radio' or 'select' type controls, where values are the keys, and labels are the values.
    
     @since 3.4.0
     @var array
    
  **/
  @:native("choices") public var choices:php.NativeStructArray<Dynamic>;
  /**
    
     List of custom input attributes for control output, where attribute names are the keys and values are the values.
    
     Not used for 'checkbox', 'radio', 'select', 'textarea', or 'dropdown-pages' control types.
    
     @since 4.0.0
     @var array
    
  **/
  @:native("input_attrs") public var inputAttrs:php.NativeStructArray<Dynamic>;
  /**
    
     Show UI for adding new content, currently only used for the dropdown-pages control.
    
     @since 4.7.0
     @var bool
    
  **/
  @:native("allow_addition") public var allowAddition:Bool;
  /**
    
     @deprecated It is better to just call the json() method
     @since 3.4.0
     @var array
    
  **/
  @:native("json") public var json:php.NativeStructArray<Dynamic>;
  /**
    
     Control's Type.
    
     @since 3.4.0
     @var string
    
  **/
  @:native("type") public var type:String;
  /**
    
     Callback.
    
     @since 4.0.0
    
     @see WP_Customize_Control::active()
    
     @var callable Callback is called with one argument, the instance of
                   WP_Customize_Control, and returns bool to indicate whether
                   the control is active (such as it relates to the URL
                   currently being previewed).
    
  **/
  @:native("active_callback") public var activeCallback:Dynamic;
  /**
    
     Constructor.
    
     Supplied `$args` override class property defaults.
    
     If `$args['settings']` is not defined, use the $id as the setting ID.
    
     @since 3.4.0
    
     @param WP_Customize_Manager $manager Customizer bootstrap instance.
     @param string               $id      Control ID.
     @param array                $args    {
         Optional. Arguments to override class property defaults.
    
         @type int                  $instance_number Order in which this instance was created in relation
                                                     to other instances.
         @type WP_Customize_Manager $manager         Customizer bootstrap instance.
         @type string               $id              Control ID.
         @type array                $settings        All settings tied to the control. If undefined, `$id` will
                                                     be used.
         @type string               $setting         The primary setting for the control (if there is one).
                                                     Default 'default'.
         @type int                  $priority        Order priority to load the control. Default 10.
         @type string               $section         Section the control belongs to. Default empty.
         @type string               $label           Label for the control. Default empty.
         @type string               $description     Description for the control. Default empty.
         @type array                $choices         List of choices for 'radio' or 'select' type controls, where
                                                     values are the keys, and labels are the values.
                                                     Default empty array.
         @type array                $input_attrs     List of custom input attributes for control output, where
                                                     attribute names are the keys and values are the values. Not
                                                     used for 'checkbox', 'radio', 'select', 'textarea', or
                                                     'dropdown-pages' control types. Default empty array.
         @type array                $json            Deprecated. Use WP_Customize_Control::json() instead.
         @type string               $type            Control type. Core controls include 'text', 'checkbox',
                                                     'textarea', 'radio', 'select', and 'dropdown-pages'. Additional
                                                     input types such as 'email', 'url', 'number', 'hidden', and
                                                     'date' are supported implicitly. Default 'text'.
     }
    
  **/
  public function new(manager:wp.extern.CustomizeManager, id:String, ?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Enqueue control related scripts/styles.
    
     @since 3.4.0
    
  **/
  @:native("enqueue") public function enqueue():Void;
  /**
    
     Check whether control is active to current Customizer preview.
    
     @since 4.0.0
    
     @return bool Whether the control is active to the current preview.
    
  **/
  @:native("active") public function active():Bool;
  /**
    
     Default callback used when invoking WP_Customize_Control::active().
    
     Subclasses can override this with their specific logic, or they may
     provide an 'active_callback' argument to the constructor.
    
     @since 4.0.0
    
     @return true Always true.
    
  **/
  @:native("active_callback") public function activeCallback():Bool;
  /**
    
     Fetch a setting's value.
     Grabs the main setting by default.
    
     @since 3.4.0
    
     @param string $setting_key
     @return mixed The requested setting's value, if the setting exists.
    
  **/
  @:native("value") public function value(setting_key:String = 'default'):Dynamic;
  /**
    
     Refresh the parameters passed to the JavaScript via JSON.
    
     @since 3.4.0
    
  **/
  @:native("to_json") public function toJson():Void;
  /**
    
     Get the data to export to the client via JSON.
    
     @since 4.1.0
    
     @return array Array of parameters passed to the JavaScript.
    
  **/
  @:native("json") public function json():php.NativeArray;
  /**
    
     Checks if the user can use this control.
    
     Returns false if the user cannot manipulate one of the associated settings,
     or if one of the associated settings does not exist. Also returns false if
     the associated section does not exist or if its capability check returns
     false.
    
     @since 3.4.0
    
     @return bool False if theme doesn't support the control or user doesn't have the required permissions, otherwise true.
    
  **/
  @:native("check_capabilities") public function checkCapabilities():Bool;
  /**
    
     Get the control's content for insertion into the Customizer pane.
    
     @since 4.1.0
    
     @return string Contents of the control.
    
  **/
  @:native("get_content") public function getContent():String;
  /**
    
     Check capabilities and render the control.
    
     @since 3.4.0
     @uses WP_Customize_Control::render()
    
  **/
  @:native("maybe_render") public function maybeRender():Void;
  /**
    
     Get the data link attribute for a setting.
    
     @since 3.4.0
     @since 4.9.0 Return a `data-customize-setting-key-link` attribute if a setting is not registered for the supplied setting key.
    
     @param string $setting_key
     @return string Data link parameter, a `data-customize-setting-link` attribute if the `$setting_key` refers to a pre-registered setting,
                    and a `data-customize-setting-key-link` attribute if the setting is not yet registered.
    
  **/
  @:native("get_link") public function getLink(setting_key:String = 'default'):String;
  /**
    
     Render the data link attribute for the control's input element.
    
     @since 3.4.0
     @uses WP_Customize_Control::get_link()
    
     @param string $setting_key
    
  **/
  @:native("link") public function link(setting_key:String = 'default'):Void;
  /**
    
     Render the custom attributes for the control's input element.
    
     @since 4.0.0
    
  **/
  @:native("input_attrs") public function inputAttrs():Void;
  /**
    
     Render the control's JS template.
    
     This function is only run for control types that have been registered with
     WP_Customize_Manager::register_control_type().
    
     In the future, this will also print the template for the control's container
     element and be override-able.
    
     @since 4.1.0
    
  **/
  @:native("print_template") public function printTemplate():Void;
}
