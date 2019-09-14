package wp.extern;

@:native("_WP_Dependency")
extern class WPDependency {
  /**
    
     The handle name.
    
     @since 2.6.0
     @var null
    
  **/
  @:native("handle") public var handle:Dynamic;
  /**
    
     The handle source.
    
     @since 2.6.0
     @var null
    
  **/
  @:native("src") public var src:Dynamic;
  /**
    
     An array of handle dependencies.
    
     @since 2.6.0
     @var array
    
  **/
  @:native("deps") public var deps:php.NativeStructArray<Dynamic>;
  /**
    
     The handle version.
    
     Used for cache-busting.
    
     @since 2.6.0
     @var bool|string
    
  **/
  @:native("ver") public var ver:haxe.extern.EitherType<Bool, String>;
  /**
    
     Additional arguments for the handle.
    
     @since 2.6.0
     @var null
    
  **/
  @:native("args") public var args:Dynamic;
  /**
    
     Extra data to supply to the handle.
    
     @since 2.6.0
     @var array
    
  **/
  @:native("extra") public var extra:php.NativeStructArray<Dynamic>;
  /**
    
     Translation textdomain set for this dependency.
    
     @since 5.0.0
     @var string
    
  **/
  @:native("textdomain") public var textdomain:String;
  /**
    
     Translation path set for this dependency.
    
     @since 5.0.0
     @var string
    
  **/
  @:native("translations_path") public var translationsPath:String;
  /**
    
     Setup dependencies.
    
     @since 2.6.0
    
  **/
  public function new():Void;
  /**
    
     Add handle data.
    
     @since 2.6.0
    
     @param string $name The data key to add.
     @param mixed  $data The data value to add.
     @return bool False if not scalar, true otherwise.
    
  **/
  @:native("add_data") public function addData(name:String, data:Dynamic):Bool;
  /**
    
     Sets the translation domain for this dependency.
    
     @since 5.0.0
    
     @param string $domain The translation textdomain.
     @param string $path   Optional. The full file path to the directory containing translation files.
    
     @return bool False if $domain is not a string, true otherwise.
    
  **/
  @:native("set_translations") public function setTranslations(domain:String, path:String = null):Bool;
}
