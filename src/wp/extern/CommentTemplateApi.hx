package wp.extern;

extern class CommentTemplateApi implements wp.util.ApiFunctions {
  /**
    
     Retrieve the author of the current comment.
    
     If the comment has an empty comment_author field, then 'Anonymous' person is
     assumed.
    
     @since 1.5.0
     @since 4.4.0 Added the ability for `$comment_ID` to also accept a WP_Comment object.
    
     @param int|WP_Comment $comment_ID Optional. WP_Comment or the ID of the comment for which to retrieve the author.
                                       Default current comment.
     @return string The comment author
    
  **/
  public function get_comment_author(comment_ID:haxe.extern.EitherType<Int, wp.extern.Comment> = 0):String;
  /**
    
     Displays the author of the current comment.
    
     @since 0.71
     @since 4.4.0 Added the ability for `$comment_ID` to also accept a WP_Comment object.
    
     @param int|WP_Comment $comment_ID Optional. WP_Comment or the ID of the comment for which to print the author.
                                       Default current comment.
    
  **/
  public function comment_author(comment_ID:haxe.extern.EitherType<Int, wp.extern.Comment> = 0):Void;
  /**
    
     Retrieve the email of the author of the current comment.
    
     @since 1.5.0
     @since 4.4.0 Added the ability for `$comment_ID` to also accept a WP_Comment object.
    
     @param int|WP_Comment $comment_ID Optional. WP_Comment or the ID of the comment for which to get the author's email.
                                       Default current comment.
     @return string The current comment author's email
    
  **/
  public function get_comment_author_email(comment_ID:haxe.extern.EitherType<Int, wp.extern.Comment> = 0):String;
  /**
    
     Display the email of the author of the current global $comment.
    
     Care should be taken to protect the email address and assure that email
     harvesters do not capture your commentors' email address. Most assume that
     their email address will not appear in raw form on the site. Doing so will
     enable anyone, including those that people don't want to get the email
     address and use it for their own means good and bad.
    
     @since 0.71
     @since 4.4.0 Added the ability for `$comment_ID` to also accept a WP_Comment object.
    
     @param int|WP_Comment $comment_ID Optional. WP_Comment or the ID of the comment for which to print the author's email.
                                       Default current comment.
    
  **/
  public function comment_author_email(comment_ID:haxe.extern.EitherType<Int, wp.extern.Comment> = 0):Void;
  /**
    
     Display the html email link to the author of the current comment.
    
     Care should be taken to protect the email address and assure that email
     harvesters do not capture your commentors' email address. Most assume that
     their email address will not appear in raw form on the site. Doing so will
     enable anyone, including those that people don't want to get the email
     address and use it for their own means good and bad.
    
     @since 0.71
     @since 4.6.0 Added the `$comment` parameter.
    
     @param string         $linktext Optional. Text to display instead of the comment author's email address.
                                     Default empty.
     @param string         $before   Optional. Text or HTML to display before the email link. Default empty.
     @param string         $after    Optional. Text or HTML to display after the email link. Default empty.
     @param int|WP_Comment $comment  Optional. Comment ID or WP_Comment object. Default is the current comment.
    
  **/
  public function comment_author_email_link(linktext:String = '', before:String = '', after:String = '', comment:haxe.extern.EitherType<Int, wp.extern.Comment> = null):Void;
  /**
    
     Return the html email link to the author of the current comment.
    
     Care should be taken to protect the email address and assure that email
     harvesters do not capture your commentors' email address. Most assume that
     their email address will not appear in raw form on the site. Doing so will
     enable anyone, including those that people don't want to get the email
     address and use it for their own means good and bad.
    
     @since 2.7.0
     @since 4.6.0 Added the `$comment` parameter.
    
     @param string         $linktext Optional. Text to display instead of the comment author's email address.
                                     Default empty.
     @param string         $before   Optional. Text or HTML to display before the email link. Default empty.
     @param string         $after    Optional. Text or HTML to display after the email link. Default empty.
     @param int|WP_Comment $comment  Optional. Comment ID or WP_Comment object. Default is the current comment.
     @return string HTML markup for the comment author email link. By default, the email address is obfuscated
                    via the {@see 'comment_email'} filter with antispambot().
    
  **/
  public function get_comment_author_email_link(linktext:String = '', before:String = '', after:String = '', comment:haxe.extern.EitherType<Int, wp.extern.Comment> = null):String;
  /**
    
     Retrieve the HTML link to the URL of the author of the current comment.
    
     Both get_comment_author_url() and get_comment_author() rely on get_comment(),
     which falls back to the global comment variable if the $comment_ID argument is empty.
    
     @since 1.5.0
     @since 4.4.0 Added the ability for `$comment_ID` to also accept a WP_Comment object.
    
     @param int|WP_Comment $comment_ID Optional. WP_Comment or the ID of the comment for which to get the author's link.
                                       Default current comment.
     @return string The comment author name or HTML link for author's URL.
    
  **/
  public function get_comment_author_link(comment_ID:haxe.extern.EitherType<Int, wp.extern.Comment> = 0):String;
  /**
    
     Display the html link to the url of the author of the current comment.
    
     @since 0.71
     @since 4.4.0 Added the ability for `$comment_ID` to also accept a WP_Comment object.
    
     @param int|WP_Comment $comment_ID Optional. WP_Comment or the ID of the comment for which to print the author's link.
                                       Default current comment.
    
  **/
  public function comment_author_link(comment_ID:haxe.extern.EitherType<Int, wp.extern.Comment> = 0):Void;
  /**
    
     Retrieve the IP address of the author of the current comment.
    
     @since 1.5.0
     @since 4.4.0 Added the ability for `$comment_ID` to also accept a WP_Comment object.
    
     @param int|WP_Comment $comment_ID Optional. WP_Comment or the ID of the comment for which to get the author's IP address.
                                       Default current comment.
     @return string Comment author's IP address.
    
  **/
  public function get_comment_author_IP(comment_ID:haxe.extern.EitherType<Int, wp.extern.Comment> = 0):String;
  /**
    
     Display the IP address of the author of the current comment.
    
     @since 0.71
     @since 4.4.0 Added the ability for `$comment_ID` to also accept a WP_Comment object.
    
     @param int|WP_Comment $comment_ID Optional. WP_Comment or the ID of the comment for which to print the author's IP address.
                                       Default current comment.
    
  **/
  public function comment_author_IP(comment_ID:haxe.extern.EitherType<Int, wp.extern.Comment> = 0):Void;
  /**
    
     Retrieve the url of the author of the current comment.
    
     @since 1.5.0
     @since 4.4.0 Added the ability for `$comment_ID` to also accept a WP_Comment object.
    
     @param int|WP_Comment $comment_ID Optional. WP_Comment or the ID of the comment for which to get the author's URL.
                                       Default current comment.
     @return string Comment author URL.
    
  **/
  public function get_comment_author_url(comment_ID:haxe.extern.EitherType<Int, wp.extern.Comment> = 0):String;
  /**
    
     Display the url of the author of the current comment.
    
     @since 0.71
     @since 4.4.0 Added the ability for `$comment_ID` to also accept a WP_Comment object.
    
     @param int|WP_Comment $comment_ID Optional. WP_Comment or the ID of the comment for which to print the author's URL.
                                       Default current comment.
    
  **/
  public function comment_author_url(comment_ID:haxe.extern.EitherType<Int, wp.extern.Comment> = 0):Void;
  /**
    
     Retrieves the HTML link of the url of the author of the current comment.
    
     $linktext parameter is only used if the URL does not exist for the comment
     author. If the URL does exist then the URL will be used and the $linktext
     will be ignored.
    
     Encapsulate the HTML link between the $before and $after. So it will appear
     in the order of $before, link, and finally $after.
    
     @since 1.5.0
     @since 4.6.0 Added the `$comment` parameter.
    
     @param string         $linktext Optional. The text to display instead of the comment
                                     author's email address. Default empty.
     @param string         $before   Optional. The text or HTML to display before the email link.
                                     Default empty.
     @param string         $after    Optional. The text or HTML to display after the email link.
                                     Default empty.
     @param int|WP_Comment $comment  Optional. Comment ID or WP_Comment object.
                                     Default is the current comment.
     @return string The HTML link between the $before and $after parameters.
    
  **/
  public function get_comment_author_url_link(linktext:String = '', before:String = '', after:String = '', comment:haxe.extern.EitherType<Int, wp.extern.Comment> = 0):String;
  /**
    
     Displays the HTML link of the url of the author of the current comment.
    
     @since 0.71
     @since 4.6.0 Added the `$comment` parameter.
    
     @param string         $linktext Optional. Text to display instead of the comment author's
                                     email address. Default empty.
     @param string         $before   Optional. Text or HTML to display before the email link.
                                     Default empty.
     @param string         $after    Optional. Text or HTML to display after the email link.
                                     Default empty.
     @param int|WP_Comment $comment  Optional. Comment ID or WP_Comment object.
                                     Default is the current comment.
    
  **/
  public function comment_author_url_link(linktext:String = '', before:String = '', after:String = '', comment:haxe.extern.EitherType<Int, wp.extern.Comment> = 0):Void;
  /**
    
     Generates semantic classes for each comment element.
    
     @since 2.7.0
     @since 4.4.0 Added the ability for `$comment` to also accept a WP_Comment object.
    
     @param string|array   $class    Optional. One or more classes to add to the class list.
                                     Default empty.
     @param int|WP_Comment $comment  Comment ID or WP_Comment object. Default current comment.
     @param int|WP_Post    $post_id  Post ID or WP_Post object. Default current post.
     @param bool           $echo     Optional. Whether to cho or return the output.
                                     Default true.
     @return string If `$echo` is false, the class will be returned. Void otherwise.
    
  **/
  public function comment_class(class_:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = '', comment:haxe.extern.EitherType<Int, wp.extern.Comment> = null, post_id:haxe.extern.EitherType<Int, wp.extern.Post> = null, echo:Bool = true):String;
  /**
    
     Returns the classes for the comment div as an array.
    
     @since 2.7.0
     @since 4.4.0 Added the ability for `$comment_id` to also accept a WP_Comment object.
    
     @global int $comment_alt
     @global int $comment_depth
     @global int $comment_thread_alt
    
     @param string|array   $class      Optional. One or more classes to add to the class list. Default empty.
     @param int|WP_Comment $comment_id Comment ID or WP_Comment object. Default current comment.
     @param int|WP_Post    $post_id    Post ID or WP_Post object. Default current post.
     @return array An array of classes.
    
  **/
  public function get_comment_class(class_:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = '', comment_id:haxe.extern.EitherType<Int, wp.extern.Comment> = null, post_id:haxe.extern.EitherType<Int, wp.extern.Post> = null):php.NativeArray;
  /**
    
     Retrieve the comment date of the current comment.
    
     @since 1.5.0
     @since 4.4.0 Added the ability for `$comment_ID` to also accept a WP_Comment object.
    
     @param string          $d          Optional. The format of the date. Default user's setting.
     @param int|WP_Comment  $comment_ID WP_Comment or ID of the comment for which to get the date.
                                        Default current comment.
     @return string The comment's date.
    
  **/
  public function get_comment_date(d:String = '', comment_ID:haxe.extern.EitherType<Int, wp.extern.Comment> = 0):String;
  /**
    
     Display the comment date of the current comment.
    
     @since 0.71
     @since 4.4.0 Added the ability for `$comment_ID` to also accept a WP_Comment object.
    
     @param string         $d          Optional. The format of the date. Default user's settings.
     @param int|WP_Comment $comment_ID WP_Comment or ID of the comment for which to print the date.
                                       Default current comment.
    
  **/
  public function comment_date(d:String = '', comment_ID:haxe.extern.EitherType<Int, wp.extern.Comment> = 0):Void;
  /**
    
     Retrieve the excerpt of the current comment.
    
     Will cut each word and only output the first 20 words with '&hellip;' at the end.
     If the word count is less than 20, then no truncating is done and no '&hellip;'
     will appear.
    
     @since 1.5.0
     @since 4.4.0 Added the ability for `$comment_ID` to also accept a WP_Comment object.
    
     @param int|WP_Comment $comment_ID  WP_Comment or ID of the comment for which to get the excerpt.
                                        Default current comment.
     @return string The maybe truncated comment with 20 words or less.
    
  **/
  public function get_comment_excerpt(comment_ID:haxe.extern.EitherType<Int, wp.extern.Comment> = 0):String;
  /**
    
     Display the excerpt of the current comment.
    
     @since 1.2.0
     @since 4.4.0 Added the ability for `$comment_ID` to also accept a WP_Comment object.
    
     @param int|WP_Comment $comment_ID  WP_Comment or ID of the comment for which to print the excerpt.
                                        Default current comment.
    
  **/
  public function comment_excerpt(comment_ID:haxe.extern.EitherType<Int, wp.extern.Comment> = 0):Void;
  /**
    
     Retrieve the comment id of the current comment.
    
     @since 1.5.0
    
     @return int The comment ID.
    
  **/
  public function get_comment_ID():Int;
  /**
    
     Display the comment id of the current comment.
    
     @since 0.71
    
  **/
  public function comment_ID():Void;
  /**
    
     Retrieve the link to a given comment.
    
     @since 1.5.0
     @since 4.4.0 Added the ability for `$comment` to also accept a WP_Comment object. Added `$cpage` argument.
    
     @see get_page_of_comment()
    
     @global WP_Rewrite $wp_rewrite
     @global bool       $in_comment_loop
    
     @param WP_Comment|int|null $comment Comment to retrieve. Default current comment.
     @param array               $args {
         An array of optional arguments to override the defaults.
    
         @type string     $type      Passed to get_page_of_comment().
         @type int        $page      Current page of comments, for calculating comment pagination.
         @type int        $per_page  Per-page value for comment pagination.
         @type int        $max_depth Passed to get_page_of_comment().
         @type int|string $cpage     Value to use for the comment's "comment-page" or "cpage" value.
                                     If provided, this value overrides any value calculated from `$page`
                                     and `$per_page`.
     }
     @return string The permalink to the given comment.
    
  **/
  public function get_comment_link(comment:haxe.extern.EitherType<wp.extern.Comment, Int> = null, ?args:php.NativeStructArray<Dynamic>):String;
  /**
    
     Retrieves the link to the current post comments.
    
     @since 1.5.0
    
     @param int|WP_Post $post_id Optional. Post ID or WP_Post object. Default is global $post.
     @return string The link to the comments.
    
  **/
  public function get_comments_link(post_id:haxe.extern.EitherType<Int, wp.extern.Post> = 0):String;
  /**
    
     Display the link to the current post comments.
    
     @since 0.71
    
     @param string $deprecated   Not Used.
     @param string $deprecated_2 Not Used.
    
  **/
  public function comments_link(deprecated:String = '', deprecated_2:String = ''):Void;
  /**
    
     Retrieves the amount of comments a post has.
    
     @since 1.5.0
    
     @param int|WP_Post $post_id Optional. Post ID or WP_Post object. Default is the global `$post`.
     @return string|int If the post exists, a numeric string representing the number of comments
                        the post has, otherwise 0.
    
  **/
  public function get_comments_number(post_id:haxe.extern.EitherType<Int, wp.extern.Post> = 0):haxe.extern.EitherType<String, Int>;
  /**
    
     Display the language string for the number of comments the current post has.
    
     @since 0.71
    
     @param string $zero       Optional. Text for no comments. Default false.
     @param string $one        Optional. Text for one comment. Default false.
     @param string $more       Optional. Text for more than one comment. Default false.
     @param string $deprecated Not used.
    
  **/
  public function comments_number(zero:String = false, one:String = false, more:String = false, deprecated:String = ''):Void;
  /**
    
     Display the language string for the number of comments the current post has.
    
     @since 4.0.0
    
     @param string $zero Optional. Text for no comments. Default false.
     @param string $one  Optional. Text for one comment. Default false.
     @param string $more Optional. Text for more than one comment. Default false.
    
  **/
  public function get_comments_number_text(zero:String = false, one:String = false, more:String = false):Void;
  /**
    
     Retrieve the text of the current comment.
    
     @since 1.5.0
     @since 4.4.0 Added the ability for `$comment_ID` to also accept a WP_Comment object.
    
     @see Walker_Comment::comment()
    
     @param int|WP_Comment  $comment_ID WP_Comment or ID of the comment for which to get the text.
                                        Default current comment.
     @param array           $args       Optional. An array of arguments. Default empty.
     @return string The comment content.
    
  **/
  public function get_comment_text(comment_ID:haxe.extern.EitherType<Int, wp.extern.Comment> = 0, ?args:php.NativeStructArray<Dynamic>):String;
  /**
    
     Display the text of the current comment.
    
     @since 0.71
     @since 4.4.0 Added the ability for `$comment_ID` to also accept a WP_Comment object.
    
     @see Walker_Comment::comment()
    
     @param int|WP_Comment  $comment_ID WP_Comment or ID of the comment for which to print the text.
                                        Default current comment.
     @param array           $args       Optional. An array of arguments. Default empty array. Default empty.
    
  **/
  public function comment_text(comment_ID:haxe.extern.EitherType<Int, wp.extern.Comment> = 0, ?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Retrieve the comment time of the current comment.
    
     @since 1.5.0
    
     @param string $d         Optional. The format of the time. Default user's settings.
     @param bool   $gmt       Optional. Whether to use the GMT date. Default false.
     @param bool   $translate Optional. Whether to translate the time (for use in feeds).
                              Default true.
     @return string The formatted time.
    
  **/
  public function get_comment_time(d:String = '', gmt:Bool = false, translate:Bool = true):String;
  /**
    
     Display the comment time of the current comment.
    
     @since 0.71
    
     @param string $d Optional. The format of the time. Default user's settings.
    
  **/
  public function comment_time(d:String = ''):Void;
  /**
    
     Retrieve the comment type of the current comment.
    
     @since 1.5.0
     @since 4.4.0 Added the ability for `$comment_ID` to also accept a WP_Comment object.
    
     @param int|WP_Comment $comment_ID Optional. WP_Comment or ID of the comment for which to get the type.
                                       Default current comment.
     @return string The comment type.
    
  **/
  public function get_comment_type(comment_ID:haxe.extern.EitherType<Int, wp.extern.Comment> = 0):String;
  /**
    
     Display the comment type of the current comment.
    
     @since 0.71
    
     @param string $commenttxt   Optional. String to display for comment type. Default false.
     @param string $trackbacktxt Optional. String to display for trackback type. Default false.
     @param string $pingbacktxt  Optional. String to display for pingback type. Default false.
    
  **/
  public function comment_type(commenttxt:String = false, trackbacktxt:String = false, pingbacktxt:String = false):Void;
  /**
    
     Retrieve The current post's trackback URL.
    
     There is a check to see if permalink's have been enabled and if so, will
     retrieve the pretty path. If permalinks weren't enabled, the ID of the
     current post is used and appended to the correct page to go to.
    
     @since 1.5.0
    
     @return string The trackback URL after being filtered.
    
  **/
  public function get_trackback_url():String;
  /**
    
     Display the current post's trackback URL.
    
     @since 0.71
    
     @param bool $deprecated_echo Not used.
     @return void|string Should only be used to echo the trackback URL, use get_trackback_url()
                         for the result instead.
    
  **/
  public function trackback_url(deprecated_echo:Bool = true):String;
  /**
    
     Generate and display the RDF for the trackback information of current post.
    
     Deprecated in 3.0.0, and restored in 3.0.1.
    
     @since 0.71
    
     @param int $deprecated Not used (Was $timezone = 0).
    
  **/
  public function trackback_rdf(deprecated:Int = ''):Void;
  /**
    
     Determines whether the current post is open for comments.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.5.0
    
     @param int|WP_Post $post_id Post ID or WP_Post object. Default current post.
     @return bool True if the comments are open.
    
  **/
  public function comments_open(post_id:haxe.extern.EitherType<Int, wp.extern.Post> = null):Bool;
  /**
    
     Determines whether the current post is open for pings.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.5.0
    
     @param int|WP_Post $post_id Post ID or WP_Post object. Default current post.
     @return bool True if pings are accepted
    
  **/
  public function pings_open(post_id:haxe.extern.EitherType<Int, wp.extern.Post> = null):Bool;
  /**
    
     Display form token for unfiltered comments.
    
     Will only display nonce token if the current user has permissions for
     unfiltered html. Won't display the token for other users.
    
     The function was backported to 2.0.10 and was added to versions 2.1.3 and
     above. Does not exist in versions prior to 2.0.10 in the 2.0 branch and in
     the 2.1 branch, prior to 2.1.3. Technically added in 2.2.0.
    
     Backported to 2.0.10.
    
     @since 2.1.3
    
  **/
  public function wp_comment_form_unfiltered_html_nonce():Void;
  /**
    
     Load the comment template specified in $file.
    
     Will not display the comments template if not on single post or page, or if
     the post does not have comments.
    
     Uses the WordPress database object to query for the comments. The comments
     are passed through the {@see 'comments_array'} filter hook with the list of comments
     and the post ID respectively.
    
     The `$file` path is passed through a filter hook called {@see 'comments_template'},
     which includes the TEMPLATEPATH and $file combined. Tries the $filtered path
     first and if it fails it will require the default comment template from the
     default theme. If either does not exist, then the WordPress process will be
     halted. It is advised for that reason, that the default theme is not deleted.
    
     Will not try to get the comments if the post has none.
    
     @since 1.5.0
    
     @global WP_Query   $wp_query
     @global WP_Post    $post
     @global wpdb       $wpdb
     @global int        $id
     @global WP_Comment $comment
     @global string     $user_login
     @global int        $user_ID
     @global string     $user_identity
     @global bool       $overridden_cpage
     @global bool       $withcomments
    
     @param string $file              Optional. The file to load. Default '/comments.php'.
     @param bool   $separate_comments Optional. Whether to separate the comments by comment type.
                                      Default false.
    
  **/
  public function comments_template(file:String = '/comments.php', separate_comments:Bool = false):Void;
  /**
    
     Displays the link to the comments for the current post ID.
    
     @since 0.71
    
     @param false|string $zero      Optional. String to display when no comments. Default false.
     @param false|string $one       Optional. String to display when only one comment is available. Default false.
     @param false|string $more      Optional. String to display when there are more than one comment. Default false.
     @param string       $css_class Optional. CSS class to use for comments. Default empty.
     @param false|string $none      Optional. String to display when comments have been turned off. Default false.
    
  **/
  public function comments_popup_link(zero:haxe.extern.EitherType<Bool, String> = false, one:haxe.extern.EitherType<Bool, String> = false, more:haxe.extern.EitherType<Bool, String> = false, css_class:String = '', none:haxe.extern.EitherType<Bool, String> = false):Void;
  /**
    
     Retrieve HTML content for reply to comment link.
    
     @since 2.7.0
     @since 4.4.0 Added the ability for `$comment` to also accept a WP_Comment object.
    
     @param array $args {
         Optional. Override default arguments.
    
         @type string $add_below  The first part of the selector used to identify the comment to respond below.
                                  The resulting value is passed as the first parameter to addComment.moveForm(),
                                  concatenated as $add_below-$comment->comment_ID. Default 'comment'.
         @type string $respond_id The selector identifying the responding comment. Passed as the third parameter
                                  to addComment.moveForm(), and appended to the link URL as a hash value.
                                  Default 'respond'.
         @type string $reply_text The text of the Reply link. Default 'Reply'.
         @type string $login_text The text of the link to reply if logged out. Default 'Log in to Reply'.
         @type int    $max_depth  The max depth of the comment tree. Default 0.
         @type int    $depth      The depth of the new comment. Must be greater than 0 and less than the value
                                  of the 'thread_comments_depth' option set in Settings > Discussion. Default 0.
         @type string $before     The text or HTML to add before the reply link. Default empty.
         @type string $after      The text or HTML to add after the reply link. Default empty.
     }
     @param int|WP_Comment $comment Comment being replied to. Default current comment.
     @param int|WP_Post    $post    Post ID or WP_Post object the comment is going to be displayed on.
                                    Default current post.
     @return void|false|string Link to show comment form, if successful. False, if comments are closed.
    
  **/
  public function get_comment_reply_link(?args:php.NativeStructArray<Dynamic>, comment:haxe.extern.EitherType<Int, wp.extern.Comment> = null, post:haxe.extern.EitherType<Int, wp.extern.Post> = null):haxe.extern.EitherType<Bool, String>;
  /**
    
     Displays the HTML content for reply to comment link.
    
     @since 2.7.0
    
     @see get_comment_reply_link()
    
     @param array       $args    Optional. Override default options.
     @param int         $comment Comment being replied to. Default current comment.
     @param int|WP_Post $post    Post ID or WP_Post object the comment is going to be displayed on.
                                 Default current post.
     @return mixed Link to show comment form, if successful. False, if comments are closed.
    
  **/
  public function comment_reply_link(?args:php.NativeStructArray<Dynamic>, comment:Int = null, post:haxe.extern.EitherType<Int, wp.extern.Post> = null):Dynamic;
  /**
    
     Retrieve HTML content for reply to post link.
    
     @since 2.7.0
    
     @param array $args {
         Optional. Override default arguments.
    
         @type string $add_below  The first part of the selector used to identify the comment to respond below.
                                  The resulting value is passed as the first parameter to addComment.moveForm(),
                                  concatenated as $add_below-$comment->comment_ID. Default is 'post'.
         @type string $respond_id The selector identifying the responding comment. Passed as the third parameter
                                  to addComment.moveForm(), and appended to the link URL as a hash value.
                                  Default 'respond'.
         @type string $reply_text Text of the Reply link. Default is 'Leave a Comment'.
         @type string $login_text Text of the link to reply if logged out. Default is 'Log in to leave a Comment'.
         @type string $before     Text or HTML to add before the reply link. Default empty.
         @type string $after      Text or HTML to add after the reply link. Default empty.
     }
     @param int|WP_Post $post    Optional. Post ID or WP_Post object the comment is going to be displayed on.
                                 Default current post.
     @return false|null|string Link to show comment form, if successful. False, if comments are closed.
    
  **/
  public function get_post_reply_link(?args:php.NativeStructArray<Dynamic>, post:haxe.extern.EitherType<Int, wp.extern.Post> = null):haxe.extern.EitherType<Bool, String>;
  /**
    
     Displays the HTML content for reply to post link.
    
     @since 2.7.0
    
     @see get_post_reply_link()
    
     @param array       $args Optional. Override default options,
     @param int|WP_Post $post Post ID or WP_Post object the comment is going to be displayed on.
                              Default current post.
     @return string|bool|null Link to show comment form, if successful. False, if comments are closed.
    
  **/
  public function post_reply_link(?args:php.NativeStructArray<Dynamic>, post:haxe.extern.EitherType<Int, wp.extern.Post> = null):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieve HTML content for cancel comment reply link.
    
     @since 2.7.0
    
     @param string $text Optional. Text to display for cancel reply link. Default empty.
     @return string
    
  **/
  public function get_cancel_comment_reply_link(text:String = ''):String;
  /**
    
     Display HTML content for cancel comment reply link.
    
     @since 2.7.0
    
     @param string $text Optional. Text to display for cancel reply link. Default empty.
    
  **/
  public function cancel_comment_reply_link(text:String = ''):Void;
  /**
    
     Retrieve hidden input HTML for replying to comments.
    
     @since 3.0.0
    
     @param int $id Optional. Post ID. Default current post ID.
     @return string Hidden input HTML for replying to comments
    
  **/
  public function get_comment_id_fields(id:Int = 0):String;
  /**
    
     Output hidden input HTML for replying to comments.
    
     @since 2.7.0
    
     @param int $id Optional. Post ID. Default current post ID.
    
  **/
  public function comment_id_fields(id:Int = 0):Void;
  /**
    
     Display text based on comment reply status.
    
     Only affects users with JavaScript disabled.
    
     @internal The $comment global must be present to allow template tags access to the current
               comment. See https://core.trac.wordpress.org/changeset/36512.
    
     @since 2.7.0
    
     @global WP_Comment $comment Current comment.
    
     @param string $noreplytext  Optional. Text to display when not replying to a comment.
                                 Default false.
     @param string $replytext    Optional. Text to display when replying to a comment.
                                 Default false. Accepts "%s" for the author of the comment
                                 being replied to.
     @param string $linktoparent Optional. Boolean to control making the author's name a link
                                 to their comment. Default true.
    
  **/
  public function comment_form_title(noreplytext:String = false, replytext:String = false, linktoparent:String = true):Void;
  /**
    
     List comments.
    
     Used in the comments.php template to list comments for a particular post.
    
     @since 2.7.0
    
     @see WP_Query->comments
    
     @global WP_Query $wp_query
     @global int      $comment_alt
     @global int      $comment_depth
     @global int      $comment_thread_alt
     @global bool     $overridden_cpage
     @global bool     $in_comment_loop
    
     @param string|array $args {
         Optional. Formatting options.
    
         @type object $walker            Instance of a Walker class to list comments. Default null.
         @type int    $max_depth         The maximum comments depth. Default empty.
         @type string $style             The style of list ordering. Default 'ul'. Accepts 'ul', 'ol'.
         @type string $callback          Callback function to use. Default null.
         @type string $end-callback      Callback function to use at the end. Default null.
         @type string $type              Type of comments to list.
                                         Default 'all'. Accepts 'all', 'comment', 'pingback', 'trackback', 'pings'.
         @type int    $page              Page ID to list comments for. Default empty.
         @type int    $per_page          Number of comments to list per page. Default empty.
         @type int    $avatar_size       Height and width dimensions of the avatar size. Default 32.
         @type bool   $reverse_top_level Ordering of the listed comments. If true, will display newest comments first.
         @type bool   $reverse_children  Whether to reverse child comments in the list. Default null.
         @type string $format            How to format the comments list.
                                         Default 'html5' if the theme supports it. Accepts 'html5', 'xhtml'.
         @type bool   $short_ping        Whether to output short pings. Default false.
         @type bool   $echo              Whether to echo the output or return it. Default true.
     }
     @param array $comments Optional. Array of WP_Comment objects.
    
  **/
  public function wp_list_comments(?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, comments:php.NativeStructArray<Dynamic> = null):Void;
  /**
    
     Outputs a complete commenting form for use within a template.
    
     Most strings and form fields may be controlled through the $args array passed
     into the function, while you may also choose to use the {@see 'comment_form_default_fields'}
     filter to modify the array of default fields if you'd just like to add a new
     one or remove a single field. All fields are also individually passed through
     a filter of the {@see 'comment_form_field_$name'} where $name is the key used
     in the array of fields.
    
     @since 3.0.0
     @since 4.1.0 Introduced the 'class_submit' argument.
     @since 4.2.0 Introduced the 'submit_button' and 'submit_fields' arguments.
     @since 4.4.0 Introduced the 'class_form', 'title_reply_before', 'title_reply_after',
                  'cancel_reply_before', and 'cancel_reply_after' arguments.
     @since 4.5.0 The 'author', 'email', and 'url' form fields are limited to 245, 100,
                  and 200 characters, respectively.
     @since 4.6.0 Introduced the 'action' argument.
     @since 4.9.6 Introduced the 'cookies' default comment field.
    
     @param array       $args {
         Optional. Default arguments and form fields to override.
    
         @type array $fields {
             Default comment fields, filterable by default via the {@see 'comment_form_default_fields'} hook.
    
             @type string $author  Comment author field HTML.
             @type string $email   Comment author email field HTML.
             @type string $url     Comment author URL field HTML.
             @type string $cookies Comment cookie opt-in field HTML.
         }
         @type string $comment_field        The comment textarea field HTML.
         @type string $must_log_in          HTML element for a 'must be logged in to comment' message.
         @type string $logged_in_as         HTML element for a 'logged in as [user]' message.
         @type string $comment_notes_before HTML element for a message displayed before the comment fields
                                            if the user is not logged in.
                                            Default 'Your email address will not be published.'.
         @type string $comment_notes_after  HTML element for a message displayed after the textarea field.
         @type string $action               The comment form element action attribute. Default '/wp-comments-post.php'.
         @type string $id_form              The comment form element id attribute. Default 'commentform'.
         @type string $id_submit            The comment submit element id attribute. Default 'submit'.
         @type string $class_form           The comment form element class attribute. Default 'comment-form'.
         @type string $class_submit         The comment submit element class attribute. Default 'submit'.
         @type string $name_submit          The comment submit element name attribute. Default 'submit'.
         @type string $title_reply          The translatable 'reply' button label. Default 'Leave a Reply'.
         @type string $title_reply_to       The translatable 'reply-to' button label. Default 'Leave a Reply to %s',
                                            where %s is the author of the comment being replied to.
         @type string $title_reply_before   HTML displayed before the comment form title.
                                            Default: '<h3 id="reply-title" class="comment-reply-title">'.
         @type string $title_reply_after    HTML displayed after the comment form title.
                                            Default: '</h3>'.
         @type string $cancel_reply_before  HTML displayed before the cancel reply link.
         @type string $cancel_reply_after   HTML displayed after the cancel reply link.
         @type string $cancel_reply_link    The translatable 'cancel reply' button label. Default 'Cancel reply'.
         @type string $label_submit         The translatable 'submit' button label. Default 'Post a comment'.
         @type string $submit_button        HTML format for the Submit button.
                                            Default: '<input name="%1$s" type="submit" id="%2$s" class="%3$s" value="%4$s" />'.
         @type string $submit_field         HTML format for the markup surrounding the Submit button and comment hidden
                                            fields. Default: '<p class="form-submit">%1$s %2$s</p>', where %1$s is the
                                            submit button markup and %2$s is the comment hidden fields.
         @type string $format               The comment form format. Default 'xhtml'. Accepts 'xhtml', 'html5'.
     }
     @param int|WP_Post $post_id Post ID or WP_Post object to generate the form for. Default current post.
    
  **/
  public function comment_form(?args:php.NativeStructArray<Dynamic>, post_id:haxe.extern.EitherType<Int, wp.extern.Post> = null):Void;
}
