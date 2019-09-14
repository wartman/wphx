package wp.extern;

@:native("WP_Customize_Panel")
extern class CustomizePanel {
  /**
    
     Order in which this instance was created in relation to other instances.
    
     @since 4.1.0
     @var int
    
  **/
  @:native("instance_number") public var instanceNumber:Int;
  /**
    
     WP_Customize_Manager instance.
    
     @since 4.0.0
     @var WP_Customize_Manager
    
  **/
  @:native("manager") public var manager:wp.extern.CustomizeManager;
  /**
    
     Unique identifier.
    
     @since 4.0.0
     @var string
    
  **/
  @:native("id") public var id:String;
  /**
    
     Priority of the panel, defining the display order of panels and sections.
    
     @since 4.0.0
     @var integer
    
  **/
  @:native("priority") public var priority:Int;
  /**
    
     Capability required for the panel.
    
     @since 4.0.0
     @var string
    
  **/
  @:native("capability") public var capability:String;
  /**
    
     Theme feature support for the panel.
    
     @since 4.0.0
     @var string|array
    
  **/
  @:native("theme_supports") public var themeSupports:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>;
  /**
    
     Title of the panel to show in UI.
    
     @since 4.0.0
     @var string
    
  **/
  @:native("title") public var title:String;
  /**
    
     Description to show in the UI.
    
     @since 4.0.0
     @var string
    
  **/
  @:native("description") public var description:String;
  /**
    
     Auto-expand a section in a panel when the panel is expanded when the panel only has the one section.
    
     @since 4.7.4
     @var bool
    
  **/
  @:native("auto_expand_sole_section") public var autoExpandSoleSection:Bool;
  /**
    
     Customizer sections for this panel.
    
     @since 4.0.0
     @var array
    
  **/
  @:native("sections") public var sections:php.NativeStructArray<Dynamic>;
  /**
    
     Type of this panel.
    
     @since 4.1.0
     @var string
    
  **/
  @:native("type") public var type:String;
  /**
    
     Active callback.
    
     @since 4.1.0
    
     @see WP_Customize_Section::active()
    
     @var callable Callback is called with one argument, the instance of
                   WP_Customize_Section, and returns bool to indicate whether
                   the section is active (such as it relates to the URL currently
                   being previewed).
    
  **/
  @:native("active_callback") public var activeCallback:Dynamic;
  /**
    
     Constructor.
    
     Any supplied $args override class property defaults.
    
     @since 4.0.0
    
     @param WP_Customize_Manager $manager Customizer bootstrap instance.
     @param string               $id      An specific ID for the panel.
     @param array                $args    Panel arguments.
    
  **/
  public function new(manager:wp.extern.CustomizeManager, id:String, ?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Check whether panel is active to current Customizer preview.
    
     @since 4.1.0
    
     @return bool Whether the panel is active to the current preview.
    
  **/
  @:native("active") public function active():Bool;
  /**
    
     Default callback used when invoking WP_Customize_Panel::active().
    
     Subclasses can override this with their specific logic, or they may
     provide an 'active_callback' argument to the constructor.
    
     @since 4.1.0
    
     @return bool Always true.
    
  **/
  @:native("active_callback") public function activeCallback():Bool;
  /**
    
     Gather the parameters passed to client JavaScript via JSON.
    
     @since 4.1.0
    
     @return array The array to be exported to the client as JSON.
    
  **/
  @:native("json") public function json():php.NativeArray;
  /**
    
     Checks required user capabilities and whether the theme has the
     feature support required by the panel.
    
     @since 4.0.0
    
     @return bool False if theme doesn't support the panel or the user doesn't have the capability.
    
  **/
  @:native("check_capabilities") public function checkCapabilities():Bool;
  /**
    
     Get the panel's content template for insertion into the Customizer pane.
    
     @since 4.1.0
    
     @return string Content for the panel.
    
  **/
  @:native("get_content") public function getContent():String;
  /**
    
     Check capabilities and render the panel.
    
     @since 4.0.0
    
  **/
  @:native("maybe_render") public function maybeRender():Void;
  /**
    
     Render the panel's JS templates.
    
     This function is only run for panel types that have been registered with
     WP_Customize_Manager::register_panel_type().
    
     @since 4.3.0
    
     @see WP_Customize_Manager::register_panel_type()
    
  **/
  @:native("print_template") public function printTemplate():Void;
}
