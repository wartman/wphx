package wp.extern;

@:native("WP_Feed_Cache_Transient")
extern class FeedCacheTransient {
  /**
    
     Holds the transient name.
    
     @since 2.8.0
     @var string
    
  **/
  @:native("name") public var name:String;
  /**
    
     Holds the transient mod name.
    
     @since 2.8.0
     @var string
    
  **/
  @:native("mod_name") public var modName:String;
  /**
    
     Holds the cache duration in seconds.
    
     Defaults to 43200 seconds (12 hours).
    
     @since 2.8.0
     @var int
    
  **/
  @:native("lifetime") public var lifetime:Int;
  /**
    
     Constructor.
    
     @since 2.8.0
     @since 3.2.0 Updated to use a PHP5 constructor.
    
     @param string $location  URL location (scheme is used to determine handler).
     @param string $filename  Unique identifier for cache object.
     @param string $extension 'spi' or 'spc'.
    
  **/
  public function new(location:String, filename:String, extension:String):Void;
  /**
    
     Sets the transient.
    
     @since 2.8.0
    
     @param SimplePie $data Data to save.
     @return true Always true.
    
  **/
  @:native("save") public function save(data:SimplePie):Bool;
  /**
    
     Gets the transient.
    
     @since 2.8.0
    
     @return mixed Transient value.
    
  **/
  @:native("load") public function load():Dynamic;
  /**
    
     Gets mod transient.
    
     @since 2.8.0
    
     @return mixed Transient value.
    
  **/
  @:native("mtime") public function mtime():Dynamic;
  /**
    
     Sets mod transient.
    
     @since 2.8.0
    
     @return bool False if value was not set and true if value was set.
    
  **/
  @:native("touch") public function touch():Bool;
  /**
    
     Deletes transients.
    
     @since 2.8.0
    
     @return true Always true.
    
  **/
  @:native("unlink") public function unlink():Bool;
}
