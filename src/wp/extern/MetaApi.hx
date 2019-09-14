package wp.extern;

extern class MetaApi implements wp.util.ApiFunctions {
  /**
    
     Add metadata for the specified object.
    
     @since 2.9.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $meta_type  Type of object metadata is for (e.g., comment, post, term, or user).
     @param int    $object_id  ID of the object metadata is for
     @param string $meta_key   Metadata key
     @param mixed  $meta_value Metadata value. Must be serializable if non-scalar.
     @param bool   $unique     Optional, default is false.
                               Whether the specified metadata key should be unique for the object.
                               If true, and the object already has a value for the specified metadata key,
                               no change will be made.
     @return int|false The meta ID on success, false on failure.
    
  **/
  public function add_metadata(meta_type:String, object_id:Int, meta_key:String, meta_value:Dynamic, unique:Bool = false):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Update metadata for the specified object. If no value already exists for the specified object
     ID and metadata key, the metadata will be added.
    
     @since 2.9.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $meta_type  Type of object metadata is for (e.g., comment, post, term, or user).
     @param int    $object_id  ID of the object metadata is for
     @param string $meta_key   Metadata key
     @param mixed  $meta_value Metadata value. Must be serializable if non-scalar.
     @param mixed  $prev_value Optional. If specified, only update existing metadata entries with
                               the specified value. Otherwise, update all entries.
     @return int|bool The new meta field ID if a field with the given key didn't exist and was
                      therefore added, true on successful update, false on failure.
    
  **/
  public function update_metadata(meta_type:String, object_id:Int, meta_key:String, meta_value:Dynamic, prev_value:Dynamic = ''):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Delete metadata for the specified object.
    
     @since 2.9.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $meta_type  Type of object metadata is for (e.g., comment, post, term, or user).
     @param int    $object_id  ID of the object metadata is for
     @param string $meta_key   Metadata key
     @param mixed  $meta_value Optional. Metadata value. Must be serializable if non-scalar. If specified, only delete
                               metadata entries with this value. Otherwise, delete all entries with the specified meta_key.
                               Pass `null`, `false`, or an empty string to skip this check. (For backward compatibility,
                               it is not possible to pass an empty string to delete those entries with an empty string
                               for a value.)
     @param bool   $delete_all Optional, default is false. If true, delete matching metadata entries for all objects,
                               ignoring the specified object_id. Otherwise, only delete matching metadata entries for
                               the specified object_id.
     @return bool True on successful delete, false on failure.
    
  **/
  public function delete_metadata(meta_type:String, object_id:Int, meta_key:String, meta_value:Dynamic = '', delete_all:Bool = false):Bool;
  /**
    
     Retrieve metadata for the specified object.
    
     @since 2.9.0
    
     @param string $meta_type Type of object metadata is for (e.g., comment, post, term, or user).
     @param int    $object_id ID of the object metadata is for
     @param string $meta_key  Optional. Metadata key. If not specified, retrieve all metadata for
                              the specified object.
     @param bool   $single    Optional, default is false.
                              If true, return only the first value of the specified meta_key.
                              This parameter has no effect if meta_key is not specified.
     @return mixed Single metadata value, or array of values
    
  **/
  public function get_metadata(meta_type:String, object_id:Int, meta_key:String = '', single:Bool = false):Dynamic;
  /**
    
     Determine if a meta key is set for a given object
    
     @since 3.3.0
    
     @param string $meta_type Type of object metadata is for (e.g., comment, post, term, or user).
     @param int    $object_id ID of the object metadata is for
     @param string $meta_key  Metadata key.
     @return bool True of the key is set, false if not.
    
  **/
  public function metadata_exists(meta_type:String, object_id:Int, meta_key:String):Bool;
  /**
    
     Get meta data by meta ID
    
     @since 3.3.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $meta_type Type of object metadata is for (e.g., comment, post, term, or user).
     @param int    $meta_id   ID for a specific meta row
     @return object|false Meta object or false.
    
  **/
  public function get_metadata_by_mid(meta_type:String, meta_id:Int):haxe.extern.EitherType<Dynamic, Bool>;
  /**
    
     Update meta data by meta ID
    
     @since 3.3.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $meta_type  Type of object metadata is for (e.g., comment, post, term, or user).
     @param int    $meta_id    ID for a specific meta row
     @param string $meta_value Metadata value
     @param string $meta_key   Optional, you can provide a meta key to update it
     @return bool True on successful update, false on failure.
    
  **/
  public function update_metadata_by_mid(meta_type:String, meta_id:Int, meta_value:String, meta_key:String = cast false):Bool;
  /**
    
     Delete meta data by meta ID
    
     @since 3.3.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $meta_type Type of object metadata is for (e.g., comment, post, term, or user).
     @param int    $meta_id   ID for a specific meta row
     @return bool True on successful delete, false on failure.
    
  **/
  public function delete_metadata_by_mid(meta_type:String, meta_id:Int):Bool;
  /**
    
     Update the metadata cache for the specified objects.
    
     @since 2.9.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string    $meta_type  Type of object metadata is for (e.g., comment, post, term, or user).
     @param int|array $object_ids Array or comma delimited list of object IDs to update cache for
     @return array|false Metadata cache for the specified objects, or false on failure.
    
  **/
  public function update_meta_cache(meta_type:String, object_ids:haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Retrieves the queue for lazy-loading metadata.
    
     @since 4.5.0
    
     @return WP_Metadata_Lazyloader $lazyloader Metadata lazyloader queue.
    
  **/
  public function wp_metadata_lazyloader():wp.extern.MetadataLazyloader;
  /**
    
     Given a meta query, generates SQL clauses to be appended to a main query.
    
     @since 3.2.0
    
     @see WP_Meta_Query
    
     @param array $meta_query         A meta query.
     @param string $type              Type of meta.
     @param string $primary_table     Primary database table name.
     @param string $primary_id_column Primary ID column name.
     @param object $context           Optional. The main query object
     @return array Associative array of `JOIN` and `WHERE` SQL.
    
  **/
  public function get_meta_sql(meta_query:php.NativeStructArray<Dynamic>, type:String, primary_table:String, primary_id_column:String, context:Dynamic = null):php.NativeArray;
  /**
    
     Retrieve the name of the metadata table for the specified object type.
    
     @since 2.9.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $type Type of object to get metadata table for (e.g., comment, post, term, or user).
     @return string|false Metadata table name, or false if no metadata table exists
    
  **/
  public function _get_meta_table(type:String):haxe.extern.EitherType<String, Bool>;
  /**
    
     Determines whether a meta key is considered protected.
    
     @since 3.1.3
    
     @param string      $meta_key  Meta key.
     @param string|null $meta_type Optional. Type of object metadata is for (e.g., comment, post, term, or user).
     @return bool Whether the meta key is considered protected.
    
  **/
  public function is_protected_meta(meta_key:String, meta_type:String = null):Bool;
  /**
    
     Sanitize meta value.
    
     @since 3.1.3
     @since 4.9.8 The `$object_subtype` parameter was added.
    
     @param string $meta_key       Meta key.
     @param mixed  $meta_value     Meta value to sanitize.
     @param string $object_type    Type of object the meta is registered to.
     @param string $object_subtype Optional. The subtype of the object type.
    
     @return mixed Sanitized $meta_value.
    
  **/
  public function sanitize_meta(meta_key:String, meta_value:Dynamic, object_type:String, object_subtype:String = ''):Dynamic;
  /**
    
     Registers a meta key.
    
     It is recommended to register meta keys for a specific combination of object type and object subtype. If passing
     an object subtype is omitted, the meta key will be registered for the entire object type, however it can be partly
     overridden in case a more specific meta key of the same name exists for the same object type and a subtype.
    
     If an object type does not support any subtypes, such as users or comments, you should commonly call this function
     without passing a subtype.
    
     @since 3.3.0
     @since 4.6.0 {@link https://core.trac.wordpress.org/ticket/35658 Modified
                  to support an array of data to attach to registered meta keys}. Previous arguments for
                  `$sanitize_callback` and `$auth_callback` have been folded into this array.
     @since 4.9.8 The `$object_subtype` argument was added to the arguments array.
    
     @param string $object_type    Type of object this meta is registered to.
     @param string $meta_key       Meta key to register.
     @param array  $args {
         Data used to describe the meta key when registered.
    
         @type string $object_subtype    A subtype; e.g. if the object type is "post", the post type. If left empty,
                                         the meta key will be registered on the entire object type. Default empty.
         @type string $type              The type of data associated with this meta key.
                                         Valid values are 'string', 'boolean', 'integer', and 'number'.
         @type string $description       A description of the data attached to this meta key.
         @type bool   $single            Whether the meta key has one value per object, or an array of values per object.
         @type string $sanitize_callback A function or method to call when sanitizing `$meta_key` data.
         @type string $auth_callback     Optional. A function or method to call when performing edit_post_meta, add_post_meta, and delete_post_meta capability checks.
         @type bool   $show_in_rest      Whether data associated with this meta key can be considered public.
     }
     @param string|array $deprecated Deprecated. Use `$args` instead.
    
     @return bool True if the meta key was successfully registered in the global array, false if not.
                           Registering a meta key with distinct sanitize and auth callbacks will fire those
                           callbacks, but will not add to the global registry.
    
  **/
  public function register_meta(object_type:String, meta_key:String, args:php.NativeStructArray<Dynamic>, deprecated:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = null):Bool;
  /**
    
     Checks if a meta key is registered.
    
     @since 4.6.0
     @since 4.9.8 The `$object_subtype` parameter was added.
    
     @param string $object_type    The type of object.
     @param string $meta_key       The meta key.
     @param string $object_subtype Optional. The subtype of the object type.
    
     @return bool True if the meta key is registered to the object type and, if provided,
                  the object subtype. False if not.
    
  **/
  public function registered_meta_key_exists(object_type:String, meta_key:String, object_subtype:String = ''):Bool;
  /**
    
     Unregisters a meta key from the list of registered keys.
    
     @since 4.6.0
     @since 4.9.8 The `$object_subtype` parameter was added.
    
     @param string $object_type    The type of object.
     @param string $meta_key       The meta key.
     @param string $object_subtype Optional. The subtype of the object type.
     @return bool True if successful. False if the meta key was not registered.
    
  **/
  public function unregister_meta_key(object_type:String, meta_key:String, object_subtype:String = ''):Bool;
  /**
    
     Retrieves a list of registered meta keys for an object type.
    
     @since 4.6.0
     @since 4.9.8 The `$object_subtype` parameter was added.
    
     @param string $object_type    The type of object. Post, comment, user, term.
     @param string $object_subtype Optional. The subtype of the object type.
     @return array List of registered meta keys.
    
  **/
  public function get_registered_meta_keys(object_type:String, object_subtype:String = ''):php.NativeArray;
  /**
    
     Retrieves registered metadata for a specified object.
    
     The results include both meta that is registered specifically for the
     object's subtype and meta that is registered for the entire object type.
    
     @since 4.6.0
    
     @param string $object_type Type of object to request metadata for. (e.g. comment, post, term, user)
     @param int    $object_id   ID of the object the metadata is for.
     @param string $meta_key    Optional. Registered metadata key. If not specified, retrieve all registered
                                metadata for the specified object.
     @return mixed A single value or array of values for a key if specified. An array of all registered keys
                   and values for an object ID if not. False if a given $meta_key is not registered.
    
  **/
  public function get_registered_metadata(object_type:String, object_id:Int, meta_key:String = ''):Dynamic;
  /**
    
     Filter out `register_meta()` args based on a whitelist.
     `register_meta()` args may change over time, so requiring the whitelist
     to be explicitly turned off is a warranty seal of sorts.
    
     @access private
     @since 4.6.0
    
     @param array $args         Arguments from `register_meta()`.
     @param array $default_args Default arguments for `register_meta()`.
    
     @return array Filtered arguments.
    
  **/
  public function _wp_register_meta_args_whitelist(args:php.NativeStructArray<Dynamic>, default_args:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Returns the object subtype for a given object ID of a specific type.
    
     @since 4.9.8
    
     @param string $object_type Type of object to request metadata for. (e.g. comment, post, term, user)
     @param int    $object_id   ID of the object to retrieve its subtype.
     @return string The object subtype or an empty string if unspecified subtype.
    
  **/
  public function get_object_subtype(object_type:String, object_id:Int):String;
}
