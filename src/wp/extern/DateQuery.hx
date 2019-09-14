package wp.extern;

@:native("WP_Date_Query")
extern class DateQuery {
  /**
    
     Array of date queries.
    
     See WP_Date_Query::__construct() for information on date query arguments.
    
     @since 3.7.0
     @var array
    
  **/
  @:native("queries") public var queries:php.NativeStructArray<Dynamic>;
  /**
    
     The default relation between top-level queries. Can be either 'AND' or 'OR'.
    
     @since 3.7.0
     @var string
    
  **/
  @:native("relation") public var relation:String;
  /**
    
     The column to query against. Can be changed via the query arguments.
    
     @since 3.7.0
     @var string
    
  **/
  @:native("column") public var column:String;
  /**
    
     The value comparison operator. Can be changed via the query arguments.
    
     @since 3.7.0
     @var array
    
  **/
  @:native("compare") public var compare:php.NativeStructArray<Dynamic>;
  /**
    
     Supported time-related parameter keys.
    
     @since 4.1.0
     @var array
    
  **/
  @:native("time_keys") public var timeKeys:php.NativeStructArray<Dynamic>;
  /**
    
     Constructor.
    
     Time-related parameters that normally require integer values ('year', 'month', 'week', 'dayofyear', 'day',
     'dayofweek', 'dayofweek_iso', 'hour', 'minute', 'second') accept arrays of integers for some values of
     'compare'. When 'compare' is 'IN' or 'NOT IN', arrays are accepted; when 'compare' is 'BETWEEN' or 'NOT
     BETWEEN', arrays of two valid values are required. See individual argument descriptions for accepted values.
    
     @since 3.7.0
     @since 4.0.0 The $inclusive logic was updated to include all times within the date range.
     @since 4.1.0 Introduced 'dayofweek_iso' time type parameter.
    
     @param array $date_query {
         Array of date query clauses.
    
         @type array {
             @type string $column   Optional. The column to query against. If undefined, inherits the value of
                                    the `$default_column` parameter. Accepts 'post_date', 'post_date_gmt',
                                    'post_modified','post_modified_gmt', 'comment_date', 'comment_date_gmt'.
                                    Default 'post_date'.
             @type string $compare  Optional. The comparison operator. Accepts '=', '!=', '>', '>=', '<', '<=',
                                    'IN', 'NOT IN', 'BETWEEN', 'NOT BETWEEN'. Default '='.
             @type string $relation Optional. The boolean relationship between the date queries. Accepts 'OR' or 'AND'.
                                    Default 'OR'.
             @type array {
                 Optional. An array of first-order clause parameters, or another fully-formed date query.
    
                 @type string|array $before {
                     Optional. Date to retrieve posts before. Accepts `strtotime()`-compatible string,
                     or array of 'year', 'month', 'day' values.
    
                     @type string $year  The four-digit year. Default empty. Accepts any four-digit year.
                     @type string $month Optional when passing array.The month of the year.
                                         Default (string:empty)|(array:1). Accepts numbers 1-12.
                     @type string $day   Optional when passing array.The day of the month.
                                         Default (string:empty)|(array:1). Accepts numbers 1-31.
                 }
                 @type string|array $after {
                     Optional. Date to retrieve posts after. Accepts `strtotime()`-compatible string,
                     or array of 'year', 'month', 'day' values.
    
                     @type string $year  The four-digit year. Accepts any four-digit year. Default empty.
                     @type string $month Optional when passing array. The month of the year. Accepts numbers 1-12.
                                         Default (string:empty)|(array:12).
                     @type string $day   Optional when passing array.The day of the month. Accepts numbers 1-31.
                                         Default (string:empty)|(array:last day of month).
                 }
                 @type string       $column        Optional. Used to add a clause comparing a column other than the
                                                   column specified in the top-level `$column` parameter. Accepts
                                                   'post_date', 'post_date_gmt', 'post_modified', 'post_modified_gmt',
                                                   'comment_date', 'comment_date_gmt'. Default is the value of
                                                   top-level `$column`.
                 @type string       $compare       Optional. The comparison operator. Accepts '=', '!=', '>', '>=',
                                                   '<', '<=', 'IN', 'NOT IN', 'BETWEEN', 'NOT BETWEEN'. 'IN',
                                                   'NOT IN', 'BETWEEN', and 'NOT BETWEEN'. Comparisons support
                                                   arrays in some time-related parameters. Default '='.
                 @type bool         $inclusive     Optional. Include results from dates specified in 'before' or
                                                   'after'. Default false.
                 @type int|array    $year          Optional. The four-digit year number. Accepts any four-digit year
                                                   or an array of years if `$compare` supports it. Default empty.
                 @type int|array    $month         Optional. The two-digit month number. Accepts numbers 1-12 or an
                                                   array of valid numbers if `$compare` supports it. Default empty.
                 @type int|array    $week          Optional. The week number of the year. Accepts numbers 0-53 or an
                                                   array of valid numbers if `$compare` supports it. Default empty.
                 @type int|array    $dayofyear     Optional. The day number of the year. Accepts numbers 1-366 or an
                                                   array of valid numbers if `$compare` supports it.
                 @type int|array    $day           Optional. The day of the month. Accepts numbers 1-31 or an array
                                                   of valid numbers if `$compare` supports it. Default empty.
                 @type int|array    $dayofweek     Optional. The day number of the week. Accepts numbers 1-7 (1 is
                                                   Sunday) or an array of valid numbers if `$compare` supports it.
                                                   Default empty.
                 @type int|array    $dayofweek_iso Optional. The day number of the week (ISO). Accepts numbers 1-7
                                                   (1 is Monday) or an array of valid numbers if `$compare` supports it.
                                                   Default empty.
                 @type int|array    $hour          Optional. The hour of the day. Accepts numbers 0-23 or an array
                                                   of valid numbers if `$compare` supports it. Default empty.
                 @type int|array    $minute        Optional. The minute of the hour. Accepts numbers 0-60 or an array
                                                   of valid numbers if `$compare` supports it. Default empty.
                 @type int|array    $second        Optional. The second of the minute. Accepts numbers 0-60 or an
                                                   array of valid numbers if `$compare` supports it. Default empty.
             }
         }
     }
     @param string $default_column Optional. Default column to query against. Default 'post_date'.
                                   Accepts 'post_date', 'post_date_gmt', 'post_modified', 'post_modified_gmt',
                                   'comment_date', 'comment_date_gmt'.
    
  **/
  public function new(date_query:php.NativeStructArray<Dynamic>, default_column:String = 'post_date'):Void;
  /**
    
     Recursive-friendly query sanitizer.
    
     Ensures that each query-level clause has a 'relation' key, and that
     each first-order clause contains all the necessary keys from
     `$defaults`.
    
     @since 4.1.0
    
     @param array $queries
     @param array $parent_query
    
     @return array Sanitized queries.
    
  **/
  @:native("sanitize_query") public function sanitizeQuery(queries:php.NativeStructArray<Dynamic>, parent_query:php.NativeStructArray<Dynamic> = null):php.NativeArray;
  /**
    
     Determines and validates what comparison operator to use.
    
     @since 3.7.0
    
     @param array $query A date query or a date subquery.
     @return string The comparison operator.
    
  **/
  @:native("get_compare") public function getCompare(query:php.NativeStructArray<Dynamic>):String;
  /**
    
     Validates the given date_query values and triggers errors if something is not valid.
    
     Note that date queries with invalid date ranges are allowed to
     continue (though of course no items will be found for impossible dates).
     This method only generates debug notices for these cases.
    
     @since  4.1.0
    
     @param  array $date_query The date_query array.
     @return bool  True if all values in the query are valid, false if one or more fail.
    
  **/
  @:native("validate_date_values") public function validateDateValues(?date_query:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Validates a column name parameter.
    
     Column names without a table prefix (like 'post_date') are checked against a whitelist of
     known tables, and then, if found, have a table prefix (such as 'wp_posts.') prepended.
     Prefixed column names (such as 'wp_posts.post_date') bypass this whitelist check,
     and are only sanitized to remove illegal characters.
    
     @since 3.7.0
    
     @param string $column The user-supplied column name.
     @return string A validated column name value.
    
  **/
  @:native("validate_column") public function validateColumn(column:String):String;
  /**
    
     Generate WHERE clause to be appended to a main query.
    
     @since 3.7.0
    
     @return string MySQL WHERE clause.
    
  **/
  @:native("get_sql") public function getSql():String;
  /**
    
     Builds and validates a value string based on the comparison operator.
    
     @since 3.7.0
    
     @param string $compare The compare operator to use
     @param string|array $value The value
     @return string|false|int The value to be used in SQL or false on error.
    
  **/
  @:native("build_value") public function buildValue(compare:String, value:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<String, haxe.extern.EitherType<Bool, Int>>;
  /**
    
     Builds a MySQL format date/time based on some query parameters.
    
     You can pass an array of values (year, month, etc.) with missing parameter values being defaulted to
     either the maximum or minimum values (controlled by the $default_to parameter). Alternatively you can
     pass a string that will be run through strtotime().
    
     @since 3.7.0
    
     @param string|array $datetime       An array of parameters or a strotime() string
     @param bool         $default_to_max Whether to round up incomplete dates. Supported by values
                                         of $datetime that are arrays, or string values that are a
                                         subset of MySQL date format ('Y', 'Y-m', 'Y-m-d', 'Y-m-d H:i').
                                         Default: false.
     @return string|false A MySQL format date/time or false on failure
    
  **/
  @:native("build_mysql_datetime") public function buildMysqlDatetime(datetime:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, default_to_max:Bool = false):haxe.extern.EitherType<String, Bool>;
  /**
    
     Builds a query string for comparing time values (hour, minute, second).
    
     If just hour, minute, or second is set than a normal comparison will be done.
     However if multiple values are passed, a pseudo-decimal time will be created
     in order to be able to accurately compare against.
    
     @since 3.7.0
    
     @param string $column The column to query against. Needs to be pre-validated!
     @param string $compare The comparison operator. Needs to be pre-validated!
     @param int|null $hour Optional. An hour value (0-23).
     @param int|null $minute Optional. A minute value (0-59).
     @param int|null $second Optional. A second value (0-59).
     @return string|false A query part or false on failure.
    
  **/
  @:native("build_time_query") public function buildTimeQuery(column:String, compare:String, hour:Int = null, minute:Int = null, second:Int = null):haxe.extern.EitherType<String, Bool>;
}
