package wp.extern;

extern class CommentApi implements wp.util.ApiFunctions {
  /**
    
     Check whether a comment passes internal checks to be allowed to add.
    
     If manual comment moderation is set in the administration, then all checks,
     regardless of their type and whitelist, will fail and the function will
     return false.
    
     If the number of links exceeds the amount in the administration, then the
     check fails. If any of the parameter contents match the blacklist of words,
     then the check fails.
    
     If the comment author was approved before, then the comment is automatically
     whitelisted.
    
     If all checks pass, the function will return true.
    
     @since 1.2.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $author       Comment author name.
     @param string $email        Comment author email.
     @param string $url          Comment author URL.
     @param string $comment      Content of the comment.
     @param string $user_ip      Comment author IP address.
     @param string $user_agent   Comment author User-Agent.
     @param string $comment_type Comment type, either user-submitted comment,
                                 trackback, or pingback.
     @return bool If all checks pass, true, otherwise false.
    
  **/
  public function check_comment(author:String, email:String, url:String, comment:String, user_ip:String, user_agent:String, comment_type:String):Bool;
  /**
    
     Retrieve the approved comments for post $post_id.
    
     @since 2.0.0
     @since 4.1.0 Refactored to leverage WP_Comment_Query over a direct query.
    
     @param  int   $post_id The ID of the post.
     @param  array $args    Optional. See WP_Comment_Query::__construct() for information on accepted arguments.
     @return int|array $comments The approved comments, or number of comments if `$count`
                                 argument is true.
    
  **/
  public function get_approved_comments(post_id:Int, ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>>;
  /**
    
     Retrieves comment data given a comment ID or comment object.
    
     If an object is passed then the comment data will be cached and then returned
     after being passed through a filter. If the comment is empty, then the global
     comment variable will be used, if it is set.
    
     @since 2.0.0
    
     @global WP_Comment $comment
    
     @param WP_Comment|string|int $comment Comment to retrieve.
     @param string                $output  Optional. The required return type. One of OBJECT, ARRAY_A, or ARRAY_N, which correspond to
                                           a WP_Comment object, an associative array, or a numeric array, respectively. Default OBJECT.
     @return WP_Comment|array|null Depends on $output value.
    
  **/
  public function get_comment(comment:haxe.extern.EitherType<wp.extern.Comment, haxe.extern.EitherType<String, Int>>, output:String):haxe.extern.EitherType<wp.extern.Comment, php.NativeArray>;
  /**
    
     Retrieve a list of comments.
    
     The comment list can be for the blog as a whole or for an individual post.
    
     @since 2.7.0
    
     @param string|array $args Optional. Array or string of arguments. See WP_Comment_Query::__construct()
                               for information on accepted arguments. Default empty.
     @return int|array List of comments or number of found comments if `$count` argument is true.
    
  **/
  public function get_comments(args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>>;
  /**
    
     Retrieve all of the WordPress supported comment statuses.
    
     Comments have a limited set of valid status values, this provides the comment
     status values and descriptions.
    
     @since 2.7.0
    
     @return array List of comment statuses.
    
  **/
  public function get_comment_statuses():php.NativeArray;
  /**
    
     Gets the default comment status for a post type.
    
     @since 4.3.0
    
     @param string $post_type    Optional. Post type. Default 'post'.
     @param string $comment_type Optional. Comment type. Default 'comment'.
     @return string Expected return value is 'open' or 'closed'.
    
  **/
  public function get_default_comment_status(post_type:String = 'post', comment_type:String = 'comment'):String;
  /**
    
     The date the last comment was modified.
    
     @since 1.5.0
     @since 4.7.0 Replaced caching the modified date in a local static variable
                  with the Object Cache API.
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $timezone Which timezone to use in reference to 'gmt', 'blog', or 'server' locations.
     @return string|false Last comment modified date on success, false on failure.
    
  **/
  public function get_lastcommentmodified(timezone:String = 'server'):haxe.extern.EitherType<String, Bool>;
  /**
    
     The amount of comments in a post or total comments.
    
     A lot like wp_count_comments(), in that they both return comment stats (albeit with different types).
     The wp_count_comments() actually caches, but this function does not.
    
     @since 2.0.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int $post_id Optional. Comment amount in post if > 0, else total comments blog wide.
     @return array The amount of spam, approved, awaiting moderation, and total comments.
    
  **/
  public function get_comment_count(post_id:Int = 0):php.NativeArray;
  /**
    
     Add meta data field to a comment.
    
     @since 2.9.0
     @link https://codex.wordpress.org/Function_Reference/add_comment_meta
    
     @param int $comment_id Comment ID.
     @param string $meta_key Metadata name.
     @param mixed $meta_value Metadata value.
     @param bool $unique Optional, default is false. Whether the same key should not be added.
     @return int|bool Meta ID on success, false on failure.
    
  **/
  public function add_comment_meta(comment_id:Int, meta_key:String, meta_value:Dynamic, unique:Bool = false):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Remove metadata matching criteria from a comment.
    
     You can match based on the key, or key and value. Removing based on key and
     value, will keep from removing duplicate metadata with the same key. It also
     allows removing all metadata matching key, if needed.
    
     @since 2.9.0
     @link https://codex.wordpress.org/Function_Reference/delete_comment_meta
    
     @param int $comment_id comment ID
     @param string $meta_key Metadata name.
     @param mixed $meta_value Optional. Metadata value.
     @return bool True on success, false on failure.
    
  **/
  public function delete_comment_meta(comment_id:Int, meta_key:String, meta_value:Dynamic = ''):Bool;
  /**
    
     Retrieve comment meta field for a comment.
    
     @since 2.9.0
     @link https://codex.wordpress.org/Function_Reference/get_comment_meta
    
     @param int $comment_id Comment ID.
     @param string $key Optional. The meta key to retrieve. By default, returns data for all keys.
     @param bool $single Whether to return a single value.
     @return mixed Will be an array if $single is false. Will be value of meta data field if $single
      is true.
    
  **/
  public function get_comment_meta(comment_id:Int, key:String = '', single:Bool = false):Dynamic;
  /**
    
     Update comment meta field based on comment ID.
    
     Use the $prev_value parameter to differentiate between meta fields with the
     same key and comment ID.
    
     If the meta field for the comment does not exist, it will be added.
    
     @since 2.9.0
     @link https://codex.wordpress.org/Function_Reference/update_comment_meta
    
     @param int $comment_id Comment ID.
     @param string $meta_key Metadata key.
     @param mixed $meta_value Metadata value.
     @param mixed $prev_value Optional. Previous value to check before removing.
     @return int|bool Meta ID if the key didn't exist, true on successful update, false on failure.
    
  **/
  public function update_comment_meta(comment_id:Int, meta_key:String, meta_value:Dynamic, prev_value:Dynamic = ''):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Queues comments for metadata lazy-loading.
    
     @since 4.5.0
    
     @param WP_Comment[] $comments Array of comment objects.
    
  **/
  public function wp_queue_comments_for_comment_meta_lazyload(comments:php.NativeIndexedArray<wp.extern.Comment>):Void;
  /**
    
     Sets the cookies used to store an unauthenticated commentator's identity. Typically used
     to recall previous comments by this commentator that are still held in moderation.
    
     @since 3.4.0
     @since 4.9.6 The `$cookies_consent` parameter was added.
    
     @param WP_Comment $comment         Comment object.
     @param WP_User    $user            Comment author's user object. The user may not exist.
     @param boolean    $cookies_consent Optional. Comment author's consent to store cookies. Default true.
    
  **/
  public function wp_set_comment_cookies(comment:wp.extern.Comment, user:wp.extern.User, cookies_consent:Bool = true):Void;
  /**
    
     Sanitizes the cookies sent to the user already.
    
     Will only do anything if the cookies have already been created for the user.
     Mostly used after cookies had been sent to use elsewhere.
    
     @since 2.0.4
    
  **/
  public function sanitize_comment_cookies():Void;
  /**
    
     Validates whether this comment is allowed to be made.
    
     @since 2.0.0
     @since 4.7.0 The `$avoid_die` parameter was added, allowing the function to
                  return a WP_Error object instead of dying.
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array $commentdata Contains information on the comment.
     @param bool  $avoid_die   When true, a disallowed comment will result in the function
                               returning a WP_Error object, rather than executing wp_die().
                               Default false.
     @return int|string|WP_Error Allowed comments return the approval status (0|1|'spam').
                                 If `$avoid_die` is true, disallowed comments return a WP_Error.
    
  **/
  public function wp_allow_comment(commentdata:php.NativeStructArray<Dynamic>, avoid_die:Bool = false):haxe.extern.EitherType<Int, haxe.extern.EitherType<String, wp.extern.Error>>;
  /**
    
     Hooks WP's native database-based comment-flood check.
    
     This wrapper maintains backward compatibility with plugins that expect to
     be able to unhook the legacy check_comment_flood_db() function from
     'check_comment_flood' using remove_action().
    
     @since 2.3.0
     @since 4.7.0 Converted to be an add_filter() wrapper.
    
  **/
  public function check_comment_flood_db():Void;
  /**
    
     Checks whether comment flooding is occurring.
    
     Won't run, if current user can manage options, so to not block
     administrators.
    
     @since 4.7.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param bool   $is_flood  Is a comment flooding occurring?
     @param string $ip        Comment author's IP address.
     @param string $email     Comment author's email address.
     @param string $date      MySQL time string.
     @param bool   $avoid_die When true, a disallowed comment will result in the function
                              returning a WP_Error object, rather than executing wp_die().
                              Default false.
     @return bool Whether comment flooding is occurring.
    
  **/
  public function wp_check_comment_flood(is_flood:Bool, ip:String, email:String, date:String, avoid_die:Bool = false):Bool;
  /**
    
     Separates an array of comments into an array keyed by comment_type.
    
     @since 2.7.0
    
     @param WP_Comment[] $comments Array of comments
     @return WP_Comment[] Array of comments keyed by comment_type.
    
  **/
  public function separate_comments(comments:php.NativeIndexedArray<wp.extern.Comment>):php.NativeIndexedArray<wp.extern.Comment>;
  /**
    
     Calculate the total number of comment pages.
    
     @since 2.7.0
    
     @uses Walker_Comment
    
     @global WP_Query $wp_query
    
     @param WP_Comment[] $comments Optional. Array of WP_Comment objects. Defaults to $wp_query->comments.
     @param int          $per_page Optional. Comments per page.
     @param bool         $threaded Optional. Control over flat or threaded comments.
     @return int Number of comment pages.
    
  **/
  public function get_comment_pages_count(comments:php.NativeIndexedArray<wp.extern.Comment> = null, per_page:Int = null, threaded:Bool = null):Int;
  /**
    
     Calculate what page number a comment will appear on for comment paging.
    
     @since 2.7.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int   $comment_ID Comment ID.
     @param array $args {
          Array of optional arguments.
          @type string     $type      Limit paginated comments to those matching a given type. Accepts 'comment',
                                      'trackback', 'pingback', 'pings' (trackbacks and pingbacks), or 'all'.
                                      Default is 'all'.
          @type int        $per_page  Per-page count to use when calculating pagination. Defaults to the value of the
                                      'comments_per_page' option.
          @type int|string $max_depth If greater than 1, comment page will be determined for the top-level parent of
                                      `$comment_ID`. Defaults to the value of the 'thread_comments_depth' option.
     } *
     @return int|null Comment page number or null on error.
    
  **/
  public function get_page_of_comment(comment_ID:Int, ?args:php.NativeStructArray<Dynamic>):Int;
  /**
    
     Retrieves the maximum character lengths for the comment form fields.
    
     @since 4.5.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @return array Maximum character length for the comment form fields.
    
  **/
  public function wp_get_comment_fields_max_lengths():php.NativeArray;
  /**
    
     Compares the lengths of comment data against the maximum character limits.
    
     @since 4.7.0
    
     @param array $comment_data Array of arguments for inserting a comment.
     @return WP_Error|true WP_Error when a comment field exceeds the limit,
                           otherwise true.
    
  **/
  public function wp_check_comment_data_max_lengths(comment_data:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<wp.extern.Error, Bool>;
  /**
    
     Does comment contain blacklisted characters or words.
    
     @since 1.5.0
    
     @param string $author The author of the comment
     @param string $email The email of the comment
     @param string $url The url used in the comment
     @param string $comment The comment content
     @param string $user_ip The comment author's IP address
     @param string $user_agent The author's browser user agent
     @return bool True if comment contains blacklisted content, false if comment does not
    
  **/
  public function wp_blacklist_check(author:String, email:String, url:String, comment:String, user_ip:String, user_agent:String):Bool;
  /**
    
     Retrieve total comments for blog or single post.
    
     The properties of the returned object contain the 'moderated', 'approved',
     and spam comments for either the entire blog or single post. Those properties
     contain the amount of comments that match the status. The 'total_comments'
     property contains the integer of total comments.
    
     The comment stats are cached and then retrieved, if they already exist in the
     cache.
    
     @since 2.5.0
    
     @param int $post_id Optional. Post ID.
     @return object|array Comment stats.
    
  **/
  public function wp_count_comments(post_id:Int = 0):haxe.extern.EitherType<Dynamic, php.NativeStructArray<Dynamic>>;
  /**
    
     Trashes or deletes a comment.
    
     The comment is moved to trash instead of permanently deleted unless trash is
     disabled, item is already in the trash, or $force_delete is true.
    
     The post comment count will be updated if the comment was approved and has a
     post ID available.
    
     @since 2.0.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int|WP_Comment $comment_id   Comment ID or WP_Comment object.
     @param bool           $force_delete Whether to bypass trash and force deletion. Default is false.
     @return bool True on success, false on failure.
    
  **/
  public function wp_delete_comment(comment_id:haxe.extern.EitherType<Int, wp.extern.Comment>, force_delete:Bool = false):Bool;
  /**
    
     Moves a comment to the Trash
    
     If trash is disabled, comment is permanently deleted.
    
     @since 2.9.0
    
     @param int|WP_Comment $comment_id Comment ID or WP_Comment object.
     @return bool True on success, false on failure.
    
  **/
  public function wp_trash_comment(comment_id:haxe.extern.EitherType<Int, wp.extern.Comment>):Bool;
  /**
    
     Removes a comment from the Trash
    
     @since 2.9.0
    
     @param int|WP_Comment $comment_id Comment ID or WP_Comment object.
     @return bool True on success, false on failure.
    
  **/
  public function wp_untrash_comment(comment_id:haxe.extern.EitherType<Int, wp.extern.Comment>):Bool;
  /**
    
     Marks a comment as Spam
    
     @since 2.9.0
    
     @param int|WP_Comment $comment_id Comment ID or WP_Comment object.
     @return bool True on success, false on failure.
    
  **/
  public function wp_spam_comment(comment_id:haxe.extern.EitherType<Int, wp.extern.Comment>):Bool;
  /**
    
     Removes a comment from the Spam
    
     @since 2.9.0
    
     @param int|WP_Comment $comment_id Comment ID or WP_Comment object.
     @return bool True on success, false on failure.
    
  **/
  public function wp_unspam_comment(comment_id:haxe.extern.EitherType<Int, wp.extern.Comment>):Bool;
  /**
    
     The status of a comment by ID.
    
     @since 1.0.0
    
     @param int|WP_Comment $comment_id Comment ID or WP_Comment object
     @return false|string Status might be 'trash', 'approved', 'unapproved', 'spam'. False on failure.
    
  **/
  public function wp_get_comment_status(comment_id:haxe.extern.EitherType<Int, wp.extern.Comment>):haxe.extern.EitherType<Bool, String>;
  /**
    
     Call hooks for when a comment status transition occurs.
    
     Calls hooks for comment status transitions. If the new comment status is not the same
     as the previous comment status, then two hooks will be ran, the first is
     {@see 'transition_comment_status'} with new status, old status, and comment data. The
     next action called is {@see comment_$old_status_to_$new_status'}. It has the
     comment data.
    
     The final action will run whether or not the comment statuses are the same. The
     action is named {@see 'comment_$new_status_$comment->comment_type'}.
    
     @since 2.7.0
    
     @param string $new_status New comment status.
     @param string $old_status Previous comment status.
     @param object $comment Comment data.
    
  **/
  public function wp_transition_comment_status(new_status:String, old_status:String, comment:Dynamic):Void;
  /**
    
     Clear the lastcommentmodified cached value when a comment status is changed.
    
     Deletes the lastcommentmodified cache key when a comment enters or leaves
     'approved' status.
    
     @since 4.7.0
     @access private
    
     @param string $new_status The new comment status.
     @param string $old_status The old comment status.
    
  **/
  public function _clear_modified_cache_on_transition_comment_status(new_status:String, old_status:String):Void;
  /**
    
     Get current commenter's name, email, and URL.
    
     Expects cookies content to already be sanitized. User of this function might
     wish to recheck the returned array for validity.
    
     @see sanitize_comment_cookies() Use to sanitize cookies
    
     @since 2.0.4
    
     @return array Comment author, email, url respectively.
    
  **/
  public function wp_get_current_commenter():php.NativeArray;
  /**
    
     Get unapproved comment author's email.
    
     Used to allow the commenter to see their pending comment.
    
     @since 5.1.0
    
     @return string The unapproved comment author's email (when supplied).
    
  **/
  public function wp_get_unapproved_comment_author_email():String;
  /**
    
     Inserts a comment into the database.
    
     @since 2.0.0
     @since 4.4.0 Introduced `$comment_meta` argument.
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array $commentdata {
         Array of arguments for inserting a new comment.
    
         @type string     $comment_agent        The HTTP user agent of the `$comment_author` when
                                                the comment was submitted. Default empty.
         @type int|string $comment_approved     Whether the comment has been approved. Default 1.
         @type string     $comment_author       The name of the author of the comment. Default empty.
         @type string     $comment_author_email The email address of the `$comment_author`. Default empty.
         @type string     $comment_author_IP    The IP address of the `$comment_author`. Default empty.
         @type string     $comment_author_url   The URL address of the `$comment_author`. Default empty.
         @type string     $comment_content      The content of the comment. Default empty.
         @type string     $comment_date         The date the comment was submitted. To set the date
                                                manually, `$comment_date_gmt` must also be specified.
                                                Default is the current time.
         @type string     $comment_date_gmt     The date the comment was submitted in the GMT timezone.
                                                Default is `$comment_date` in the site's GMT timezone.
         @type int        $comment_karma        The karma of the comment. Default 0.
         @type int        $comment_parent       ID of this comment's parent, if any. Default 0.
         @type int        $comment_post_ID      ID of the post that relates to the comment, if any.
                                                Default 0.
         @type string     $comment_type         Comment type. Default empty.
         @type array      $comment_meta         Optional. Array of key/value pairs to be stored in commentmeta for the
                                                new comment.
         @type int        $user_id              ID of the user who submitted the comment. Default 0.
     }
     @return int|false The new comment's ID on success, false on failure.
    
  **/
  public function wp_insert_comment(commentdata:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Filters and sanitizes comment data.
    
     Sets the comment data 'filtered' field to true when finished. This can be
     checked as to whether the comment should be filtered and to keep from
     filtering the same comment more than once.
    
     @since 2.0.0
    
     @param array $commentdata Contains information on the comment.
     @return array Parsed comment information.
    
  **/
  public function wp_filter_comment(commentdata:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Whether a comment should be blocked because of comment flood.
    
     @since 2.1.0
    
     @param bool $block Whether plugin has already blocked comment.
     @param int $time_lastcomment Timestamp for last comment.
     @param int $time_newcomment Timestamp for new comment.
     @return bool Whether comment should be blocked.
    
  **/
  public function wp_throttle_comment_flood(block:Bool, time_lastcomment:Int, time_newcomment:Int):Bool;
  /**
    
     Adds a new comment to the database.
    
     Filters new comment to ensure that the fields are sanitized and valid before
     inserting comment into database. Calls {@see 'comment_post'} action with comment ID
     and whether comment is approved by WordPress. Also has {@see 'preprocess_comment'}
     filter for processing the comment data before the function handles it.
    
     We use `REMOTE_ADDR` here directly. If you are behind a proxy, you should ensure
     that it is properly set, such as in wp-config.php, for your environment.
    
     See {@link https://core.trac.wordpress.org/ticket/9235}
    
     @since 1.5.0
     @since 4.3.0 'comment_agent' and 'comment_author_IP' can be set via `$commentdata`.
     @since 4.7.0 The `$avoid_die` parameter was added, allowing the function to
                  return a WP_Error object instead of dying.
    
     @see wp_insert_comment()
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array $commentdata {
         Comment data.
    
         @type string $comment_author       The name of the comment author.
         @type string $comment_author_email The comment author email address.
         @type string $comment_author_url   The comment author URL.
         @type string $comment_content      The content of the comment.
         @type string $comment_date         The date the comment was submitted. Default is the current time.
         @type string $comment_date_gmt     The date the comment was submitted in the GMT timezone.
                                            Default is `$comment_date` in the GMT timezone.
         @type int    $comment_parent       The ID of this comment's parent, if any. Default 0.
         @type int    $comment_post_ID      The ID of the post that relates to the comment.
         @type int    $user_id              The ID of the user who submitted the comment. Default 0.
         @type int    $user_ID              Kept for backward-compatibility. Use `$user_id` instead.
         @type string $comment_agent        Comment author user agent. Default is the value of 'HTTP_USER_AGENT'
                                            in the `$_SERVER` superglobal sent in the original request.
         @type string $comment_author_IP    Comment author IP address in IPv4 format. Default is the value of
                                            'REMOTE_ADDR' in the `$_SERVER` superglobal sent in the original request.
     }
     @param bool $avoid_die Should errors be returned as WP_Error objects instead of
                            executing wp_die()? Default false.
     @return int|false|WP_Error The ID of the comment on success, false or WP_Error on failure.
    
  **/
  public function wp_new_comment(commentdata:php.NativeStructArray<Dynamic>, avoid_die:Bool = false):haxe.extern.EitherType<Int, haxe.extern.EitherType<Bool, wp.extern.Error>>;
  /**
    
     Send a comment moderation notification to the comment moderator.
    
     @since 4.4.0
    
     @param int $comment_ID ID of the comment.
     @return bool True on success, false on failure.
    
  **/
  public function wp_new_comment_notify_moderator(comment_ID:Int):Bool;
  /**
    
     Send a notification of a new comment to the post author.
    
     @since 4.4.0
    
     Uses the {@see 'notify_post_author'} filter to determine whether the post author
     should be notified when a new comment is added, overriding site setting.
    
     @param int $comment_ID Comment ID.
     @return bool True on success, false on failure.
    
  **/
  public function wp_new_comment_notify_postauthor(comment_ID:Int):Bool;
  /**
    
     Sets the status of a comment.
    
     The {@see 'wp_set_comment_status'} action is called after the comment is handled.
     If the comment status is not in the list, then false is returned.
    
     @since 1.0.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int|WP_Comment $comment_id     Comment ID or WP_Comment object.
     @param string         $comment_status New comment status, either 'hold', 'approve', 'spam', or 'trash'.
     @param bool           $wp_error       Whether to return a WP_Error object if there is a failure. Default is false.
     @return bool|WP_Error True on success, false or WP_Error on failure.
    
  **/
  public function wp_set_comment_status(comment_id:haxe.extern.EitherType<Int, wp.extern.Comment>, comment_status:String, wp_error:Bool = false):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Updates an existing comment in the database.
    
     Filters the comment and makes sure certain fields are valid before updating.
    
     @since 2.0.0
     @since 4.9.0 Add updating comment meta during comment update.
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array $commentarr Contains information on the comment.
     @return int Comment was updated if value is 1, or was not updated if value is 0.
    
  **/
  public function wp_update_comment(commentarr:php.NativeStructArray<Dynamic>):Int;
  /**
    
     Whether to defer comment counting.
    
     When setting $defer to true, all post comment counts will not be updated
     until $defer is set to false. When $defer is set to false, then all
     previously deferred updated post comment counts will then be automatically
     updated without having to call wp_update_comment_count() after.
    
     @since 2.5.0
     @staticvar bool $_defer
    
     @param bool $defer
     @return bool
    
  **/
  public function wp_defer_comment_counting(defer:Bool = null):Bool;
  /**
    
     Updates the comment count for post(s).
    
     When $do_deferred is false (is by default) and the comments have been set to
     be deferred, the post_id will be added to a queue, which will be updated at a
     later date and only updated once per post ID.
    
     If the comments have not be set up to be deferred, then the post will be
     updated. When $do_deferred is set to true, then all previous deferred post
     IDs will be updated along with the current $post_id.
    
     @since 2.1.0
     @see wp_update_comment_count_now() For what could cause a false return value
    
     @staticvar array $_deferred
    
     @param int|null $post_id     Post ID.
     @param bool     $do_deferred Optional. Whether to process previously deferred
                                  post comment counts. Default false.
     @return bool|void True on success, false on failure or if post with ID does
                       not exist.
    
  **/
  public function wp_update_comment_count(post_id:Int, do_deferred:Bool = false):Bool;
  /**
    
     Updates the comment count for the post.
    
     @since 2.5.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int $post_id Post ID
     @return bool True on success, false on '0' $post_id or if post with ID does not exist.
    
  **/
  public function wp_update_comment_count_now(post_id:Int):Bool;
  /**
    
     Finds a pingback server URI based on the given URL.
    
     Checks the HTML for the rel="pingback" link and x-pingback headers. It does
     a check for the x-pingback headers first and returns that, if available. The
     check for the rel="pingback" has more overhead than just the header.
    
     @since 1.5.0
    
     @param string $url URL to ping.
     @param int $deprecated Not Used.
     @return false|string False on failure, string containing URI on success.
    
  **/
  public function discover_pingback_server_uri(url:String, deprecated:Int = cast ''):haxe.extern.EitherType<Bool, String>;
  /**
    
     Perform all pingbacks, enclosures, trackbacks, and send to pingback services.
    
     @since 2.1.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
  **/
  public function do_all_pings():Void;
  /**
    
     Perform trackbacks.
    
     @since 1.5.0
     @since 4.7.0 `$post_id` can be a WP_Post object.
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int|WP_Post $post_id Post object or ID to do trackbacks on.
    
  **/
  public function do_trackbacks(post_id:haxe.extern.EitherType<Int, wp.extern.Post>):Void;
  /**
    
     Sends pings to all of the ping site services.
    
     @since 1.2.0
    
     @param int $post_id Post ID.
     @return int Same as Post ID from parameter
    
  **/
  public function generic_ping(post_id:Int = 0):Int;
  /**
    
     Pings back the links found in a post.
    
     @since 0.71
     @since 4.7.0 `$post_id` can be a WP_Post object.
    
     @param string $content Post content to check for links. If empty will retrieve from post.
     @param int|WP_Post $post_id Post Object or ID.
    
  **/
  public function pingback(content:String, post_id:haxe.extern.EitherType<Int, wp.extern.Post>):Void;
  /**
    
     Check whether blog is public before returning sites.
    
     @since 2.1.0
    
     @param mixed $sites Will return if blog is public, will not return if not public.
     @return mixed Empty string if blog is not public, returns $sites, if site is public.
    
  **/
  public function privacy_ping_filter(sites:Dynamic):Dynamic;
  /**
    
     Send a Trackback.
    
     Updates database when sending trackback to prevent duplicates.
    
     @since 0.71
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $trackback_url URL to send trackbacks.
     @param string $title Title of post.
     @param string $excerpt Excerpt of post.
     @param int $ID Post ID.
     @return int|false|void Database query from update.
    
  **/
  public function trackback(trackback_url:String, title:String, excerpt:String, ID:Int):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Send a pingback.
    
     @since 1.2.0
    
     @param string $server Host of blog to connect to.
     @param string $path Path to send the ping.
    
  **/
  public function weblog_ping(server:String = '', path:String = ''):Void;
  /**
    
     Default filter attached to pingback_ping_source_uri to validate the pingback's Source URI
    
     @since 3.5.1
     @see wp_http_validate_url()
    
     @param string $source_uri
     @return string
    
  **/
  public function pingback_ping_source_uri(source_uri:String):String;
  /**
    
     Default filter attached to xmlrpc_pingback_error.
    
     Returns a generic pingback error code unless the error code is 48,
     which reports that the pingback is already registered.
    
     @since 3.5.1
     @link https://www.hixie.ch/specs/pingback/pingback#TOC3
    
     @param IXR_Error $ixr_error
     @return IXR_Error
    
  **/
//   public function xmlrpc_pingback_error(ixr_error:IXR_Error):IXR_Error;
  /**
    
     Removes a comment from the object cache.
    
     @since 2.3.0
    
     @param int|array $ids Comment ID or an array of comment IDs to remove from cache.
    
  **/
  public function clean_comment_cache(ids:haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>>):Void;
  /**
    
     Updates the comment cache of given comments.
    
     Will add the comments in $comments to the cache. If comment ID already exists
     in the comment cache then it will not be updated. The comment is added to the
     cache using the comment group with the key using the ID of the comments.
    
     @since 2.3.0
     @since 4.4.0 Introduced the `$update_meta_cache` parameter.
    
     @param WP_Comment[] $comments          Array of comment objects
     @param bool         $update_meta_cache Whether to update commentmeta cache. Default true.
    
  **/
  public function update_comment_cache(comments:php.NativeIndexedArray<wp.extern.Comment>, update_meta_cache:Bool = true):Void;
  /**
    
     Adds any comments from the given IDs to the cache that do not already exist in cache.
    
     @since 4.4.0
     @access private
    
     @see update_comment_cache()
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int[] $comment_ids       Array of comment IDs.
     @param bool  $update_meta_cache Optional. Whether to update the meta cache. Default true.
    
  **/
  public function _prime_comment_caches(comment_ids:php.NativeIndexedArray<Int>, update_meta_cache:Bool = true):Void;
  /**
    
     Close comments on old posts on the fly, without any extra DB queries. Hooked to the_posts.
    
     @access private
     @since 2.7.0
    
     @param WP_Post  $posts Post data object.
     @param WP_Query $query Query object.
     @return array
    
  **/
  public function _close_comments_for_old_posts(posts:wp.extern.Post, query:wp.extern.Query):php.NativeArray;
  /**
    
     Close comments on an old post. Hooked to comments_open and pings_open.
    
     @access private
     @since 2.7.0
    
     @param bool $open Comments open or closed
     @param int $post_id Post ID
     @return bool $open
    
  **/
  public function _close_comments_for_old_post(open:Bool, post_id:Int):Bool;
  /**
    
     Handles the submission of a comment, usually posted to wp-comments-post.php via a comment form.
    
     This function expects unslashed data, as opposed to functions such as `wp_new_comment()` which
     expect slashed data.
    
     @since 4.4.0
    
     @param array $comment_data {
         Comment data.
    
         @type string|int $comment_post_ID             The ID of the post that relates to the comment.
         @type string     $author                      The name of the comment author.
         @type string     $email                       The comment author email address.
         @type string     $url                         The comment author URL.
         @type string     $comment                     The content of the comment.
         @type string|int $comment_parent              The ID of this comment's parent, if any. Default 0.
         @type string     $_wp_unfiltered_html_comment The nonce value for allowing unfiltered HTML.
     }
     @return WP_Comment|WP_Error A WP_Comment object on success, a WP_Error object on failure.
    
  **/
  public function wp_handle_comment_submission(comment_data:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<wp.extern.Comment, wp.extern.Error>;
  /**
    
     Registers the personal data exporter for comments.
    
     @since 4.9.6
    
     @param array $exporters An array of personal data exporters.
     @return array $exporters An array of personal data exporters.
    
  **/
  public function wp_register_comment_personal_data_exporter(exporters:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Finds and exports personal data associated with an email address from the comments table.
    
     @since 4.9.6
    
     @param string $email_address The comment author email address.
     @param int    $page          Comment page.
     @return array $return An array of personal data.
    
  **/
  public function wp_comments_personal_data_exporter(email_address:String, page:Int = 1):php.NativeArray;
  /**
    
     Registers the personal data eraser for comments.
    
     @since 4.9.6
    
     @param  array $erasers An array of personal data erasers.
     @return array $erasers An array of personal data erasers.
    
  **/
  public function wp_register_comment_personal_data_eraser(erasers:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Erases personal data associated with an email address from the comments table.
    
     @since 4.9.6
    
     @param  string $email_address The comment author email address.
     @param  int    $page          Comment page.
     @return array
    
  **/
  public function wp_comments_personal_data_eraser(email_address:String, page:Int = 1):php.NativeArray;
  /**
    
     Sets the last changed time for the 'comment' cache group.
    
     @since 5.0.0
    
  **/
  public function wp_cache_set_comments_last_changed():Void;
}
