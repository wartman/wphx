package wp.extern;

extern class BookmarkApi implements wp.util.ApiFunctions {
  /**
    
     Retrieve Bookmark data
    
     @since 2.1.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int|stdClass $bookmark
     @param string $output Optional. The required return type. One of OBJECT, ARRAY_A, or ARRAY_N, which correspond to
                           an stdClass object, an associative array, or a numeric array, respectively. Default OBJECT.
     @param string $filter Optional, default is 'raw'.
     @return array|object|null Type returned depends on $output value.
    
  **/
  public function get_bookmark(bookmark:haxe.extern.EitherType<Int, Dynamic>, ?output:String, filter:String = 'raw'):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Dynamic>;
  /**
    
     Retrieve single bookmark data item or field.
    
     @since 2.3.0
    
     @param string $field The name of the data field to return
     @param int $bookmark The bookmark ID to get field
     @param string $context Optional. The context of how the field will be used.
     @return string|WP_Error
    
  **/
  public function get_bookmark_field(field:String, bookmark:Int, context:String = 'display'):haxe.extern.EitherType<String, wp.extern.Error>;
  /**
    
     Retrieves the list of bookmarks
    
     Attempts to retrieve from the cache first based on MD5 hash of arguments. If
     that fails, then the query will be built from the arguments and executed. The
     results will be stored to the cache.
    
     @since 2.1.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string|array $args {
         Optional. String or array of arguments to retrieve bookmarks.
    
         @type string   $orderby        How to order the links by. Accepts post fields. Default 'name'.
         @type string   $order          Whether to order bookmarks in ascending or descending order.
                                        Accepts 'ASC' (ascending) or 'DESC' (descending). Default 'ASC'.
         @type int      $limit          Amount of bookmarks to display. Accepts 1+ or -1 for all.
                                        Default -1.
         @type string   $category       Comma-separated list of category ids to include links from.
                                        Default empty.
         @type string   $category_name  Category to retrieve links for by name. Default empty.
         @type int|bool $hide_invisible Whether to show or hide links marked as 'invisible'. Accepts
                                        1|true or 0|false. Default 1|true.
         @type int|bool $show_updated   Whether to display the time the bookmark was last updated.
                                        Accepts 1|true or 0|false. Default 0|false.
         @type string   $include        Comma-separated list of bookmark IDs to include. Default empty.
         @type string   $exclude        Comma-separated list of bookmark IDs to exclude. Default empty.
     }
     @return array List of bookmark row objects.
    
  **/
  public function get_bookmarks(args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):php.NativeArray;
  /**
    
     Sanitizes all bookmark fields
    
     @since 2.3.0
    
     @param stdClass|array $bookmark Bookmark row
     @param string $context Optional, default is 'display'. How to filter the
          fields
     @return stdClass|array Same type as $bookmark but with fields sanitized.
    
  **/
  public function sanitize_bookmark(bookmark:haxe.extern.EitherType<Dynamic, php.NativeStructArray<Dynamic>>, context:String = 'display'):haxe.extern.EitherType<Dynamic, php.NativeStructArray<Dynamic>>;
  /**
    
     Sanitizes a bookmark field.
    
     Sanitizes the bookmark fields based on what the field name is. If the field
     has a strict value set, then it will be tested for that, else a more generic
     filtering is applied. After the more strict filter is applied, if the `$context`
     is 'raw' then the value is immediately return.
    
     Hooks exist for the more generic cases. With the 'edit' context, the {@see 'edit_$field'}
     filter will be called and passed the `$value` and `$bookmark_id` respectively.
    
     With the 'db' context, the {@see 'pre_$field'} filter is called and passed the value.
     The 'display' context is the final context and has the `$field` has the filter name
     and is passed the `$value`, `$bookmark_id`, and `$context`, respectively.
    
     @since 2.3.0
    
     @param string $field       The bookmark field.
     @param mixed  $value       The bookmark field value.
     @param int    $bookmark_id Bookmark ID.
     @param string $context     How to filter the field value. Accepts 'raw', 'edit', 'attribute',
                                'js', 'db', or 'display'
     @return mixed The filtered value.
    
  **/
  public function sanitize_bookmark_field(field:String, value:Dynamic, bookmark_id:Int, context:String):Dynamic;
  /**
    
     Deletes the bookmark cache.
    
     @since 2.7.0
    
     @param int $bookmark_id Bookmark ID.
    
  **/
  public function clean_bookmark_cache(bookmark_id:Int):Void;
}
