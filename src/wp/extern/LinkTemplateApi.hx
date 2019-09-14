package wp.extern;

extern class LinkTemplateApi implements wp.util.ApiFunctions {
  /**
    
     Displays the permalink for the current post.
    
     @since 1.2.0
     @since 4.4.0 Added the `$post` parameter.
    
     @param int|WP_Post $post Optional. Post ID or post object. Default is the global `$post`.
    
  **/
  public function the_permalink(post:haxe.extern.EitherType<Int, wp.extern.Post> = 0):Void;
  /**
    
     Retrieves a trailing-slashed string if the site is set for adding trailing slashes.
    
     Conditionally adds a trailing slash if the permalink structure has a trailing
     slash, strips the trailing slash if not. The string is passed through the
     {@see 'user_trailingslashit'} filter. Will remove trailing slash from string, if
     site is not set to have them.
    
     @since 2.2.0
    
     @global WP_Rewrite $wp_rewrite
    
     @param string $string      URL with or without a trailing slash.
     @param string $type_of_url Optional. The type of URL being considered (e.g. single, category, etc)
                                for use in the filter. Default empty string.
     @return string The URL with the trailing slash appended or stripped.
    
  **/
  public function user_trailingslashit(string:String, type_of_url:String = ''):String;
  /**
    
     Displays the permalink anchor for the current post.
    
     The permalink mode title will use the post title for the 'a' element 'id'
     attribute. The id mode uses 'post-' with the post ID for the 'id' attribute.
    
     @since 0.71
    
     @param string $mode Optional. Permalink mode. Accepts 'title' or 'id'. Default 'id'.
    
  **/
  public function permalink_anchor(mode:String = 'id'):Void;
  /**
    
     Retrieves the full permalink for the current post or post ID.
    
     This function is an alias for get_permalink().
    
     @since 3.9.0
    
     @see get_permalink()
    
     @param int|WP_Post $post      Optional. Post ID or post object. Default is the global `$post`.
     @param bool        $leavename Optional. Whether to keep post name or page name. Default false.
    
     @return string|false The permalink URL or false if post does not exist.
    
  **/
  public function get_the_permalink(post:haxe.extern.EitherType<Int, wp.extern.Post> = 0, leavename:Bool = false):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieves the full permalink for the current post or post ID.
    
     @since 1.0.0
    
     @param int|WP_Post $post      Optional. Post ID or post object. Default is the global `$post`.
     @param bool        $leavename Optional. Whether to keep post name or page name. Default false.
     @return string|false The permalink URL or false if post does not exist.
    
  **/
  public function get_permalink(post:haxe.extern.EitherType<Int, wp.extern.Post> = 0, leavename:Bool = false):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieves the permalink for a post of a custom post type.
    
     @since 3.0.0
    
     @global WP_Rewrite $wp_rewrite
    
     @param int|WP_Post $id        Optional. Post ID or post object. Default is the global `$post`.
     @param bool        $leavename Optional, defaults to false. Whether to keep post name. Default false.
     @param bool        $sample    Optional, defaults to false. Is it a sample permalink. Default false.
     @return string|WP_Error The post permalink.
    
  **/
  public function get_post_permalink(id:haxe.extern.EitherType<Int, wp.extern.Post> = 0, leavename:Bool = false, sample:Bool = false):haxe.extern.EitherType<String, wp.extern.Error>;
  /**
    
     Retrieves the permalink for the current page or page ID.
    
     Respects page_on_front. Use this one.
    
     @since 1.5.0
    
     @param int|WP_Post $post      Optional. Post ID or object. Default uses the global `$post`.
     @param bool        $leavename Optional. Whether to keep the page name. Default false.
     @param bool        $sample    Optional. Whether it should be treated as a sample permalink.
                                   Default false.
     @return string The page permalink.
    
  **/
  public function get_page_link(post:haxe.extern.EitherType<Int, wp.extern.Post> = cast false, leavename:Bool = false, sample:Bool = false):String;
  /**
    
     Retrieves the page permalink.
    
     Ignores page_on_front. Internal use only.
    
     @since 2.1.0
     @access private
    
     @global WP_Rewrite $wp_rewrite
    
     @param int|WP_Post $post      Optional. Post ID or object. Default uses the global `$post`.
     @param bool        $leavename Optional. Whether to keep the page name. Default false.
     @param bool        $sample    Optional. Whether it should be treated as a sample permalink.
                                   Default false.
     @return string The page permalink.
    
  **/
  public function _get_page_link(post:haxe.extern.EitherType<Int, wp.extern.Post> = cast false, leavename:Bool = false, sample:Bool = false):String;
  /**
    
     Retrieves the permalink for an attachment.
    
     This can be used in the WordPress Loop or outside of it.
    
     @since 2.0.0
    
     @global WP_Rewrite $wp_rewrite
    
     @param int|object $post      Optional. Post ID or object. Default uses the global `$post`.
     @param bool       $leavename Optional. Whether to keep the page name. Default false.
     @return string The attachment permalink.
    
  **/
  public function get_attachment_link(post:haxe.extern.EitherType<Int, Dynamic> = null, leavename:Bool = false):String;
  /**
    
     Retrieves the permalink for the year archives.
    
     @since 1.5.0
    
     @global WP_Rewrite $wp_rewrite
    
     @param int|bool $year False for current year or year for permalink.
     @return string The permalink for the specified year archive.
    
  **/
  public function get_year_link(year:haxe.extern.EitherType<Int, Bool>):String;
  /**
    
     Retrieves the permalink for the month archives with year.
    
     @since 1.0.0
    
     @global WP_Rewrite $wp_rewrite
    
     @param bool|int $year  False for current year. Integer of year.
     @param bool|int $month False for current month. Integer of month.
     @return string The permalink for the specified month and year archive.
    
  **/
  public function get_month_link(year:haxe.extern.EitherType<Bool, Int>, month:haxe.extern.EitherType<Bool, Int>):String;
  /**
    
     Retrieves the permalink for the day archives with year and month.
    
     @since 1.0.0
    
     @global WP_Rewrite $wp_rewrite
    
     @param bool|int $year  False for current year. Integer of year.
     @param bool|int $month False for current month. Integer of month.
     @param bool|int $day   False for current day. Integer of day.
     @return string The permalink for the specified day, month, and year archive.
    
  **/
  public function get_day_link(year:haxe.extern.EitherType<Bool, Int>, month:haxe.extern.EitherType<Bool, Int>, day:haxe.extern.EitherType<Bool, Int>):String;
  /**
    
     Displays the permalink for the feed type.
    
     @since 3.0.0
    
     @param string $anchor The link's anchor text.
     @param string $feed   Optional. Feed type. Default empty.
    
  **/
  public function the_feed_link(anchor:String, feed:String = ''):Void;
  /**
    
     Retrieves the permalink for the feed type.
    
     @since 1.5.0
    
     @global WP_Rewrite $wp_rewrite
    
     @param string $feed Optional. Feed type. Default empty.
     @return string The feed permalink.
    
  **/
  public function get_feed_link(feed:String = ''):String;
  /**
    
     Retrieves the permalink for the post comments feed.
    
     @since 2.2.0
    
     @param int    $post_id Optional. Post ID. Default is the ID of the global `$post`.
     @param string $feed    Optional. Feed type. Default empty.
     @return string The permalink for the comments feed for the given post.
    
  **/
  public function get_post_comments_feed_link(post_id:Int = 0, feed:String = ''):String;
  /**
    
     Displays the comment feed link for a post.
    
     Prints out the comment feed link for a post. Link text is placed in the
     anchor. If no link text is specified, default text is used. If no post ID is
     specified, the current post is used.
    
     @since 2.5.0
    
     @param string $link_text Optional. Descriptive link text. Default 'Comments Feed'.
     @param int    $post_id   Optional. Post ID. Default is the ID of the global `$post`.
     @param string $feed      Optional. Feed format. Default empty.
    
  **/
  public function post_comments_feed_link(link_text:String = '', post_id:Int = cast '', feed:String = ''):Void;
  /**
    
     Retrieves the feed link for a given author.
    
     Returns a link to the feed for all posts by a given author. A specific feed
     can be requested or left blank to get the default feed.
    
     @since 2.5.0
    
     @param int    $author_id Author ID.
     @param string $feed      Optional. Feed type. Default empty.
     @return string Link to the feed for the author specified by $author_id.
    
  **/
  public function get_author_feed_link(author_id:Int, feed:String = ''):String;
  /**
    
     Retrieves the feed link for a category.
    
     Returns a link to the feed for all posts in a given category. A specific feed
     can be requested or left blank to get the default feed.
    
     @since 2.5.0
    
     @param int    $cat_id Category ID.
     @param string $feed   Optional. Feed type. Default empty.
     @return string Link to the feed for the category specified by $cat_id.
    
  **/
  public function get_category_feed_link(cat_id:Int, feed:String = ''):String;
  /**
    
     Retrieves the feed link for a term.
    
     Returns a link to the feed for all posts in a given term. A specific feed
     can be requested or left blank to get the default feed.
    
     @since 3.0.0
    
     @param int    $term_id  Term ID.
     @param string $taxonomy Optional. Taxonomy of `$term_id`. Default 'category'.
     @param string $feed     Optional. Feed type. Default empty.
     @return string|false Link to the feed for the term specified by $term_id and $taxonomy.
    
  **/
  public function get_term_feed_link(term_id:Int, taxonomy:String = 'category', feed:String = ''):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieves the permalink for a tag feed.
    
     @since 2.3.0
    
     @param int    $tag_id Tag ID.
     @param string $feed   Optional. Feed type. Default empty.
     @return string The feed permalink for the given tag.
    
  **/
  public function get_tag_feed_link(tag_id:Int, feed:String = ''):String;
  /**
    
     Retrieves the edit link for a tag.
    
     @since 2.7.0
    
     @param int    $tag_id   Tag ID.
     @param string $taxonomy Optional. Taxonomy slug. Default 'post_tag'.
     @return string The edit tag link URL for the given tag.
    
  **/
  public function get_edit_tag_link(tag_id:Int, taxonomy:String = 'post_tag'):String;
  /**
    
     Displays or retrieves the edit link for a tag with formatting.
    
     @since 2.7.0
    
     @param string  $link   Optional. Anchor text. Default empty.
     @param string  $before Optional. Display before edit link. Default empty.
     @param string  $after  Optional. Display after edit link. Default empty.
     @param WP_Term $tag    Optional. Term object. If null, the queried object will be inspected.
                            Default null.
    
  **/
  public function edit_tag_link(link:String = '', before:String = '', after:String = '', tag:wp.extern.Term = null):Void;
  /**
    
     Retrieves the URL for editing a given term.
    
     @since 3.1.0
     @since 4.5.0 The `$taxonomy` argument was made optional.
    
     @param int    $term_id     Term ID.
     @param string $taxonomy    Optional. Taxonomy. Defaults to the taxonomy of the term identified
                                by `$term_id`.
     @param string $object_type Optional. The object type. Used to highlight the proper post type
                                menu on the linked page. Defaults to the first object_type associated
                                with the taxonomy.
     @return string|null The edit term link URL for the given term, or null on failure.
    
  **/
  public function get_edit_term_link(term_id:Int, taxonomy:String = '', object_type:String = ''):String;
  /**
    
     Displays or retrieves the edit term link with formatting.
    
     @since 3.1.0
    
     @param string $link   Optional. Anchor text. Default empty.
     @param string $before Optional. Display before edit link. Default empty.
     @param string $after  Optional. Display after edit link. Default empty.
     @param object $term   Optional. Term object. If null, the queried object will be inspected. Default null.
     @param bool   $echo   Optional. Whether or not to echo the return. Default true.
     @return string|void HTML content.
    
  **/
  public function edit_term_link(link:String = '', before:String = '', after:String = '', term:Dynamic = null, echo:Bool = true):String;
  /**
    
     Retrieves the permalink for a search.
    
     @since  3.0.0
    
     @global WP_Rewrite $wp_rewrite
    
     @param string $query Optional. The query string to use. If empty the current query is used. Default empty.
     @return string The search permalink.
    
  **/
  public function get_search_link(query:String = ''):String;
  /**
    
     Retrieves the permalink for the search results feed.
    
     @since 2.5.0
    
     @global WP_Rewrite $wp_rewrite
    
     @param string $search_query Optional. Search query. Default empty.
     @param string $feed         Optional. Feed type. Default empty.
     @return string The search results feed permalink.
    
  **/
  public function get_search_feed_link(search_query:String = '', feed:String = ''):String;
  /**
    
     Retrieves the permalink for the search results comments feed.
    
     @since 2.5.0
    
     @global WP_Rewrite $wp_rewrite
    
     @param string $search_query Optional. Search query. Default empty.
     @param string $feed         Optional. Feed type. Default empty.
     @return string The comments feed search results permalink.
    
  **/
  public function get_search_comments_feed_link(search_query:String = '', feed:String = ''):String;
  /**
    
     Retrieves the permalink for a post type archive.
    
     @since 3.1.0
     @since 4.5.0 Support for posts was added.
    
     @global WP_Rewrite $wp_rewrite
    
     @param string $post_type Post type.
     @return string|false The post type archive permalink.
    
  **/
  public function get_post_type_archive_link(post_type:String):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieves the permalink for a post type archive feed.
    
     @since 3.1.0
    
     @param string $post_type Post type
     @param string $feed      Optional. Feed type. Default empty.
     @return string|false The post type feed permalink.
    
  **/
  public function get_post_type_archive_feed_link(post_type:String, feed:String = ''):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieves the URL used for the post preview.
    
     Allows additional query args to be appended.
    
     @since 4.4.0
    
     @param int|WP_Post $post         Optional. Post ID or `WP_Post` object. Defaults to global `$post`.
     @param array       $query_args   Optional. Array of additional query args to be appended to the link.
                                      Default empty array.
     @param string      $preview_link Optional. Base preview link to be used if it should differ from the
                                      post permalink. Default empty.
     @return string|null URL used for the post preview, or null if the post does not exist.
    
  **/
  public function get_preview_post_link(post:haxe.extern.EitherType<Int, wp.extern.Post> = null, ?query_args:php.NativeStructArray<Dynamic>, preview_link:String = ''):String;
  /**
    
     Retrieves the edit post link for post.
    
     Can be used within the WordPress loop or outside of it. Can be used with
     pages, posts, attachments, and revisions.
    
     @since 2.3.0
    
     @param int|WP_Post $id      Optional. Post ID or post object. Default is the global `$post`.
     @param string      $context Optional. How to output the '&' character. Default '&amp;'.
     @return string|null The edit post link for the given post. null if the post type is invalid or does
                         not allow an editing UI.
    
  **/
  public function get_edit_post_link(id:haxe.extern.EitherType<Int, wp.extern.Post> = 0, context:String = 'display'):String;
  /**
    
     Displays the edit post link for post.
    
     @since 1.0.0
     @since 4.4.0 The `$class` argument was added.
    
     @param string      $text   Optional. Anchor text. If null, default is 'Edit This'. Default null.
     @param string      $before Optional. Display before edit link. Default empty.
     @param string      $after  Optional. Display after edit link. Default empty.
     @param int|WP_Post $id     Optional. Post ID or post object. Default is the global `$post`.
     @param string      $class  Optional. Add custom class to link. Default 'post-edit-link'.
    
  **/
  public function edit_post_link(text:String = null, before:String = '', after:String = '', id:haxe.extern.EitherType<Int, wp.extern.Post> = 0, class_:String = 'post-edit-link'):Void;
  /**
    
     Retrieves the delete posts link for post.
    
     Can be used within the WordPress loop or outside of it, with any post type.
    
     @since 2.9.0
    
     @param int|WP_Post $id           Optional. Post ID or post object. Default is the global `$post`.
     @param string      $deprecated   Not used.
     @param bool        $force_delete Optional. Whether to bypass trash and force deletion. Default false.
     @return string|void The delete post link URL for the given post.
    
  **/
  public function get_delete_post_link(id:haxe.extern.EitherType<Int, wp.extern.Post> = 0, deprecated:String = '', force_delete:Bool = false):String;
  /**
    
     Retrieves the edit comment link.
    
     @since 2.3.0
    
     @param int|WP_Comment $comment_id Optional. Comment ID or WP_Comment object.
     @return string|void The edit comment link URL for the given comment.
    
  **/
  public function get_edit_comment_link(comment_id:haxe.extern.EitherType<Int, wp.extern.Comment> = 0):String;
  /**
    
     Displays the edit comment link with formatting.
    
     @since 1.0.0
    
     @param string $text   Optional. Anchor text. If null, default is 'Edit This'. Default null.
     @param string $before Optional. Display before edit link. Default empty.
     @param string $after  Optional. Display after edit link. Default empty.
    
  **/
  public function edit_comment_link(text:String = null, before:String = '', after:String = ''):Void;
  /**
    
     Displays the edit bookmark link.
    
     @since 2.7.0
    
     @param int|stdClass $link Optional. Bookmark ID. Default is the id of the current bookmark.
     @return string|void The edit bookmark link URL.
    
  **/
  public function get_edit_bookmark_link(link:haxe.extern.EitherType<Int, Dynamic> = 0):String;
  /**
    
     Displays the edit bookmark link anchor content.
    
     @since 2.7.0
    
     @param string $link     Optional. Anchor text. Default empty.
     @param string $before   Optional. Display before edit link. Default empty.
     @param string $after    Optional. Display after edit link. Default empty.
     @param int    $bookmark Optional. Bookmark ID. Default is the current bookmark.
    
  **/
  public function edit_bookmark_link(link:String = '', before:String = '', after:String = '', bookmark:Int = null):Void;
  /**
    
     Retrieves the edit user link.
    
     @since 3.5.0
    
     @param int $user_id Optional. User ID. Defaults to the current user.
     @return string URL to edit user page or empty string.
    
  **/
  public function get_edit_user_link(user_id:Int = null):String;
  /**
    
     Retrieves the previous post that is adjacent to the current post.
    
     @since 1.5.0
    
     @param bool         $in_same_term   Optional. Whether post should be in a same taxonomy term. Default false.
     @param array|string $excluded_terms Optional. Array or comma-separated list of excluded term IDs. Default empty.
     @param string       $taxonomy       Optional. Taxonomy, if $in_same_term is true. Default 'category'.
     @return null|string|WP_Post Post object if successful. Null if global $post is not set. Empty string if no
                                 corresponding post exists.
    
  **/
  public function get_previous_post(in_same_term:Bool = false, excluded_terms:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = '', taxonomy:String = 'category'):haxe.extern.EitherType<String, wp.extern.Post>;
  /**
    
     Retrieves the next post that is adjacent to the current post.
    
     @since 1.5.0
    
     @param bool         $in_same_term   Optional. Whether post should be in a same taxonomy term. Default false.
     @param array|string $excluded_terms Optional. Array or comma-separated list of excluded term IDs. Default empty.
     @param string       $taxonomy       Optional. Taxonomy, if $in_same_term is true. Default 'category'.
     @return null|string|WP_Post Post object if successful. Null if global $post is not set. Empty string if no
                                 corresponding post exists.
    
  **/
  public function get_next_post(in_same_term:Bool = false, excluded_terms:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = '', taxonomy:String = 'category'):haxe.extern.EitherType<String, wp.extern.Post>;
  /**
    
     Retrieves the adjacent post.
    
     Can either be next or previous post.
    
     @since 2.5.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param bool         $in_same_term   Optional. Whether post should be in a same taxonomy term. Default false.
     @param array|string $excluded_terms Optional. Array or comma-separated list of excluded term IDs. Default empty.
     @param bool         $previous       Optional. Whether to retrieve previous post. Default true
     @param string       $taxonomy       Optional. Taxonomy, if $in_same_term is true. Default 'category'.
     @return null|string|WP_Post Post object if successful. Null if global $post is not set. Empty string if no
                                 corresponding post exists.
    
  **/
  public function get_adjacent_post(in_same_term:Bool = false, excluded_terms:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = '', previous:Bool = true, taxonomy:String = 'category'):haxe.extern.EitherType<String, wp.extern.Post>;
  /**
    
     Retrieves the adjacent post relational link.
    
     Can either be next or previous post relational link.
    
     @since 2.8.0
    
     @param string       $title          Optional. Link title format. Default '%title'.
     @param bool         $in_same_term   Optional. Whether link should be in a same taxonomy term. Default false.
     @param array|string $excluded_terms Optional. Array or comma-separated list of excluded term IDs. Default empty.
     @param bool         $previous       Optional. Whether to display link to previous or next post. Default true.
     @param string       $taxonomy       Optional. Taxonomy, if $in_same_term is true. Default 'category'.
     @return string|void The adjacent post relational link URL.
    
  **/
  public function get_adjacent_post_rel_link(title:String = '%title', in_same_term:Bool = false, excluded_terms:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = '', previous:Bool = true, taxonomy:String = 'category'):String;
  /**
    
     Displays the relational links for the posts adjacent to the current post.
    
     @since 2.8.0
    
     @param string       $title          Optional. Link title format. Default '%title'.
     @param bool         $in_same_term   Optional. Whether link should be in a same taxonomy term. Default false.
     @param array|string $excluded_terms Optional. Array or comma-separated list of excluded term IDs. Default empty.
     @param string       $taxonomy       Optional. Taxonomy, if $in_same_term is true. Default 'category'.
    
  **/
  public function adjacent_posts_rel_link(title:String = '%title', in_same_term:Bool = false, excluded_terms:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = '', taxonomy:String = 'category'):Void;
  /**
    
     Displays relational links for the posts adjacent to the current post for single post pages.
    
     This is meant to be attached to actions like 'wp_head'. Do not call this directly in plugins
     or theme templates.
    
     @since 3.0.0
    
     @see adjacent_posts_rel_link()
    
  **/
  public function adjacent_posts_rel_link_wp_head():Void;
  /**
    
     Displays the relational link for the next post adjacent to the current post.
    
     @since 2.8.0
    
     @see get_adjacent_post_rel_link()
    
     @param string       $title          Optional. Link title format. Default '%title'.
     @param bool         $in_same_term   Optional. Whether link should be in a same taxonomy term. Default false.
     @param array|string $excluded_terms Optional. Array or comma-separated list of excluded term IDs. Default empty.
     @param string       $taxonomy       Optional. Taxonomy, if $in_same_term is true. Default 'category'.
    
  **/
  public function next_post_rel_link(title:String = '%title', in_same_term:Bool = false, excluded_terms:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = '', taxonomy:String = 'category'):Void;
  /**
    
     Displays the relational link for the previous post adjacent to the current post.
    
     @since 2.8.0
    
     @see get_adjacent_post_rel_link()
    
     @param string       $title          Optional. Link title format. Default '%title'.
     @param bool         $in_same_term   Optional. Whether link should be in a same taxonomy term. Default false.
     @param array|string $excluded_terms Optional. Array or comma-separated list of excluded term IDs. Default true.
     @param string       $taxonomy       Optional. Taxonomy, if $in_same_term is true. Default 'category'.
    
  **/
  public function prev_post_rel_link(title:String = '%title', in_same_term:Bool = false, excluded_terms:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = '', taxonomy:String = 'category'):Void;
  /**
    
     Retrieves the boundary post.
    
     Boundary being either the first or last post by publish date within the constraints specified
     by $in_same_term or $excluded_terms.
    
     @since 2.8.0
    
     @param bool         $in_same_term   Optional. Whether returned post should be in a same taxonomy term.
                                         Default false.
     @param array|string $excluded_terms Optional. Array or comma-separated list of excluded term IDs.
                                         Default empty.
     @param bool         $start          Optional. Whether to retrieve first or last post. Default true
     @param string       $taxonomy       Optional. Taxonomy, if $in_same_term is true. Default 'category'.
     @return null|array Array containing the boundary post object if successful, null otherwise.
    
  **/
  public function get_boundary_post(in_same_term:Bool = false, excluded_terms:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = '', start:Bool = true, taxonomy:String = 'category'):php.NativeArray;
  /**
    
     Retrieves the previous post link that is adjacent to the current post.
    
     @since 3.7.0
    
     @param string       $format         Optional. Link anchor format. Default '&laquo; %link'.
     @param string       $link           Optional. Link permalink format. Default '%title'.
     @param bool         $in_same_term   Optional. Whether link should be in a same taxonomy term. Default false.
     @param array|string $excluded_terms Optional. Array or comma-separated list of excluded term IDs. Default empty.
     @param string       $taxonomy       Optional. Taxonomy, if $in_same_term is true. Default 'category'.
     @return string The link URL of the previous post in relation to the current post.
    
  **/
  public function get_previous_post_link(format:String = '&laquo; %link', link:String = '%title', in_same_term:Bool = false, excluded_terms:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = '', taxonomy:String = 'category'):String;
  /**
    
     Displays the previous post link that is adjacent to the current post.
    
     @since 1.5.0
    
     @see get_previous_post_link()
    
     @param string       $format         Optional. Link anchor format. Default '&laquo; %link'.
     @param string       $link           Optional. Link permalink format. Default '%title'.
     @param bool         $in_same_term   Optional. Whether link should be in a same taxonomy term. Default false.
     @param array|string $excluded_terms Optional. Array or comma-separated list of excluded term IDs. Default empty.
     @param string       $taxonomy       Optional. Taxonomy, if $in_same_term is true. Default 'category'.
    
  **/
  public function previous_post_link(format:String = '&laquo; %link', link:String = '%title', in_same_term:Bool = false, excluded_terms:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = '', taxonomy:String = 'category'):Void;
  /**
    
     Retrieves the next post link that is adjacent to the current post.
    
     @since 3.7.0
    
     @param string       $format         Optional. Link anchor format. Default '&laquo; %link'.
     @param string       $link           Optional. Link permalink format. Default '%title'.
     @param bool         $in_same_term   Optional. Whether link should be in a same taxonomy term. Default false.
     @param array|string $excluded_terms Optional. Array or comma-separated list of excluded term IDs. Default empty.
     @param string       $taxonomy       Optional. Taxonomy, if $in_same_term is true. Default 'category'.
     @return string The link URL of the next post in relation to the current post.
    
  **/
  public function get_next_post_link(format:String = '%link &raquo;', link:String = '%title', in_same_term:Bool = false, excluded_terms:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = '', taxonomy:String = 'category'):String;
  /**
    
     Displays the next post link that is adjacent to the current post.
    
     @since 1.5.0
     @see get_next_post_link()
    
     @param string       $format         Optional. Link anchor format. Default '&laquo; %link'.
     @param string       $link           Optional. Link permalink format. Default '%title'
     @param bool         $in_same_term   Optional. Whether link should be in a same taxonomy term. Default false.
     @param array|string $excluded_terms Optional. Array or comma-separated list of excluded term IDs. Default empty.
     @param string       $taxonomy       Optional. Taxonomy, if $in_same_term is true. Default 'category'.
    
  **/
  public function next_post_link(format:String = '%link &raquo;', link:String = '%title', in_same_term:Bool = false, excluded_terms:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = '', taxonomy:String = 'category'):Void;
  /**
    
     Retrieves the adjacent post link.
    
     Can be either next post link or previous.
    
     @since 3.7.0
    
     @param string       $format         Link anchor format.
     @param string       $link           Link permalink format.
     @param bool         $in_same_term   Optional. Whether link should be in a same taxonomy term. Default false.
     @param array|string $excluded_terms Optional. Array or comma-separated list of excluded terms IDs. Default empty.
     @param bool         $previous       Optional. Whether to display link to previous or next post. Default true.
     @param string       $taxonomy       Optional. Taxonomy, if $in_same_term is true. Default 'category'.
     @return string The link URL of the previous or next post in relation to the current post.
    
  **/
  public function get_adjacent_post_link(format:String, link:String, in_same_term:Bool = false, excluded_terms:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = '', previous:Bool = true, taxonomy:String = 'category'):String;
  /**
    
     Displays the adjacent post link.
    
     Can be either next post link or previous.
    
     @since 2.5.0
    
     @param string       $format         Link anchor format.
     @param string       $link           Link permalink format.
     @param bool         $in_same_term   Optional. Whether link should be in a same taxonomy term. Default false.
     @param array|string $excluded_terms Optional. Array or comma-separated list of excluded category IDs. Default empty.
     @param bool         $previous       Optional. Whether to display link to previous or next post. Default true.
     @param string       $taxonomy       Optional. Taxonomy, if $in_same_term is true. Default 'category'.
    
  **/
  public function adjacent_post_link(format:String, link:String, in_same_term:Bool = false, excluded_terms:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = '', previous:Bool = true, taxonomy:String = 'category'):Void;
  /**
    
     Retrieves the link for a page number.
    
     @since 1.5.0
    
     @global WP_Rewrite $wp_rewrite
    
     @param int  $pagenum Optional. Page ID. Default 1.
     @param bool $escape  Optional. Whether to escape the URL for display, with esc_url(). Defaults to true.
                          Otherwise, prepares the URL with esc_url_raw().
     @return string The link URL for the given page number.
    
  **/
  public function get_pagenum_link(pagenum:Int = 1, escape:Bool = true):String;
  /**
    
     Retrieves the next posts page link.
    
     Backported from 2.1.3 to 2.0.10.
    
     @since 2.0.10
    
     @global int $paged
    
     @param int $max_page Optional. Max pages. Default 0.
     @return string|void The link URL for next posts page.
    
  **/
  public function get_next_posts_page_link(max_page:Int = 0):String;
  /**
    
     Displays or retrieves the next posts page link.
    
     @since 0.71
    
     @param int   $max_page Optional. Max pages. Default 0.
     @param bool  $echo     Optional. Whether to echo the link. Default true.
     @return string|void The link URL for next posts page if `$echo = false`.
    
  **/
  public function next_posts(max_page:Int = 0, echo:Bool = true):String;
  /**
    
     Retrieves the next posts page link.
    
     @since 2.7.0
    
     @global int      $paged
     @global WP_Query $wp_query
    
     @param string $label    Content for link text.
     @param int    $max_page Optional. Max pages. Default 0.
     @return string|void HTML-formatted next posts page link.
    
  **/
  public function get_next_posts_link(label:String = null, max_page:Int = 0):String;
  /**
    
     Displays the next posts page link.
    
     @since 0.71
    
     @param string $label    Content for link text.
     @param int    $max_page Optional. Max pages. Default 0.
    
  **/
  public function next_posts_link(label:String = null, max_page:Int = 0):Void;
  /**
    
     Retrieves the previous posts page link.
    
     Will only return string, if not on a single page or post.
    
     Backported to 2.0.10 from 2.1.3.
    
     @since 2.0.10
    
     @global int $paged
    
     @return string|void The link for the previous posts page.
    
  **/
  public function get_previous_posts_page_link():String;
  /**
    
     Displays or retrieves the previous posts page link.
    
     @since 0.71
    
     @param bool $echo Optional. Whether to echo the link. Default true.
     @return string|void The previous posts page link if `$echo = false`.
    
  **/
  public function previous_posts(echo:Bool = true):String;
  /**
    
     Retrieves the previous posts page link.
    
     @since 2.7.0
    
     @global int $paged
    
     @param string $label Optional. Previous page link text.
     @return string|void HTML-formatted previous page link.
    
  **/
  public function get_previous_posts_link(label:String = null):String;
  /**
    
     Displays the previous posts page link.
    
     @since 0.71
    
     @param string $label Optional. Previous page link text.
    
  **/
  public function previous_posts_link(label:String = null):Void;
  /**
    
     Retrieves the post pages link navigation for previous and next pages.
    
     @since 2.8.0
    
     @global WP_Query $wp_query
    
     @param string|array $args {
         Optional. Arguments to build the post pages link navigation.
    
         @type string $sep      Separator character. Default '&#8212;'.
         @type string $prelabel Link text to display for the previous page link.
                                Default '&laquo; Previous Page'.
         @type string $nxtlabel Link text to display for the next page link.
                                Default 'Next Page &raquo;'.
     }
     @return string The posts link navigation.
    
  **/
  public function get_posts_nav_link(?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):String;
  /**
    
     Displays the post pages link navigation for previous and next pages.
    
     @since 0.71
    
     @param string $sep      Optional. Separator for posts navigation links. Default empty.
     @param string $prelabel Optional. Label for previous pages. Default empty.
     @param string $nxtlabel Optional Label for next pages. Default empty.
    
  **/
  public function posts_nav_link(sep:String = '', prelabel:String = '', nxtlabel:String = ''):Void;
  /**
    
     Retrieves the navigation to next/previous post, when applicable.
    
     @since 4.1.0
     @since 4.4.0 Introduced the `in_same_term`, `excluded_terms`, and `taxonomy` arguments.
    
     @param array $args {
         Optional. Default post navigation arguments. Default empty array.
    
         @type string       $prev_text          Anchor text to display in the previous post link. Default '%title'.
         @type string       $next_text          Anchor text to display in the next post link. Default '%title'.
         @type bool         $in_same_term       Whether link should be in a same taxonomy term. Default false.
         @type array|string $excluded_terms     Array or comma-separated list of excluded term IDs. Default empty.
         @type string       $taxonomy           Taxonomy, if `$in_same_term` is true. Default 'category'.
         @type string       $screen_reader_text Screen reader text for nav element. Default 'Post navigation'.
     }
     @return string Markup for post links.
    
  **/
  public function get_the_post_navigation(?args:php.NativeStructArray<Dynamic>):String;
  /**
    
     Displays the navigation to next/previous post, when applicable.
    
     @since 4.1.0
    
     @param array $args Optional. See get_the_post_navigation() for available arguments.
                        Default empty array.
    
  **/
  public function the_post_navigation(?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Returns the navigation to next/previous set of posts, when applicable.
    
     @since 4.1.0
    
     @global WP_Query $wp_query WordPress Query object.
    
     @param array $args {
         Optional. Default posts navigation arguments. Default empty array.
    
         @type string $prev_text          Anchor text to display in the previous posts link.
                                          Default 'Older posts'.
         @type string $next_text          Anchor text to display in the next posts link.
                                          Default 'Newer posts'.
         @type string $screen_reader_text Screen reader text for nav element.
                                          Default 'Posts navigation'.
     }
     @return string Markup for posts links.
    
  **/
  public function get_the_posts_navigation(?args:php.NativeStructArray<Dynamic>):String;
  /**
    
     Displays the navigation to next/previous set of posts, when applicable.
    
     @since 4.1.0
    
     @param array $args Optional. See get_the_posts_navigation() for available arguments.
                        Default empty array.
    
  **/
  public function the_posts_navigation(?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Retrieves a paginated navigation to next/previous set of posts, when applicable.
    
     @since 4.1.0
    
     @param array $args {
         Optional. Default pagination arguments, see paginate_links().
    
         @type string $screen_reader_text Screen reader text for navigation element.
                                          Default 'Posts navigation'.
     }
     @return string Markup for pagination links.
    
  **/
  public function get_the_posts_pagination(?args:php.NativeStructArray<Dynamic>):String;
  /**
    
     Displays a paginated navigation to next/previous set of posts, when applicable.
    
     @since 4.1.0
    
     @param array $args Optional. See get_the_posts_pagination() for available arguments.
                        Default empty array.
    
  **/
  public function the_posts_pagination(?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Wraps passed links in navigational markup.
    
     @since 4.1.0
     @access private
    
     @param string $links              Navigational links.
     @param string $class              Optional. Custom class for nav element. Default: 'posts-navigation'.
     @param string $screen_reader_text Optional. Screen reader text for nav element. Default: 'Posts navigation'.
     @return string Navigation template tag.
    
  **/
  public function _navigation_markup(links:String, class_:String = 'posts-navigation', screen_reader_text:String = ''):String;
  /**
    
     Retrieves the comments page number link.
    
     @since 2.7.0
    
     @global WP_Rewrite $wp_rewrite
    
     @param int $pagenum  Optional. Page number. Default 1.
     @param int $max_page Optional. The maximum number of comment pages. Default 0.
     @return string The comments page number link URL.
    
  **/
  public function get_comments_pagenum_link(pagenum:Int = 1, max_page:Int = 0):String;
  /**
    
     Retrieves the link to the next comments page.
    
     @since 2.7.1
    
     @global WP_Query $wp_query
    
     @param string $label    Optional. Label for link text. Default empty.
     @param int    $max_page Optional. Max page. Default 0.
     @return string|void HTML-formatted link for the next page of comments.
    
  **/
  public function get_next_comments_link(label:String = '', max_page:Int = 0):String;
  /**
    
     Displays the link to the next comments page.
    
     @since 2.7.0
    
     @param string $label    Optional. Label for link text. Default empty.
     @param int    $max_page Optional. Max page. Default 0.
    
  **/
  public function next_comments_link(label:String = '', max_page:Int = 0):Void;
  /**
    
     Retrieves the link to the previous comments page.
    
     @since 2.7.1
    
     @param string $label Optional. Label for comments link text. Default empty.
     @return string|void HTML-formatted link for the previous page of comments.
    
  **/
  public function get_previous_comments_link(label:String = ''):String;
  /**
    
     Displays the link to the previous comments page.
    
     @since 2.7.0
    
     @param string $label Optional. Label for comments link text. Default empty.
    
  **/
  public function previous_comments_link(label:String = ''):Void;
  /**
    
     Displays or retrieves pagination links for the comments on the current post.
    
     @see paginate_links()
     @since 2.7.0
    
     @global WP_Rewrite $wp_rewrite
    
     @param string|array $args Optional args. See paginate_links(). Default empty array.
     @return string|array|void Markup for comment page links or array of comment page links.
    
  **/
  public function paginate_comments_links(?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<String, php.NativeArray>;
  /**
    
     Retrieves navigation to next/previous set of comments, when applicable.
    
     @since 4.4.0
    
     @param array $args {
         Optional. Default comments navigation arguments.
    
         @type string $prev_text          Anchor text to display in the previous comments link.
                                          Default 'Older comments'.
         @type string $next_text          Anchor text to display in the next comments link.
                                          Default 'Newer comments'.
         @type string $screen_reader_text Screen reader text for nav element. Default 'Comments navigation'.
     }
     @return string Markup for comments links.
    
  **/
  public function get_the_comments_navigation(?args:php.NativeStructArray<Dynamic>):String;
  /**
    
     Displays navigation to next/previous set of comments, when applicable.
    
     @since 4.4.0
    
     @param array $args See get_the_comments_navigation() for available arguments. Default empty array.
    
  **/
  public function the_comments_navigation(?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Retrieves a paginated navigation to next/previous set of comments, when applicable.
    
     @since 4.4.0
    
     @see paginate_comments_links()
    
     @param array $args {
         Optional. Default pagination arguments.
    
         @type string $screen_reader_text Screen reader text for nav element. Default 'Comments navigation'.
     }
     @return string Markup for pagination links.
    
  **/
  public function get_the_comments_pagination(?args:php.NativeStructArray<Dynamic>):String;
  /**
    
     Displays a paginated navigation to next/previous set of comments, when applicable.
    
     @since 4.4.0
    
     @param array $args See get_the_comments_pagination() for available arguments. Default empty array.
    
  **/
  public function the_comments_pagination(?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Retrieves the URL for the current site where the front end is accessible.
    
     Returns the 'home' option with the appropriate protocol. The protocol will be 'https'
     if is_ssl() evaluates to true; otherwise, it will be the same as the 'home' option.
     If `$scheme` is 'http' or 'https', is_ssl() is overridden.
    
     @since 3.0.0
    
     @param  string      $path   Optional. Path relative to the home URL. Default empty.
     @param  string|null $scheme Optional. Scheme to give the home URL context. Accepts
                                 'http', 'https', 'relative', 'rest', or null. Default null.
     @return string Home URL link with optional path appended.
    
  **/
  public function home_url(path:String = '', scheme:String = null):String;
  /**
    
     Retrieves the URL for a given site where the front end is accessible.
    
     Returns the 'home' option with the appropriate protocol. The protocol will be 'https'
     if is_ssl() evaluates to true; otherwise, it will be the same as the 'home' option.
     If `$scheme` is 'http' or 'https', is_ssl() is overridden.
    
     @since 3.0.0
    
     @global string $pagenow
    
     @param  int         $blog_id Optional. Site ID. Default null (current site).
     @param  string      $path    Optional. Path relative to the home URL. Default empty.
     @param  string|null $scheme  Optional. Scheme to give the home URL context. Accepts
                                  'http', 'https', 'relative', 'rest', or null. Default null.
     @return string Home URL link with optional path appended.
    
  **/
  public function get_home_url(blog_id:Int = null, path:String = '', scheme:String = null):String;
  /**
    
     Retrieves the URL for the current site where WordPress application files
     (e.g. wp-blog-header.php or the wp-admin/ folder) are accessible.
    
     Returns the 'site_url' option with the appropriate protocol, 'https' if
     is_ssl() and 'http' otherwise. If $scheme is 'http' or 'https', is_ssl() is
     overridden.
    
     @since 3.0.0
    
     @param string $path   Optional. Path relative to the site URL. Default empty.
     @param string $scheme Optional. Scheme to give the site URL context. See set_url_scheme().
     @return string Site URL link with optional path appended.
    
  **/
  public function site_url(path:String = '', scheme:String = null):String;
  /**
    
     Retrieves the URL for a given site where WordPress application files
     (e.g. wp-blog-header.php or the wp-admin/ folder) are accessible.
    
     Returns the 'site_url' option with the appropriate protocol, 'https' if
     is_ssl() and 'http' otherwise. If `$scheme` is 'http' or 'https',
     `is_ssl()` is overridden.
    
     @since 3.0.0
    
     @param int    $blog_id Optional. Site ID. Default null (current site).
     @param string $path    Optional. Path relative to the site URL. Default empty.
     @param string $scheme  Optional. Scheme to give the site URL context. Accepts
                            'http', 'https', 'login', 'login_post', 'admin', or
                            'relative'. Default null.
     @return string Site URL link with optional path appended.
    
  **/
  public function get_site_url(blog_id:Int = null, path:String = '', scheme:String = null):String;
  /**
    
     Retrieves the URL to the admin area for the current site.
    
     @since 2.6.0
    
     @param string $path   Optional path relative to the admin URL.
     @param string $scheme The scheme to use. Default is 'admin', which obeys force_ssl_admin() and is_ssl().
                           'http' or 'https' can be passed to force those schemes.
     @return string Admin URL link with optional path appended.
    
  **/
  public function admin_url(path:String = '', scheme:String = 'admin'):String;
  /**
    
     Retrieves the URL to the admin area for a given site.
    
     @since 3.0.0
    
     @param int    $blog_id Optional. Site ID. Default null (current site).
     @param string $path    Optional. Path relative to the admin URL. Default empty.
     @param string $scheme  Optional. The scheme to use. Accepts 'http' or 'https',
                            to force those schemes. Default 'admin', which obeys
                            force_ssl_admin() and is_ssl().
     @return string Admin URL link with optional path appended.
    
  **/
  public function get_admin_url(blog_id:Int = null, path:String = '', scheme:String = 'admin'):String;
  /**
    
     Retrieves the URL to the includes directory.
    
     @since 2.6.0
    
     @param string $path   Optional. Path relative to the includes URL. Default empty.
     @param string $scheme Optional. Scheme to give the includes URL context. Accepts
                           'http', 'https', or 'relative'. Default null.
     @return string Includes URL link with optional path appended.
    
  **/
  public function includes_url(path:String = '', scheme:String = null):String;
  /**
    
     Retrieves the URL to the content directory.
    
     @since 2.6.0
    
     @param string $path Optional. Path relative to the content URL. Default empty.
     @return string Content URL link with optional path appended.
    
  **/
  public function content_url(path:String = ''):String;
  /**
    
     Retrieves a URL within the plugins or mu-plugins directory.
    
     Defaults to the plugins directory URL if no arguments are supplied.
    
     @since 2.6.0
    
     @param  string $path   Optional. Extra path appended to the end of the URL, including
                            the relative directory if $plugin is supplied. Default empty.
     @param  string $plugin Optional. A full path to a file inside a plugin or mu-plugin.
                            The URL will be relative to its directory. Default empty.
                            Typically this is done by passing `__FILE__` as the argument.
     @return string Plugins URL link with optional paths appended.
    
  **/
  public function plugins_url(path:String = '', plugin:String = ''):String;
  /**
    
     Retrieves the site URL for the current network.
    
     Returns the site URL with the appropriate protocol, 'https' if
     is_ssl() and 'http' otherwise. If $scheme is 'http' or 'https', is_ssl() is
     overridden.
    
     @since 3.0.0
    
     @see set_url_scheme()
    
     @param string $path   Optional. Path relative to the site URL. Default empty.
     @param string $scheme Optional. Scheme to give the site URL context. Accepts
                           'http', 'https', or 'relative'. Default null.
     @return string Site URL link with optional path appended.
    
  **/
  public function network_site_url(path:String = '', scheme:String = null):String;
  /**
    
     Retrieves the home URL for the current network.
    
     Returns the home URL with the appropriate protocol, 'https' is_ssl()
     and 'http' otherwise. If `$scheme` is 'http' or 'https', `is_ssl()` is
     overridden.
    
     @since 3.0.0
    
     @param  string $path   Optional. Path relative to the home URL. Default empty.
     @param  string $scheme Optional. Scheme to give the home URL context. Accepts
                            'http', 'https', or 'relative'. Default null.
     @return string Home URL link with optional path appended.
    
  **/
  public function network_home_url(path:String = '', scheme:String = null):String;
  /**
    
     Retrieves the URL to the admin area for the network.
    
     @since 3.0.0
    
     @param string $path   Optional path relative to the admin URL. Default empty.
     @param string $scheme Optional. The scheme to use. Default is 'admin', which obeys force_ssl_admin()
                           and is_ssl(). 'http' or 'https' can be passed to force those schemes.
     @return string Admin URL link with optional path appended.
    
  **/
  public function network_admin_url(path:String = '', scheme:String = 'admin'):String;
  /**
    
     Retrieves the URL to the admin area for the current user.
    
     @since 3.0.0
    
     @param string $path   Optional. Path relative to the admin URL. Default empty.
     @param string $scheme Optional. The scheme to use. Default is 'admin', which obeys force_ssl_admin()
                           and is_ssl(). 'http' or 'https' can be passed to force those schemes.
     @return string Admin URL link with optional path appended.
    
  **/
  public function user_admin_url(path:String = '', scheme:String = 'admin'):String;
  /**
    
     Retrieves the URL to the admin area for either the current site or the network depending on context.
    
     @since 3.1.0
    
     @param string $path   Optional. Path relative to the admin URL. Default empty.
     @param string $scheme Optional. The scheme to use. Default is 'admin', which obeys force_ssl_admin()
                           and is_ssl(). 'http' or 'https' can be passed to force those schemes.
     @return string Admin URL link with optional path appended.
    
  **/
  public function self_admin_url(path:String = '', scheme:String = 'admin'):String;
  /**
    
     Sets the scheme for a URL.
    
     @since 3.4.0
     @since 4.4.0 The 'rest' scheme was added.
    
     @param string      $url    Absolute URL that includes a scheme
     @param string|null $scheme Optional. Scheme to give $url. Currently 'http', 'https', 'login',
                                'login_post', 'admin', 'relative', 'rest', 'rpc', or null. Default null.
     @return string $url URL with chosen scheme.
    
  **/
  public function set_url_scheme(url:String, scheme:String = null):String;
  /**
    
     Retrieves the URL to the user's dashboard.
    
     If a user does not belong to any site, the global user dashboard is used. If the user
     belongs to the current site, the dashboard for the current site is returned. If the user
     cannot edit the current site, the dashboard to the user's primary site is returned.
    
     @since 3.1.0
    
     @param int    $user_id Optional. User ID. Defaults to current user.
     @param string $path    Optional path relative to the dashboard. Use only paths known to
                            both site and user admins. Default empty.
     @param string $scheme  The scheme to use. Default is 'admin', which obeys force_ssl_admin()
                            and is_ssl(). 'http' or 'https' can be passed to force those schemes.
     @return string Dashboard URL link with optional path appended.
    
  **/
  public function get_dashboard_url(user_id:Int = 0, path:String = '', scheme:String = 'admin'):String;
  /**
    
     Retrieves the URL to the user's profile editor.
    
     @since 3.1.0
    
     @param int    $user_id Optional. User ID. Defaults to current user.
     @param string $scheme  Optional. The scheme to use. Default is 'admin', which obeys force_ssl_admin()
                            and is_ssl(). 'http' or 'https' can be passed to force those schemes.
     @return string Dashboard URL link with optional path appended.
    
  **/
  public function get_edit_profile_url(user_id:Int = 0, scheme:String = 'admin'):String;
  /**
    
     Returns the canonical URL for a post.
    
     When the post is the same as the current requested page the function will handle the
     pagination arguments too.
    
     @since 4.6.0
    
     @param int|WP_Post $post Optional. Post ID or object. Default is global `$post`.
     @return string|false The canonical URL, or false if the post does not exist or has not
                          been published yet.
    
  **/
  public function wp_get_canonical_url(post:haxe.extern.EitherType<Int, wp.extern.Post> = null):haxe.extern.EitherType<String, Bool>;
  /**
    
     Outputs rel=canonical for singular queries.
    
     @since 2.9.0
     @since 4.6.0 Adjusted to use `wp_get_canonical_url()`.
    
  **/
  public function rel_canonical():Void;
  /**
    
     Returns a shortlink for a post, page, attachment, or site.
    
     This function exists to provide a shortlink tag that all themes and plugins can target.
     A plugin must hook in to provide the actual shortlinks. Default shortlink support is
     limited to providing ?p= style links for posts. Plugins can short-circuit this function
     via the {@see 'pre_get_shortlink'} filter or filter the output via the {@see 'get_shortlink'}
     filter.
    
     @since 3.0.0
    
     @param int    $id          Optional. A post or site id. Default is 0, which means the current post or site.
     @param string $context     Optional. Whether the id is a 'site' id, 'post' id, or 'media' id. If 'post',
                                the post_type of the post is consulted. If 'query', the current query is consulted
                                to determine the id and context. Default 'post'.
     @param bool   $allow_slugs Optional. Whether to allow post slugs in the shortlink. It is up to the plugin how
                                and whether to honor this. Default true.
     @return string A shortlink or an empty string if no shortlink exists for the requested resource or if shortlinks
                    are not enabled.
    
  **/
  public function wp_get_shortlink(id:Int = 0, context:String = 'post', allow_slugs:Bool = true):String;
  /**
    
     Injects rel=shortlink into the head if a shortlink is defined for the current page.
    
     Attached to the {@see 'wp_head'} action.
    
     @since 3.0.0
    
  **/
  public function wp_shortlink_wp_head():Void;
  /**
    
     Sends a Link: rel=shortlink header if a shortlink is defined for the current page.
    
     Attached to the {@see 'wp'} action.
    
     @since 3.0.0
    
  **/
  public function wp_shortlink_header():Void;
  /**
    
     Displays the shortlink for a post.
    
     Must be called from inside "The Loop"
    
     Call like the_shortlink( __( 'Shortlinkage FTW' ) )
    
     @since 3.0.0
    
     @param string $text   Optional The link text or HTML to be displayed. Defaults to 'This is the short link.'
     @param string $title  Optional The tooltip for the link. Must be sanitized. Defaults to the sanitized post title.
     @param string $before Optional HTML to display before the link. Default empty.
     @param string $after  Optional HTML to display after the link. Default empty.
    
  **/
  public function the_shortlink(text:String = '', title:String = '', before:String = '', after:String = ''):Void;
  /**
    
     Retrieves the avatar URL.
    
     @since 4.2.0
    
     @param mixed $id_or_email The Gravatar to retrieve a URL for. Accepts a user_id, gravatar md5 hash,
                               user email, WP_User object, WP_Post object, or WP_Comment object.
     @param array $args {
         Optional. Arguments to return instead of the default arguments.
    
         @type int    $size           Height and width of the avatar in pixels. Default 96.
         @type string $default        URL for the default image or a default type. Accepts '404' (return
                                      a 404 instead of a default image), 'retro' (8bit), 'monsterid' (monster),
                                      'wavatar' (cartoon face), 'indenticon' (the "quilt"), 'mystery', 'mm',
                                      or 'mysteryman' (The Oyster Man), 'blank' (transparent GIF), or
                                      'gravatar_default' (the Gravatar logo). Default is the value of the
                                      'avatar_default' option, with a fallback of 'mystery'.
         @type bool   $force_default  Whether to always show the default image, never the Gravatar. Default false.
         @type string $rating         What rating to display avatars up to. Accepts 'G', 'PG', 'R', 'X', and are
                                      judged in that order. Default is the value of the 'avatar_rating' option.
         @type string $scheme         URL scheme to use. See set_url_scheme() for accepted values.
                                      Default null.
         @type array  $processed_args When the function returns, the value will be the processed/sanitized $args
                                      plus a "found_avatar" guess. Pass as a reference. Default null.
     }
     @return false|string The URL of the avatar we found, or false if we couldn't find an avatar.
    
  **/
  public function get_avatar_url(id_or_email:Dynamic, args:php.NativeStructArray<Dynamic> = null):haxe.extern.EitherType<Bool, String>;
  /**
    
     Check if this comment type allows avatars to be retrieved.
    
     @since 5.1.0
    
     @param string $comment_type Comment type to check.
     @return bool Whether the comment type is allowed for retrieving avatars.
    
  **/
  public function is_avatar_comment_type(comment_type:String):Bool;
  /**
    
     Retrieves default data about the avatar.
    
     @since 4.2.0
    
     @param mixed $id_or_email The Gravatar to retrieve. Accepts a user_id, gravatar md5 hash,
                                user email, WP_User object, WP_Post object, or WP_Comment object.
     @param array $args {
         Optional. Arguments to return instead of the default arguments.
    
         @type int    $size           Height and width of the avatar image file in pixels. Default 96.
         @type int    $height         Display height of the avatar in pixels. Defaults to $size.
         @type int    $width          Display width of the avatar in pixels. Defaults to $size.
         @type string $default        URL for the default image or a default type. Accepts '404' (return
                                      a 404 instead of a default image), 'retro' (8bit), 'monsterid' (monster),
                                      'wavatar' (cartoon face), 'indenticon' (the "quilt"), 'mystery', 'mm',
                                      or 'mysteryman' (The Oyster Man), 'blank' (transparent GIF), or
                                      'gravatar_default' (the Gravatar logo). Default is the value of the
                                      'avatar_default' option, with a fallback of 'mystery'.
         @type bool   $force_default  Whether to always show the default image, never the Gravatar. Default false.
         @type string $rating         What rating to display avatars up to. Accepts 'G', 'PG', 'R', 'X', and are
                                      judged in that order. Default is the value of the 'avatar_rating' option.
         @type string $scheme         URL scheme to use. See set_url_scheme() for accepted values.
                                      Default null.
         @type array  $processed_args When the function returns, the value will be the processed/sanitized $args
                                      plus a "found_avatar" guess. Pass as a reference. Default null.
         @type string $extra_attr     HTML attributes to insert in the IMG element. Is not sanitized. Default empty.
     }
     @return array $processed_args {
         Along with the arguments passed in `$args`, this will contain a couple of extra arguments.
    
         @type bool   $found_avatar True if we were able to find an avatar for this user,
                                    false or not set if we couldn't.
         @type string $url          The URL of the avatar we found.
     }
    
  **/
  public function get_avatar_data(id_or_email:Dynamic, args:php.NativeStructArray<Dynamic> = null):php.NativeArray;
  /**
    
     Retrieves the URL of a file in the theme.
    
     Searches in the stylesheet directory before the template directory so themes
     which inherit from a parent theme can just override one file.
    
     @since 4.7.0
    
     @param string $file Optional. File to search for in the stylesheet directory.
     @return string The URL of the file.
    
  **/
  public function get_theme_file_uri(file:String = ''):String;
  /**
    
     Retrieves the URL of a file in the parent theme.
    
     @since 4.7.0
    
     @param string $file Optional. File to return the URL for in the template directory.
     @return string The URL of the file.
    
  **/
  public function get_parent_theme_file_uri(file:String = ''):String;
  /**
    
     Retrieves the path of a file in the theme.
    
     Searches in the stylesheet directory before the template directory so themes
     which inherit from a parent theme can just override one file.
    
     @since 4.7.0
    
     @param string $file Optional. File to search for in the stylesheet directory.
     @return string The path of the file.
    
  **/
  public function get_theme_file_path(file:String = ''):String;
  /**
    
     Retrieves the path of a file in the parent theme.
    
     @since 4.7.0
    
     @param string $file Optional. File to return the path for in the template directory.
     @return string The path of the file.
    
  **/
  public function get_parent_theme_file_path(file:String = ''):String;
  /**
    
     Retrieves the URL to the privacy policy page.
    
     @since 4.9.6
    
     @return string The URL to the privacy policy page. Empty string if it doesn't exist.
    
  **/
  public function get_privacy_policy_url():String;
  /**
    
     Displays the privacy policy link with formatting, when applicable.
    
     @since 4.9.6
    
     @param string $before Optional. Display before privacy policy link. Default empty.
     @param string $after  Optional. Display after privacy policy link. Default empty.
    
  **/
  public function the_privacy_policy_link(before:String = '', after:String = ''):Void;
  /**
    
     Returns the privacy policy link with formatting, when applicable.
    
     @since 4.9.6
    
     @param string $before Optional. Display before privacy policy link. Default empty.
     @param string $after  Optional. Display after privacy policy link. Default empty.
    
     @return string Markup for the link and surrounding elements. Empty string if it
                    doesn't exist.
    
  **/
  public function get_the_privacy_policy_link(before:String = '', after:String = ''):String;
}
