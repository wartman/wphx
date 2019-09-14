package wp.extern;

@:native("WP_Metadata_Lazyloader")
extern class MetadataLazyloader {
  /**
    
     Constructor.
    
     @since 4.5.0
    
  **/
  public function new():Void;
  /**
    
     Adds objects to the metadata lazy-load queue.
    
     @since 4.5.0
    
     @param string $object_type Type of object whose meta is to be lazy-loaded. Accepts 'term' or 'comment'.
     @param array  $object_ids  Array of object IDs.
     @return bool|WP_Error True on success, WP_Error on failure.
    
  **/
  @:native("queue_objects") public function queueObjects(object_type:String, object_ids:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Resets lazy-load queue for a given object type.
    
     @since 4.5.0
    
     @param string $object_type Object type. Accepts 'comment' or 'term'.
     @return bool|WP_Error True on success, WP_Error on failure.
    
  **/
  @:native("reset_queue") public function resetQueue(object_type:String):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Lazy-loads term meta for queued terms.
    
     This method is public so that it can be used as a filter callback. As a rule, there
     is no need to invoke it directly.
    
     @since 4.5.0
    
     @param mixed $check The `$check` param passed from the 'get_term_metadata' hook.
     @return mixed In order not to short-circuit `get_metadata()`. Generally, this is `null`, but it could be
                   another value if filtered by a plugin.
    
  **/
  @:native("lazyload_term_meta") public function lazyloadTermMeta(check:Dynamic):Dynamic;
  /**
    
     Lazy-loads comment meta for queued comments.
    
     This method is public so that it can be used as a filter callback. As a rule, there is no need to invoke it
     directly, from either inside or outside the `WP_Query` object.
    
     @since 4.5.0
    
     @param mixed $check The `$check` param passed from the {@see 'get_comment_metadata'} hook.
     @return mixed The original value of `$check`, so as not to short-circuit `get_comment_metadata()`.
    
  **/
  @:native("lazyload_comment_meta") public function lazyloadCommentMeta(check:Dynamic):Dynamic;
}
