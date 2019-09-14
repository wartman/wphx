package wp.extern;

extern class FunctionsPhpApi implements wp.util.ApiFunctions {
  /**
    
     Convert given date string into a different format.
    
     $format should be either a PHP date format string, e.g. 'U' for a Unix
     timestamp, or 'G' for a Unix timestamp assuming that $date is GMT.
    
     If $translate is true then the given date and format string will
     be passed to date_i18n() for translation.
    
     @since 0.71
    
     @param string $format    Format of the date to return.
     @param string $date      Date string to convert.
     @param bool   $translate Whether the return date should be translated. Default true.
     @return string|int|bool Formatted date string or Unix timestamp. False if $date is empty.
    
  **/
  public function mysql2date(format:String, date:String, translate:Bool = true):haxe.extern.EitherType<String, haxe.extern.EitherType<Int, Bool>>;
  /**
    
     Retrieve the current time based on specified type.
    
     The 'mysql' type will return the time in the format for MySQL DATETIME field.
     The 'timestamp' type will return the current timestamp.
     Other strings will be interpreted as PHP date formats (e.g. 'Y-m-d').
    
     If $gmt is set to either '1' or 'true', then both types will use GMT time.
     if $gmt is false, the output is adjusted with the GMT offset in the WordPress option.
    
     @since 1.0.0
    
     @param string   $type Type of time to retrieve. Accepts 'mysql', 'timestamp', or PHP date
                           format string (e.g. 'Y-m-d').
     @param int|bool $gmt  Optional. Whether to use GMT timezone. Default false.
     @return int|string Integer if $type is 'timestamp', string otherwise.
    
  **/
  public function current_time(type:String, gmt:haxe.extern.EitherType<Int, Bool> = 0):haxe.extern.EitherType<Int, String>;
  /**
    
     Retrieve the date in localized format, based on a sum of Unix timestamp and
     timezone offset in seconds.
    
     If the locale specifies the locale month and weekday, then the locale will
     take over the format for the date. If it isn't, then the date format string
     will be used instead.
    
     @since 0.71
    
     @global WP_Locale $wp_locale
    
     @param string   $dateformatstring      Format to display the date.
     @param int|bool $timestamp_with_offset Optional. A sum of Unix timestamp and timezone offset in seconds.
                                            Default false.
     @param bool     $gmt                   Optional. Whether to use GMT timezone. Only applies if timestamp is
                                            not provided. Default false.
    
     @return string The date, translated if locale specifies it.
    
  **/
  public function date_i18n(dateformatstring:String, timestamp_with_offset:haxe.extern.EitherType<Int, Bool> = false, gmt:Bool = false):String;
  /**
    
     Determines if the date should be declined.
    
     If the locale specifies that month names require a genitive case in certain
     formats (like 'j F Y'), the month name will be replaced with a correct form.
    
     @since 4.4.0
    
     @global WP_Locale $wp_locale
    
     @param string $date Formatted date string.
     @return string The date, declined if locale specifies it.
    
  **/
  public function wp_maybe_decline_date(date:String):String;
  /**
    
     Convert float number to format based on the locale.
    
     @since 2.3.0
    
     @global WP_Locale $wp_locale
    
     @param float $number   The number to convert based on locale.
     @param int   $decimals Optional. Precision of the number of decimal places. Default 0.
     @return string Converted number in string format.
    
  **/
  public function number_format_i18n(number:Int, decimals:Int = 0):String;
  /**
    
     Convert number of bytes largest unit bytes will fit into.
    
     It is easier to read 1 KB than 1024 bytes and 1 MB than 1048576 bytes. Converts
     number of bytes to human readable number by taking the number of that unit
     that the bytes will go into it. Supports TB value.
    
     Please note that integers in PHP are limited to 32 bits, unless they are on
     64 bit architecture, then they have 64 bit size. If you need to place the
     larger size then what PHP integer type will hold, then use a string. It will
     be converted to a double, which should always have 64 bit length.
    
     Technically the correct unit names for powers of 1024 are KiB, MiB etc.
    
     @since 2.3.0
    
     @param int|string $bytes    Number of bytes. Note max integer size for integers.
     @param int        $decimals Optional. Precision of number of decimal places. Default 0.
     @return string|false False on failure. Number string on success.
    
  **/
  public function size_format(bytes:haxe.extern.EitherType<Int, String>, decimals:Int = 0):haxe.extern.EitherType<String, Bool>;
  /**
    
     Convert a duration to human readable format.
    
     @since 5.1.0
    
     @param string $duration Duration will be in string format (HH:ii:ss) OR (ii:ss),
                             with a possible prepended negative sign (-).
     @return string|false A human readable duration string, false on failure.
    
  **/
  public function human_readable_duration(duration:String = ''):haxe.extern.EitherType<String, Bool>;
  /**
    
     Get the week start and end from the datetime or date string from MySQL.
    
     @since 0.71
    
     @param string     $mysqlstring   Date or datetime field type from MySQL.
     @param int|string $start_of_week Optional. Start of the week as an integer. Default empty string.
     @return array Keys are 'start' and 'end'.
    
  **/
  public function get_weekstartend(mysqlstring:String, start_of_week:haxe.extern.EitherType<Int, String> = ''):php.NativeArray;
  /**
    
     Unserialize value only if it was serialized.
    
     @since 2.0.0
    
     @param string $original Maybe unserialized original, if is needed.
     @return mixed Unserialized data can be any type.
    
  **/
  public function maybe_unserialize(original:String):Dynamic;
  /**
    
     Check value to find if it was serialized.
    
     If $data is not an string, then returned value will always be false.
     Serialized data is always a string.
    
     @since 2.0.5
    
     @param string $data   Value to check to see if was serialized.
     @param bool   $strict Optional. Whether to be strict about the end of the string. Default true.
     @return bool False if not serialized and true if it was.
    
  **/
  public function is_serialized(data:String, strict:Bool = true):Bool;
  /**
    
     Check whether serialized data is of string type.
    
     @since 2.0.5
    
     @param string $data Serialized data.
     @return bool False if not a serialized string, true if it is.
    
  **/
  public function is_serialized_string(data:String):Bool;
  /**
    
     Serialize data, if needed.
    
     @since 2.0.5
    
     @param string|array|object $data Data that might be serialized.
     @return mixed A scalar data
    
  **/
  public function maybe_serialize(data:haxe.extern.EitherType<String, haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Dynamic>>):Dynamic;
  /**
    
     Retrieve post title from XMLRPC XML.
    
     If the title element is not part of the XML, then the default post title from
     the $post_default_title will be used instead.
    
     @since 0.71
    
     @global string $post_default_title Default XML-RPC post title.
    
     @param string $content XMLRPC XML Request content
     @return string Post title
    
  **/
  public function xmlrpc_getposttitle(content:String):String;
  /**
    
     Retrieve the post category or categories from XMLRPC XML.
    
     If the category element is not found, then the default post category will be
     used. The return type then would be what $post_default_category. If the
     category is found, then it will always be an array.
    
     @since 0.71
    
     @global string $post_default_category Default XML-RPC post category.
    
     @param string $content XMLRPC XML Request content
     @return string|array List of categories or category name.
    
  **/
  public function xmlrpc_getpostcategory(content:String):haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>;
  /**
    
     XMLRPC XML content without title and category elements.
    
     @since 0.71
    
     @param string $content XML-RPC XML Request content.
     @return string XMLRPC XML Request content without title and category elements.
    
  **/
  public function xmlrpc_removepostdata(content:String):String;
  /**
    
     Use RegEx to extract URLs from arbitrary content.
    
     @since 3.7.0
    
     @param string $content Content to extract URLs from.
     @return array URLs found in passed string.
    
  **/
  public function wp_extract_urls(content:String):php.NativeArray;
  /**
    
     Check content for video and audio links to add as enclosures.
    
     Will not add enclosures that have already been added and will
     remove enclosures that are no longer in the post. This is called as
     pingbacks and trackbacks.
    
     @since 1.5.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $content Post Content.
     @param int    $post_ID Post ID.
    
  **/
  public function do_enclose(content:String, post_ID:Int):Void;
  /**
    
     Retrieve HTTP Headers from URL.
    
     @since 1.5.1
    
     @param string $url        URL to retrieve HTTP headers from.
     @param bool   $deprecated Not Used.
     @return bool|string False on failure, headers on success.
    
  **/
  public function wp_get_http_headers(url:String, deprecated:Bool = false):haxe.extern.EitherType<Bool, String>;
  /**
    
     Determines whether the publish date of the current post in the loop is different
     from the publish date of the previous post in the loop.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 0.71
    
     @global string $currentday  The day of the current post in the loop.
     @global string $previousday The day of the previous post in the loop.
    
     @return int 1 when new day, 0 if not a new day.
    
  **/
  public function is_new_day():Int;
  /**
    
     Build URL query based on an associative and, or indexed array.
    
     This is a convenient function for easily building url queries. It sets the
     separator to '&' and uses _http_build_query() function.
    
     @since 2.3.0
    
     @see _http_build_query() Used to build the query
     @link https://secure.php.net/manual/en/function.http-build-query.php for more on what
           http_build_query() does.
    
     @param array $data URL-encode key/value pairs.
     @return string URL-encoded string.
    
  **/
  public function build_query(data:php.NativeStructArray<Dynamic>):String;
  /**
    
     From php.net (modified by Mark Jaquith to behave like the native PHP5 function).
    
     @since 3.2.0
     @access private
    
     @see https://secure.php.net/manual/en/function.http-build-query.php
    
     @param array|object  $data       An array or object of data. Converted to array.
     @param string        $prefix     Optional. Numeric index. If set, start parameter numbering with it.
                                      Default null.
     @param string        $sep        Optional. Argument separator; defaults to 'arg_separator.output'.
                                      Default null.
     @param string        $key        Optional. Used to prefix key name. Default empty.
     @param bool          $urlencode  Optional. Whether to use urlencode() in the result. Default true.
    
     @return string The query string.
    
  **/
  public function _http_build_query(data:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Dynamic>, prefix:String = null, sep:String = null, key:String = '', urlencode:Bool = true):String;
  /**
    
     Retrieves a modified URL query string.
    
     You can rebuild the URL and append query variables to the URL query by using this function.
     There are two ways to use this function; either a single key and value, or an associative array.
    
     Using a single key and value:
    
         add_query_arg( 'key', 'value', 'http://example.com' );
    
     Using an associative array:
    
         add_query_arg( array(
             'key1' => 'value1',
             'key2' => 'value2',
         ), 'http://example.com' );
    
     Omitting the URL from either use results in the current URL being used
     (the value of `$_SERVER['REQUEST_URI']`).
    
     Values are expected to be encoded appropriately with urlencode() or rawurlencode().
    
     Setting any query variable's value to boolean false removes the key (see remove_query_arg()).
    
     Important: The return value of add_query_arg() is not escaped by default. Output should be
     late-escaped with esc_url() or similar to help prevent vulnerability to cross-site scripting
     (XSS) attacks.
    
     @since 1.5.0
    
     @param string|array $key   Either a query variable key, or an associative array of query variables.
     @param string       $value Optional. Either a query variable value, or a URL to act upon.
     @param string       $url   Optional. A URL to act upon.
     @return string New URL query string (unescaped).
    
  **/
  public function add_query_arg(key:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, value:String, url:String):String;
  /**
    
     Removes an item or items from a query string.
    
     @since 1.5.0
    
     @param string|array $key   Query key or keys to remove.
     @param bool|string  $query Optional. When false uses the current URL. Default false.
     @return string New URL query string.
    
  **/
  public function remove_query_arg(key:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, query:haxe.extern.EitherType<Bool, String> = false):String;
  /**
    
     Returns an array of single-use query variable names that can be removed from a URL.
    
     @since 4.4.0
    
     @return array An array of parameters to remove from the URL.
    
  **/
  public function wp_removable_query_args():php.NativeArray;
  /**
    
     Walks the array while sanitizing the contents.
    
     @since 0.71
    
     @param array $array Array to walk while sanitizing contents.
     @return array Sanitized $array.
    
  **/
  public function add_magic_quotes(array:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     HTTP request for URI to retrieve content.
    
     @since 1.5.1
    
     @see wp_safe_remote_get()
    
     @param string $uri URI/URL of web page to retrieve.
     @return false|string HTTP content. False on failure.
    
  **/
  public function wp_remote_fopen(uri:String):haxe.extern.EitherType<Bool, String>;
  /**
    
     Set up the WordPress query.
    
     @since 2.0.0
    
     @global WP       $wp_locale
     @global WP_Query $wp_query
     @global WP_Query $wp_the_query
    
     @param string|array $query_vars Default WP_Query arguments.
    
  **/
  public function wp(query_vars:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Void;
  /**
    
     Retrieve the description for the HTTP status.
    
     @since 2.3.0
     @since 3.9.0 Added status codes 418, 428, 429, 431, and 511.
     @since 4.5.0 Added status codes 308, 421, and 451.
     @since 5.1.0 Added status code 103.
    
     @global array $wp_header_to_desc
    
     @param int $code HTTP status code.
     @return string Empty string if not found, or description if found.
    
  **/
  public function get_status_header_desc(code:Int):String;
  /**
    
     Set HTTP status header.
    
     @since 2.0.0
     @since 4.4.0 Added the `$description` parameter.
    
     @see get_status_header_desc()
    
     @param int    $code        HTTP status code.
     @param string $description Optional. A custom description for the HTTP status.
    
  **/
  public function status_header(code:Int, description:String = ''):Void;
  /**
    
     Get the header information to prevent caching.
    
     The several different headers cover the different ways cache prevention
     is handled by different browsers
    
     @since 2.8.0
    
     @return array The associative array of header names and field values.
    
  **/
  public function wp_get_nocache_headers():php.NativeArray;
  /**
    
     Set the headers to prevent caching for the different browsers.
    
     Different browsers support different nocache headers, so several
     headers must be sent so that all of them get the point that no
     caching should occur.
    
     @since 2.0.0
    
     @see wp_get_nocache_headers()
    
  **/
  public function nocache_headers():Void;
  /**
    
     Set the headers for caching for 10 days with JavaScript content type.
    
     @since 2.1.0
    
  **/
  public function cache_javascript_headers():Void;
  /**
    
     Retrieve the number of database queries during the WordPress execution.
    
     @since 2.0.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @return int Number of database queries.
    
  **/
  public function get_num_queries():Int;
  /**
    
     Whether input is yes or no.
    
     Must be 'y' to be true.
    
     @since 1.0.0
    
     @param string $yn Character string containing either 'y' (yes) or 'n' (no).
     @return bool True if yes, false on anything else.
    
  **/
  public function bool_from_yn(yn:String):Bool;
  /**
    
     Load the feed template from the use of an action hook.
    
     If the feed action does not have a hook, then the function will die with a
     message telling the visitor that the feed is not valid.
    
     It is better to only have one hook for each feed.
    
     @since 2.1.0
    
     @global WP_Query $wp_query Used to tell if the use a comment feed.
    
  **/
  public function do_feed():Void;
  /**
    
     Load the RDF RSS 0.91 Feed template.
    
     @since 2.1.0
    
     @see load_template()
    
  **/
  public function do_feed_rdf():Void;
  /**
    
     Load the RSS 1.0 Feed Template.
    
     @since 2.1.0
    
     @see load_template()
    
  **/
  public function do_feed_rss():Void;
  /**
    
     Load either the RSS2 comment feed or the RSS2 posts feed.
    
     @since 2.1.0
    
     @see load_template()
    
     @param bool $for_comments True for the comment feed, false for normal feed.
    
  **/
  public function do_feed_rss2(for_comments:Bool):Void;
  /**
    
     Load either Atom comment feed or Atom posts feed.
    
     @since 2.1.0
    
     @see load_template()
    
     @param bool $for_comments True for the comment feed, false for normal feed.
    
  **/
  public function do_feed_atom(for_comments:Bool):Void;
  /**
    
     Display the robots.txt file content.
    
     The echo content should be with usage of the permalinks or for creating the
     robots.txt file.
    
     @since 2.1.0
    
  **/
  public function do_robots():Void;
  /**
    
     Determines whether WordPress is already installed.
    
     The cache will be checked first. If you have a cache plugin, which saves
     the cache values, then this will work. If you use the default WordPress
     cache, and the database goes away, then you might have problems.
    
     Checks for the 'siteurl' option for whether WordPress is installed.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.1.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @return bool Whether the site is already installed.
    
  **/
  public function is_blog_installed():Bool;
  /**
    
     Retrieve URL with nonce added to URL query.
    
     @since 2.0.4
    
     @param string     $actionurl URL to add nonce action.
     @param int|string $action    Optional. Nonce action name. Default -1.
     @param string     $name      Optional. Nonce name. Default '_wpnonce'.
     @return string Escaped URL with nonce action added.
    
  **/
  public function wp_nonce_url(actionurl:String, action:haxe.extern.EitherType<Int, String> = , name:String):String;
  /**
    
     Retrieve or display nonce hidden field for forms.
    
     The nonce field is used to validate that the contents of the form came from
     the location on the current site and not somewhere else. The nonce does not
     offer absolute protection, but should protect against most cases. It is very
     important to use nonce field in forms.
    
     The $action and $name are optional, but if you want to have better security,
     it is strongly suggested to set those two parameters. It is easier to just
     call the function without any parameters, because validation of the nonce
     doesn't require any parameters, but since crackers know what the default is
     it won't be difficult for them to find a way around your nonce and cause
     damage.
    
     The input name will be whatever $name value you gave. The input value will be
     the nonce creation value.
    
     @since 2.0.4
    
     @param int|string $action  Optional. Action name. Default -1.
     @param string     $name    Optional. Nonce name. Default '_wpnonce'.
     @param bool       $referer Optional. Whether to set the referer field for validation. Default true.
     @param bool       $echo    Optional. Whether to display or return hidden form field. Default true.
     @return string Nonce field HTML markup.
    
  **/
  public function wp_nonce_field(action:haxe.extern.EitherType<Int, String> = , name:String, referer:Bool, echo:Bool):String;
  /**
    
     Retrieve or display referer hidden field for forms.
    
     The referer link is the current Request URI from the server super global. The
     input name is '_wp_http_referer', in case you wanted to check manually.
    
     @since 2.0.4
    
     @param bool $echo Optional. Whether to echo or return the referer field. Default true.
     @return string Referer field HTML markup.
    
  **/
  public function wp_referer_field(echo:Bool = true):String;
  /**
    
     Retrieve or display original referer hidden field for forms.
    
     The input name is '_wp_original_http_referer' and will be either the same
     value of wp_referer_field(), if that was posted already or it will be the
     current page, if it doesn't exist.
    
     @since 2.0.4
    
     @param bool   $echo         Optional. Whether to echo the original http referer. Default true.
     @param string $jump_back_to Optional. Can be 'previous' or page you want to jump back to.
                                 Default 'current'.
     @return string Original referer field.
    
  **/
  public function wp_original_referer_field(echo:Bool = true, jump_back_to:String = 'current'):String;
  /**
    
     Retrieve referer from '_wp_http_referer' or HTTP referer.
    
     If it's the same as the current request URL, will return false.
    
     @since 2.0.4
    
     @return false|string False on failure. Referer URL on success.
    
  **/
  public function wp_get_referer():haxe.extern.EitherType<Bool, String>;
  /**
    
     Retrieves unvalidated referer from '_wp_http_referer' or HTTP referer.
    
     Do not use for redirects, use wp_get_referer() instead.
    
     @since 4.5.0
    
     @return string|false Referer URL on success, false on failure.
    
  **/
  public function wp_get_raw_referer():haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieve original referer that was posted, if it exists.
    
     @since 2.0.4
    
     @return string|false False if no original referer or original referer if set.
    
  **/
  public function wp_get_original_referer():haxe.extern.EitherType<String, Bool>;
  /**
    
     Recursive directory creation based on full path.
    
     Will attempt to set permissions on folders.
    
     @since 2.0.1
    
     @param string $target Full path to attempt to create.
     @return bool Whether the path was created. True if path already exists.
    
  **/
  public function wp_mkdir_p(target:String):Bool;
  /**
    
     Test if a given filesystem path is absolute.
    
     For example, '/foo/bar', or 'c:\windows'.
    
     @since 2.5.0
    
     @param string $path File path.
     @return bool True if path is absolute, false is not absolute.
    
  **/
  public function path_is_absolute(path:String):Bool;
  /**
    
     Join two filesystem paths together.
    
     For example, 'give me $path relative to $base'. If the $path is absolute,
     then it the full path is returned.
    
     @since 2.5.0
    
     @param string $base Base path.
     @param string $path Path relative to $base.
     @return string The path with the base or absolute path.
    
  **/
  public function path_join(base:String, path:String):String;
  /**
    
     Normalize a filesystem path.
    
     On windows systems, replaces backslashes with forward slashes
     and forces upper-case drive letters.
     Allows for two leading slashes for Windows network shares, but
     ensures that all other duplicate slashes are reduced to a single.
    
     @since 3.9.0
     @since 4.4.0 Ensures upper-case drive letters on Windows systems.
     @since 4.5.0 Allows for Windows network shares.
     @since 4.9.7 Allows for PHP file wrappers.
    
     @param string $path Path to normalize.
     @return string Normalized path.
    
  **/
  public function wp_normalize_path(path:String):String;
  /**
    
     Determine a writable directory for temporary files.
    
     Function's preference is the return value of sys_get_temp_dir(),
     followed by your PHP temporary upload directory, followed by WP_CONTENT_DIR,
     before finally defaulting to /tmp/
    
     In the event that this function does not find a writable location,
     It may be overridden by the WP_TEMP_DIR constant in your wp-config.php file.
    
     @since 2.5.0
    
     @staticvar string $temp
    
     @return string Writable temporary directory.
    
  **/
  public function get_temp_dir():String;
  /**
    
     Determine if a directory is writable.
    
     This function is used to work around certain ACL issues in PHP primarily
     affecting Windows Servers.
    
     @since 3.6.0
    
     @see win_is_writable()
    
     @param string $path Path to check for write-ability.
     @return bool Whether the path is writable.
    
  **/
  public function wp_is_writable(path:String):Bool;
  /**
    
     Workaround for Windows bug in is_writable() function
    
     PHP has issues with Windows ACL's for determine if a
     directory is writable or not, this works around them by
     checking the ability to open files rather than relying
     upon PHP to interprate the OS ACL.
    
     @since 2.8.0
    
     @see https://bugs.php.net/bug.php?id=27609
     @see https://bugs.php.net/bug.php?id=30931
    
     @param string $path Windows path to check for write-ability.
     @return bool Whether the path is writable.
    
  **/
  public function win_is_writable(path:String):Bool;
  /**
    
     Retrieves uploads directory information.
    
     Same as wp_upload_dir() but "light weight" as it doesn't attempt to create the uploads directory.
     Intended for use in themes, when only 'basedir' and 'baseurl' are needed, generally in all cases
     when not uploading files.
    
     @since 4.5.0
    
     @see wp_upload_dir()
    
     @return array See wp_upload_dir() for description.
    
  **/
  public function wp_get_upload_dir():php.NativeArray;
  /**
    
     Get an array containing the current upload directory's path and url.
    
     Checks the 'upload_path' option, which should be from the web root folder,
     and if it isn't empty it will be used. If it is empty, then the path will be
     'WP_CONTENT_DIR/uploads'. If the 'UPLOADS' constant is defined, then it will
     override the 'upload_path' option and 'WP_CONTENT_DIR/uploads' path.
    
     The upload URL path is set either by the 'upload_url_path' option or by using
     the 'WP_CONTENT_URL' constant and appending '/uploads' to the path.
    
     If the 'uploads_use_yearmonth_folders' is set to true (checkbox if checked in
     the administration settings panel), then the time will be used. The format
     will be year first and then month.
    
     If the path couldn't be created, then an error will be returned with the key
     'error' containing the error message. The error suggests that the parent
     directory is not writable by the server.
    
     On success, the returned array will have many indices:
     'path' - base directory and sub directory or full path to upload directory.
     'url' - base url and sub directory or absolute URL to upload directory.
     'subdir' - sub directory if uploads use year/month folders option is on.
     'basedir' - path without subdir.
     'baseurl' - URL path without subdir.
     'error' - false or error message.
    
     @since 2.0.0
     @uses _wp_upload_dir()
    
     @staticvar array $cache
     @staticvar array $tested_paths
    
     @param string $time Optional. Time formatted in 'yyyy/mm'. Default null.
     @param bool   $create_dir Optional. Whether to check and create the uploads directory.
                               Default true for backward compatibility.
     @param bool   $refresh_cache Optional. Whether to refresh the cache. Default false.
     @return array See above for description.
    
  **/
  public function wp_upload_dir(time:String = null, create_dir:Bool = true, refresh_cache:Bool = false):php.NativeArray;
  /**
    
     A non-filtered, non-cached version of wp_upload_dir() that doesn't check the path.
    
     @since 4.5.0
     @access private
    
     @param string $time Optional. Time formatted in 'yyyy/mm'. Default null.
     @return array See wp_upload_dir()
    
  **/
  public function _wp_upload_dir(time:String = null):php.NativeArray;
  /**
    
     Get a filename that is sanitized and unique for the given directory.
    
     If the filename is not unique, then a number will be added to the filename
     before the extension, and will continue adding numbers until the filename is
     unique.
    
     The callback is passed three parameters, the first one is the directory, the
     second is the filename, and the third is the extension.
    
     @since 2.5.0
    
     @param string   $dir                      Directory.
     @param string   $filename                 File name.
     @param callable $unique_filename_callback Callback. Default null.
     @return string New filename, if given wasn't unique.
    
  **/
  public function wp_unique_filename(dir:String, filename:String, unique_filename_callback:Dynamic = null):String;
  /**
    
     Create a file in the upload folder with given content.
    
     If there is an error, then the key 'error' will exist with the error message.
     If success, then the key 'file' will have the unique file path, the 'url' key
     will have the link to the new file. and the 'error' key will be set to false.
    
     This function will not move an uploaded file to the upload folder. It will
     create a new file with the content in $bits parameter. If you move the upload
     file, read the content of the uploaded file, and then you can give the
     filename and content to this function, which will add it to the upload
     folder.
    
     The permissions will be set on the new file automatically by this function.
    
     @since 2.0.0
    
     @param string       $name       Filename.
     @param null|string  $deprecated Never used. Set to null.
     @param mixed        $bits       File content
     @param string       $time       Optional. Time formatted in 'yyyy/mm'. Default null.
     @return array
    
  **/
  public function wp_upload_bits(name:String, deprecated:String, bits:Dynamic, time:String = null):php.NativeArray;
  /**
    
     Retrieve the file type based on the extension name.
    
     @since 2.5.0
    
     @param string $ext The extension to search.
     @return string|void The file type, example: audio, video, document, spreadsheet, etc.
    
  **/
  public function wp_ext2type(ext:String):String;
  /**
    
     Retrieve the file type from the file name.
    
     You can optionally define the mime array, if needed.
    
     @since 2.0.4
    
     @param string $filename File name or path.
     @param array  $mimes    Optional. Key is the file extension with value as the mime type.
     @return array Values with extension first and mime type.
    
  **/
  public function wp_check_filetype(filename:String, mimes:php.NativeStructArray<Dynamic> = null):php.NativeArray;
  /**
    
     Attempt to determine the real file type of a file.
    
     If unable to, the file name extension will be used to determine type.
    
     If it's determined that the extension does not match the file's real type,
     then the "proper_filename" value will be set with a proper filename and extension.
    
     Currently this function only supports renaming images validated via wp_get_image_mime().
    
     @since 3.0.0
    
     @param string $file     Full path to the file.
     @param string $filename The name of the file (may differ from $file due to $file being
                             in a tmp directory).
     @param array   $mimes   Optional. Key is the file extension with value as the mime type.
     @return array Values for the extension, MIME, and either a corrected filename or false
                   if original $filename is valid.
    
  **/
  public function wp_check_filetype_and_ext(file:String, filename:String, mimes:php.NativeStructArray<Dynamic> = null):php.NativeArray;
  /**
    
     Returns the real mime type of an image file.
    
     This depends on exif_imagetype() or getimagesize() to determine real mime types.
    
     @since 4.7.1
    
     @param string $file Full path to the file.
     @return string|false The actual mime type or false if the type cannot be determined.
    
  **/
  public function wp_get_image_mime(file:String):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieve list of mime types and file extensions.
    
     @since 3.5.0
     @since 4.2.0 Support was added for GIMP (xcf) files.
    
     @return array Array of mime types keyed by the file extension regex corresponding to those types.
    
  **/
  public function wp_get_mime_types():php.NativeArray;
  /**
    
     Retrieves the list of common file extensions and their types.
    
     @since 4.6.0
    
     @return array Array of file extensions types keyed by the type of file.
    
  **/
  public function wp_get_ext_types():php.NativeArray;
  /**
    
     Retrieve list of allowed mime types and file extensions.
    
     @since 2.8.6
    
     @param int|WP_User $user Optional. User to check. Defaults to current user.
     @return array Array of mime types keyed by the file extension regex corresponding
                   to those types.
    
  **/
  public function get_allowed_mime_types(user:haxe.extern.EitherType<Int, wp.extern.User> = null):php.NativeArray;
  /**
    
     Display "Are You Sure" message to confirm the action being taken.
    
     If the action has the nonce explain message, then it will be displayed
     along with the "Are you sure?" message.
    
     @since 2.0.4
    
     @param string $action The nonce action.
    
  **/
  public function wp_nonce_ays(action:String):Void;
  /**
    
     Kill WordPress execution and display HTML message with error message.
    
     This function complements the `die()` PHP function. The difference is that
     HTML will be displayed to the user. It is recommended to use this function
     only when the execution should not continue any further. It is not recommended
     to call this function very often, and try to handle as many errors as possible
     silently or more gracefully.
    
     As a shorthand, the desired HTTP response code may be passed as an integer to
     the `$title` parameter (the default title would apply) or the `$args` parameter.
    
     @since 2.0.4
     @since 4.1.0 The `$title` and `$args` parameters were changed to optionally accept
                  an integer to be used as the response code.
     @since 5.1.0 The `$link_url`, `$link_text`, and `$exit` arguments were added.
    
     @param string|WP_Error  $message Optional. Error message. If this is a WP_Error object,
                                      and not an Ajax or XML-RPC request, the error's messages are used.
                                      Default empty.
     @param string|int       $title   Optional. Error title. If `$message` is a `WP_Error` object,
                                      error data with the key 'title' may be used to specify the title.
                                      If `$title` is an integer, then it is treated as the response
                                      code. Default empty.
     @param string|array|int $args {
         Optional. Arguments to control behavior. If `$args` is an integer, then it is treated
         as the response code. Default empty array.
    
         @type int    $response       The HTTP response code. Default 200 for Ajax requests, 500 otherwise.
         @type string $link_url       A URL to include a link to. Only works in combination with $link_text.
                                      Default empty string.
         @type string $link_text      A label for the link to include. Only works in combination with $link_url.
                                      Default empty string.
         @type bool   $back_link      Whether to include a link to go back. Default false.
         @type string $text_direction The text direction. This is only useful internally, when WordPress
                                      is still loading and the site's locale is not set up yet. Accepts 'rtl'.
                                      Default is the value of is_rtl().
         @type string $code           Error code to use. Default is 'wp_die', or the main error code if $message
                                      is a WP_Error.
         @type bool   $exit           Whether to exit the process after completion. Default true.
     }
    
  **/
  public function wp_die(message:haxe.extern.EitherType<String, wp.extern.Error> = '', title:haxe.extern.EitherType<String, Int> = '', ?args:haxe.extern.EitherType<String, haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Int>>):Void;
  /**
    
     Filters the callback for killing WordPress execution for Ajax requests.
    
     @since 3.4.0
    
     @param callable $function Callback function name.
    
  **/
  public function = apply_filters(function_:Dynamic):Void;
  /**
    
     Filters the callback for killing WordPress execution for JSON requests.
    
     @since 5.1.0
    
     @param callable $function Callback function name.
    
  **/
  public function = apply_filters(function_:Dynamic):Void;
  /**
    
     Filters the callback for killing WordPress execution for XML-RPC requests.
    
     @since 3.4.0
    
     @param callable $function Callback function name.
    
  **/
  public function = apply_filters(function_:Dynamic):Void;
  /**
    
     Filters the callback for killing WordPress execution for all non-Ajax, non-XML-RPC requests.
    
     @since 3.0.0
    
     @param callable $function Callback function name.
    
  **/
  public function = apply_filters(function_:Dynamic):Void;
  /**
    
     Kills WordPress execution and display HTML message with error message.
    
     This is the default handler for wp_die if you want a custom one for your
     site then you can overload using the {@see 'wp_die_handler'} filter in wp_die().
    
     @since 3.0.0
     @access private
    
     @param string|WP_Error $message Error message or WP_Error object.
     @param string          $title   Optional. Error title. Default empty.
     @param string|array    $args    Optional. Arguments to control behavior. Default empty array.
    
  **/
  public function _default_wp_die_handler(message:haxe.extern.EitherType<String, wp.extern.Error>, title:String = '', ?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):Void;
  /**
    
     Kill WordPress execution and display JSON message with error message.
    
     This is the handler for wp_die when processing JSON requests.
    
     @since 5.1.0
     @access private
    
     @param string       $message Error message.
     @param string       $title   Optional. Error title. Default empty.
     @param string|array $args    Optional. Arguments to control behavior. Default empty array.
    
  **/
  public function _json_wp_die_handler(message:String, title:String = '', ?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):Void;
  /**
    
     Kill WordPress execution and display XML message with error message.
    
     This is the handler for wp_die when processing XMLRPC requests.
    
     @since 3.2.0
     @access private
    
     @global wp_xmlrpc_server $wp_xmlrpc_server
    
     @param string       $message Error message.
     @param string       $title   Optional. Error title. Default empty.
     @param string|array $args    Optional. Arguments to control behavior. Default empty array.
    
  **/
  public function _xmlrpc_wp_die_handler(message:String, title:String = '', ?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):Void;
  /**
    
     Kill WordPress ajax execution.
    
     This is the handler for wp_die when processing Ajax requests.
    
     @since 3.4.0
     @access private
    
     @param string       $message Error message.
     @param string       $title   Optional. Error title (unused). Default empty.
     @param string|array $args    Optional. Arguments to control behavior. Default empty array.
    
  **/
  public function _ajax_wp_die_handler(message:String, title:String = '', ?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):Void;
  /**
    
     Kill WordPress execution.
    
     This is the handler for wp_die when processing APP requests.
    
     @since 3.4.0
     @since 5.1.0 Added the $title and $args parameters.
     @access private
    
     @param string       $message Optional. Response to print. Default empty.
     @param string       $title   Optional. Error title (unused). Default empty.
     @param string|array $args    Optional. Arguments to control behavior. Default empty array.
    
  **/
  public function _scalar_wp_die_handler(message:String = '', title:String = '', ?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):Void;
  /**
    
     Processes arguments passed to {@see wp_die()} consistently for its handlers.
    
     @since 5.1.0
     @access private
    
     @param string       $message Error message.
     @param string       $title   Optional. Error title. Default empty.
     @param string|array $args    Optional. Arguments to control behavior. Default empty array.
     @return array List of processed $message string, $title string, and $args array.
    
  **/
  public function _wp_die_process_input(message:String, title:String = '', ?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):php.NativeArray;
  /**
    
     Encode a variable into JSON, with some sanity checks.
    
     @since 4.1.0
    
     @param mixed $data    Variable (usually an array or object) to encode as JSON.
     @param int   $options Optional. Options to be passed to json_encode(). Default 0.
     @param int   $depth   Optional. Maximum depth to walk through $data. Must be
                           greater than 0. Default 512.
     @return string|false The JSON encoded string, or false if it cannot be encoded.
    
  **/
  public function wp_json_encode(data:Dynamic, options:Int = 0, depth:Int = 512):haxe.extern.EitherType<String, Bool>;
  /**
    
     Perform sanity checks on data that shall be encoded to JSON.
    
     @ignore
     @since 4.1.0
     @access private
    
     @see wp_json_encode()
    
     @param mixed $data  Variable (usually an array or object) to encode as JSON.
     @param int   $depth Maximum depth to walk through $data. Must be greater than 0.
     @return mixed The sanitized data that shall be encoded to JSON.
    
  **/
  public function _wp_json_sanity_check(data:Dynamic, depth:Int):Dynamic;
  /**
    
     Convert a string to UTF-8, so that it can be safely encoded to JSON.
    
     @ignore
     @since 4.1.0
     @access private
    
     @see _wp_json_sanity_check()
    
     @staticvar bool $use_mb
    
     @param string $string The string which is to be converted.
     @return string The checked string.
    
  **/
  public function _wp_json_convert_string(string:String):String;
  /**
    
     Prepares response data to be serialized to JSON.
    
     This supports the JsonSerializable interface for PHP 5.2-5.3 as well.
    
     @ignore
     @since 4.4.0
     @access private
    
     @param mixed $data Native representation.
     @return bool|int|float|null|string|array Data ready for `json_encode()`.
    
  **/
  public function _wp_json_prepare_data(data:Dynamic):haxe.extern.EitherType<Bool, haxe.extern.EitherType<Int, haxe.extern.EitherType<Int, haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>>>>;
  /**
    
     Send a JSON response back to an Ajax request.
    
     @since 3.5.0
     @since 4.7.0 The `$status_code` parameter was added.
    
     @param mixed $response    Variable (usually an array or object) to encode as JSON,
                               then print and die.
     @param int   $status_code The HTTP status code to output.
    
  **/
  public function wp_send_json(response:Dynamic, status_code:Int = null):Void;
  /**
    
     Send a JSON response back to an Ajax request, indicating success.
    
     @since 3.5.0
     @since 4.7.0 The `$status_code` parameter was added.
    
     @param mixed $data        Data to encode as JSON, then print and die.
     @param int   $status_code The HTTP status code to output.
    
  **/
  public function wp_send_json_success(data:Dynamic = null, status_code:Int = null):Void;
  /**
    
     Send a JSON response back to an Ajax request, indicating failure.
    
     If the `$data` parameter is a WP_Error object, the errors
     within the object are processed and output as an array of error
     codes and corresponding messages. All other types are output
     without further processing.
    
     @since 3.5.0
     @since 4.1.0 The `$data` parameter is now processed if a WP_Error object is passed in.
     @since 4.7.0 The `$status_code` parameter was added.
    
     @param mixed $data        Data to encode as JSON, then print and die.
     @param int   $status_code The HTTP status code to output.
    
  **/
  public function wp_send_json_error(data:Dynamic = null, status_code:Int = null):Void;
  /**
    
     Checks that a JSONP callback is a valid JavaScript callback.
    
     Only allows alphanumeric characters and the dot character in callback
     function names. This helps to mitigate XSS attacks caused by directly
     outputting user input.
    
     @since 4.6.0
    
     @param string $callback Supplied JSONP callback function.
     @return bool True if valid callback, otherwise false.
    
  **/
  public function wp_check_jsonp_callback(callback:String):Bool;
  /**
    
     Retrieve the WordPress home page URL.
    
     If the constant named 'WP_HOME' exists, then it will be used and returned
     by the function. This can be used to counter the redirection on your local
     development environment.
    
     @since 2.2.0
     @access private
    
     @see WP_HOME
    
     @param string $url URL for the home location.
     @return string Homepage location.
    
  **/
  public function _config_wp_home(url:String = ''):String;
  /**
    
     Retrieve the WordPress site URL.
    
     If the constant named 'WP_SITEURL' is defined, then the value in that
     constant will always be returned. This can be used for debugging a site
     on your localhost while not having to change the database to your URL.
    
     @since 2.2.0
     @access private
    
     @see WP_SITEURL
    
     @param string $url URL to set the WordPress site location.
     @return string The WordPress Site URL.
    
  **/
  public function _config_wp_siteurl(url:String = ''):String;
  /**
    
     Delete the fresh site option.
    
     @since 4.7.0
     @access private
    
  **/
  public function _delete_option_fresh_site():Void;
  /**
    
     Set the localized direction for MCE plugin.
    
     Will only set the direction to 'rtl', if the WordPress locale has
     the text direction set to 'rtl'.
    
     Fills in the 'directionality' setting, enables the 'directionality'
     plugin, and adds the 'ltr' button to 'toolbar1', formerly
     'theme_advanced_buttons1' array keys. These keys are then returned
     in the $mce_init (TinyMCE settings) array.
    
     @since 2.1.0
     @access private
    
     @param array $mce_init MCE settings array.
     @return array Direction set for 'rtl', if needed by locale.
    
  **/
  public function _mce_set_direction(mce_init:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Convert smiley code to the icon graphic file equivalent.
    
     You can turn off smilies, by going to the write setting screen and unchecking
     the box, or by setting 'use_smilies' option to false or removing the option.
    
     Plugins may override the default smiley list by setting the $wpsmiliestrans
     to an array, with the key the code the blogger types in and the value the
     image file.
    
     The $wp_smiliessearch global is for the regular expression and is set each
     time the function is called.
    
     The full list of smilies can be found in the function and won't be listed in
     the description. Probably should create a Codex page for it, so that it is
     available.
    
     @global array $wpsmiliestrans
     @global array $wp_smiliessearch
    
     @since 2.2.0
    
  **/
  public function smilies_init():Void;
  /**
    
     Merge user defined arguments into defaults array.
    
     This function is used throughout WordPress to allow for both string or array
     to be merged into another array.
    
     @since 2.2.0
     @since 2.3.0 `$args` can now also be an object.
    
     @param string|array|object $args     Value to merge with $defaults.
     @param array               $defaults Optional. Array that serves as the defaults. Default empty.
     @return array Merged user defined values with defaults.
    
  **/
  public function wp_parse_args(args:haxe.extern.EitherType<String, haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Dynamic>>, defaults:php.NativeStructArray<Dynamic> = ''):php.NativeArray;
  /**
    
     Cleans up an array, comma- or space-separated list of scalar values.
    
     @since 5.1.0
    
     @param array|string $list List of values.
     @return array Sanitized array of values.
    
  **/
  public function wp_parse_list(list:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):php.NativeArray;
  /**
    
     Clean up an array, comma- or space-separated list of IDs.
    
     @since 3.0.0
    
     @param array|string $list List of ids.
     @return array Sanitized array of IDs.
    
  **/
  public function wp_parse_id_list(list:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):php.NativeArray;
  /**
    
     Clean up an array, comma- or space-separated list of slugs.
    
     @since 4.7.0
    
     @param  array|string $list List of slugs.
     @return array Sanitized array of slugs.
    
  **/
  public function wp_parse_slug_list(list:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):php.NativeArray;
  /**
    
     Extract a slice of an array, given a list of keys.
    
     @since 3.1.0
    
     @param array $array The original array.
     @param array $keys  The list of keys.
     @return array The array slice.
    
  **/
  public function wp_array_slice_assoc(array:php.NativeStructArray<Dynamic>, keys:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Determines if the variable is a numeric-indexed array.
    
     @since 4.4.0
    
     @param mixed $data Variable to check.
     @return bool Whether the variable is a list.
    
  **/
  public function wp_is_numeric_array(data:Dynamic):Bool;
  /**
    
     Filters a list of objects, based on a set of key => value arguments.
    
     @since 3.0.0
     @since 4.7.0 Uses `WP_List_Util` class.
    
     @param array       $list     An array of objects to filter
     @param array       $args     Optional. An array of key => value arguments to match
                                  against each object. Default empty array.
     @param string      $operator Optional. The logical operation to perform. 'or' means
                                  only one element from the array needs to match; 'and'
                                  means all elements must match; 'not' means no elements may
                                  match. Default 'and'.
     @param bool|string $field    A field from the object to place instead of the entire object.
                                  Default false.
     @return array A list of objects or object fields.
    
  **/
  public function wp_filter_object_list(list:php.NativeStructArray<Dynamic>, ?args:php.NativeStructArray<Dynamic>, operator_:String = 'and', field:haxe.extern.EitherType<Bool, String> = false):php.NativeArray;
  /**
    
     Filters a list of objects, based on a set of key => value arguments.
    
     @since 3.1.0
     @since 4.7.0 Uses `WP_List_Util` class.
    
     @param array  $list     An array of objects to filter.
     @param array  $args     Optional. An array of key => value arguments to match
                             against each object. Default empty array.
     @param string $operator Optional. The logical operation to perform. 'AND' means
                             all elements from the array must match. 'OR' means only
                             one element needs to match. 'NOT' means no elements may
                             match. Default 'AND'.
     @return array Array of found values.
    
  **/
  public function wp_list_filter(list:php.NativeStructArray<Dynamic>, ?args:php.NativeStructArray<Dynamic>, ?operator_:String):php.NativeArray;
  /**
    
     Pluck a certain field out of each object in a list.
    
     This has the same functionality and prototype of
     array_column() (PHP 5.5) but also supports objects.
    
     @since 3.1.0
     @since 4.0.0 $index_key parameter added.
     @since 4.7.0 Uses `WP_List_Util` class.
    
     @param array      $list      List of objects or arrays
     @param int|string $field     Field from the object to place instead of the entire object
     @param int|string $index_key Optional. Field from the object to use as keys for the new array.
                                  Default null.
     @return array Array of found values. If `$index_key` is set, an array of found values with keys
                   corresponding to `$index_key`. If `$index_key` is null, array keys from the original
                   `$list` will be preserved in the results.
    
  **/
  public function wp_list_pluck(list:php.NativeStructArray<Dynamic>, field:haxe.extern.EitherType<Int, String>, index_key:haxe.extern.EitherType<Int, String> = null):php.NativeArray;
  /**
    
     Sorts a list of objects, based on one or more orderby arguments.
    
     @since 4.7.0
    
     @param array        $list          An array of objects to sort.
     @param string|array $orderby       Optional. Either the field name to order by or an array
                                        of multiple orderby fields as $orderby => $order.
     @param string       $order         Optional. Either 'ASC' or 'DESC'. Only used if $orderby
                                        is a string.
     @param bool         $preserve_keys Optional. Whether to preserve keys. Default false.
     @return array The sorted array.
    
  **/
  public function wp_list_sort(list:php.NativeStructArray<Dynamic>, ?orderby:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, ?order:String, preserve_keys:Bool = false):php.NativeArray;
  /**
    
     Determines if Widgets library should be loaded.
    
     Checks to make sure that the widgets library hasn't already been loaded.
     If it hasn't, then it will load the widgets library and run an action hook.
    
     @since 2.2.0
    
  **/
  public function wp_maybe_load_widgets():Void;
  /**
    
     Append the Widgets menu to the themes main menu.
    
     @since 2.2.0
    
     @global array $submenu
    
  **/
  public function wp_widgets_add_menu():Void;
  /**
    
     Flush all output buffers for PHP 5.2.
    
     Make sure all output buffers are flushed before our singletons are destroyed.
    
     @since 2.2.0
    
  **/
  public function wp_ob_end_flush_all():Void;
  /**
    
     Load custom DB error or display WordPress DB error.
    
     If a file exists in the wp-content directory named db-error.php, then it will
     be loaded instead of displaying the WordPress DB error. If it is not found,
     then the WordPress DB error will be displayed instead.
    
     The WordPress DB error sets the HTTP status header to 500 to try to prevent
     search engines from caching the message. Custom DB messages should do the
     same.
    
     This function was backported to WordPress 2.3.2, but originally was added
     in WordPress 2.5.0.
    
     @since 2.3.2
    
     @global wpdb $wpdb WordPress database abstraction object.
    
  **/
  public function dead_db():Void;
  /**
    
     Convert a value to non-negative integer.
    
     @since 2.5.0
    
     @param mixed $maybeint Data you wish to have converted to a non-negative integer.
     @return int A non-negative integer.
    
  **/
  public function absint(maybeint:Dynamic):Int;
  /**
    
     Mark a function as deprecated and inform when it has been used.
    
     There is a {@see 'hook deprecated_function_run'} that will be called that can be used
     to get the backtrace up to what file and function called the deprecated
     function.
    
     The current behavior is to trigger a user error if `WP_DEBUG` is true.
    
     This function is to be used in every function that is deprecated.
    
     @since 2.5.0
     @access private
    
     @param string $function    The function that was called.
     @param string $version     The version of WordPress that deprecated the function.
     @param string $replacement Optional. The function that should have been called. Default null.
    
  **/
  public function _deprecated_function(function_:String, version:String, replacement:String = null):Void;
  /**
    
     Marks a constructor as deprecated and informs when it has been used.
    
     Similar to _deprecated_function(), but with different strings. Used to
     remove PHP4 style constructors.
    
     The current behavior is to trigger a user error if `WP_DEBUG` is true.
    
     This function is to be used in every PHP4 style constructor method that is deprecated.
    
     @since 4.3.0
     @since 4.5.0 Added the `$parent_class` parameter.
    
     @access private
    
     @param string $class        The class containing the deprecated constructor.
     @param string $version      The version of WordPress that deprecated the function.
     @param string $parent_class Optional. The parent class calling the deprecated constructor.
                                 Default empty string.
    
  **/
  public function _deprecated_constructor(class_:String, version:String, parent_class:String = ''):Void;
  /**
    
     Mark a file as deprecated and inform when it has been used.
    
     There is a hook {@see 'deprecated_file_included'} that will be called that can be used
     to get the backtrace up to what file and function included the deprecated
     file.
    
     The current behavior is to trigger a user error if `WP_DEBUG` is true.
    
     This function is to be used in every file that is deprecated.
    
     @since 2.5.0
     @access private
    
     @param string $file        The file that was included.
     @param string $version     The version of WordPress that deprecated the file.
     @param string $replacement Optional. The file that should have been included based on ABSPATH.
                                Default null.
     @param string $message     Optional. A message regarding the change. Default empty.
    
  **/
  public function _deprecated_file(file:String, version:String, replacement:String = null, message:String = ''):Void;
  /**
    
     Mark a function argument as deprecated and inform when it has been used.
    
     This function is to be used whenever a deprecated function argument is used.
     Before this function is called, the argument must be checked for whether it was
     used by comparing it to its default value or evaluating whether it is empty.
     For example:
    
         if ( ! empty( $deprecated ) ) {
             _deprecated_argument( __FUNCTION__, '3.0.0' );
         }
    
     There is a hook deprecated_argument_run that will be called that can be used
     to get the backtrace up to what file and function used the deprecated
     argument.
    
     The current behavior is to trigger a user error if WP_DEBUG is true.
    
     @since 3.0.0
     @access private
    
     @param string $function The function that was called.
     @param string $version  The version of WordPress that deprecated the argument used.
     @param string $message  Optional. A message regarding the change. Default null.
    
  **/
  public function _deprecated_argument(function_:String, version:String, message:String = null):Void;
  /**
    
     Marks a deprecated action or filter hook as deprecated and throws a notice.
    
     Use the {@see 'deprecated_hook_run'} action to get the backtrace describing where
     the deprecated hook was called.
    
     Default behavior is to trigger a user error if `WP_DEBUG` is true.
    
     This function is called by the do_action_deprecated() and apply_filters_deprecated()
     functions, and so generally does not need to be called directly.
    
     @since 4.6.0
     @access private
    
     @param string $hook        The hook that was used.
     @param string $version     The version of WordPress that deprecated the hook.
     @param string $replacement Optional. The hook that should have been used.
     @param string $message     Optional. A message regarding the change.
    
  **/
  public function _deprecated_hook(hook:String, version:String, replacement:String = null, message:String = null):Void;
  /**
    
     Mark something as being incorrectly called.
    
     There is a hook {@see 'doing_it_wrong_run'} that will be called that can be used
     to get the backtrace up to what file and function called the deprecated
     function.
    
     The current behavior is to trigger a user error if `WP_DEBUG` is true.
    
     @since 3.1.0
     @access private
    
     @param string $function The function that was called.
     @param string $message  A message explaining what has been done incorrectly.
     @param string $version  The version of WordPress where the message was added.
    
  **/
  public function _doing_it_wrong(function_:String, message:String, version:String):Void;
  /**
    
     Is the server running earlier than 1.5.0 version of lighttpd?
    
     @since 2.5.0
    
     @return bool Whether the server is running lighttpd < 1.5.0.
    
  **/
  public function is_lighttpd_before_150():Bool;
  /**
    
     Does the specified module exist in the Apache config?
    
     @since 2.5.0
    
     @global bool $is_apache
    
     @param string $mod     The module, e.g. mod_rewrite.
     @param bool   $default Optional. The default return value if the module is not found. Default false.
     @return bool Whether the specified module is loaded.
    
  **/
  public function apache_mod_loaded(mod:String, default:Bool = false):Bool;
  /**
    
     Check if IIS 7+ supports pretty permalinks.
    
     @since 2.8.0
    
     @global bool $is_iis7
    
     @return bool Whether IIS7 supports permalinks.
    
  **/
  public function iis7_supports_permalinks():Bool;
  /**
    
     Validates a file name and path against an allowed set of rules.
    
     A return value of `1` means the file path contains directory traversal.
    
     A return value of `2` means the file path contains a Windows drive path.
    
     A return value of `3` means the file is not in the allowed files list.
    
     @since 1.2.0
    
     @param string $file          File path.
     @param array  $allowed_files Optional. List of allowed files.
     @return int 0 means nothing is wrong, greater than 0 means something was wrong.
    
  **/
  public function validate_file(file:String, ?allowed_files:php.NativeStructArray<Dynamic>):Int;
  /**
    
     Whether to force SSL used for the Administration Screens.
    
     @since 2.6.0
    
     @staticvar bool $forced
    
     @param string|bool $force Optional. Whether to force SSL in admin screens. Default null.
     @return bool True if forced, false if not forced.
    
  **/
  public function force_ssl_admin(force:haxe.extern.EitherType<String, Bool> = null):Bool;
  /**
    
     Guess the URL for the site.
    
     Will remove wp-admin links to retrieve only return URLs not in the wp-admin
     directory.
    
     @since 2.6.0
    
     @return string The guessed URL.
    
  **/
  public function wp_guess_url():String;
  /**
    
     Temporarily suspend cache additions.
    
     Stops more data being added to the cache, but still allows cache retrieval.
     This is useful for actions, such as imports, when a lot of data would otherwise
     be almost uselessly added to the cache.
    
     Suspension lasts for a single page load at most. Remember to call this
     function again if you wish to re-enable cache adds earlier.
    
     @since 3.3.0
    
     @staticvar bool $_suspend
    
     @param bool $suspend Optional. Suspends additions if true, re-enables them if false.
     @return bool The current suspend setting
    
  **/
  public function wp_suspend_cache_addition(suspend:Bool = null):Bool;
  /**
    
     Suspend cache invalidation.
    
     Turns cache invalidation on and off. Useful during imports where you don't want to do
     invalidations every time a post is inserted. Callers must be sure that what they are
     doing won't lead to an inconsistent cache when invalidation is suspended.
    
     @since 2.7.0
    
     @global bool $_wp_suspend_cache_invalidation
    
     @param bool $suspend Optional. Whether to suspend or enable cache invalidation. Default true.
     @return bool The current suspend setting.
    
  **/
  public function wp_suspend_cache_invalidation(suspend:Bool = true):Bool;
  /**
    
     Determine whether a site is the main site of the current network.
    
     @since 3.0.0
     @since 4.9.0 The `$network_id` parameter was added.
    
     @param int $site_id    Optional. Site ID to test. Defaults to current site.
     @param int $network_id Optional. Network ID of the network to check for.
                            Defaults to current network.
     @return bool True if $site_id is the main site of the network, or if not
                  running Multisite.
    
  **/
  public function is_main_site(site_id:Int = null, network_id:Int = null):Bool;
  /**
    
     Gets the main site ID.
    
     @since 4.9.0
    
     @param int $network_id Optional. The ID of the network for which to get the main site.
                            Defaults to the current network.
     @return int The ID of the main site.
    
  **/
  public function get_main_site_id(network_id:Int = null):Int;
  /**
    
     Determine whether a network is the main network of the Multisite installation.
    
     @since 3.7.0
    
     @param int $network_id Optional. Network ID to test. Defaults to current network.
     @return bool True if $network_id is the main network, or if not running Multisite.
    
  **/
  public function is_main_network(network_id:Int = null):Bool;
  /**
    
     Get the main network ID.
    
     @since 4.3.0
    
     @return int The ID of the main network.
    
  **/
  public function get_main_network_id():Int;
  /**
    
     Determine whether global terms are enabled.
    
     @since 3.0.0
    
     @staticvar bool $global_terms
    
     @return bool True if multisite and global terms enabled.
    
  **/
  public function global_terms_enabled():Bool;
  /**
    
     Determines whether site meta is enabled.
    
     This function checks whether the 'blogmeta' database table exists. The result is saved as
     a setting for the main network, making it essentially a global setting. Subsequent requests
     will refer to this setting instead of running the query.
    
     @since 5.1.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @return bool True if site meta is supported, false otherwise.
    
  **/
  public function is_site_meta_supported():Bool;
  /**
    
     gmt_offset modification for smart timezone handling.
    
     Overrides the gmt_offset option if we have a timezone_string available.
    
     @since 2.8.0
    
     @return float|false Timezone GMT offset, false otherwise.
    
  **/
  public function wp_timezone_override_offset():haxe.extern.EitherType<Int, Bool>;
  /**
    
     Sort-helper for timezones.
    
     @since 2.9.0
     @access private
    
     @param array $a
     @param array $b
     @return int
    
  **/
  public function _wp_timezone_choice_usort_callback(a:php.NativeStructArray<Dynamic>, b:php.NativeStructArray<Dynamic>):Int;
  /**
    
     Gives a nicely-formatted list of timezone strings.
    
     @since 2.9.0
     @since 4.7.0 Added the `$locale` parameter.
    
     @staticvar bool $mo_loaded
     @staticvar string $locale_loaded
    
     @param string $selected_zone Selected timezone.
     @param string $locale        Optional. Locale to load the timezones in. Default current site locale.
     @return string
    
  **/
  public function wp_timezone_choice(selected_zone:String, locale:String = null):String;
  /**
    
     Strip close comment and close php tags from file headers used by WP.
    
     @since 2.8.0
     @access private
    
     @see https://core.trac.wordpress.org/ticket/8497
    
     @param string $str Header comment to clean up.
     @return string
    
  **/
  public function _cleanup_header_comment(str:String):String;
  /**
    
     Permanently delete comments or posts of any type that have held a status
     of 'trash' for the number of days defined in EMPTY_TRASH_DAYS.
    
     The default value of `EMPTY_TRASH_DAYS` is 30 (days).
    
     @since 2.9.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
  **/
  public function wp_scheduled_delete():Void;
  /**
    
     Retrieve metadata from a file.
    
     Searches for metadata in the first 8kiB of a file, such as a plugin or theme.
     Each piece of metadata must be on its own line. Fields can not span multiple
     lines, the value will get cut at the end of the first line.
    
     If the file data is not within that first 8kiB, then the author should correct
     their plugin file and move the data headers to the top.
    
     @link https://codex.wordpress.org/File_Header
    
     @since 2.9.0
    
     @param string $file            Absolute path to the file.
     @param array  $default_headers List of headers, in the format `array('HeaderKey' => 'Header Name')`.
     @param string $context         Optional. If specified adds filter hook {@see 'extra_$context_headers'}.
                                    Default empty.
     @return array Array of file headers in `HeaderKey => Header Value` format.
    
  **/
  public function get_file_data(file:String, default_headers:php.NativeStructArray<Dynamic>, context:String = ''):php.NativeArray;
  /**
    
     Returns true.
    
     Useful for returning true to filters easily.
    
     @since 3.0.0
    
     @see __return_false()
    
     @return true True.
    
  **/
  public function __return_true():Bool;
  /**
    
     Returns false.
    
     Useful for returning false to filters easily.
    
     @since 3.0.0
    
     @see __return_true()
    
     @return false False.
    
  **/
  public function __return_false():Bool;
  /**
    
     Returns 0.
    
     Useful for returning 0 to filters easily.
    
     @since 3.0.0
    
     @return int 0.
    
  **/
  public function __return_zero():Int;
  /**
    
     Returns an empty array.
    
     Useful for returning an empty array to filters easily.
    
     @since 3.0.0
    
     @return array Empty array.
    
  **/
  public function __return_empty_array():php.NativeArray;
  /**
    
     Returns null.
    
     Useful for returning null to filters easily.
    
     @since 3.4.0
    
     @return null Null value.
    
  **/
  public function __return_null():Void;
  /**
    
     Returns an empty string.
    
     Useful for returning an empty string to filters easily.
    
     @since 3.7.0
    
     @see __return_null()
    
     @return string Empty string.
    
  **/
  public function __return_empty_string():String;
  /**
    
     Send a HTTP header to disable content type sniffing in browsers which support it.
    
     @since 3.0.0
    
     @see https://blogs.msdn.com/ie/archive/2008/07/02/ie8-security-part-v-comprehensive-protection.aspx
     @see https://src.chromium.org/viewvc/chrome?view=rev&revision=6985
    
  **/
  public function send_nosniff_header():Void;
  /**
    
     Return a MySQL expression for selecting the week number based on the start_of_week option.
    
     @ignore
     @since 3.0.0
    
     @param string $column Database column.
     @return string SQL clause.
    
  **/
  public function _wp_mysql_week(column:String):String;
  /**
    
     Find hierarchy loops using a callback function that maps object IDs to parent IDs.
    
     @since 3.1.0
     @access private
    
     @param callable $callback      Function that accepts ( ID, $callback_args ) and outputs parent_ID.
     @param int      $start         The ID to start the loop check at.
     @param int      $start_parent  The parent_ID of $start to use instead of calling $callback( $start ).
                                    Use null to always use $callback
     @param array    $callback_args Optional. Additional arguments to send to $callback.
     @return array IDs of all members of loop.
    
  **/
  public function wp_find_hierarchy_loop(callback:Dynamic, start:Int, start_parent:Int, ?callback_args:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Use the "The Tortoise and the Hare" algorithm to detect loops.
    
     For every step of the algorithm, the hare takes two steps and the tortoise one.
     If the hare ever laps the tortoise, there must be a loop.
    
     @since 3.1.0
     @access private
    
     @param callable $callback      Function that accepts ( ID, callback_arg, ... ) and outputs parent_ID.
     @param int      $start         The ID to start the loop check at.
     @param array    $override      Optional. An array of ( ID => parent_ID, ... ) to use instead of $callback.
                                    Default empty array.
     @param array    $callback_args Optional. Additional arguments to send to $callback. Default empty array.
     @param bool     $_return_loop  Optional. Return loop members or just detect presence of loop? Only set
                                    to true if you already know the given $start is part of a loop (otherwise
                                    the returned array might include branches). Default false.
     @return mixed Scalar ID of some arbitrary member of the loop, or array of IDs of all members of loop if
                   $_return_loop
    
  **/
  public function wp_find_hierarchy_loop_tortoise_hare(callback:Dynamic, start:Int, ?override:php.NativeStructArray<Dynamic>, ?callback_args:php.NativeStructArray<Dynamic>, _return_loop:Bool = false):Dynamic;
  /**
    
     Send a HTTP header to limit rendering of pages to same origin iframes.
    
     @since 3.1.3
    
     @see https://developer.mozilla.org/en/the_x-frame-options_response_header
    
  **/
  public function send_frame_options_header():Void;
  /**
    
     Retrieve a list of protocols to allow in HTML attributes.
    
     @since 3.3.0
     @since 4.3.0 Added 'webcal' to the protocols array.
     @since 4.7.0 Added 'urn' to the protocols array.
    
     @see wp_kses()
     @see esc_url()
    
     @staticvar array $protocols
    
     @return string[] Array of allowed protocols. Defaults to an array containing 'http', 'https',
                      'ftp', 'ftps', 'mailto', 'news', 'irc', 'gopher', 'nntp', 'feed', 'telnet',
                      'mms', 'rtsp', 'svn', 'tel', 'fax', 'xmpp', 'webcal', and 'urn'. This covers
                      all common link protocols, except for 'javascript' which should not be
                      allowed for untrusted users.
    
  **/
  public function wp_allowed_protocols():php.NativeIndexedArray<String>;
  /**
    
     Return a comma-separated string of functions that have been called to get
     to the current point in code.
    
     @since 3.4.0
    
     @see https://core.trac.wordpress.org/ticket/19589
    
     @staticvar array $truncate_paths Array of paths to truncate.
    
     @param string $ignore_class Optional. A class to ignore all function calls within - useful
                                 when you want to just give info about the callee. Default null.
     @param int    $skip_frames  Optional. A number of stack frames to skip - useful for unwinding
                                 back to the source of the issue. Default 0.
     @param bool   $pretty       Optional. Whether or not you want a comma separated string or raw
                                 array returned. Default true.
     @return string|array Either a string containing a reversed comma separated trace or an array
                          of individual calls.
    
  **/
  public function wp_debug_backtrace_summary(ignore_class:String = null, skip_frames:Int = 0, pretty:Bool = true):haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>;
  /**
    
     Retrieve IDs that are not already present in the cache.
    
     @since 3.4.0
     @access private
    
     @param int[]  $object_ids Array of IDs.
     @param string $cache_key  The cache bucket to check against.
     @return int[] Array of IDs not present in the cache.
    
  **/
  public function _get_non_cached_ids(object_ids:php.NativeIndexedArray<Int>, cache_key:String):php.NativeIndexedArray<Int>;
  /**
    
     Test if the current device has the capability to upload files.
    
     @since 3.4.0
     @access private
    
     @return bool Whether the device is able to upload files.
    
  **/
  public function _device_can_upload():Bool;
  /**
    
     Test if a given path is a stream URL
    
     @since 3.5.0
    
     @param string $path The resource path or URL.
     @return bool True if the path is a stream URL.
    
  **/
  public function wp_is_stream(path:String):Bool;
  /**
    
     Test if the supplied date is valid for the Gregorian calendar.
    
     @since 3.5.0
    
     @link https://secure.php.net/manual/en/function.checkdate.php
    
     @param  int    $month       Month number.
     @param  int    $day         Day number.
     @param  int    $year        Year number.
     @param  string $source_date The date to filter.
     @return bool True if valid date, false if not valid date.
    
  **/
  public function wp_checkdate(month:Int, day:Int, year:Int, source_date:String):Bool;
  /**
    
     Load the auth check for monitoring whether the user is still logged in.
    
     Can be disabled with remove_action( 'admin_enqueue_scripts', 'wp_auth_check_load' );
    
     This is disabled for certain screens where a login screen could cause an
     inconvenient interruption. A filter called {@see 'wp_auth_check_load'} can be used
     for fine-grained control.
    
     @since 3.6.0
    
  **/
  public function wp_auth_check_load():Void;
  /**
    
     Output the HTML that shows the wp-login dialog when the user is no longer logged in.
    
     @since 3.6.0
    
  **/
  public function wp_auth_check_html():Void;
  /**
    
     Check whether a user is still logged in, for the heartbeat.
    
     Send a result that shows a log-in box if the user is no longer logged in,
     or if their cookie is within the grace period.
    
     @since 3.6.0
    
     @global int $login_grace_period
    
     @param array $response  The Heartbeat response.
     @return array $response The Heartbeat response with 'wp-auth-check' value set.
    
  **/
  public function wp_auth_check(response:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Return RegEx body to liberally match an opening HTML tag.
    
     Matches an opening HTML tag that:
     1. Is self-closing or
     2. Has no body but has a closing tag of the same name or
     3. Contains a body and a closing tag of the same name
    
     Note: this RegEx does not balance inner tags and does not attempt
     to produce valid HTML
    
     @since 3.6.0
    
     @param string $tag An HTML tag name. Example: 'video'.
     @return string Tag RegEx.
    
  **/
  public function get_tag_regex(tag:String):String;
  /**
    
     Retrieve a canonical form of the provided charset appropriate for passing to PHP
     functions such as htmlspecialchars() and charset html attributes.
    
     @since 3.6.0
     @access private
    
     @see https://core.trac.wordpress.org/ticket/23688
    
     @param string $charset A charset name.
     @return string The canonical form of the charset.
    
  **/
  public function _canonical_charset(charset:String):String;
  /**
    
     Set the mbstring internal encoding to a binary safe encoding when func_overload
     is enabled.
    
     When mbstring.func_overload is in use for multi-byte encodings, the results from
     strlen() and similar functions respect the utf8 characters, causing binary data
     to return incorrect lengths.
    
     This function overrides the mbstring encoding to a binary-safe encoding, and
     resets it to the users expected encoding afterwards through the
     `reset_mbstring_encoding` function.
    
     It is safe to recursively call this function, however each
     `mbstring_binary_safe_encoding()` call must be followed up with an equal number
     of `reset_mbstring_encoding()` calls.
    
     @since 3.7.0
    
     @see reset_mbstring_encoding()
    
     @staticvar array $encodings
     @staticvar bool  $overloaded
    
     @param bool $reset Optional. Whether to reset the encoding back to a previously-set encoding.
                        Default false.
    
  **/
  public function mbstring_binary_safe_encoding(reset:Bool = false):Void;
  /**
    
     Reset the mbstring internal encoding to a users previously set encoding.
    
     @see mbstring_binary_safe_encoding()
    
     @since 3.7.0
    
  **/
  public function reset_mbstring_encoding():Void;
  /**
    
     Filter/validate a variable as a boolean.
    
     Alternative to `filter_var( $var, FILTER_VALIDATE_BOOLEAN )`.
    
     @since 4.0.0
    
     @param mixed $var Boolean value to validate.
     @return bool Whether the value is validated.
    
  **/
  public function wp_validate_boolean(var_:Dynamic):Bool;
  /**
    
     Delete a file
    
     @since 4.2.0
    
     @param string $file The path to the file to delete.
    
  **/
  public function wp_delete_file(file:String):Void;
  /**
    
     Deletes a file if its path is within the given directory.
    
     @since 4.9.7
    
     @param string $file      Absolute path to the file to delete.
     @param string $directory Absolute path to a directory.
     @return bool True on success, false on failure.
    
  **/
  public function wp_delete_file_from_directory(file:String, directory:String):Bool;
  /**
    
     Outputs a small JS snippet on preview tabs/windows to remove `window.name` on unload.
    
     This prevents reusing the same tab for a preview when the user has navigated away.
    
     @since 4.3.0
    
     @global WP_Post $post
    
  **/
  public function wp_post_preview_js():Void;
  /**
    
     Parses and formats a MySQL datetime (Y-m-d H:i:s) for ISO8601 (Y-m-d\TH:i:s).
    
     Explicitly strips timezones, as datetimes are not saved with any timezone
     information. Including any information on the offset could be misleading.
    
     Despite historical function name, the output does not conform to RFC3339 format,
     which must contain timezone.
    
     @since 4.4.0
    
     @param string $date_string Date string to parse and format.
     @return string Date formatted for ISO8601 without time zone.
    
  **/
  public function mysql_to_rfc3339(date_string:String):String;
  /**
    
     Attempts to raise the PHP memory limit for memory intensive processes.
    
     Only allows raising the existing limit and prevents lowering it.
    
     @since 4.6.0
    
     @param string $context Optional. Context in which the function is called. Accepts either 'admin',
                            'image', or an arbitrary other context. If an arbitrary context is passed,
                            the similarly arbitrary {@see '{$context}_memory_limit'} filter will be
                            invoked. Default 'admin'.
     @return bool|int|string The limit that was set or false on failure.
    
  **/
  public function wp_raise_memory_limit(context:String = 'admin'):haxe.extern.EitherType<Bool, haxe.extern.EitherType<Int, String>>;
  /**
    
     Generate a random UUID (version 4).
    
     @since 4.7.0
    
     @return string UUID.
    
  **/
  public function wp_generate_uuid4():String;
  /**
    
     Validates that a UUID is valid.
    
     @since 4.9.0
    
     @param mixed $uuid    UUID to check.
     @param int   $version Specify which version of UUID to check against. Default is none,
                           to accept any UUID version. Otherwise, only version allowed is `4`.
     @return bool The string is a valid UUID or false on failure.
    
  **/
  public function wp_is_uuid(uuid:Dynamic, version:Int = null):Bool;
  /**
    
     Get unique ID.
    
     This is a PHP implementation of Underscore's uniqueId method. A static variable
     contains an integer that is incremented with each call. This number is returned
     with the optional prefix. As such the returned value is not universally unique,
     but it is unique across the life of the PHP process.
    
     @since 5.0.3
    
     @staticvar int $id_counter
    
     @param string $prefix Prefix for the returned ID.
     @return string Unique ID.
    
  **/
  public function wp_unique_id(prefix:String = ''):String;
  /**
    
     Get last changed date for the specified cache group.
    
     @since 4.7.0
    
     @param string $group Where the cache contents are grouped.
    
     @return string $last_changed UNIX timestamp with microseconds representing when the group was last changed.
    
  **/
  public function wp_cache_get_last_changed(group:String):String;
  /**
    
     Send an email to the old site admin email address when the site admin email address changes.
    
     @since 4.9.0
    
     @param string $old_email   The old site admin email address.
     @param string $new_email   The new site admin email address.
     @param string $option_name The relevant database option name.
    
  **/
  public function wp_site_admin_email_change_notification(old_email:String, new_email:String, option_name:String):Void;
  /**
    
     Return an anonymized IPv4 or IPv6 address.
    
     @since 4.9.6 Abstracted from `WP_Community_Events::get_unsafe_client_ip()`.
    
     @param  string $ip_addr        The IPv4 or IPv6 address to be anonymized.
     @param  bool   $ipv6_fallback  Optional. Whether to return the original IPv6 address if the needed functions
                                    to anonymize it are not present. Default false, return `::` (unspecified address).
     @return string  The anonymized IP address.
    
  **/
  public function wp_privacy_anonymize_ip(ip_addr:String, ipv6_fallback:Bool = false):String;
  /**
    
     Return uniform "anonymous" data by type.
    
     @since 4.9.6
    
     @param  string $type The type of data to be anonymized.
     @param  string $data Optional The data to be anonymized.
     @return string The anonymous data for the requested type.
    
  **/
  public function wp_privacy_anonymize_data(type:String, data:String = ''):String;
  /**
    
     Returns the directory used to store personal data export files.
    
     @since 4.9.6
    
     @see wp_privacy_exports_url
    
     @return string Exports directory.
    
  **/
  public function wp_privacy_exports_dir():String;
  /**
    
     Returns the URL of the directory used to store personal data export files.
    
     @since 4.9.6
    
     @see wp_privacy_exports_dir
    
     @return string Exports directory URL.
    
  **/
  public function wp_privacy_exports_url():String;
  /**
    
     Schedule a `WP_Cron` job to delete expired export files.
    
     @since 4.9.6
    
  **/
  public function wp_schedule_delete_old_privacy_export_files():Void;
  /**
    
     Cleans up export files older than three days old.
    
     The export files are stored in `wp-content/uploads`, and are therefore publicly
     accessible. A CSPRN is appended to the filename to mitigate the risk of an
     unauthorized person downloading the file, but it is still possible. Deleting
     the file after the data subject has had a chance to delete it adds an additional
     layer of protection.
    
     @since 4.9.6
    
  **/
  public function wp_privacy_delete_old_export_files():Void;
  /**
    
     Gets the URL to learn more about updating the PHP version the site is running on.
    
     This URL can be overridden by specifying an environment variable `WP_UPDATE_PHP_URL` or by using the
     {@see 'wp_update_php_url'} filter. Providing an empty string is not allowed and will result in the
     default URL being used. Furthermore the page the URL links to should preferably be localized in the
     site language.
    
     @since 5.1.0
    
     @return string URL to learn more about updating PHP.
    
  **/
  public function wp_get_update_php_url():String;
  /**
    
     Gets the default URL to learn more about updating the PHP version the site is running on.
    
     Do not use this function to retrieve this URL. Instead, use {@see wp_get_update_php_url()} when relying on the URL.
     This function does not allow modifying the returned URL, and is only used to compare the actually used URL with the
     default one.
    
     @since 5.1.0
     @access private
    
     @return string Default URL to learn more about updating PHP.
    
  **/
  public function wp_get_default_update_php_url():String;
  /**
    
     Prints the default annotation for the web host altering the "Update PHP" page URL.
    
     This function is to be used after {@see wp_get_update_php_url()} to display a consistent
     annotation if the web host has altered the default "Update PHP" page URL.
    
     @since 5.1.0
    
  **/
  public function wp_update_php_annotation():Void;
  /**
    
     Gets the URL for directly updating the PHP version the site is running on.
    
     A URL will only be returned if the `WP_DIRECT_UPDATE_PHP_URL` environment variable is specified or
     by using the {@see 'wp_direct_php_update_url'} filter. This allows hosts to send users directly to
     the page where they can update PHP to a newer version.
    
     @since 5.1.1
    
     @return string URL for directly updating PHP or empty string.
    
  **/
  public function wp_get_direct_php_update_url():String;
  /**
    
     Display a button directly linking to a PHP update process.
    
     This provides hosts with a way for users to be sent directly to their PHP update process.
    
     The button is only displayed if a URL is returned by `wp_get_direct_php_update_url()`.
    
     @since 5.1.1
    
  **/
  public function wp_direct_php_update_button():Void;
}
