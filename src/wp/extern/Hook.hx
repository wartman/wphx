package wp.extern;

@:native("WP_Hook")
extern class Hook {
  /**
    
     Hook callbacks.
    
     @since 4.7.0
     @var array
    
  **/
  @:native("callbacks") public var callbacks:php.NativeStructArray<Dynamic>;
  /**
    
     Hooks a function or method to a specific filter action.
    
     @since 4.7.0
    
     @param string   $tag             The name of the filter to hook the $function_to_add callback to.
     @param callable $function_to_add The callback to be run when the filter is applied.
     @param int      $priority        The order in which the functions associated with a
                                      particular action are executed. Lower numbers correspond with
                                      earlier execution, and functions with the same priority are executed
                                      in the order in which they were added to the action.
     @param int      $accepted_args   The number of arguments the function accepts.
    
  **/
  @:native("add_filter") public function addFilter(tag:String, function_to_add:Dynamic, priority:Int, accepted_args:Int):Void;
  /**
    
     Unhooks a function or method from a specific filter action.
    
     @since 4.7.0
    
     @param string   $tag                The filter hook to which the function to be removed is hooked. Used
                                         for building the callback ID when SPL is not available.
     @param callable $function_to_remove The callback to be removed from running when the filter is applied.
     @param int      $priority           The exact priority used when adding the original filter callback.
     @return bool Whether the callback existed before it was removed.
    
  **/
  @:native("remove_filter") public function removeFilter(tag:String, function_to_remove:Dynamic, priority:Int):Bool;
  /**
    
     Checks if a specific action has been registered for this hook.
    
     @since 4.7.0
    
     @param string        $tag               Optional. The name of the filter hook. Used for building
                                             the callback ID when SPL is not available. Default empty.
     @param callable|bool $function_to_check Optional. The callback to check for. Default false.
     @return bool|int The priority of that hook is returned, or false if the function is not attached.
    
  **/
  @:native("has_filter") public function hasFilter(tag:String = '', function_to_check:haxe.extern.EitherType<Dynamic, Bool> = false):haxe.extern.EitherType<Bool, Int>;
  /**
    
     Checks if any callbacks have been registered for this hook.
    
     @since 4.7.0
    
     @return bool True if callbacks have been registered for the current hook, otherwise false.
    
  **/
  @:native("has_filters") public function hasFilters():Bool;
  /**
    
     Removes all callbacks from the current filter.
    
     @since 4.7.0
    
     @param int|bool $priority Optional. The priority number to remove. Default false.
    
  **/
  @:native("remove_all_filters") public function removeAllFilters(priority:haxe.extern.EitherType<Int, Bool> = false):Void;
  /**
    
     Calls the callback functions added to a filter hook.
    
     @since 4.7.0
    
     @param mixed $value The value to filter.
     @param array $args  Arguments to pass to callbacks.
     @return mixed The filtered value after all hooked functions are applied to it.
    
  **/
  @:native("apply_filters") public function applyFilters(value:Dynamic, args:php.NativeStructArray<Dynamic>):Dynamic;
  /**
    
     Executes the callback functions hooked on a specific action hook.
    
     @since 4.7.0
    
     @param mixed $args Arguments to pass to the hook callbacks.
    
  **/
  @:native("do_action") public function doAction(args:Dynamic):Void;
  /**
    
     Processes the functions hooked into the 'all' hook.
    
     @since 4.7.0
    
     @param array $args Arguments to pass to the hook callbacks. Passed by reference.
    
  **/
  @:native("do_all_hook") public function doAllHook(args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Return the current priority level of the currently running iteration of the hook.
    
     @since 4.7.0
    
     @return int|false If the hook is running, return the current priority level. If it isn't running, return false.
    
  **/
  @:native("current_priority") public function currentPriority():haxe.extern.EitherType<Int, Bool>;
  /**
    
     Normalizes filters set up before WordPress has initialized to WP_Hook objects.
    
     @since 4.7.0
    
     @param array $filters Filters to normalize.
     @return WP_Hook[] Array of normalized filters.
    
  **/
  @:native("build_preinitialized_hooks") public static function buildPreinitializedHooks(filters:php.NativeStructArray<Dynamic>):php.NativeIndexedArray<wp.extern.Hook>;
  /**
    
     Determines whether an offset value exists.
    
     @since 4.7.0
    
     @link https://secure.php.net/manual/en/arrayaccess.offsetexists.php
    
     @param mixed $offset An offset to check for.
     @return bool True if the offset exists, false otherwise.
    
  **/
  @:native("offsetExists") public function offsetExists(offset:Dynamic):Bool;
  /**
    
     Retrieves a value at a specified offset.
    
     @since 4.7.0
    
     @link https://secure.php.net/manual/en/arrayaccess.offsetget.php
    
     @param mixed $offset The offset to retrieve.
     @return mixed If set, the value at the specified offset, null otherwise.
    
  **/
  @:native("offsetGet") public function offsetGet(offset:Dynamic):Dynamic;
  /**
    
     Sets a value at a specified offset.
    
     @since 4.7.0
    
     @link https://secure.php.net/manual/en/arrayaccess.offsetset.php
    
     @param mixed $offset The offset to assign the value to.
     @param mixed $value The value to set.
    
  **/
  @:native("offsetSet") public function offsetSet(offset:Dynamic, value:Dynamic):Void;
  /**
    
     Unsets a specified offset.
    
     @since 4.7.0
    
     @link https://secure.php.net/manual/en/arrayaccess.offsetunset.php
    
     @param mixed $offset The offset to unset.
    
  **/
  @:native("offsetUnset") public function offsetUnset(offset:Dynamic):Void;
  /**
    
     Returns the current element.
    
     @since 4.7.0
    
     @link https://secure.php.net/manual/en/iterator.current.php
    
     @return array Of callbacks at current priority.
    
  **/
  @:native("current") public function current():php.NativeArray;
  /**
    
     Moves forward to the next element.
    
     @since 4.7.0
    
     @link https://secure.php.net/manual/en/iterator.next.php
    
     @return array Of callbacks at next priority.
    
  **/
  @:native("next") public function next():php.NativeArray;
  /**
    
     Returns the key of the current element.
    
     @since 4.7.0
    
     @link https://secure.php.net/manual/en/iterator.key.php
    
     @return mixed Returns current priority on success, or NULL on failure
    
  **/
  @:native("key") public function key():Dynamic;
  /**
    
     Checks if current position is valid.
    
     @since 4.7.0
    
     @link https://secure.php.net/manual/en/iterator.valid.php
    
     @return boolean
    
  **/
  @:native("valid") public function valid():Bool;
  /**
    
     Rewinds the Iterator to the first element.
    
     @since 4.7.0
    
     @link https://secure.php.net/manual/en/iterator.rewind.php
    
  **/
  @:native("rewind") public function rewind():Void;
}
