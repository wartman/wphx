package wp.extern;

@:native("WP_Comment_Query")
extern class CommentQuery {
  /**
    
     SQL for database query.
    
     @since 4.0.1
     @var string
    
  **/
  @:native("request") public var request:String;
  /**
    
     Metadata query container
    
     @since 3.5.0
     @var object WP_Meta_Query
    
  **/
  @:native("meta_query") public var metaQuery:Dynamic;
  /**
    
     Date query container
    
     @since 3.7.0
     @var object WP_Date_Query
    
  **/
  @:native("date_query") public var dateQuery:Dynamic;
  /**
    
     Query vars set by the user.
    
     @since 3.1.0
     @var array
    
  **/
  @:native("query_vars") public var queryVars:php.NativeStructArray<Dynamic>;
  /**
    
     Default values for query vars.
    
     @since 4.2.0
     @var array
    
  **/
  @:native("query_var_defaults") public var queryVarDefaults:php.NativeStructArray<Dynamic>;
  /**
    
     List of comments located by the query.
    
     @since 4.0.0
     @var array
    
  **/
  @:native("comments") public var comments:php.NativeStructArray<Dynamic>;
  /**
    
     The amount of found comments for the current query.
    
     @since 4.4.0
     @var int
    
  **/
  @:native("found_comments") public var foundComments:Int;
  /**
    
     The number of pages.
    
     @since 4.4.0
     @var int
    
  **/
  @:native("max_num_pages") public var maxNumPages:Int;
  /**
    
     Make private/protected methods readable for backward compatibility.
    
     @since 4.0.0
    
     @param string   $name      Method to call.
     @param array    $arguments Arguments to pass when calling.
     @return mixed|false Return value of the callback, false otherwise.
    
  **/
  @:native("__call") public function __call(name:String, arguments:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Dynamic, Bool>;
  /**
    
     Constructor.
    
     Sets up the comment query, based on the query vars passed.
    
     @since 4.2.0
     @since 4.4.0 `$parent__in` and `$parent__not_in` were added.
     @since 4.4.0 Order by `comment__in` was added. `$update_comment_meta_cache`, `$no_found_rows`,
                  `$hierarchical`, and `$update_comment_post_cache` were added.
     @since 4.5.0 Introduced the `$author_url` argument.
     @since 4.6.0 Introduced the `$cache_domain` argument.
     @since 4.9.0 Introduced the `$paged` argument.
    
     @param string|array $query {
         Optional. Array or query string of comment query parameters. Default empty.
    
         @type string       $author_email              Comment author email address. Default empty.
         @type string       $author_url                Comment author URL. Default empty.
         @type array        $author__in                Array of author IDs to include comments for. Default empty.
         @type array        $author__not_in            Array of author IDs to exclude comments for. Default empty.
         @type array        $comment__in               Array of comment IDs to include. Default empty.
         @type array        $comment__not_in           Array of comment IDs to exclude. Default empty.
         @type bool         $count                     Whether to return a comment count (true) or array of
                                                       comment objects (false). Default false.
         @type array        $date_query                Date query clauses to limit comments by. See WP_Date_Query.
                                                       Default null.
         @type string       $fields                    Comment fields to return. Accepts 'ids' for comment IDs
                                                       only or empty for all fields. Default empty.
         @type int          $ID                        Currently unused.
         @type array        $include_unapproved        Array of IDs or email addresses of users whose unapproved
                                                       comments will be returned by the query regardless of
                                                       `$status`. Default empty.
         @type int          $karma                     Karma score to retrieve matching comments for.
                                                       Default empty.
         @type string       $meta_key                  Include comments with a matching comment meta key.
                                                       Default empty.
         @type string       $meta_value                Include comments with a matching comment meta value.
                                                       Requires `$meta_key` to be set. Default empty.
         @type array        $meta_query                Meta query clauses to limit retrieved comments by.
                                                       See WP_Meta_Query. Default empty.
         @type int          $number                    Maximum number of comments to retrieve.
                                                       Default empty (no limit).
         @type int          $paged                     When used with $number, defines the page of results to return.
                                                       When used with $offset, $offset takes precedence. Default 1.
         @type int          $offset                    Number of comments to offset the query. Used to build
                                                       LIMIT clause. Default 0.
         @type bool         $no_found_rows             Whether to disable the `SQL_CALC_FOUND_ROWS` query.
                                                       Default: true.
         @type string|array $orderby                   Comment status or array of statuses. To use 'meta_value'
                                                       or 'meta_value_num', `$meta_key` must also be defined.
                                                       To sort by a specific `$meta_query` clause, use that
                                                       clause's array key. Accepts 'comment_agent',
                                                       'comment_approved', 'comment_author',
                                                       'comment_author_email', 'comment_author_IP',
                                                       'comment_author_url', 'comment_content', 'comment_date',
                                                       'comment_date_gmt', 'comment_ID', 'comment_karma',
                                                       'comment_parent', 'comment_post_ID', 'comment_type',
                                                       'user_id', 'comment__in', 'meta_value', 'meta_value_num',
                                                       the value of $meta_key, and the array keys of
                                                       `$meta_query`. Also accepts false, an empty array, or
                                                       'none' to disable `ORDER BY` clause.
                                                       Default: 'comment_date_gmt'.
         @type string       $order                     How to order retrieved comments. Accepts 'ASC', 'DESC'.
                                                       Default: 'DESC'.
         @type int          $parent                    Parent ID of comment to retrieve children of.
                                                       Default empty.
         @type array        $parent__in                Array of parent IDs of comments to retrieve children for.
                                                       Default empty.
         @type array        $parent__not_in            Array of parent IDs of comments *not* to retrieve
                                                       children for. Default empty.
         @type array        $post_author__in           Array of author IDs to retrieve comments for.
                                                       Default empty.
         @type array        $post_author__not_in       Array of author IDs *not* to retrieve comments for.
                                                       Default empty.
         @type int          $post_ID                   Currently unused.
         @type int          $post_id                   Limit results to those affiliated with a given post ID.
                                                       Default 0.
         @type array        $post__in                  Array of post IDs to include affiliated comments for.
                                                       Default empty.
         @type array        $post__not_in              Array of post IDs to exclude affiliated comments for.
                                                       Default empty.
         @type int          $post_author               Post author ID to limit results by. Default empty.
         @type string|array $post_status               Post status or array of post statuses to retrieve
                                                       affiliated comments for. Pass 'any' to match any value.
                                                       Default empty.
         @type string       $post_type                 Post type or array of post types to retrieve affiliated
                                                       comments for. Pass 'any' to match any value. Default empty.
         @type string       $post_name                 Post name to retrieve affiliated comments for.
                                                       Default empty.
         @type int          $post_parent               Post parent ID to retrieve affiliated comments for.
                                                       Default empty.
         @type string       $search                    Search term(s) to retrieve matching comments for.
                                                       Default empty.
         @type string|array $status                    Comment stati to limit results by. Accepts an array
                                                       or space/comma-separated list of 'hold' (`comment_status=0`),
                                                       'approve' (`comment_status=1`), 'all', or a custom
                                                       comment status. Default 'all'.
         @type string|array $type                      Include comments of a given type, or array of types.
                                                       Accepts 'comment', 'pings' (includes 'pingback' and
                                                       'trackback'), or anycustom type string. Default empty.
         @type array        $type__in                  Include comments from a given array of comment types.
                                                       Default empty.
         @type array        $type__not_in              Exclude comments from a given array of comment types.
                                                       Default empty.
         @type int          $user_id                   Include comments for a specific user ID. Default empty.
         @type bool|string  $hierarchical              Whether to include comment descendants in the results.
                                                       'threaded' returns a tree, with each comment's children
                                                       stored in a `children` property on the `WP_Comment`
                                                       object. 'flat' returns a flat array of found comments plus
                                                       their children. Pass `false` to leave out descendants.
                                                       The parameter is ignored (forced to `false`) when
                                                       `$fields` is 'ids' or 'counts'. Accepts 'threaded',
                                                       'flat', or false. Default: false.
         @type string       $cache_domain              Unique cache key to be produced when this query is stored in
                                                       an object cache. Default is 'core'.
         @type bool         $update_comment_meta_cache Whether to prime the metadata cache for found comments.
                                                       Default true.
         @type bool         $update_comment_post_cache Whether to prime the cache for comment posts.
                                                       Default false.
     }
    
  **/
  public function new(query:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Void;
  /**
    
     Parse arguments passed to the comment query with default query parameters.
    
     @since 4.2.0 Extracted from WP_Comment_Query::query().
    
     @param string|array $query WP_Comment_Query arguments. See WP_Comment_Query::__construct()
    
  **/
  @:native("parse_query") public function parseQuery(query:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Void;
  /**
    
     Sets up the WordPress query for retrieving comments.
    
     @since 3.1.0
     @since 4.1.0 Introduced 'comment__in', 'comment__not_in', 'post_author__in',
                  'post_author__not_in', 'author__in', 'author__not_in', 'post__in',
                  'post__not_in', 'include_unapproved', 'type__in', and 'type__not_in'
                  arguments to $query_vars.
     @since 4.2.0 Moved parsing to WP_Comment_Query::parse_query().
    
     @param string|array $query Array or URL query string of parameters.
     @return array|int List of comments, or number of comments when 'count' is passed as a query var.
    
  **/
  @:native("query") public function query(query:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Int>;
  /**
    
     Get a list of comments matching the query vars.
    
     @since 4.2.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @return int|array List of comments or number of found comments if `$count` argument is true.
    
  **/
  @:native("get_comments") public function getComments():haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>>;
}
