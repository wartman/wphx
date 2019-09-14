package wp.extern;

@:native("WP_User_Query")
extern class UserQuery {
  /**
    
     Query vars, after parsing
    
     @since 3.5.0
     @var array
    
  **/
  @:native("query_vars") public var queryVars:php.NativeStructArray<Dynamic>;
  /**
    
     Metadata query container.
    
     @since 4.2.0
     @var WP_Meta_Query
    
  **/
  @:native("meta_query") public var metaQuery:wp.extern.MetaQuery;
  /**
    
     The SQL query used to fetch matching users.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("request") public var request:String;
  /**
    
     PHP5 constructor.
    
     @since 3.1.0
    
     @param null|string|array $query Optional. The query variables.
    
  **/
  public function new(query:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = null):Void;
  /**
    
     Fills in missing query variables with default values.
    
     @since 4.4.0
    
     @param array $args Query vars, as passed to `WP_User_Query`.
     @return array Complete query variables with undefined ones filled in with defaults.
    
  **/
  @:native("fill_query_vars") public static function fillQueryVars(args:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Prepare the query variables.
    
     @since 3.1.0
     @since 4.1.0 Added the ability to order by the `include` value.
     @since 4.2.0 Added 'meta_value_num' support for `$orderby` parameter. Added multi-dimensional array syntax
                  for `$orderby` parameter.
     @since 4.3.0 Added 'has_published_posts' parameter.
     @since 4.4.0 Added 'paged', 'role__in', and 'role__not_in' parameters. The 'role' parameter was updated to
                  permit an array or comma-separated list of values. The 'number' parameter was updated to support
                  querying for all users with using -1.
     @since 4.7.0 Added 'nicename', 'nicename__in', 'nicename__not_in', 'login', 'login__in',
                  and 'login__not_in' parameters.
    
     @global wpdb $wpdb WordPress database abstraction object.
     @global int  $blog_id
    
     @param string|array $query {
         Optional. Array or string of Query parameters.
    
         @type int          $blog_id             The site ID. Default is the current site.
         @type string|array $role                An array or a comma-separated list of role names that users must match
                                                 to be included in results. Note that this is an inclusive list: users
                                                 must match *each* role. Default empty.
         @type array        $role__in            An array of role names. Matched users must have at least one of these
                                                 roles. Default empty array.
         @type array        $role__not_in        An array of role names to exclude. Users matching one or more of these
                                                 roles will not be included in results. Default empty array.
         @type string       $meta_key            User meta key. Default empty.
         @type string       $meta_value          User meta value. Default empty.
         @type string       $meta_compare        Comparison operator to test the `$meta_value`. Accepts '=', '!=',
                                                 '>', '>=', '<', '<=', 'LIKE', 'NOT LIKE', 'IN', 'NOT IN',
                                                 'BETWEEN', 'NOT BETWEEN', 'EXISTS', 'NOT EXISTS', 'REGEXP',
                                                 'NOT REGEXP', or 'RLIKE'. Default '='.
         @type array        $include             An array of user IDs to include. Default empty array.
         @type array        $exclude             An array of user IDs to exclude. Default empty array.
         @type string       $search              Search keyword. Searches for possible string matches on columns.
                                                 When `$search_columns` is left empty, it tries to determine which
                                                 column to search in based on search string. Default empty.
         @type array        $search_columns      Array of column names to be searched. Accepts 'ID', 'login',
                                                 'nicename', 'email', 'url'. Default empty array.
         @type string|array $orderby             Field(s) to sort the retrieved users by. May be a single value,
                                                 an array of values, or a multi-dimensional array with fields as
                                                 keys and orders ('ASC' or 'DESC') as values. Accepted values are
                                                 'ID', 'display_name' (or 'name'), 'include', 'user_login'
                                                 (or 'login'), 'login__in', 'user_nicename' (or 'nicename'),
                                                 'nicename__in', 'user_email (or 'email'), 'user_url' (or 'url'),
                                                 'user_registered' (or 'registered'), 'post_count', 'meta_value',
                                                 'meta_value_num', the value of `$meta_key`, or an array key of
                                                 `$meta_query`. To use 'meta_value' or 'meta_value_num', `$meta_key`
                                                 must be also be defined. Default 'user_login'.
         @type string       $order               Designates ascending or descending order of users. Order values
                                                 passed as part of an `$orderby` array take precedence over this
                                                 parameter. Accepts 'ASC', 'DESC'. Default 'ASC'.
         @type int          $offset              Number of users to offset in retrieved results. Can be used in
                                                 conjunction with pagination. Default 0.
         @type int          $number              Number of users to limit the query for. Can be used in
                                                 conjunction with pagination. Value -1 (all) is supported, but
                                                 should be used with caution on larger sites.
                                                 Default empty (all users).
         @type int          $paged               When used with number, defines the page of results to return.
                                                 Default 1.
         @type bool         $count_total         Whether to count the total number of users found. If pagination
                                                 is not needed, setting this to false can improve performance.
                                                 Default true.
         @type string|array $fields              Which fields to return. Single or all fields (string), or array
                                                 of fields. Accepts 'ID', 'display_name', 'user_login',
                                                 'user_nicename', 'user_email', 'user_url', 'user_registered'.
                                                 Use 'all' for all fields and 'all_with_meta' to include
                                                 meta fields. Default 'all'.
         @type string       $who                 Type of users to query. Accepts 'authors'.
                                                 Default empty (all users).
         @type bool|array   $has_published_posts Pass an array of post types to filter results to users who have
                                                 published posts in those post types. `true` is an alias for all
                                                 public post types.
         @type string       $nicename            The user nicename. Default empty.
         @type array        $nicename__in        An array of nicenames to include. Users matching one of these
                                                 nicenames will be included in results. Default empty array.
         @type array        $nicename__not_in    An array of nicenames to exclude. Users matching one of these
                                                 nicenames will not be included in results. Default empty array.
         @type string       $login               The user login. Default empty.
         @type array        $login__in           An array of logins to include. Users matching one of these
                                                 logins will be included in results. Default empty array.
         @type array        $login__not_in       An array of logins to exclude. Users matching one of these
                                                 logins will not be included in results. Default empty array.
     }
    
  **/
  @:native("prepare_query") public function prepareQuery(?query:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):Void;
  /**
    
     Execute the query, with the current variables.
    
     @since 3.1.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
  **/
  @:native("query") public function query():Void;
  /**
    
     Retrieve query variable.
    
     @since 3.5.0
    
     @param string $query_var Query variable key.
     @return mixed
    
  **/
  @:native("get") public function get(query_var:String):Dynamic;
  /**
    
     Set query variable.
    
     @since 3.5.0
    
     @param string $query_var Query variable key.
     @param mixed $value Query variable value.
    
  **/
  @:native("set") public function set(query_var:String, value:Dynamic):Void;
  /**
    
     Return the list of users.
    
     @since 3.1.0
    
     @return array Array of results.
    
  **/
  @:native("get_results") public function getResults():php.NativeArray;
  /**
    
     Return the total number of users for the current query.
    
     @since 3.1.0
    
     @return int Number of total users.
    
  **/
  @:native("get_total") public function getTotal():Int;
  /**
    
     Make private properties readable for backward compatibility.
    
     @since 4.0.0
    
     @param string $name Property to get.
     @return mixed Property.
    
  **/
  @:native("__get") public function __get(name:String):Dynamic;
  /**
    
     Make private properties settable for backward compatibility.
    
     @since 4.0.0
    
     @param string $name  Property to check if set.
     @param mixed  $value Property value.
     @return mixed Newly-set property.
    
  **/
  @:native("__set") public function __set(name:String, value:Dynamic):Dynamic;
  /**
    
     Make private properties checkable for backward compatibility.
    
     @since 4.0.0
    
     @param string $name Property to check if set.
     @return bool Whether the property is set.
    
  **/
  @:native("__isset") public function __isset(name:String):Bool;
  /**
    
     Make private properties un-settable for backward compatibility.
    
     @since 4.0.0
    
     @param string $name Property to unset.
    
  **/
  @:native("__unset") public function __unset(name:String):Void;
  /**
    
     Make private/protected methods readable for backward compatibility.
    
     @since 4.0.0
    
     @param string   $name      Method to call.
     @param array    $arguments Arguments to pass when calling.
     @return mixed Return value of the callback, false otherwise.
    
  **/
  @:native("__call") public function __call(name:String, arguments:php.NativeStructArray<Dynamic>):Dynamic;
}
