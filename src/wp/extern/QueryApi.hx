package wp.extern;

extern class QueryApi implements wp.util.ApiFunctions {
  /**
    
     Retrieve variable in the WP_Query class.
    
     @since 1.5.0
     @since 3.9.0 The `$default` argument was introduced.
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @param string $var       The variable key to retrieve.
     @param mixed  $default   Optional. Value to return if the query variable is not set. Default empty.
     @return mixed Contents of the query variable.
    
  **/
  public function get_query_var(var_:String, default:Dynamic = ''):Dynamic;
  /**
    
     Retrieve the currently-queried object.
    
     Wrapper for WP_Query::get_queried_object().
    
     @since 3.1.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return object Queried object.
    
  **/
  public function get_queried_object():Dynamic;
  /**
    
     Retrieve ID of the current queried object.
    
     Wrapper for WP_Query::get_queried_object_id().
    
     @since 3.1.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return int ID of the queried object.
    
  **/
  public function get_queried_object_id():Int;
  /**
    
     Set query variable.
    
     @since 2.2.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @param string $var   Query variable key.
     @param mixed  $value Query variable value.
    
  **/
  public function set_query_var(var_:String, value:Dynamic):Void;
  /**
    
     Sets up The Loop with query parameters.
    
     Note: This function will completely override the main query and isn't intended for use
     by plugins or themes. Its overly-simplistic approach to modifying the main query can be
     problematic and should be avoided wherever possible. In most cases, there are better,
     more performant options for modifying the main query such as via the {@see 'pre_get_posts'}
     action within WP_Query.
    
     This must not be used within the WordPress Loop.
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @param array|string $query Array or string of WP_Query arguments.
     @return array List of post objects.
    
  **/
  public function query_posts(query:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):php.NativeArray;
  /**
    
     Destroys the previous query and sets up a new query.
    
     This should be used after query_posts() and before another query_posts().
     This will remove obscure bugs that occur when the previous WP_Query object
     is not destroyed properly before another is set up.
    
     @since 2.3.0
    
     @global WP_Query $wp_query     Global WP_Query instance.
     @global WP_Query $wp_the_query Copy of the global WP_Query instance created during wp_reset_query().
    
  **/
  public function wp_reset_query():Void;
  /**
    
     After looping through a separate query, this function restores
     the $post global to the current post in the main query.
    
     @since 3.0.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
  **/
  public function wp_reset_postdata():Void;
  /**
    
     Determines whether the query is for an existing archive page.
    
     Month, Year, Category, Author, Post Type archive...
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool
    
  **/
  public function is_archive():Bool;
  /**
    
     Determines whether the query is for an existing post type archive page.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 3.1.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @param string|array $post_types Optional. Post type or array of posts types to check against.
     @return bool
    
  **/
  public function is_post_type_archive(post_types:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Bool;
  /**
    
     Determines whether the query is for an existing attachment page.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.0.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @param int|string|array|object $attachment Attachment ID, title, slug, or array of such.
     @return bool
    
  **/
  public function is_attachment(attachment:haxe.extern.EitherType<Int, haxe.extern.EitherType<String, haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Dynamic>>> = ''):Bool;
  /**
    
     Determines whether the query is for an existing author archive page.
    
     If the $author parameter is specified, this function will additionally
     check if the query is for one of the authors specified.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @param mixed $author Optional. User ID, nickname, nicename, or array of User IDs, nicknames, and nicenames
     @return bool
    
  **/
  public function is_author(author:Dynamic = ''):Bool;
  /**
    
     Determines whether the query is for an existing category archive page.
    
     If the $category parameter is specified, this function will additionally
     check if the query is for one of the categories specified.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @param mixed $category Optional. Category ID, name, slug, or array of Category IDs, names, and slugs.
     @return bool
    
  **/
  public function is_category(category:Dynamic = ''):Bool;
  /**
    
     Determines whether the query is for an existing tag archive page.
    
     If the $tag parameter is specified, this function will additionally
     check if the query is for one of the tags specified.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.3.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @param mixed $tag Optional. Tag ID, name, slug, or array of Tag IDs, names, and slugs.
     @return bool
    
  **/
  public function is_tag(tag:Dynamic = ''):Bool;
  /**
    
     Determines whether the query is for an existing custom taxonomy archive page.
    
     If the $taxonomy parameter is specified, this function will additionally
     check if the query is for that specific $taxonomy.
    
     If the $term parameter is specified in addition to the $taxonomy parameter,
     this function will additionally check if the query is for one of the terms
     specified.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @param string|array     $taxonomy Optional. Taxonomy slug or slugs.
     @param int|string|array $term     Optional. Term ID, name, slug or array of Term IDs, names, and slugs.
     @return bool True for custom taxonomy archive pages, false for built-in taxonomies (category and tag archives).
    
  **/
  public function is_tax(taxonomy:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = '', term:haxe.extern.EitherType<Int, haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>> = ''):Bool;
  /**
    
     Determines whether the query is for an existing date archive.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool
    
  **/
  public function is_date():Bool;
  /**
    
     Determines whether the query is for an existing day archive.
    
     A conditional check to test whether the page is a date-based archive page displaying posts for the current day.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool
    
  **/
  public function is_day():Bool;
  /**
    
     Determines whether the query is for a feed.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @param string|array $feeds Optional feed types to check.
     @return bool
    
  **/
  public function is_feed(feeds:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Bool;
  /**
    
     Is the query for a comments feed?
    
     @since 3.0.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool
    
  **/
  public function is_comment_feed():Bool;
  /**
    
     Determines whether the query is for the front page of the site.
    
     This is for what is displayed at your site's main URL.
    
     Depends on the site's "Front page displays" Reading Settings 'show_on_front' and 'page_on_front'.
    
     If you set a static page for the front page of your site, this function will return
     true when viewing that page.
    
     Otherwise the same as @see is_home()
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool True, if front of site.
    
  **/
  public function is_front_page():Bool;
  /**
    
     Determines whether the query is for the blog homepage.
    
     The blog homepage is the page that shows the time-based blog content of the site.
    
     is_home() is dependent on the site's "Front page displays" Reading Settings 'show_on_front'
     and 'page_for_posts'.
    
     If a static page is set for the front page of the site, this function will return true only
     on the page you set as the "Posts page".
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.5.0
    
     @see is_front_page()
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool True if blog view homepage, otherwise false.
    
  **/
  public function is_home():Bool;
  /**
    
     Determines whether the query is for an existing month archive.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool
    
  **/
  public function is_month():Bool;
  /**
    
     Determines whether the query is for an existing single page.
    
     If the $page parameter is specified, this function will additionally
     check if the query is for one of the pages specified.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @see is_single()
     @see is_singular()
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @param int|string|array $page Optional. Page ID, title, slug, or array of such. Default empty.
     @return bool Whether the query is for an existing single page.
    
  **/
  public function is_page(page:haxe.extern.EitherType<Int, haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>> = ''):Bool;
  /**
    
     Determines whether the query is for paged results and not for the first page.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool
    
  **/
  public function is_paged():Bool;
  /**
    
     Determines whether the query is for a post or page preview.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.0.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool
    
  **/
  public function is_preview():Bool;
  /**
    
     Is the query for the robots file?
    
     @since 2.1.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool
    
  **/
  public function is_robots():Bool;
  /**
    
     Determines whether the query is for a search.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool
    
  **/
  public function is_search():Bool;
  /**
    
     Determines whether the query is for an existing single post.
    
     Works for any post type, except attachments and pages
    
     If the $post parameter is specified, this function will additionally
     check if the query is for one of the Posts specified.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @see is_page()
     @see is_singular()
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @param int|string|array $post Optional. Post ID, title, slug, or array of such. Default empty.
     @return bool Whether the query is for an existing single post.
    
  **/
  public function is_single(post:haxe.extern.EitherType<Int, haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>> = ''):Bool;
  /**
    
     Determines whether the query is for an existing single post of any post type
     (post, attachment, page, custom post types).
    
     If the $post_types parameter is specified, this function will additionally
     check if the query is for one of the Posts Types specified.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @see is_page()
     @see is_single()
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @param string|array $post_types Optional. Post type or array of post types. Default empty.
     @return bool Whether the query is for an existing single post of any of the given post types.
    
  **/
  public function is_singular(post_types:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Bool;
  /**
    
     Determines whether the query is for a specific time.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool
    
  **/
  public function is_time():Bool;
  /**
    
     Determines whether the query is for a trackback endpoint call.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool
    
  **/
  public function is_trackback():Bool;
  /**
    
     Determines whether the query is for an existing year archive.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool
    
  **/
  public function is_year():Bool;
  /**
    
     Determines whether the query has resulted in a 404 (returns no results).
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool
    
  **/
  public function is_404():Bool;
  /**
    
     Is the query for an embedded post?
    
     @since 4.4.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool Whether we're in an embedded post or not.
    
  **/
  public function is_embed():Bool;
  /**
    
     Determines whether the query is the main query.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 3.3.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool
    
  **/
  public function is_main_query():Bool;
  /**
    
     Whether current WordPress query has results to loop over.
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool
    
  **/
  public function have_posts():Bool;
  /**
    
     Determines whether the caller is in the Loop.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.0.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool True if caller is within loop, false if loop hasn't started or ended.
    
  **/
  public function in_the_loop():Bool;
  /**
    
     Rewind the loop posts.
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
  **/
  public function rewind_posts():Void;
  /**
    
     Iterate the post index in the loop.
    
     @since 1.5.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
  **/
  public function the_post():Void;
  /**
    
     Whether there are comments to loop over.
    
     @since 2.2.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return bool
    
  **/
  public function have_comments():Bool;
  /**
    
     Iterate comment index in the comment loop.
    
     @since 2.2.0
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @return object
    
  **/
  public function the_comment():Dynamic;
  /**
    
     Redirect old slugs to the correct permalink.
    
     Attempts to find the current slug from the past slugs.
    
     @since 2.1.0
    
  **/
  public function wp_old_slug_redirect():Void;
  /**
    
     Find the post ID for redirecting an old slug.
    
     @see wp_old_slug_redirect()
    
     @since 4.9.3
     @access private
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $post_type The current post type based on the query vars.
     @return int $id The Post ID.
    
  **/
  public function _find_post_by_old_slug(post_type:String):Int;
  /**
    
     Find the post ID for redirecting an old date.
    
     @see wp_old_slug_redirect()
    
     @since 4.9.3
     @access private
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $post_type The current post type based on the query vars.
     @return int $id The Post ID.
    
  **/
  public function _find_post_by_old_date(post_type:String):Int;
  /**
    
     Set up global post data.
    
     @since 1.5.0
     @since 4.4.0 Added the ability to pass a post ID to `$post`.
    
     @global WP_Query $wp_query Global WP_Query instance.
    
     @param WP_Post|object|int $post WP_Post instance or Post ID/object.
     @return bool True when finished.
    
  **/
  public function setup_postdata(post:haxe.extern.EitherType<wp.extern.Post, haxe.extern.EitherType<Dynamic, Int>>):Bool;
}
