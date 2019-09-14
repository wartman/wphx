package wp.extern;

@:native("wpdb")
extern class wpdb {
  /**
    
     The last error during query.
    
     @since 2.5.0
     @var string
    
  **/
  @:native("last_error") public var lastError:String;
  /**
    
     Amount of queries made
    
     @since 1.2.0
     @var int
    
  **/
  @:native("num_queries") public var numQueries:Int;
  /**
    
     Count of rows returned by previous query
    
     @since 0.71
     @var int
    
  **/
  @:native("num_rows") public var numRows:Int;
  /**
    
     The ID generated for an AUTO_INCREMENT column by the previous query (usually INSERT).
    
     @since 0.71
     @var int
    
  **/
  @:native("insert_id") public var insertId:Int;
  /**
    
     WordPress table prefix
    
     You can set this to have multiple WordPress installations
     in a single database. The second reason is for possible
     security precautions.
    
     @since 2.5.0
     @var string
    
  **/
  @:native("prefix") public var prefix:String;
  /**
    
     WordPress base table prefix.
    
     @since 3.0.0
     @var string
    
  **/
  @:native("base_prefix") public var basePrefix:String;
  /**
    
     Blog ID.
    
     @since 3.0.0
     @var int
    
  **/
  @:native("blogid") public var blogid:Int;
  /**
    
     Site ID.
    
     @since 3.0.0
     @var int
    
  **/
  @:native("siteid") public var siteid:Int;
  /**
    
     WordPress Comments table
    
     @since 1.5.0
     @var string
    
  **/
  @:native("comments") public var comments:String;
  /**
    
     WordPress Comment Metadata table
    
     @since 2.9.0
     @var string
    
  **/
  @:native("commentmeta") public var commentmeta:String;
  /**
    
     WordPress Links table
    
     @since 1.5.0
     @var string
    
  **/
  @:native("links") public var links:String;
  /**
    
     WordPress Options table
    
     @since 1.5.0
     @var string
    
  **/
  @:native("options") public var options:String;
  /**
    
     WordPress Post Metadata table
    
     @since 1.5.0
     @var string
    
  **/
  @:native("postmeta") public var postmeta:String;
  /**
    
     WordPress Posts table
    
     @since 1.5.0
     @var string
    
  **/
  @:native("posts") public var posts:String;
  /**
    
     WordPress Terms table
    
     @since 2.3.0
     @var string
    
  **/
  @:native("terms") public var terms:String;
  /**
    
     WordPress Term Relationships table
    
     @since 2.3.0
     @var string
    
  **/
  @:native("term_relationships") public var termRelationships:String;
  /**
    
     WordPress Term Taxonomy table
    
     @since 2.3.0
     @var string
    
  **/
  @:native("term_taxonomy") public var termTaxonomy:String;
  /**
    
     WordPress Term Meta table.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("termmeta") public var termmeta:String;
  /**
    
     WordPress User Metadata table
    
     @since 2.3.0
     @var string
    
  **/
  @:native("usermeta") public var usermeta:String;
  /**
    
     WordPress Users table
    
     @since 1.5.0
     @var string
    
  **/
  @:native("users") public var users:String;
  /**
    
     Multisite Blogs table
    
     @since 3.0.0
     @var string
    
  **/
  @:native("blogs") public var blogs:String;
  /**
    
     Multisite Blog Metadata table
    
     @since 5.1.0
     @var string
    
  **/
  @:native("blogmeta") public var blogmeta:String;
  /**
    
     Multisite Blog Versions table
    
     @since 3.0.0
     @var string
    
  **/
  @:native("blog_versions") public var blogVersions:String;
  /**
    
     Multisite Registration Log table
    
     @since 3.0.0
     @var string
    
  **/
  @:native("registration_log") public var registrationLog:String;
  /**
    
     Multisite Signups table
    
     @since 3.0.0
     @var string
    
  **/
  @:native("signups") public var signups:String;
  /**
    
     Multisite Sites table
    
     @since 3.0.0
     @var string
    
  **/
  @:native("site") public var site:String;
  /**
    
     Multisite Sitewide Terms table
    
     @since 3.0.0
     @var string
    
  **/
  @:native("sitecategories") public var sitecategories:String;
  /**
    
     Multisite Site Metadata table
    
     @since 3.0.0
     @var string
    
  **/
  @:native("sitemeta") public var sitemeta:String;
  /**
    
     Format specifiers for DB columns. Columns not listed here default to %s. Initialized during WP load.
    
     Keys are column names, values are format types: 'ID' => '%d'
    
     @since 2.8.0
     @see wpdb::prepare()
     @see wpdb::insert()
     @see wpdb::update()
     @see wpdb::delete()
     @see wp_set_wpdb_vars()
     @var array
    
  **/
  @:native("field_types") public var fieldTypes:php.NativeStructArray<Dynamic>;
  /**
    
     Database table columns charset
    
     @since 2.2.0
     @var string
    
  **/
  @:native("charset") public var charset:String;
  /**
    
     Database table columns collate
    
     @since 2.2.0
     @var string
    
  **/
  @:native("collate") public var collate:String;
  /**
    
     A textual description of the last query/get_row/get_var call
    
     @since 3.0.0
     @var string
    
  **/
  @:native("func_call") public var funcCall:String;
  /**
    
     Whether MySQL is used as the database engine.
    
     Set in WPDB::db_connect() to true, by default. This is used when checking
     against the required MySQL version for WordPress. Normally, a replacement
     database drop-in (db.php) will skip these checks, but setting this to true
     will force the checks to occur.
    
     @since 3.3.0
     @var bool
    
  **/
  @:native("is_mysql") public var isMysql:Bool;
  /**
    
     Connects to the database server and selects a database
    
     PHP5 style constructor for compatibility with PHP5. Does
     the actual setting up of the class properties and connection
     to the database.
    
     @link https://core.trac.wordpress.org/ticket/3354
     @since 2.0.8
    
     @global string $wp_version
    
     @param string $dbuser     MySQL database user
     @param string $dbpassword MySQL database password
     @param string $dbname     MySQL database name
     @param string $dbhost     MySQL database host
    
  **/
  public function new(dbuser:String, dbpassword:String, dbname:String, dbhost:String):Void;
  /**
    
     PHP5 style destructor and will run when database object is destroyed.
    
     @see wpdb::__construct()
     @since 2.0.8
     @return true
    
  **/
  @:native("__destruct") public function __destruct():Bool;
  /**
    
     Makes private properties readable for backward compatibility.
    
     @since 3.5.0
    
     @param string $name The private member to get, and optionally process
     @return mixed The private member
    
  **/
  @:native("__get") public function __get(name:String):Dynamic;
  /**
    
     Makes private properties settable for backward compatibility.
    
     @since 3.5.0
    
     @param string $name  The private member to set
     @param mixed  $value The value to set
    
  **/
  @:native("__set") public function __set(name:String, value:Dynamic):Void;
  /**
    
     Makes private properties check-able for backward compatibility.
    
     @since 3.5.0
    
     @param string $name  The private member to check
    
     @return bool If the member is set or not
    
  **/
  @:native("__isset") public function __isset(name:String):Bool;
  /**
    
     Makes private properties un-settable for backward compatibility.
    
     @since 3.5.0
    
     @param string $name  The private member to unset
    
  **/
  @:native("__unset") public function __unset(name:String):Void;
  /**
    
     Set $this->charset and $this->collate
    
     @since 3.1.0
    
  **/
  @:native("init_charset") public function initCharset():Void;
  /**
    
     Determines the best charset and collation to use given a charset and collation.
    
     For example, when able, utf8mb4 should be used instead of utf8.
    
     @since 4.6.0
    
     @param string $charset The character set to check.
     @param string $collate The collation to check.
     @return array The most appropriate character set and collation to use.
    
  **/
  @:native("determine_charset") public function determineCharset(charset:String, collate:String):php.NativeArray;
  /**
    
     Sets the connection's character set.
    
     @since 3.1.0
    
     @param resource $dbh     The resource given by mysql_connect
     @param string   $charset Optional. The character set. Default null.
     @param string   $collate Optional. The collation. Default null.
    
  **/
  @:native("set_charset") public function setCharset(dbh:Dynamic, charset:String = null, collate:String = null):Void;
  /**
    
     Change the current SQL mode, and ensure its WordPress compatibility.
    
     If no modes are passed, it will ensure the current MySQL server
     modes are compatible.
    
     @since 3.9.0
    
     @param array $modes Optional. A list of SQL modes to set.
    
  **/
  @:native("set_sql_mode") public function setSqlMode(?modes:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Sets the table prefix for the WordPress tables.
    
     @since 2.5.0
    
     @param string $prefix          Alphanumeric name for the new prefix.
     @param bool   $set_table_names Optional. Whether the table names, e.g. wpdb::$posts, should be updated or not.
     @return string|WP_Error Old prefix or WP_Error on error
    
  **/
  @:native("set_prefix") public function setPrefix(prefix:String, set_table_names:Bool = true):haxe.extern.EitherType<String, wp.extern.Error>;
  /**
    
     Sets blog id.
    
     @since 3.0.0
    
     @param int $blog_id
     @param int $network_id Optional.
     @return int previous blog id
    
  **/
  @:native("set_blog_id") public function setBlogId(blog_id:Int, network_id:Int = 0):Int;
  /**
    
     Gets blog prefix.
    
     @since 3.0.0
     @param int $blog_id Optional.
     @return string Blog prefix.
    
  **/
  @:native("get_blog_prefix") public function getBlogPrefix(blog_id:Int = null):String;
  /**
    
     Returns an array of WordPress tables.
    
     Also allows for the CUSTOM_USER_TABLE and CUSTOM_USER_META_TABLE to
     override the WordPress users and usermeta tables that would otherwise
     be determined by the prefix.
    
     The scope argument can take one of the following:
    
     'all' - returns 'all' and 'global' tables. No old tables are returned.
     'blog' - returns the blog-level tables for the queried blog.
     'global' - returns the global tables for the installation, returning multisite tables only if running multisite.
     'ms_global' - returns the multisite global tables, regardless if current installation is multisite.
     'old' - returns tables which are deprecated.
    
     @since 3.0.0
     @uses wpdb::$tables
     @uses wpdb::$old_tables
     @uses wpdb::$global_tables
     @uses wpdb::$ms_global_tables
    
     @param string $scope   Optional. Can be all, global, ms_global, blog, or old tables. Defaults to all.
     @param bool   $prefix  Optional. Whether to include table prefixes. Default true. If blog
                            prefix is requested, then the custom users and usermeta tables will be mapped.
     @param int    $blog_id Optional. The blog_id to prefix. Defaults to wpdb::$blogid. Used only when prefix is requested.
     @return array Table names. When a prefix is requested, the key is the unprefixed table name.
    
  **/
  @:native("tables") public function tables(scope:String = 'all', prefix:Bool = true, blog_id:Int = 0):php.NativeArray;
  /**
    
     Selects a database using the current database connection.
    
     The database name will be changed based on the current database
     connection. On failure, the execution will bail and display an DB error.
    
     @since 0.71
    
     @param string        $db  MySQL database name
     @param resource|null $dbh Optional link identifier.
    
  **/
  @:native("select") public function select(db:String, dbh:Dynamic = null):Void;
  /**
    
     Do not use, deprecated.
    
     Use esc_sql() or wpdb::prepare() instead.
    
     @since 2.8.0
     @deprecated 3.6.0 Use wpdb::prepare()
     @see wpdb::prepare
     @see esc_sql()
    
     @param string $string
     @return string
    
  **/
  @:native("_weak_escape") public function _weakEscape(string:String):String;
  /**
    
     Real escape, using mysqli_real_escape_string() or mysql_real_escape_string()
    
     @see mysqli_real_escape_string()
     @see mysql_real_escape_string()
     @since 2.8.0
    
     @param  string $string to escape
     @return string escaped
    
  **/
  @:native("_real_escape") public function _realEscape(string:String):String;
  /**
    
     Escape data. Works on arrays.
    
     @uses wpdb::_real_escape()
     @since  2.8.0
    
     @param  string|array $data
     @return string|array escaped
    
  **/
  @:native("_escape") public function _escape(data:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>;
  /**
    
     Do not use, deprecated.
    
     Use esc_sql() or wpdb::prepare() instead.
    
     @since 0.71
     @deprecated 3.6.0 Use wpdb::prepare()
     @see wpdb::prepare()
     @see esc_sql()
    
     @param mixed $data
     @return mixed
    
  **/
  @:native("escape") public function escape(data:Dynamic):Dynamic;
  /**
    
     Escapes content by reference for insertion into the database, for security
    
     @uses wpdb::_real_escape()
    
     @since 2.3.0
    
     @param string $string to escape
    
  **/
  @:native("escape_by_ref") public function escapeByRef(string:String):Void;
  /**
    
     Prepares a SQL query for safe execution. Uses sprintf()-like syntax.
    
     The following placeholders can be used in the query string:
       %d (integer)
       %f (float)
       %s (string)
    
     All placeholders MUST be left unquoted in the query string. A corresponding argument MUST be passed for each placeholder.
    
     For compatibility with old behavior, numbered or formatted string placeholders (eg, %1$s, %5s) will not have quotes
     added by this function, so should be passed with appropriate quotes around them for your usage.
    
     Literal percentage signs (%) in the query string must be written as %%. Percentage wildcards (for example,
     to use in LIKE syntax) must be passed via a substitution argument containing the complete LIKE string, these
     cannot be inserted directly in the query string. Also see {@see wpdb::esc_like()}.
    
     Arguments may be passed as individual arguments to the method, or as a single array containing all arguments. A combination
     of the two is not supported.
    
     Examples:
         $wpdb->prepare( "SELECT * FROM `table` WHERE `column` = %s AND `field` = %d OR `other_field` LIKE %s", array( 'foo', 1337, '%bar' ) );
         $wpdb->prepare( "SELECT DATE_FORMAT(`field`, '%%c') FROM `table` WHERE `column` = %s", 'foo' );
    
     @link https://secure.php.net/sprintf Description of syntax.
     @since 2.3.0
    
     @param string      $query    Query statement with sprintf()-like placeholders
     @param array|mixed $args     The array of variables to substitute into the query's placeholders if being called with an array of arguments,
                                  or the first variable to substitute into the query's placeholders if being called with individual arguments.
     @param mixed       $args,... further variables to substitute into the query's placeholders if being called wih individual arguments.
     @return string|void Sanitized query string, if there is a query to prepare.
    
  **/
  @:native("prepare") public function prepare(query:String, args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Dynamic>, args:Dynamic):String;
  /**
    
     First half of escaping for LIKE special characters % and _ before preparing for MySQL.
    
     Use this only before wpdb::prepare() or esc_sql().  Reversing the order is very bad for security.
    
     Example Prepared Statement:
    
         $wild = '%';
         $find = 'only 43% of planets';
         $like = $wild . $wpdb->esc_like( $find ) . $wild;
         $sql  = $wpdb->prepare( "SELECT * FROM $wpdb->posts WHERE post_content LIKE %s", $like );
    
     Example Escape Chain:
    
         $sql  = esc_sql( $wpdb->esc_like( $input ) );
    
     @since 4.0.0
    
     @param string $text The raw text to be escaped. The input typed by the user should have no
                         extra or deleted slashes.
     @return string Text in the form of a LIKE phrase. The output is not SQL safe. Call $wpdb::prepare()
                    or real_escape next.
    
  **/
  @:native("esc_like") public function escLike(text:String):String;
  /**
    
     Print SQL/DB error.
    
     @since 0.71
     @global array $EZSQL_ERROR Stores error information of query and error string
    
     @param string $str The error to display
     @return false|void False if the showing of errors is disabled.
    
  **/
  @:native("print_error") public function printError(str:String = ''):Bool;
  /**
    
     Enables showing of database errors.
    
     This function should be used only to enable showing of errors.
     wpdb::hide_errors() should be used instead for hiding of errors. However,
     this function can be used to enable and disable showing of database
     errors.
    
     @since 0.71
     @see wpdb::hide_errors()
    
     @param bool $show Whether to show or hide errors
     @return bool Old value for showing errors.
    
  **/
  @:native("show_errors") public function showErrors(show:Bool = true):Bool;
  /**
    
     Disables showing of database errors.
    
     By default database errors are not shown.
    
     @since 0.71
     @see wpdb::show_errors()
    
     @return bool Whether showing of errors was active
    
  **/
  @:native("hide_errors") public function hideErrors():Bool;
  /**
    
     Whether to suppress database errors.
    
     By default database errors are suppressed, with a simple
     call to this function they can be enabled.
    
     @since 2.5.0
     @see wpdb::hide_errors()
     @param bool $suppress Optional. New value. Defaults to true.
     @return bool Old value
    
  **/
  @:native("suppress_errors") public function suppressErrors(suppress:Bool = true):Bool;
  /**
    
     Kill cached query results.
    
     @since 0.71
    
  **/
  @:native("flush") public function flush():Void;
  /**
    
     Connect to and select database.
    
     If $allow_bail is false, the lack of database connection will need
     to be handled manually.
    
     @since 3.0.0
     @since 3.9.0 $allow_bail parameter added.
    
     @param bool $allow_bail Optional. Allows the function to bail. Default true.
     @return bool True with a successful connection, false on failure.
    
  **/
  @:native("db_connect") public function dbConnect(allow_bail:Bool = true):Bool;
  /**
    
     Parse the DB_HOST setting to interpret it for mysqli_real_connect.
    
     mysqli_real_connect doesn't support the host param including a port or
     socket like mysql_connect does. This duplicates how mysql_connect detects
     a port and/or socket file.
    
     @since 4.9.0
    
     @param string $host The DB_HOST setting to parse.
     @return array|bool Array containing the host, the port, the socket and whether
                        it is an IPv6 address, in that order. If $host couldn't be parsed,
                        returns false.
    
  **/
  @:native("parse_db_host") public function parseDbHost(host:String):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Checks that the connection to the database is still up. If not, try to reconnect.
    
     If this function is unable to reconnect, it will forcibly die, or if after the
     the {@see 'template_redirect'} hook has been fired, return false instead.
    
     If $allow_bail is false, the lack of database connection will need
     to be handled manually.
    
     @since 3.9.0
    
     @param bool $allow_bail Optional. Allows the function to bail. Default true.
     @return bool|void True if the connection is up.
    
  **/
  @:native("check_connection") public function checkConnection(allow_bail:Bool = true):Bool;
  /**
    
     Perform a MySQL database query, using current database connection.
    
     More information can be found on the codex page.
    
     @since 0.71
    
     @param string $query Database query
     @return int|bool Boolean true for CREATE, ALTER, TRUNCATE and DROP queries. Number of rows
                      affected/selected for all other queries. Boolean false on error.
    
  **/
  @:native("query") public function query(query:String):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Generates and returns a placeholder escape string for use in queries returned by ::prepare().
    
     @since 4.8.3
    
     @return string String to escape placeholders.
    
  **/
  @:native("placeholder_escape") public function placeholderEscape():String;
  /**
    
     Adds a placeholder escape string, to escape anything that resembles a printf() placeholder.
    
     @since 4.8.3
    
     @param string $query The query to escape.
     @return string The query with the placeholder escape string inserted where necessary.
    
  **/
  @:native("add_placeholder_escape") public function addPlaceholderEscape(query:String):String;
  /**
    
     Removes the placeholder escape strings from a query.
    
     @since 4.8.3
    
     @param string $query The query from which the placeholder will be removed.
     @return string The query with the placeholder removed.
    
  **/
  @:native("remove_placeholder_escape") public function removePlaceholderEscape(query:String):String;
  /**
    
     Insert a row into a table.
    
         wpdb::insert( 'table', array( 'column' => 'foo', 'field' => 'bar' ) )
         wpdb::insert( 'table', array( 'column' => 'foo', 'field' => 1337 ), array( '%s', '%d' ) )
    
     @since 2.5.0
     @see wpdb::prepare()
     @see wpdb::$field_types
     @see wp_set_wpdb_vars()
    
     @param string       $table  Table name
     @param array        $data   Data to insert (in column => value pairs).
                                 Both $data columns and $data values should be "raw" (neither should be SQL escaped).
                                 Sending a null value will cause the column to be set to NULL - the corresponding format is ignored in this case.
     @param array|string $format Optional. An array of formats to be mapped to each of the value in $data.
                                 If string, that format will be used for all of the values in $data.
                                 A format is one of '%d', '%f', '%s' (integer, float, string).
                                 If omitted, all values in $data will be treated as strings unless otherwise specified in wpdb::$field_types.
     @return int|false The number of rows inserted, or false on error.
    
  **/
  @:native("insert") public function insert(table:String, data:php.NativeStructArray<Dynamic>, format:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = null):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Replace a row into a table.
    
         wpdb::replace( 'table', array( 'column' => 'foo', 'field' => 'bar' ) )
         wpdb::replace( 'table', array( 'column' => 'foo', 'field' => 1337 ), array( '%s', '%d' ) )
    
     @since 3.0.0
     @see wpdb::prepare()
     @see wpdb::$field_types
     @see wp_set_wpdb_vars()
    
     @param string       $table  Table name
     @param array        $data   Data to insert (in column => value pairs).
                                 Both $data columns and $data values should be "raw" (neither should be SQL escaped).
                                 Sending a null value will cause the column to be set to NULL - the corresponding format is ignored in this case.
     @param array|string $format Optional. An array of formats to be mapped to each of the value in $data.
                                 If string, that format will be used for all of the values in $data.
                                 A format is one of '%d', '%f', '%s' (integer, float, string).
                                 If omitted, all values in $data will be treated as strings unless otherwise specified in wpdb::$field_types.
     @return int|false The number of rows affected, or false on error.
    
  **/
  @:native("replace") public function replace(table:String, data:php.NativeStructArray<Dynamic>, format:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = null):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Helper function for insert and replace.
    
     Runs an insert or replace query based on $type argument.
    
     @since 3.0.0
     @see wpdb::prepare()
     @see wpdb::$field_types
     @see wp_set_wpdb_vars()
    
     @param string       $table  Table name
     @param array        $data   Data to insert (in column => value pairs).
                                 Both $data columns and $data values should be "raw" (neither should be SQL escaped).
                                 Sending a null value will cause the column to be set to NULL - the corresponding format is ignored in this case.
     @param array|string $format Optional. An array of formats to be mapped to each of the value in $data.
                                 If string, that format will be used for all of the values in $data.
                                 A format is one of '%d', '%f', '%s' (integer, float, string).
                                 If omitted, all values in $data will be treated as strings unless otherwise specified in wpdb::$field_types.
     @param string $type         Optional. What type of operation is this? INSERT or REPLACE. Defaults to INSERT.
     @return int|false The number of rows affected, or false on error.
    
  **/
  @:native("_insert_replace_helper") public function _insertReplaceHelper(table:String, data:php.NativeStructArray<Dynamic>, format:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = null, ?type:String):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Update a row in the table
    
         wpdb::update( 'table', array( 'column' => 'foo', 'field' => 'bar' ), array( 'ID' => 1 ) )
         wpdb::update( 'table', array( 'column' => 'foo', 'field' => 1337 ), array( 'ID' => 1 ), array( '%s', '%d' ), array( '%d' ) )
    
     @since 2.5.0
     @see wpdb::prepare()
     @see wpdb::$field_types
     @see wp_set_wpdb_vars()
    
     @param string       $table        Table name
     @param array        $data         Data to update (in column => value pairs).
                                       Both $data columns and $data values should be "raw" (neither should be SQL escaped).
                                       Sending a null value will cause the column to be set to NULL - the corresponding
                                       format is ignored in this case.
     @param array        $where        A named array of WHERE clauses (in column => value pairs).
                                       Multiple clauses will be joined with ANDs.
                                       Both $where columns and $where values should be "raw".
                                       Sending a null value will create an IS NULL comparison - the corresponding format will be ignored in this case.
     @param array|string $format       Optional. An array of formats to be mapped to each of the values in $data.
                                       If string, that format will be used for all of the values in $data.
                                       A format is one of '%d', '%f', '%s' (integer, float, string).
                                       If omitted, all values in $data will be treated as strings unless otherwise specified in wpdb::$field_types.
     @param array|string $where_format Optional. An array of formats to be mapped to each of the values in $where.
                                       If string, that format will be used for all of the items in $where.
                                       A format is one of '%d', '%f', '%s' (integer, float, string).
                                       If omitted, all values in $where will be treated as strings.
     @return int|false The number of rows updated, or false on error.
    
  **/
  @:native("update") public function update(table:String, data:php.NativeStructArray<Dynamic>, where:php.NativeStructArray<Dynamic>, format:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = null, where_format:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = null):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Delete a row in the table
    
         wpdb::delete( 'table', array( 'ID' => 1 ) )
         wpdb::delete( 'table', array( 'ID' => 1 ), array( '%d' ) )
    
     @since 3.4.0
     @see wpdb::prepare()
     @see wpdb::$field_types
     @see wp_set_wpdb_vars()
    
     @param string       $table        Table name
     @param array        $where        A named array of WHERE clauses (in column => value pairs).
                                       Multiple clauses will be joined with ANDs.
                                       Both $where columns and $where values should be "raw".
                                       Sending a null value will create an IS NULL comparison - the corresponding format will be ignored in this case.
     @param array|string $where_format Optional. An array of formats to be mapped to each of the values in $where.
                                       If string, that format will be used for all of the items in $where.
                                       A format is one of '%d', '%f', '%s' (integer, float, string).
                                       If omitted, all values in $where will be treated as strings unless otherwise specified in wpdb::$field_types.
     @return int|false The number of rows updated, or false on error.
    
  **/
  @:native("delete") public function delete(table:String, where:php.NativeStructArray<Dynamic>, where_format:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = null):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Retrieve one variable from the database.
    
     Executes a SQL query and returns the value from the SQL result.
     If the SQL result contains more than one column and/or more than one row, this function returns the value in the column and row specified.
     If $query is null, this function returns the value in the specified column and row from the previous SQL result.
    
     @since 0.71
    
     @param string|null $query Optional. SQL query. Defaults to null, use the result from the previous query.
     @param int         $x     Optional. Column of value to return. Indexed from 0.
     @param int         $y     Optional. Row of value to return. Indexed from 0.
     @return string|null Database query result (as string), or null on failure
    
  **/
  @:native("get_var") public function getVar(query:String = null, x:Int = 0, y:Int = 0):String;
  /**
    
     Retrieve one row from the database.
    
     Executes a SQL query and returns the row from the SQL result.
    
     @since 0.71
    
     @param string|null $query  SQL query.
     @param string      $output Optional. The required return type. One of OBJECT, ARRAY_A, or ARRAY_N, which correspond to
                                an stdClass object, an associative array, or a numeric array, respectively. Default OBJECT.
     @param int         $y      Optional. Row to return. Indexed from 0.
     @return array|object|null|void Database query result in format specified by $output or null on failure
    
  **/
  @:native("get_row") public function getRow(query:String = null, ?output:String, y:Int = 0):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Dynamic>;
  /**
    
     Retrieve one column from the database.
    
     Executes a SQL query and returns the column from the SQL result.
     If the SQL result contains more than one column, this function returns the column specified.
     If $query is null, this function returns the specified column from the previous SQL result.
    
     @since 0.71
    
     @param string|null $query Optional. SQL query. Defaults to previous query.
     @param int         $x     Optional. Column to return. Indexed from 0.
     @return array Database query result. Array indexed from 0 by SQL result row number.
    
  **/
  @:native("get_col") public function getCol(query:String = null, x:Int = 0):php.NativeArray;
  /**
    
     Retrieve an entire SQL result set from the database (i.e., many rows)
    
     Executes a SQL query and returns the entire SQL result.
    
     @since 0.71
    
     @param string $query  SQL query.
     @param string $output Optional. Any of ARRAY_A | ARRAY_N | OBJECT | OBJECT_K constants.
                           With one of the first three, return an array of rows indexed from 0 by SQL result row number.
                           Each row is an associative array (column => value, ...), a numerically indexed array (0 => value, ...), or an object. ( ->column = value ), respectively.
                           With OBJECT_K, return an associative array of row objects keyed by the value of each row's first column's value.
                           Duplicate keys are discarded.
     @return array|object|null Database query results
    
  **/
  @:native("get_results") public function getResults(query:String = null, ?output:String):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Dynamic>;
  /**
    
     Retrieves the character set for the given column.
    
     @since 4.2.0
    
     @param string $table  Table name.
     @param string $column Column name.
     @return string|false|WP_Error Column character set as a string. False if the column has no
                                   character set. WP_Error object if there was an error.
    
  **/
  @:native("get_col_charset") public function getColCharset(table:String, column:String):haxe.extern.EitherType<String, haxe.extern.EitherType<Bool, wp.extern.Error>>;
  /**
    
     Retrieve the maximum string length allowed in a given column.
     The length may either be specified as a byte length or a character length.
    
     @since 4.2.1
    
     @param string $table  Table name.
     @param string $column Column name.
     @return array|false|WP_Error array( 'length' => (int), 'type' => 'byte' | 'char' )
                                  false if the column has no length (for example, numeric column)
                                  WP_Error object if there was an error.
    
  **/
  @:native("get_col_length") public function getColLength(table:String, column:String):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, haxe.extern.EitherType<Bool, wp.extern.Error>>;
  /**
    
     Strips any invalid characters from the string for a given table and column.
    
     @since 4.2.0
    
     @param string $table  Table name.
     @param string $column Column name.
     @param string $value  The text to check.
     @return string|WP_Error The converted string, or a WP_Error object if the conversion fails.
    
  **/
  @:native("strip_invalid_text_for_column") public function stripInvalidTextForColumn(table:String, column:String, value:String):haxe.extern.EitherType<String, wp.extern.Error>;
  /**
    
     Retrieve column metadata from the last query.
    
     @since 0.71
    
     @param string $info_type  Optional. Type one of name, table, def, max_length, not_null, primary_key, multiple_key, unique_key, numeric, blob, type, unsigned, zerofill
     @param int    $col_offset Optional. 0: col name. 1: which table the col's in. 2: col's max length. 3: if the col is numeric. 4: col's type
     @return mixed Column Results
    
  **/
  @:native("get_col_info") public function getColInfo(info_type:String = 'name', col_offset:Int = ):Dynamic;
  /**
    
     Starts the timer, for debugging purposes.
    
     @since 1.5.0
    
     @return true
    
  **/
  @:native("timer_start") public function timerStart():Bool;
  /**
    
     Stops the debugging timer.
    
     @since 1.5.0
    
     @return float Total time spent on the query, in seconds
    
  **/
  @:native("timer_stop") public function timerStop():Int;
  /**
    
     Wraps errors in a nice header and footer and dies.
    
     Will not die if wpdb::$show_errors is false.
    
     @since 1.5.0
    
     @param string $message    The Error message
     @param string $error_code Optional. A Computer readable string to identify the error.
     @return false|void
    
  **/
  @:native("bail") public function bail(message:String, error_code:String = '500'):Bool;
  /**
    
     Closes the current database connection.
    
     @since 4.5.0
    
     @return bool True if the connection was successfully closed, false if it wasn't,
                  or the connection doesn't exist.
    
  **/
  @:native("close") public function close():Bool;
  /**
    
     Whether MySQL database is at least the required minimum version.
    
     @since 2.5.0
    
     @global string $wp_version
     @global string $required_mysql_version
    
     @return WP_Error|void
    
  **/
  @:native("check_database_version") public function checkDatabaseVersion():wp.extern.Error;
  /**
    
     Whether the database supports collation.
    
     Called when WordPress is generating the table scheme.
    
     Use `wpdb::has_cap( 'collation' )`.
    
     @since 2.5.0
     @deprecated 3.5.0 Use wpdb::has_cap()
    
     @return bool True if collation is supported, false if version does not
    
  **/
  @:native("supports_collation") public function supportsCollation():Bool;
  /**
    
     The database character collate.
    
     @since 3.5.0
    
     @return string The database character collate.
    
  **/
  @:native("get_charset_collate") public function getCharsetCollate():String;
  /**
    
     Determine if a database supports a particular feature.
    
     @since 2.7.0
     @since 4.1.0 Added support for the 'utf8mb4' feature.
     @since 4.6.0 Added support for the 'utf8mb4_520' feature.
    
     @see wpdb::db_version()
    
     @param string $db_cap The feature to check for. Accepts 'collation',
                           'group_concat', 'subqueries', 'set_charset',
                           'utf8mb4', or 'utf8mb4_520'.
     @return int|false Whether the database feature is supported, false otherwise.
    
  **/
  @:native("has_cap") public function hasCap(db_cap:String):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Retrieve the name of the function that called wpdb.
    
     Searches up the list of functions until it reaches
     the one that would most logically had called this method.
    
     @since 2.5.0
    
     @return string Comma separated list of the calling functions.
    
  **/
  @:native("get_caller") public function getCaller():String;
  /**
    
     Retrieves the MySQL server version.
    
     @since 2.7.0
    
     @return null|string Null on failure, version number on success.
    
  **/
  @:native("db_version") public function dbVersion():String;
}
