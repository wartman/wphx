package wp.extern;

@:native("WP_Dependencies")
extern class Dependencies {
  /**
    
     An array of registered handle objects.
    
     @since 2.6.8
     @var array
    
  **/
  @:native("registered") public var registered:php.NativeStructArray<Dynamic>;
  /**
    
     An array of queued _WP_Dependency handle objects.
    
     @since 2.6.8
     @var array
    
  **/
  @:native("queue") public var queue:php.NativeStructArray<Dynamic>;
  /**
    
     An array of _WP_Dependency handle objects to queue.
    
     @since 2.6.0
     @var array
    
  **/
  @:native("to_do") public var toDo:php.NativeStructArray<Dynamic>;
  /**
    
     An array of _WP_Dependency handle objects already queued.
    
     @since 2.6.0
     @var array
    
  **/
  @:native("done") public var done:php.NativeStructArray<Dynamic>;
  /**
    
     An array of additional arguments passed when a handle is registered.
    
     Arguments are appended to the item query string.
    
     @since 2.6.0
     @var array
    
  **/
  @:native("args") public var args:php.NativeStructArray<Dynamic>;
  /**
    
     An array of handle groups to enqueue.
    
     @since 2.8.0
     @var array
    
  **/
  @:native("groups") public var groups:php.NativeStructArray<Dynamic>;
  /**
    
     A handle group to enqueue.
    
     @since 2.8.0
     @deprecated 4.5.0
     @var int
    
  **/
  @:native("group") public var group:Int;
  /**
    
     Processes the items and dependencies.
    
     Processes the items passed to it or the queue, and their dependencies.
    
     @since 2.6.0
     @since 2.8.0 Added the `$group` parameter.
    
     @param mixed $handles Optional. Items to be processed: Process queue (false), process item (string), process items (array of strings).
     @param mixed $group   Group level: level (int), no groups (false).
     @return array Handles of items that have been processed.
    
  **/
  @:native("do_items") public function doItems(handles:Dynamic = false, group:Dynamic = false):php.NativeArray;
  /**
    
     Processes a dependency.
    
     @since 2.6.0
    
     @param string $handle Name of the item. Should be unique.
     @return bool True on success, false if not set.
    
  **/
  @:native("do_item") public function doItem(handle:String):Bool;
  /**
    
     Determines dependencies.
    
     Recursively builds an array of items to process taking
     dependencies into account. Does NOT catch infinite loops.
    
     @since 2.1.0
     @since 2.6.0 Moved from `WP_Scripts`.
     @since 2.8.0 Added the `$group` parameter.
    
     @param mixed     $handles   Item handle and argument (string) or item handles and arguments (array of strings).
     @param bool      $recursion Internal flag that function is calling itself.
     @param int|false $group     Group level: (int) level, (false) no groups.
     @return bool True on success, false on failure.
    
  **/
  @:native("all_deps") public function allDeps(handles:Dynamic, recursion:Bool = false, group:haxe.extern.EitherType<Int, Bool> = false):Bool;
  /**
    
     Register an item.
    
     Registers the item if no item of that name already exists.
    
     @since 2.1.0
     @since 2.6.0 Moved from `WP_Scripts`.
    
     @param string           $handle Name of the item. Should be unique.
     @param string|bool      $src    Full URL of the item, or path of the item relative to the WordPress root directory.
                                     If source is set to false, item is an alias of other items it depends on.
     @param string[]         $deps   Optional. An array of registered item handles this item depends on. Default empty array.
     @param string|bool|null $ver    Optional. String specifying item version number, if it has one, which is added to the URL
                                     as a query string for cache busting purposes. If version is set to false, a version
                                     number is automatically added equal to current installed WordPress version.
                                     If set to null, no version is added.
     @param mixed            $args   Optional. Custom property of the item. NOT the class property $args. Examples: $media, $in_footer.
     @return bool Whether the item has been registered. True on success, false on failure.
    
  **/
  @:native("add") public function add(handle:String, src:haxe.extern.EitherType<String, Bool>, ?deps:php.NativeIndexedArray<String>, ver:haxe.extern.EitherType<String, Bool> = false, args:Dynamic = null):Bool;
  /**
    
     Add extra item data.
    
     Adds data to a registered item.
    
     @since 2.6.0
    
     @param string $handle Name of the item. Should be unique.
     @param string $key    The data key.
     @param mixed  $value  The data value.
     @return bool True on success, false on failure.
    
  **/
  @:native("add_data") public function addData(handle:String, key:String, value:Dynamic):Bool;
  /**
    
     Get extra item data.
    
     Gets data associated with a registered item.
    
     @since 3.3.0
    
     @param string $handle Name of the item. Should be unique.
     @param string $key    The data key.
     @return mixed Extra item data (string), false otherwise.
    
  **/
  @:native("get_data") public function getData(handle:String, key:String):Dynamic;
  /**
    
     Un-register an item or items.
    
     @since 2.1.0
     @since 2.6.0 Moved from `WP_Scripts`.
    
     @param mixed $handles Item handle and argument (string) or item handles and arguments (array of strings).
     @return void
    
  **/
  @:native("remove") public function remove(handles:Dynamic):Void;
  /**
    
     Queue an item or items.
    
     Decodes handles and arguments, then queues handles and stores
     arguments in the class property $args. For example in extending
     classes, $args is appended to the item url as a query string.
     Note $args is NOT the $args property of items in the $registered array.
    
     @since 2.1.0
     @since 2.6.0 Moved from `WP_Scripts`.
    
     @param mixed $handles Item handle and argument (string) or item handles and arguments (array of strings).
    
  **/
  @:native("enqueue") public function enqueue(handles:Dynamic):Void;
  /**
    
     Dequeue an item or items.
    
     Decodes handles and arguments, then dequeues handles
     and removes arguments from the class property $args.
    
     @since 2.1.0
     @since 2.6.0 Moved from `WP_Scripts`.
    
     @param mixed $handles Item handle and argument (string) or item handles and arguments (array of strings).
    
  **/
  @:native("dequeue") public function dequeue(handles:Dynamic):Void;
  /**
    
     Query list for an item.
    
     @since 2.1.0
     @since 2.6.0 Moved from `WP_Scripts`.
    
     @param string $handle Name of the item. Should be unique.
     @param string $list   Property name of list array.
     @return bool|_WP_Dependency Found, or object Item data.
    
  **/
  @:native("query") public function query(handle:String, list:String = 'registered'):haxe.extern.EitherType<Bool, _WP_Dependency>;
  /**
    
     Set item group, unless already in a lower group.
    
     @since 2.8.0
    
     @param string $handle    Name of the item. Should be unique.
     @param bool   $recursion Internal flag that calling function was called recursively.
     @param mixed  $group     Group level.
     @return bool Not already in the group or a lower group
    
  **/
  @:native("set_group") public function setGroup(handle:String, recursion:Bool, group:Dynamic):Bool;
}
