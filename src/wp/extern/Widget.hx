package wp.extern;

@:native("WP_Widget")
extern class Widget {
  /**
    
     Root ID for all widgets of this type.
    
     @since 2.8.0
     @var mixed|string
    
  **/
  @:native("id_base") public var idBase:haxe.extern.EitherType<Dynamic, String>;
  /**
    
     Name for this widget type.
    
     @since 2.8.0
     @var string
    
  **/
  @:native("name") public var name:String;
  /**
    
     Option name for this widget type.
    
     @since 2.8.0
     @var string
    
  **/
  @:native("option_name") public var optionName:String;
  /**
    
     Alt option name for this widget type.
    
     @since 2.8.0
     @var string
    
  **/
  @:native("alt_option_name") public var altOptionName:String;
  /**
    
     Option array passed to wp_register_sidebar_widget().
    
     @since 2.8.0
     @var array
    
  **/
  @:native("widget_options") public var options:php.NativeStructArray<Dynamic>;
  /**
    
     Option array passed to wp_register_widget_control().
    
     @since 2.8.0
     @var array
    
  **/
  @:native("control_options") public var controlOptions:php.NativeStructArray<Dynamic>;
  /**
    
     Unique ID number of the current instance.
    
     @since 2.8.0
     @var bool|int
    
  **/
  @:native("number") public var number:haxe.extern.EitherType<Bool, Int>;
  /**
    
     Unique ID string of the current instance (id_base-number).
    
     @since 2.8.0
     @var bool|string
    
  **/
  @:native("id") public var id:haxe.extern.EitherType<Bool, String>;
  /**
    
     Whether the widget data has been updated.
    
     Set to true when the data is updated after a POST submit - ensures it does
     not happen twice.
    
     @since 2.8.0
     @var bool
    
  **/
  @:native("updated") public var updated:Bool;
  /**
    
     Echoes the widget content.
    
     Sub-classes should over-ride this function to generate their widget code.
    
     @since 2.8.0
    
     @param array $args     Display arguments including 'before_title', 'after_title',
                            'before_widget', and 'after_widget'.
     @param array $instance The settings for the particular instance of the widget.
    
  **/
  @:native("widget") public function widget(args:php.NativeStructArray<Dynamic>, instance:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Updates a particular instance of a widget.
    
     This function should check that `$new_instance` is set correctly. The newly-calculated
     value of `$instance` should be returned. If false is returned, the instance won't be
     saved/updated.
    
     @since 2.8.0
    
     @param array $new_instance New settings for this instance as input by the user via
                                WP_Widget::form().
     @param array $old_instance Old settings for this instance.
     @return array Settings to save or bool false to cancel saving.
    
  **/
  @:native("update") public function update(new_instance:php.NativeStructArray<Dynamic>, old_instance:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Outputs the settings update form.
    
     @since 2.8.0
    
     @param array $instance Current settings.
     @return string Default return is 'noform'.
    
  **/
  @:native("form") public function form(instance:php.NativeStructArray<Dynamic>):String;
  /**
    
     PHP5 constructor.
    
     @since 2.8.0
    
     @param string $id_base         Optional Base ID for the widget, lowercase and unique. If left empty,
                                    a portion of the widget's class name will be used Has to be unique.
     @param string $name            Name for the widget displayed on the configuration page.
     @param array  $widget_options  Optional. Widget options. See wp_register_sidebar_widget() for information
                                    on accepted arguments. Default empty array.
     @param array  $control_options Optional. Widget control options. See wp_register_widget_control() for
                                    information on accepted arguments. Default empty array.
    
  **/
  public function new(id_base:String, name:String, ?widget_options:php.NativeStructArray<Dynamic>, ?control_options:php.NativeStructArray<Dynamic>):Void;
  /**
    
     PHP4 constructor.
    
     @since 2.8.0
    
     @see __construct()
    
     @param string $id_base         Optional Base ID for the widget, lowercase and unique. If left empty,
                                    a portion of the widget's class name will be used Has to be unique.
     @param string $name            Name for the widget displayed on the configuration page.
     @param array  $widget_options  Optional. Widget options. See wp_register_sidebar_widget() for information
                                    on accepted arguments. Default empty array.
     @param array  $control_options Optional. Widget control options. See wp_register_widget_control() for
                                    information on accepted arguments. Default empty array.
    
  **/
  @:native("WP_Widget") public function WPWidget(id_base:String, name:String, ?widget_options:php.NativeStructArray<Dynamic>, ?control_options:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Constructs name attributes for use in form() fields
    
     This function should be used in form() methods to create name attributes for fields
     to be saved by update()
    
     @since 2.8.0
     @since 4.4.0 Array format field names are now accepted.
    
     @param string $field_name Field name
     @return string Name attribute for $field_name
    
  **/
  @:native("get_field_name") public function getFieldName(field_name:String):String;
  /**
    
     Constructs id attributes for use in WP_Widget::form() fields.
    
     This function should be used in form() methods to create id attributes
     for fields to be saved by WP_Widget::update().
    
     @since 2.8.0
     @since 4.4.0 Array format field IDs are now accepted.
    
     @param string $field_name Field name.
     @return string ID attribute for `$field_name`.
    
  **/
  @:native("get_field_id") public function getFieldId(field_name:String):String;
  /**
    
     Register all widget instances of this widget class.
    
     @since 2.8.0
    
  **/
  @:native("_register") public function _register():Void;
  /**
    
     Sets the internal order number for the widget instance.
    
     @since 2.8.0
    
     @param int $number The unique order number of this widget instance compared to other
                        instances of the same class.
    
  **/
  @:native("_set") public function _set(number:Int):Void;
  /**
    
     Retrieves the widget display callback.
    
     @since 2.8.0
    
     @return callable Display callback.
    
  **/
  @:native("_get_display_callback") public function _getDisplayCallback():Dynamic;
  /**
    
     Retrieves the widget update callback.
    
     @since 2.8.0
    
     @return callable Update callback.
    
  **/
  @:native("_get_update_callback") public function _getUpdateCallback():Dynamic;
  /**
    
     Retrieves the form callback.
    
     @since 2.8.0
    
     @return callable Form callback.
    
  **/
  @:native("_get_form_callback") public function _getFormCallback():Dynamic;
  /**
    
     Determines whether the current request is inside the Customizer preview.
    
     If true -- the current request is inside the Customizer preview, then
     the object cache gets suspended and widgets should check this to decide
     whether they should store anything persistently to the object cache,
     to transients, or anywhere else.
    
     @since 3.9.0
    
     @global WP_Customize_Manager $wp_customize
    
     @return bool True if within the Customizer preview, false if not.
    
  **/
  @:native("is_preview") public function isPreview():Bool;
  /**
    
     Generates the actual widget content (Do NOT override).
    
     Finds the instance and calls WP_Widget::widget().
    
     @since 2.8.0
    
     @param array     $args        Display arguments. See WP_Widget::widget() for information
                                   on accepted arguments.
     @param int|array $widget_args {
         Optional. Internal order number of the widget instance, or array of multi-widget arguments.
         Default 1.
    
         @type int $number Number increment used for multiples of the same widget.
     }
    
  **/
  @:native("display_callback") public function displayCallback(args:php.NativeStructArray<Dynamic>, widget_args:haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>> = 1):Void;
  /**
    
     Handles changed settings (Do NOT override).
    
     @since 2.8.0
    
     @global array $wp_registered_widgets
    
     @param int $deprecated Not used.
    
  **/
  @:native("update_callback") public function updateCallback(deprecated:Int = 1):Void;
  /**
    
     Generates the widget control form (Do NOT override).
    
     @since 2.8.0
    
     @param int|array $widget_args {
         Optional. Internal order number of the widget instance, or array of multi-widget arguments.
         Default 1.
    
         @type int $number Number increment used for multiples of the same widget.
     }
     @return string|null
    
  **/
  @:native("form_callback") public function formCallback(widget_args:haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>> = 1):String;
  /**
    
     Registers an instance of the widget class.
    
     @since 2.8.0
    
     @param integer $number Optional. The unique order number of this widget instance
                            compared to other instances of the same class. Default -1.
    
  **/
  @:native("_register_one") public function _registerOne(number:Int = ):Void;
  /**
    
     Saves the settings for all instances of the widget class.
    
     @since 2.8.0
    
     @param array $settings Multi-dimensional array of widget instance settings.
    
  **/
  @:native("save_settings") public function saveSettings(settings:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Retrieves the settings for all instances of the widget class.
    
     @since 2.8.0
    
     @return array Multi-dimensional array of widget instance settings.
    
  **/
  @:native("get_settings") public function getSettings():php.NativeArray;
}
