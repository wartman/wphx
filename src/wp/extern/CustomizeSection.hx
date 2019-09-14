package wp.extern;

@:native("WP_Customize_Section")
extern class CustomizeSection {
  /**
    
     Order in which this instance was created in relation to other instances.
    
     @since 4.1.0
     @var int
    
  **/
  @:native("instance_number") public var instanceNumber:Int;
  /**
    
     WP_Customize_Manager instance.
    
     @since 3.4.0
     @var WP_Customize_Manager
    
  **/
  @:native("manager") public var manager:wp.extern.CustomizeManager;
  /**
    
     Unique identifier.
    
     @since 3.4.0
     @var string
    
  **/
  @:native("id") public var id:String;
  /**
    
     Priority of the section which informs load order of sections.
    
     @since 3.4.0
     @var integer
    
  **/
  @:native("priority") public var priority:Int;
  /**
    
     Panel in which to show the section, making it a sub-section.
    
     @since 4.0.0
     @var string
    
  **/
  @:native("panel") public var panel:String;
  /**
    
     Capability required for the section.
    
     @since 3.4.0
     @var string
    
  **/
  @:native("capability") public var capability:String;
  /**
    
     Theme feature support for the section.
    
     @since 3.4.0
     @var string|array
    
  **/
  @:native("theme_supports") public var themeSupports:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>;
  /**
    
     Title of the section to show in UI.
    
     @since 3.4.0
     @var string
    
  **/
  @:native("title") public var title:String;
  /**
    
     Description to show in the UI.
    
     @since 3.4.0
     @var string
    
  **/
  @:native("description") public var description:String;
  /**
    
     Customizer controls for this section.
    
     @since 3.4.0
     @var array
    
  **/
  @:native("controls") public var controls:php.NativeStructArray<Dynamic>;
  /**
    
     Type of this section.
    
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
    
     Show the description or hide it behind the help icon.
    
     @since 4.7.0
    
     @var bool Indicates whether the Section's description should be
               hidden behind a help icon ("?") in the Section header,
               similar to how help icons are displayed on Panels.
    
  **/
  @:native("description_hidden") public var descriptionHidden:Bool;
  /**
    
     Constructor.
    
     Any supplied $args override class property defaults.
    
     @since 3.4.0
    
     @param WP_Customize_Manager $manager Customizer bootstrap instance.
     @param string               $id      An specific ID of the section.
     @param array                $args    Section arguments.
    
  **/
  public function new(manager:wp.extern.CustomizeManager, id:String, ?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Check whether section is active to current Customizer preview.
    
     @since 4.1.0
    
     @return bool Whether the section is active to the current preview.
    
  **/
  @:native("active") public function active():Bool;
  /**
    
     Default callback used when invoking WP_Customize_Section::active().
    
     Subclasses can override this with their specific logic, or they may provide
     an 'active_callback' argument to the constructor.
    
     @since 4.1.0
    
     @return true Always true.
    
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
     feature support required by the section.
    
     @since 3.4.0
    
     @return bool False if theme doesn't support the section or user doesn't have the capability.
    
  **/
  @:native("check_capabilities") public function checkCapabilities():Bool;
  /**
    
     Get the section's content for insertion into the Customizer pane.
    
     @since 4.1.0
    
     @return string Contents of the section.
    
  **/
  @:native("get_content") public function getContent():String;
  /**
    
     Check capabilities and render the section.
    
     @since 3.4.0
    
  **/
  @:native("maybe_render") public function maybeRender():Void;
  /**
    
     Render the section's JS template.
    
     This function is only run for section types that have been registered with
     WP_Customize_Manager::register_section_type().
    
     @since 4.3.0
    
     @see WP_Customize_Manager::render_template()
    
  **/
  @:native("print_template") public function printTemplate():Void;
}
