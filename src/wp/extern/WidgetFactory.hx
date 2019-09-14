package wp.extern;

@:native("WP_Widget_Factory")
extern class WidgetFactory {
  /**
    
     Widgets array.
    
     @since 2.8.0
     @var array
    
  **/
  @:native("widgets") public var widgets:php.NativeStructArray<Dynamic>;
  /**
    
     PHP5 constructor.
    
     @since 4.3.0
    
  **/
  public function new():Void;
  /**
    
     PHP4 constructor.
    
     @since 2.8.0
    
  **/
  @:native("WP_Widget_Factory") public function WPWidgetFactory():Void;
  /**
    
     Registers a widget subclass.
    
     @since 2.8.0
     @since 4.6.0 Updated the `$widget` parameter to also accept a WP_Widget instance object
                  instead of simply a `WP_Widget` subclass name.
    
     @param string|WP_Widget $widget Either the name of a `WP_Widget` subclass or an instance of a `WP_Widget` subclass.
    
  **/
  @:native("register") public function register(widget:haxe.extern.EitherType<String, wp.extern.Widget>):Void;
  /**
    
     Un-registers a widget subclass.
    
     @since 2.8.0
     @since 4.6.0 Updated the `$widget` parameter to also accept a WP_Widget instance object
                  instead of simply a `WP_Widget` subclass name.
    
     @param string|WP_Widget $widget Either the name of a `WP_Widget` subclass or an instance of a `WP_Widget` subclass.
    
  **/
  @:native("unregister") public function unregister(widget:haxe.extern.EitherType<String, wp.extern.Widget>):Void;
  /**
    
     Serves as a utility method for adding widgets to the registered widgets global.
    
     @since 2.8.0
    
     @global array $wp_registered_widgets
    
  **/
  @:native("_register_widgets") public function _registerWidgets():Void;
}
