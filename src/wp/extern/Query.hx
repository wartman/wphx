package wp.extern;

@:native("WP_Query")
extern class Query {
  /**
    
     Query vars set by the user
    
     @since 1.5.0
     @var array
    
  **/
  @:native("query") public var query:php.NativeStructArray<Dynamic>;
  /**
    
     Query vars, after parsing
    
     @since 1.5.0
     @var array
    
  **/
  @:native("query_vars") public var vars:php.NativeStructArray<Dynamic>;
  /**
    
     Taxonomy query, as passed to get_tax_sql()
    
     @since 3.1.0
     @var object WP_Tax_Query
    
  **/
  @:native("tax_query") public var taxQuery:Dynamic;
  /**
    
     Metadata query container
    
     @since 3.2.0
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
    
     Holds the data for a single object that is queried.
    
     Holds the contents of a post, page, category, attachment.
    
     @since 1.5.0
     @var object|array
    
  **/
  @:native("queried_object") public var queriedObject:haxe.extern.EitherType<Dynamic, php.NativeStructArray<Dynamic>>;
  /**
    
     The ID of the queried object.
    
     @since 1.5.0
     @var int
    
  **/
  @:native("queried_object_id") public var queriedObjectId:Int;
  /**
    
     Get post database query.
    
     @since 2.0.1
     @var string
    
  **/
  @:native("request") public var request:String;
  /**
    
     List of posts.
    
     @since 1.5.0
     @var array
    
  **/
  @:native("posts") public var posts:php.NativeStructArray<Dynamic>;
  /**
    
     The amount of posts for the current query.
    
     @since 1.5.0
     @var int
    
  **/
  @:native("post_count") public var postCount:Int;
  /**
    
     Index of the current item in the loop.
    
     @since 1.5.0
     @var int
    
  **/
  @:native("current_post") public var currentPost:Int;
  /**
    
     Whether the loop has started and the caller is in the loop.
    
     @since 2.0.0
     @var bool
    
  **/
  @:native("in_the_loop") public var inTheLoop:Bool;
  /**
    
     The current post.
    
     @since 1.5.0
     @var WP_Post
    
  **/
  @:native("post") public var post:wp.extern.Post;
  /**
    
     The list of comments for current post.
    
     @since 2.2.0
     @var array
    
  **/
  @:native("comments") public var comments:php.NativeStructArray<Dynamic>;
  /**
    
     The amount of comments for the posts.
    
     @since 2.2.0
     @var int
    
  **/
  @:native("comment_count") public var commentCount:Int;
  /**
    
     The index of the comment in the comment loop.
    
     @since 2.2.0
     @var int
    
  **/
  @:native("current_comment") public var currentComment:Int;
  /**
    
     Current comment ID.
    
     @since 2.2.0
     @var int
    
  **/
  @:native("comment") public var comment:Int;
  /**
    
     The amount of found posts for the current query.
    
     If limit clause was not used, equals $post_count.
    
     @since 2.1.0
     @var int
    
  **/
  @:native("found_posts") public var foundPosts:Int;
  /**
    
     The amount of pages.
    
     @since 2.1.0
     @var int
    
  **/
  @:native("max_num_pages") public var maxNumPages:Int;
  /**
    
     The amount of comment pages.
    
     @since 2.7.0
     @var int
    
  **/
  @:native("max_num_comment_pages") public var maxNumCommentPages:Int;
  /**
    
     Signifies whether the current query is for a single post.
    
     @since 1.5.0
     @var bool
    
  **/
  @:native("is_single") public var isSingle:Bool;
  /**
    
     Signifies whether the current query is for a preview.
    
     @since 2.0.0
     @var bool
    
  **/
  @:native("is_preview") public var isPreview:Bool;
  /**
    
     Signifies whether the current query is for a page.
    
     @since 1.5.0
     @var bool
    
  **/
  @:native("is_page") public var isPage:Bool;
  /**
    
     Signifies whether the current query is for an archive.
    
     @since 1.5.0
     @var bool
    
  **/
  @:native("is_archive") public var isArchive:Bool;
  /**
    
     Signifies whether the current query is for a date archive.
    
     @since 1.5.0
     @var bool
    
  **/
  @:native("is_date") public var isDate:Bool;
  /**
    
     Signifies whether the current query is for a year archive.
    
     @since 1.5.0
     @var bool
    
  **/
  @:native("is_year") public var isYear:Bool;
  /**
    
     Signifies whether the current query is for a month archive.
    
     @since 1.5.0
     @var bool
    
  **/
  @:native("is_month") public var isMonth:Bool;
  /**
    
     Signifies whether the current query is for a day archive.
    
     @since 1.5.0
     @var bool
    
  **/
  @:native("is_day") public var isDay:Bool;
  /**
    
     Signifies whether the current query is for a specific time.
    
     @since 1.5.0
     @var bool
    
  **/
  @:native("is_time") public var isTime:Bool;
  /**
    
     Signifies whether the current query is for an author archive.
    
     @since 1.5.0
     @var bool
    
  **/
  @:native("is_author") public var isAuthor:Bool;
  /**
    
     Signifies whether the current query is for a category archive.
    
     @since 1.5.0
     @var bool
    
  **/
  @:native("is_category") public var isCategory:Bool;
  /**
    
     Signifies whether the current query is for a tag archive.
    
     @since 2.3.0
     @var bool
    
  **/
  @:native("is_tag") public var isTag:Bool;
  /**
    
     Signifies whether the current query is for a taxonomy archive.
    
     @since 2.5.0
     @var bool
    
  **/
  @:native("is_tax") public var isTax:Bool;
  /**
    
     Signifies whether the current query is for a search.
    
     @since 1.5.0
     @var bool
    
  **/
  @:native("is_search") public var isSearch:Bool;
  /**
    
     Signifies whether the current query is for a feed.
    
     @since 1.5.0
     @var bool
    
  **/
  @:native("is_feed") public var isFeed:Bool;
  /**
    
     Signifies whether the current query is for a comment feed.
    
     @since 2.2.0
     @var bool
    
  **/
  @:native("is_comment_feed") public var isCommentFeed:Bool;
  /**
    
     Signifies whether the current query is for trackback endpoint call.
    
     @since 1.5.0
     @var bool
    
  **/
  @:native("is_trackback") public var isTrackback:Bool;
  /**
    
     Signifies whether the current query is for the site homepage.
    
     @since 1.5.0
     @var bool
    
  **/
  @:native("is_home") public var isHome:Bool;
  /**
    
     Signifies whether the current query couldn't find anything.
    
     @since 1.5.0
     @var bool
    
  **/
  @:native("is_404") public var is404:Bool;
  /**
    
     Signifies whether the current query is for an embed.
    
     @since 4.4.0
     @var bool
    
  **/
  @:native("is_embed") public var isEmbed:Bool;
  /**
    
     Signifies whether the current query is for a paged result and not for the first page.
    
     @since 1.5.0
     @var bool
    
  **/
  @:native("is_paged") public var isPaged:Bool;
  /**
    
     Signifies whether the current query is for an administrative interface page.
    
     @since 1.5.0
     @var bool
    
  **/
  @:native("is_admin") public var isAdmin:Bool;
  /**
    
     Signifies whether the current query is for an attachment page.
    
     @since 2.0.0
     @var bool
    
  **/
  @:native("is_attachment") public var isAttachment:Bool;
  /**
    
     Signifies whether the current query is for an existing single post of any post type
     (post, attachment, page, custom post types).
    
     @since 2.1.0
     @var bool
    
  **/
  @:native("is_singular") public var isSingular:Bool;
  /**
    
     Signifies whether the current query is for the robots.txt file.
    
     @since 2.1.0
     @var bool
    
  **/
  @:native("is_robots") public var isRobots:Bool;
  /**
    
     Signifies whether the current query is for the page_for_posts page.
    
     Basically, the homepage if the option isn't set for the static homepage.
    
     @since 2.1.0
     @var bool
    
  **/
  @:native("is_posts_page") public var isPostsPage:Bool;
  /**
    
     Signifies whether the current query is for a post type archive.
    
     @since 3.1.0
     @var bool
    
  **/
  @:native("is_post_type_archive") public var isPostTypeArchive:Bool;
  /**
    
     Set if post thumbnails are cached
    
     @since 3.2.0
     @var bool
    
  **/
  @:native("thumbnails_cached") public var thumbnailsCached:Bool;
  /**
    
     Initiates object properties and sets default values.
    
     @since 1.5.0
    
  **/
  @:native("init") public function init():Void;
  /**
    
     Reparse the query vars.
    
     @since 1.5.0
    
  **/
  @:native("parse_query_vars") public function parseQueryVars():Void;
  /**
    
     Fills in the query variables, which do not exist within the parameter.
    
     @since 2.1.0
     @since 4.4.0 Removed the `comments_popup` public query variable.
    
     @param array $array Defined query variables.
     @return array Complete query variables with undefined ones filled in empty.
    
  **/
  @:native("fill_query_vars") public function fillQueryVars(array:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Parse a query string and set query type booleans.
    
     @since 1.5.0
     @since 4.2.0 Introduced the ability to order by specific clauses of a `$meta_query`, by passing the clause's
                  array key to `$orderby`.
     @since 4.4.0 Introduced `$post_name__in` and `$title` parameters. `$s` was updated to support excluded
                  search terms, by prepending a hyphen.
     @since 4.5.0 Removed the `$comments_popup` parameter.
                  Introduced the `$comment_status` and `$ping_status` parameters.
                  Introduced `RAND(x)` syntax for `$orderby`, which allows an integer seed value to random sorts.
     @since 4.6.0 Added 'post_name__in' support for `$orderby`. Introduced the `$lazy_load_term_meta` argument.
     @since 4.9.0 Introduced the `$comment_count` parameter.
     @since 5.1.0 Introduced the `$meta_compare_key` parameter.
    
     @param string|array $query {
         Optional. Array or string of Query parameters.
    
         @type int          $attachment_id           Attachment post ID. Used for 'attachment' post_type.
         @type int|string   $author                  Author ID, or comma-separated list of IDs.
         @type string       $author_name             User 'user_nicename'.
         @type array        $author__in              An array of author IDs to query from.
         @type array        $author__not_in          An array of author IDs not to query from.
         @type bool         $cache_results           Whether to cache post information. Default true.
         @type int|string   $cat                     Category ID or comma-separated list of IDs (this or any children).
         @type array        $category__and           An array of category IDs (AND in).
         @type array        $category__in            An array of category IDs (OR in, no children).
         @type array        $category__not_in        An array of category IDs (NOT in).
         @type string       $category_name           Use category slug (not name, this or any children).
         @type array|int    $comment_count           Filter results by comment count. Provide an integer to match
                                                     comment count exactly. Provide an array with integer 'value'
                                                     and 'compare' operator ('=', '!=', '>', '>=', '<', '<=' ) to
                                                     compare against comment_count in a specific way.
         @type string       $comment_status          Comment status.
         @type int          $comments_per_page       The number of comments to return per page.
                                                     Default 'comments_per_page' option.
         @type array        $date_query              An associative array of WP_Date_Query arguments.
                                                     See WP_Date_Query::__construct().
         @type int          $day                     Day of the month. Default empty. Accepts numbers 1-31.
         @type bool         $exact                   Whether to search by exact keyword. Default false.
         @type string|array $fields                  Which fields to return. Single field or all fields (string),
                                                     or array of fields. 'id=>parent' uses 'id' and 'post_parent'.
                                                     Default all fields. Accepts 'ids', 'id=>parent'.
         @type int          $hour                    Hour of the day. Default empty. Accepts numbers 0-23.
         @type int|bool     $ignore_sticky_posts     Whether to ignore sticky posts or not. Setting this to false
                                                     excludes stickies from 'post__in'. Accepts 1|true, 0|false.
                                                     Default 0|false.
         @type int          $m                       Combination YearMonth. Accepts any four-digit year and month
                                                     numbers 1-12. Default empty.
         @type string       $meta_compare            Comparison operator to test the 'meta_value'.
         @type string       $meta_compare_key        Comparison operator to test the 'meta_key'.
         @type string       $meta_key                Custom field key.
         @type array        $meta_query              An associative array of WP_Meta_Query arguments. See WP_Meta_Query.
         @type string       $meta_value              Custom field value.
         @type int          $meta_value_num          Custom field value number.
         @type int          $menu_order              The menu order of the posts.
         @type int          $monthnum                The two-digit month. Default empty. Accepts numbers 1-12.
         @type string       $name                    Post slug.
         @type bool         $nopaging                Show all posts (true) or paginate (false). Default false.
         @type bool         $no_found_rows           Whether to skip counting the total rows found. Enabling can improve
                                                     performance. Default false.
         @type int          $offset                  The number of posts to offset before retrieval.
         @type string       $order                   Designates ascending or descending order of posts. Default 'DESC'.
                                                     Accepts 'ASC', 'DESC'.
         @type string|array $orderby                 Sort retrieved posts by parameter. One or more options may be
                                                     passed. To use 'meta_value', or 'meta_value_num',
                                                     'meta_key=keyname' must be also be defined. To sort by a
                                                     specific `$meta_query` clause, use that clause's array key.
                                                     Accepts 'none', 'name', 'author', 'date', 'title',
                                                     'modified', 'menu_order', 'parent', 'ID', 'rand',
                                                     'relevance', 'RAND(x)' (where 'x' is an integer seed value),
                                                     'comment_count', 'meta_value', 'meta_value_num', 'post__in',
                                                     'post_name__in', 'post_parent__in', and the array keys
                                                     of `$meta_query`. Default is 'date', except when a search
                                                     is being performed, when the default is 'relevance'.
    
         @type int          $p                       Post ID.
         @type int          $page                    Show the number of posts that would show up on page X of a
                                                     static front page.
         @type int          $paged                   The number of the current page.
         @type int          $page_id                 Page ID.
         @type string       $pagename                Page slug.
         @type string       $perm                    Show posts if user has the appropriate capability.
         @type string       $ping_status             Ping status.
         @type array        $post__in                An array of post IDs to retrieve, sticky posts will be included
         @type string       $post_mime_type          The mime type of the post. Used for 'attachment' post_type.
         @type array        $post__not_in            An array of post IDs not to retrieve. Note: a string of comma-
                                                     separated IDs will NOT work.
         @type int          $post_parent             Page ID to retrieve child pages for. Use 0 to only retrieve
                                                     top-level pages.
         @type array        $post_parent__in         An array containing parent page IDs to query child pages from.
         @type array        $post_parent__not_in     An array containing parent page IDs not to query child pages from.
         @type string|array $post_type               A post type slug (string) or array of post type slugs.
                                                     Default 'any' if using 'tax_query'.
         @type string|array $post_status             A post status (string) or array of post statuses.
         @type int          $posts_per_page          The number of posts to query for. Use -1 to request all posts.
         @type int          $posts_per_archive_page  The number of posts to query for by archive page. Overrides
                                                     'posts_per_page' when is_archive(), or is_search() are true.
         @type array        $post_name__in           An array of post slugs that results must match.
         @type string       $s                       Search keyword(s). Prepending a term with a hyphen will
                                                     exclude posts matching that term. Eg, 'pillow -sofa' will
                                                     return posts containing 'pillow' but not 'sofa'. The
                                                     character used for exclusion can be modified using the
                                                     the 'wp_query_search_exclusion_prefix' filter.
         @type int          $second                  Second of the minute. Default empty. Accepts numbers 0-60.
         @type bool         $sentence                Whether to search by phrase. Default false.
         @type bool         $suppress_filters        Whether to suppress filters. Default false.
         @type string       $tag                     Tag slug. Comma-separated (either), Plus-separated (all).
         @type array        $tag__and                An array of tag ids (AND in).
         @type array        $tag__in                 An array of tag ids (OR in).
         @type array        $tag__not_in             An array of tag ids (NOT in).
         @type int          $tag_id                  Tag id or comma-separated list of IDs.
         @type array        $tag_slug__and           An array of tag slugs (AND in).
         @type array        $tag_slug__in            An array of tag slugs (OR in). unless 'ignore_sticky_posts' is
                                                     true. Note: a string of comma-separated IDs will NOT work.
         @type array        $tax_query               An associative array of WP_Tax_Query arguments.
                                                     See WP_Tax_Query->queries.
         @type string       $title                   Post title.
         @type bool         $update_post_meta_cache  Whether to update the post meta cache. Default true.
         @type bool         $update_post_term_cache  Whether to update the post term cache. Default true.
         @type bool         $lazy_load_term_meta     Whether to lazy-load term meta. Setting to false will
                                                     disable cache priming for term meta, so that each
                                                     get_term_meta() call will hit the database.
                                                     Defaults to the value of `$update_post_term_cache`.
         @type int          $w                       The week number of the year. Default empty. Accepts numbers 0-53.
         @type int          $year                    The four-digit year. Default empty. Accepts any four-digit year.
     }
    
  **/
  @:native("parse_query") public function parseQuery(query:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Void;
  /**
    
     Parses various taxonomy related query vars.
    
     For BC, this method is not marked as protected. See [28987].
    
     @since 3.1.0
    
     @param array $q The query variables. Passed by reference.
    
  **/
  @:native("parse_tax_query") public function parseTaxQuery(q:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Sets the 404 property and saves whether query is feed.
    
     @since 2.0.0
    
  **/
  @:native("set_404") public function set404():Void;
  /**
    
     Retrieve query variable.
    
     @since 1.5.0
     @since 3.9.0 The `$default` argument was introduced.
    
     @param string $query_var Query variable key.
     @param mixed  $default   Optional. Value to return if the query variable is not set. Default empty.
     @return mixed Contents of the query variable.
    
  **/
  @:native("get") public function get(query_var:String, default_:Dynamic = ''):Dynamic;
  /**
    
     Set query variable.
    
     @since 1.5.0
    
     @param string $query_var Query variable key.
     @param mixed  $value     Query variable value.
    
  **/
  @:native("set") public function set(query_var:String, value:Dynamic):Void;
  /**
    
     Retrieves an array of posts based on query variables.
    
     There are a few filters and actions that can be used to modify the post
     database query.
    
     @since 1.5.0
    
     @return WP_Post[]|int[] Array of post objects or post IDs.
    
  **/
  @:native("get_posts") public function getPosts():haxe.extern.EitherType<php.NativeIndexedArray<wp.extern.Post>, php.NativeIndexedArray<Int>>;
  /**
    
     Set up the next post and iterate current post index.
    
     @since 1.5.0
    
     @return WP_Post Next post.
    
  **/
  @:native("next_post") public function nextPost():wp.extern.Post;
  /**
    
     Sets up the current post.
    
     Retrieves the next post, sets up the post, sets the 'in the loop'
     property to true.
    
     @since 1.5.0
    
     @global WP_Post $post
    
  **/
  @:native("the_post") public function thePost():Void;
  /**
    
     Determines whether there are more posts available in the loop.
    
     Calls the {@see 'loop_end'} action when the loop is complete.
    
     @since 1.5.0
    
     @return bool True if posts are available, false if end of loop.
    
  **/
  @:native("have_posts") public function havePosts():Bool;
  /**
    
     Rewind the posts and reset post index.
    
     @since 1.5.0
    
  **/
  @:native("rewind_posts") public function rewindPosts():Void;
  /**
    
     Iterate current comment index and return WP_Comment object.
    
     @since 2.2.0
    
     @return WP_Comment Comment object.
    
  **/
  @:native("next_comment") public function nextComment():wp.extern.Comment;
  /**
    
     Sets up the current comment.
    
     @since 2.2.0
     @global WP_Comment $comment Current comment.
    
  **/
  @:native("the_comment") public function theComment():Void;
  /**
    
     Whether there are more comments available.
    
     Automatically rewinds comments when finished.
    
     @since 2.2.0
    
     @return bool True, if more comments. False, if no more posts.
    
  **/
  @:native("have_comments") public function haveComments():Bool;
  /**
    
     Rewind the comments, resets the comment index and comment to first.
    
     @since 2.2.0
    
  **/
  @:native("rewind_comments") public function rewindComments():Void;
  /**
    
     Sets up the WordPress query by parsing query string.
    
     @since 1.5.0
    
     @param string|array $query URL query string or array of query arguments.
     @return WP_Post[]|int[] Array of post objects or post IDs.
    
  **/
  @:native("query") public function getQuery(query:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<php.NativeIndexedArray<wp.extern.Post>, php.NativeIndexedArray<Int>>;
  /**
    
     Retrieve queried object.
    
     If queried object is not set, then the queried object will be set from
     the category, tag, taxonomy, posts page, single post, page, or author
     query variable. After it is set up, it will be returned.
    
     @since 1.5.0
    
     @return object
    
  **/
  @:native("get_queried_object") public function getQueriedObject():Dynamic;
  /**
    
     Retrieve ID of the current queried object.
    
     @since 1.5.0
    
     @return int
    
  **/
  @:native("get_queried_object_id") public function getQueriedObjectId():Int;
  /**
    
     Constructor.
    
     Sets up the WordPress query, if parameter is not empty.
    
     @since 1.5.0
    
     @param string|array $query URL query string or array of vars.
    
  **/
  public function new(query:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Void;
  /**
    
     Make private properties readable for backward compatibility.
    
     @since 4.0.0
    
     @param string $name Property to get.
     @return mixed Property.
    
  **/
  @:native("__get") public function __get(name:String):Dynamic;
  /**
    
     Make private properties checkable for backward compatibility.
    
     @since 4.0.0
    
     @param string $name Property to check if set.
     @return bool Whether the property is set.
    
  **/
  @:native("__isset") public function __isset(name:String):Bool;
  /**
    
     Make private/protected methods readable for backward compatibility.
    
     @since 4.0.0
    
     @param string   $name      Method to call.
     @param array    $arguments Arguments to pass when calling.
     @return mixed|false Return value of the callback, false otherwise.
    
  **/
  @:native("__call") public function __call(name:String, arguments:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Dynamic, Bool>;
  /**
    
     Is the query for an existing archive page?
    
     Month, Year, Category, Author, Post Type archive...
    
     @since 3.1.0
    
     @return bool
    
  **/
  @:native("is_archive") public function getIsArchive():Bool;
  /**
    
     Is the query for an existing post type archive page?
    
     @since 3.1.0
    
     @param mixed $post_types Optional. Post type or array of posts types to check against.
     @return bool
    
  **/
  @:native("is_post_type_archive") public function getIsPostTypeArchive(post_types:Dynamic = ''):Bool;
  /**
    
     Is the query for an existing attachment page?
    
     @since 3.1.0
    
     @param mixed $attachment Attachment ID, title, slug, or array of such.
     @return bool
    
  **/
  @:native("is_attachment") public function getIsAttachment(attachment:Dynamic = ''):Bool;
  /**
    
     Is the query for an existing author archive page?
    
     If the $author parameter is specified, this function will additionally
     check if the query is for one of the authors specified.
    
     @since 3.1.0
    
     @param mixed $author Optional. User ID, nickname, nicename, or array of User IDs, nicknames, and nicenames
     @return bool
    
  **/
  @:native("is_author") public function getIsAuthor(author:Dynamic = ''):Bool;
  /**
    
     Is the query for an existing category archive page?
    
     If the $category parameter is specified, this function will additionally
     check if the query is for one of the categories specified.
    
     @since 3.1.0
    
     @param mixed $category Optional. Category ID, name, slug, or array of Category IDs, names, and slugs.
     @return bool
    
  **/
  @:native("is_category") public function getIsCategory(category:Dynamic = ''):Bool;
  /**
    
     Is the query for an existing tag archive page?
    
     If the $tag parameter is specified, this function will additionally
     check if the query is for one of the tags specified.
    
     @since 3.1.0
    
     @param mixed $tag Optional. Tag ID, name, slug, or array of Tag IDs, names, and slugs.
     @return bool
    
  **/
  @:native("is_tag") public function getIsTag(tag:Dynamic = ''):Bool;
  /**
    
     Is the query for an existing custom taxonomy archive page?
    
     If the $taxonomy parameter is specified, this function will additionally
     check if the query is for that specific $taxonomy.
    
     If the $term parameter is specified in addition to the $taxonomy parameter,
     this function will additionally check if the query is for one of the terms
     specified.
    
     @since 3.1.0
    
     @global array $wp_taxonomies
    
     @param mixed $taxonomy Optional. Taxonomy slug or slugs.
     @param mixed $term     Optional. Term ID, name, slug or array of Term IDs, names, and slugs.
     @return bool True for custom taxonomy archive pages, false for built-in taxonomies (category and tag archives).
    
  **/
  @:native("is_tax") public function getIsTax(taxonomy:Dynamic = '', term:Dynamic = ''):Bool;
  /**
    
     Whether the current URL is within the comments popup window.
    
     @since 3.1.0
     @deprecated 4.5.0
    
     @return bool
    
  **/
  @:native("is_comments_popup") public function getIsCommentsPopup():Bool;
  /**
    
     Is the query for an existing date archive?
    
     @since 3.1.0
    
     @return bool
    
  **/
  @:native("is_date") public function getIsDate():Bool;
  /**
    
     Is the query for an existing day archive?
    
     @since 3.1.0
    
     @return bool
    
  **/
  @:native("is_day") public function getIsDay():Bool;
  /**
    
     Is the query for a feed?
    
     @since 3.1.0
    
     @param string|array $feeds Optional feed types to check.
     @return bool
    
  **/
  @:native("is_feed") public function getIsFeed(feeds:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Bool;
  /**
    
     Is the query for a comments feed?
    
     @since 3.1.0
    
     @return bool
    
  **/
  @:native("is_comment_feed") public function getIsCommentFeed():Bool;
  /**
    
     Is the query for the front page of the site?
    
     This is for what is displayed at your site's main URL.
    
     Depends on the site's "Front page displays" Reading Settings 'show_on_front' and 'page_on_front'.
    
     If you set a static page for the front page of your site, this function will return
     true when viewing that page.
    
     Otherwise the same as @see WP_Query::is_home()
    
     @since 3.1.0
    
     @return bool True, if front of site.
    
  **/
  @:native("is_front_page") public function getIsFrontPage():Bool;
  /**
    
     Is the query for the blog homepage?
    
     This is the page which shows the time based blog content of your site.
    
     Depends on the site's "Front page displays" Reading Settings 'show_on_front' and 'page_for_posts'.
    
     If you set a static page for the front page of your site, this function will return
     true only on the page you set as the "Posts page".
    
     @see WP_Query::is_front_page()
    
     @since 3.1.0
    
     @return bool True if blog view homepage.
    
  **/
  @:native("is_home") public function getIsHome():Bool;
  /**
    
     Is the query for an existing month archive?
    
     @since 3.1.0
    
     @return bool
    
  **/
  @:native("is_month") public function getIsMonth():Bool;
  /**
    
     Is the query for an existing single page?
    
     If the $page parameter is specified, this function will additionally
     check if the query is for one of the pages specified.
    
     @see WP_Query::is_single()
     @see WP_Query::is_singular()
    
     @since 3.1.0
    
     @param int|string|array $page Optional. Page ID, title, slug, path, or array of such. Default empty.
     @return bool Whether the query is for an existing single page.
    
  **/
  @:native("is_page") public function getIsPage(page:haxe.extern.EitherType<Int, haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>> = ''):Bool;
  /**
    
     Is the query for paged result and not for the first page?
    
     @since 3.1.0
    
     @return bool
    
  **/
  @:native("is_paged") public function getIsPaged():Bool;
  /**
    
     Is the query for a post or page preview?
    
     @since 3.1.0
    
     @return bool
    
  **/
  @:native("is_preview") public function getIsPreview():Bool;
  /**
    
     Is the query for the robots file?
    
     @since 3.1.0
    
     @return bool
    
  **/
  @:native("is_robots") public function getIsRobots():Bool;
  /**
    
     Is the query for a search?
    
     @since 3.1.0
    
     @return bool
    
  **/
  @:native("is_search") public function getIsSearch():Bool;
  /**
    
     Is the query for an existing single post?
    
     Works for any post type excluding pages.
    
     If the $post parameter is specified, this function will additionally
     check if the query is for one of the Posts specified.
    
     @see WP_Query::is_page()
     @see WP_Query::is_singular()
    
     @since 3.1.0
    
     @param int|string|array $post Optional. Post ID, title, slug, path, or array of such. Default empty.
     @return bool Whether the query is for an existing single post.
    
  **/
  @:native("is_single") public function getIsSingle(post:haxe.extern.EitherType<Int, haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>> = ''):Bool;
  /**
    
     Is the query for an existing single post of any post type (post, attachment, page,
     custom post types)?
    
     If the $post_types parameter is specified, this function will additionally
     check if the query is for one of the Posts Types specified.
    
     @see WP_Query::is_page()
     @see WP_Query::is_single()
    
     @since 3.1.0
    
     @param string|array $post_types Optional. Post type or array of post types. Default empty.
     @return bool Whether the query is for an existing single post of any of the given post types.
    
  **/
  @:native("is_singular") public function getIsSingular(post_types:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Bool;
  /**
    
     Is the query for a specific time?
    
     @since 3.1.0
    
     @return bool
    
  **/
  @:native("is_time") public function getIsTime():Bool;
  /**
    
     Is the query for a trackback endpoint call?
    
     @since 3.1.0
    
     @return bool
    
  **/
  @:native("is_trackback") public function getIsTrackback():Bool;
  /**
    
     Is the query for an existing year archive?
    
     @since 3.1.0
    
     @return bool
    
  **/
  @:native("is_year") public function getIsYear():Bool;
  /**
    
     Is the query a 404 (returns no results)?
    
     @since 3.1.0
    
     @return bool
    
  **/
  @:native("is_404") public function getIs404():Bool;
  /**
    
     Is the query for an embedded post?
    
     @since 4.4.0
    
     @return bool
    
  **/
  @:native("is_embed") public function getIsEmbed():Bool;
  /**
    
     Is the query the main query?
    
     @since 3.3.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool
    
  **/
  @:native("is_main_query") public function getIsMainQuery():Bool;
  /**
    
     Set up global post data.
    
     @since 4.1.0
     @since 4.4.0 Added the ability to pass a post ID to `$post`.
    
     @global int             $id
     @global WP_User         $authordata
     @global string|int|bool $currentday
     @global string|int|bool $currentmonth
     @global int             $page
     @global array           $pages
     @global int             $multipage
     @global int             $more
     @global int             $numpages
    
     @param WP_Post|object|int $post WP_Post instance or Post ID/object.
     @return true True when finished.
    
  **/
  @:native("setup_postdata") public function setupPostdata(post:haxe.extern.EitherType<wp.extern.Post, haxe.extern.EitherType<Dynamic, Int>>):Bool;
  /**
    
     After looping through a nested query, this function
     restores the $post global to the current post in this query.
    
     @since 3.7.0
    
     @global WP_Post $post
    
  **/
  @:native("reset_postdata") public function resetPostdata():Void;
  /**
    
     Lazyload term meta for posts in the loop.
    
     @since 4.4.0
     @deprecated 4.5.0 See wp_queue_posts_for_term_meta_lazyload().
    
     @param mixed $check
     @param int   $term_id
     @return mixed
    
  **/
  @:native("lazyload_term_meta") public function lazyloadTermMeta(check:Dynamic, term_id:Int):Dynamic;
  /**
    
     Lazyload comment meta for comments in the loop.
    
     @since 4.4.0
     @deprecated 4.5.0 See wp_queue_comments_for_comment_meta_lazyload().
    
     @param mixed $check
     @param int   $comment_id
     @return mixed
    
  **/
  @:native("lazyload_comment_meta") public function lazyloadCommentMeta(check:Dynamic, comment_id:Int):Dynamic;
}
