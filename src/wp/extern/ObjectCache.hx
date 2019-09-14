package wp.extern;

@:native("WP_Object_Cache")
extern class ObjectCache {
  /**
    
     The amount of times the cache data was already stored in the cache.
    
     @since 2.5.0
     @var int
    
  **/
  @:native("cache_hits") public var cacheHits:Int;
  /**
    
     Amount of times the cache did not have the request in cache.
    
     @since 2.0.0
     @var int
    
  **/
  @:native("cache_misses") public var cacheMisses:Int;
  /**
    
     Makes private properties readable for backward compatibility.
    
     @since 4.0.0
    
     @param string $name Property to get.
     @return mixed Property.
    
  **/
  @:native("__get") public function __get(name:String):Dynamic;
  /**
    
     Makes private properties settable for backward compatibility.
    
     @since 4.0.0
    
     @param string $name  Property to set.
     @param mixed  $value Property value.
     @return mixed Newly-set property.
    
  **/
  @:native("__set") public function __set(name:String, value:Dynamic):Dynamic;
  /**
    
     Makes private properties checkable for backward compatibility.
    
     @since 4.0.0
    
     @param string $name Property to check if set.
     @return bool Whether the property is set.
    
  **/
  @:native("__isset") public function __isset(name:String):Bool;
  /**
    
     Makes private properties un-settable for backward compatibility.
    
     @since 4.0.0
    
     @param string $name Property to unset.
    
  **/
  @:native("__unset") public function __unset(name:String):Void;
  /**
    
     Adds data to the cache if it doesn't already exist.
    
     @since 2.0.0
    
     @uses WP_Object_Cache::_exists() Checks to see if the cache already has data.
     @uses WP_Object_Cache::set()     Sets the data after the checking the cache
                                      contents existence.
    
     @param int|string $key    What to call the contents in the cache.
     @param mixed      $data   The contents to store in the cache.
     @param string     $group  Optional. Where to group the cache contents. Default 'default'.
     @param int        $expire Optional. When to expire the cache contents. Default 0 (no expiration).
     @return bool False if cache key and group already exist, true on success
    
  **/
  @:native("add") public function add(key:haxe.extern.EitherType<Int, String>, data:Dynamic, group:String = 'default', expire:Int = 0):Bool;
  /**
    
     Sets the list of global cache groups.
    
     @since 3.0.0
    
     @param array $groups List of groups that are global.
    
  **/
  @:native("add_global_groups") public function addGlobalGroups(groups:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Decrements numeric cache item's value.
    
     @since 3.3.0
    
     @param int|string $key    The cache key to decrement.
     @param int        $offset Optional. The amount by which to decrement the item's value. Default 1.
     @param string     $group  Optional. The group the key is in. Default 'default'.
     @return false|int False on failure, the item's new value on success.
    
  **/
  @:native("decr") public function decr(key:haxe.extern.EitherType<Int, String>, offset:Int = 1, group:String = 'default'):haxe.extern.EitherType<Bool, Int>;
  /**
    
     Removes the contents of the cache key in the group.
    
     If the cache key does not exist in the group, then nothing will happen.
    
     @since 2.0.0
    
     @param int|string $key        What the contents in the cache are called.
     @param string     $group      Optional. Where the cache contents are grouped. Default 'default'.
     @param bool       $deprecated Optional. Unused. Default false.
     @return bool False if the contents weren't deleted and true on success.
    
  **/
  @:native("delete") public function delete(key:haxe.extern.EitherType<Int, String>, group:String = 'default', deprecated:Bool = false):Bool;
  /**
    
     Clears the object cache of all data.
    
     @since 2.0.0
    
     @return true Always returns true.
    
  **/
  @:native("flush") public function flush():Bool;
  /**
    
     Retrieves the cache contents, if it exists.
    
     The contents will be first attempted to be retrieved by searching by the
     key in the cache group. If the cache is hit (success) then the contents
     are returned.
    
     On failure, the number of cache misses will be incremented.
    
     @since 2.0.0
    
     @param int|string $key    What the contents in the cache are called.
     @param string     $group  Optional. Where the cache contents are grouped. Default 'default'.
     @param bool       $force  Optional. Unused. Whether to force a refetch rather than relying on the local
                               cache. Default false.
     @param bool       $found  Optional. Whether the key was found in the cache (passed by reference).
                               Disambiguates a return of false, a storable value. Default null.
     @return false|mixed False on failure to retrieve contents or the cache contents on success.
    
  **/
  @:native("get") public function get(key:haxe.extern.EitherType<Int, String>, group:String = 'default', force:Bool = false, found:Bool):haxe.extern.EitherType<Bool, Dynamic>;
  /**
    
     Increments numeric cache item's value.
    
     @since 3.3.0
    
     @param int|string $key    The cache key to increment
     @param int        $offset Optional. The amount by which to increment the item's value. Default 1.
     @param string     $group  Optional. The group the key is in. Default 'default'.
     @return false|int False on failure, the item's new value on success.
    
  **/
  @:native("incr") public function incr(key:haxe.extern.EitherType<Int, String>, offset:Int = 1, group:String = 'default'):haxe.extern.EitherType<Bool, Int>;
  /**
    
     Replaces the contents in the cache, if contents already exist.
    
     @since 2.0.0
    
     @see WP_Object_Cache::set()
    
     @param int|string $key    What to call the contents in the cache.
     @param mixed      $data   The contents to store in the cache.
     @param string     $group  Optional. Where to group the cache contents. Default 'default'.
     @param int        $expire Optional. When to expire the cache contents. Default 0 (no expiration).
     @return bool False if not exists, true if contents were replaced.
    
  **/
  @:native("replace") public function replace(key:haxe.extern.EitherType<Int, String>, data:Dynamic, group:String = 'default', expire:Int = 0):Bool;
  /**
    
     Resets cache keys.
    
     @since 3.0.0
    
     @deprecated 3.5.0 Use switch_to_blog()
     @see switch_to_blog()
    
  **/
  @:native("reset") public function reset():Void;
  /**
    
     Sets the data contents into the cache.
    
     The cache contents is grouped by the $group parameter followed by the
     $key. This allows for duplicate ids in unique groups. Therefore, naming of
     the group should be used with care and should follow normal function
     naming guidelines outside of core WordPress usage.
    
     The $expire parameter is not used, because the cache will automatically
     expire for each time a page is accessed and PHP finishes. The method is
     more for cache plugins which use files.
    
     @since 2.0.0
    
     @param int|string $key    What to call the contents in the cache.
     @param mixed      $data   The contents to store in the cache.
     @param string     $group  Optional. Where to group the cache contents. Default 'default'.
     @param int        $expire Not Used.
     @return true Always returns true.
    
  **/
  @:native("set") public function set(key:haxe.extern.EitherType<Int, String>, data:Dynamic, group:String = 'default', expire:Int = 0):Bool;
  /**
    
     Echoes the stats of the caching.
    
     Gives the cache hits, and cache misses. Also prints every cached group,
     key and the data.
    
     @since 2.0.0
    
  **/
  @:native("stats") public function stats():Void;
  /**
    
     Switches the internal blog ID.
    
     This changes the blog ID used to create keys in blog specific groups.
    
     @since 3.5.0
    
     @param int $blog_id Blog ID.
    
  **/
  @:native("switch_to_blog") public function switchToBlog(blog_id:Int):Void;
  /**
    
     Sets up object properties; PHP 5 style constructor.
    
     @since 2.0.8
    
  **/
  public function new():Void;
  /**
    
     Saves the object cache before object is completely destroyed.
    
     Called upon object destruction, which should be when PHP ends.
    
     @since 2.0.8
    
     @return true Always returns true.
    
  **/
  @:native("__destruct") public function __destruct():Bool;
}
