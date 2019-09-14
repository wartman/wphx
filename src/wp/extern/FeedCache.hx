package wp.extern;

@:native("WP_Feed_Cache")
extern class FeedCache {
  /**
    
     Creates a new SimplePie_Cache object.
    
     @since 2.8.0
    
     @param string $location  URL location (scheme is used to determine handler).
     @param string $filename  Unique identifier for cache object.
     @param string $extension 'spi' or 'spc'.
     @return WP_Feed_Cache_Transient Feed cache handler object that uses transients.
    
  **/
  @:native("create") public function create(location:String, filename:String, extension:String):wp.extern.FeedCacheTransient;
}
