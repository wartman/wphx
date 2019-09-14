package wp.extern;

extern class DeprecatedApi implements wp.util.ApiFunctions {
  /**
    
     Retrieves all post data for a given post.
    
     @since 0.71
     @deprecated 1.5.1 Use get_post()
     @see get_post()
    
     @param int $postid Post ID.
     @return array Post data.
    
  **/
  public function get_postdata(postid:Int):php.NativeArray;
  /**
    
     Sets up the WordPress Loop.
    
     Use The Loop instead.
    
     @link https://codex.wordpress.org/The_Loop
    
     @since 1.0.1
     @deprecated 1.5.0
    
  **/
  public function start_wp():Void;
  /**
    
     Returns or prints a category ID.
    
     @since 0.71
     @deprecated 0.71 Use get_the_category()
     @see get_the_category()
    
     @param bool $echo Optional. Whether to echo the output. Default true.
     @return int Category ID.
    
  **/
  public function the_category_ID(echo:Bool = true):Int;
  /**
    
     Prints a category with optional text before and after.
    
     @since 0.71
     @deprecated 0.71 Use get_the_category_by_ID()
     @see get_the_category_by_ID()
    
     @param string $before Optional. Text to display before the category. Default empty.
     @param string $after  Optional. Text to display after the category. Default empty.
    
  **/
  public function the_category_head(before:String = '', after:String = ''):Void;
  /**
    
     Prints a link to the previous post.
    
     @since 1.5.0
     @deprecated 2.0.0 Use previous_post_link()
     @see previous_post_link()
    
     @param string $format
     @param string $previous
     @param string $title
     @param string $in_same_cat
     @param int    $limitprev
     @param string $excluded_categories
    
  **/
  public function previous_post(format:String = '%', previous:String = 'previous post: ', title:String = 'yes', in_same_cat:String = 'no', limitprev:Int = 1, excluded_categories:String = ''):Void;
  /**
    
     Prints link to the next post.
    
     @since 0.71
     @deprecated 2.0.0 Use next_post_link()
     @see next_post_link()
    
     @param string $format
     @param string $next
     @param string $title
     @param string $in_same_cat
     @param int $limitnext
     @param string $excluded_categories
    
  **/
  public function next_post(format:String = '%', next:String = 'next post: ', title:String = 'yes', in_same_cat:String = 'no', limitnext:Int = 1, excluded_categories:String = ''):Void;
  /**
    
     Whether user can create a post.
    
     @since 1.5.0
     @deprecated 2.0.0 Use current_user_can()
     @see current_user_can()
    
     @param int $user_id
     @param int $blog_id Not Used
     @param int $category_id Not Used
     @return bool
    
  **/
  public function user_can_create_post(user_id:Int, blog_id:Int = 1, ?category_id:Int):Bool;
  /**
    
     Whether user can create a post.
    
     @since 1.5.0
     @deprecated 2.0.0 Use current_user_can()
     @see current_user_can()
    
     @param int $user_id
     @param int $blog_id Not Used
     @param int $category_id Not Used
     @return bool
    
  **/
  public function user_can_create_draft(user_id:Int, blog_id:Int = 1, ?category_id:Int):Bool;
  /**
    
     Whether user can edit a post.
    
     @since 1.5.0
     @deprecated 2.0.0 Use current_user_can()
     @see current_user_can()
    
     @param int $user_id
     @param int $post_id
     @param int $blog_id Not Used
     @return bool
    
  **/
  public function user_can_edit_post(user_id:Int, post_id:Int, blog_id:Int = 1):Bool;
  /**
    
     Whether user can delete a post.
    
     @since 1.5.0
     @deprecated 2.0.0 Use current_user_can()
     @see current_user_can()
    
     @param int $user_id
     @param int $post_id
     @param int $blog_id Not Used
     @return bool
    
  **/
  public function user_can_delete_post(user_id:Int, post_id:Int, blog_id:Int = 1):Bool;
  /**
    
     Whether user can set new posts' dates.
    
     @since 1.5.0
     @deprecated 2.0.0 Use current_user_can()
     @see current_user_can()
    
     @param int $user_id
     @param int $blog_id Not Used
     @param int $category_id Not Used
     @return bool
    
  **/
  public function user_can_set_post_date(user_id:Int, blog_id:Int = 1, ?category_id:Int):Bool;
  /**
    
     Whether user can delete a post.
    
     @since 1.5.0
     @deprecated 2.0.0 Use current_user_can()
     @see current_user_can()
    
     @param int $user_id
     @param int $post_id
     @param int $blog_id Not Used
     @return bool returns true if $user_id can edit $post_id's date
    
  **/
  public function user_can_edit_post_date(user_id:Int, post_id:Int, blog_id:Int = 1):Bool;
  /**
    
     Whether user can delete a post.
    
     @since 1.5.0
     @deprecated 2.0.0 Use current_user_can()
     @see current_user_can()
    
     @param int $user_id
     @param int $post_id
     @param int $blog_id Not Used
     @return bool returns true if $user_id can edit $post_id's comments
    
  **/
  public function user_can_edit_post_comments(user_id:Int, post_id:Int, blog_id:Int = 1):Bool;
  /**
    
     Whether user can delete a post.
    
     @since 1.5.0
     @deprecated 2.0.0 Use current_user_can()
     @see current_user_can()
    
     @param int $user_id
     @param int $post_id
     @param int $blog_id Not Used
     @return bool returns true if $user_id can delete $post_id's comments
    
  **/
  public function user_can_delete_post_comments(user_id:Int, post_id:Int, blog_id:Int = 1):Bool;
  /**
    
     Can user can edit other user.
    
     @since 1.5.0
     @deprecated 2.0.0 Use current_user_can()
     @see current_user_can()
    
     @param int $user_id
     @param int $other_user
     @return bool
    
  **/
  public function user_can_edit_user(user_id:Int, other_user:Int):Bool;
  /**
    
     Gets the links associated with category $cat_name.
    
     @since 0.71
     @deprecated 2.1.0 Use get_bookmarks()
     @see get_bookmarks()
    
     @param string $cat_name Optional. The category name to use. If no match is found uses all.
     @param string $before Optional. The html to output before the link.
     @param string $after Optional. The html to output after the link.
     @param string $between Optional. The html to output between the link/image and its description. Not used if no image or $show_images is true.
     @param bool $show_images Optional. Whether to show images (if defined).
     @param string $orderby Optional. The order to output the links. E.g. 'id', 'name', 'url', 'description' or 'rating'. Or maybe owner.
    		If you start the name with an underscore the order will be reversed. You can also specify 'rand' as the order which will return links in a
    		random order.
     @param bool $show_description Optional. Whether to show the description if show_images=false/not defined.
     @param bool $show_rating Optional. Show rating stars/chars.
     @param int $limit		Optional. Limit to X entries. If not specified, all entries are shown.
     @param int $show_updated Optional. Whether to show last updated timestamp
    
  **/
  public function get_linksbyname(cat_name:String = "noname", before:String = '', after:String = '<br />', between:String = " ", show_images:Bool = true, orderby:String = 'id', show_description:Bool = true, show_rating:Bool = false, limit:Int = , show_updated:Int):Void;
  /**
    
     Gets the links associated with the named category.
    
     @since 1.0.1
     @deprecated 2.1.0 Use wp_list_bookmarks()
     @see wp_list_bookmarks()
    
     @param string $category The category to use.
     @param string $args
     @return string|null
    
  **/
  public function wp_get_linksbyname(category:String, args:String = ''):String;
  /**
    
     Gets an array of link objects associated with category $cat_name.
    
         $links = get_linkobjectsbyname( 'fred' );
         foreach ( $links as $link ) {
          	echo '<li>' . $link->link_name . '</li>';
         }
    
     @since 1.0.1
     @deprecated 2.1.0 Use get_bookmarks()
     @see get_bookmarks()
    
     @param string $cat_name The category name to use. If no match is found uses all.
     @param string $orderby The order to output the links. E.g. 'id', 'name', 'url', 'description', or 'rating'.
    		Or maybe owner. If you start the name with an underscore the order will be reversed. You can also
    		specify 'rand' as the order which will return links in a random order.
     @param int $limit Limit to X entries. If not specified, all entries are shown.
     @return array
    
  **/
  public function get_linkobjectsbyname(cat_name:String = "noname", orderby:String, limit:Int):php.NativeArray;
  /**
    
     Gets an array of link objects associated with category n.
    
     Usage:
    
         $links = get_linkobjects(1);
         if ($links) {
         	foreach ($links as $link) {
         		echo '<li>'.$link->link_name.'<br />'.$link->link_description.'</li>';
         	}
         }
    
     Fields are:
    
     - link_id
     - link_url
     - link_name
     - link_image
     - link_target
     - link_category
     - link_description
     - link_visible
     - link_owner
     - link_rating
     - link_updated
     - link_rel
     - link_notes
    
     @since 1.0.1
     @deprecated 2.1.0 Use get_bookmarks()
     @see get_bookmarks()
    
     @param int $category The category to use. If no category supplied uses all
     @param string $orderby the order to output the links. E.g. 'id', 'name', 'url',
    		'description', or 'rating'. Or maybe owner. If you start the name with an
    		underscore the order will be reversed. You can also specify 'rand' as the
    		order which will return links in a random order.
     @param int $limit Limit to X entries. If not specified, all entries are shown.
     @return array
    
  **/
  public function get_linkobjects(category:Int = 0, orderby:String = 'name', limit:Int = 0):php.NativeArray;
  /**
    
     Gets the links associated with category 'cat_name' and display rating stars/chars.
    
     @since 0.71
     @deprecated 2.1.0 Use get_bookmarks()
     @see get_bookmarks()
    
     @param string $cat_name The category name to use. If no match is found uses all
     @param string $before The html to output before the link
     @param string $after The html to output after the link
     @param string $between The html to output between the link/image and its description. Not used if no image or show_images is true
     @param bool $show_images Whether to show images (if defined).
     @param string $orderby the order to output the links. E.g. 'id', 'name', 'url',
    		'description', or 'rating'. Or maybe owner. If you start the name with an
    		underscore the order will be reversed. You can also specify 'rand' as the
    		order which will return links in a random order.
     @param bool $show_description Whether to show the description if show_images=false/not defined
     @param int $limit Limit to X entries. If not specified, all entries are shown.
     @param int $show_updated Whether to show last updated timestamp
    
  **/
  public function get_linksbyname_withrating(cat_name:String = "noname", before:String = '', after:String = '<br />', between:String = " ", show_images:Bool = true, orderby:String = 'id', show_description:Bool = true, limit:Int = , show_updated:Int):Void;
  /**
    
     Gets the links associated with category n and display rating stars/chars.
    
     @since 0.71
     @deprecated 2.1.0 Use get_bookmarks()
     @see get_bookmarks()
    
     @param int $category The category to use. If no category supplied uses all
     @param string $before The html to output before the link
     @param string $after The html to output after the link
     @param string $between The html to output between the link/image and its description. Not used if no image or show_images == true
     @param bool $show_images Whether to show images (if defined).
     @param string $orderby The order to output the links. E.g. 'id', 'name', 'url',
    		'description', or 'rating'. Or maybe owner. If you start the name with an
    		underscore the order will be reversed. You can also specify 'rand' as the
    		order which will return links in a random order.
     @param bool $show_description Whether to show the description if show_images=false/not defined.
     @param int $limit Limit to X entries. If not specified, all entries are shown.
     @param int $show_updated Whether to show last updated timestamp
    
  **/
  public function get_links_withrating(category:Int = , before:String, after:String, between:String, show_images:Bool, orderby:String, show_description:Bool, limit:Int, show_updated:Int):Void;
  /**
    
     Gets the auto_toggle setting.
    
     @since 0.71
     @deprecated 2.1.0
    
     @param int $id The category to get. If no category supplied uses 0
     @return int Only returns 0.
    
  **/
  public function get_autotoggle(id:Int = 0):Int;
  /**
    
     Lists categories.
    
     @since 0.71
     @deprecated 2.1.0 Use wp_list_categories()
     @see wp_list_categories()
    
     @param int $optionall
     @param string $all
     @param string $sort_column
     @param string $sort_order
     @param string $file
     @param bool $list
     @param int $optiondates
     @param int $optioncount
     @param int $hide_empty
     @param int $use_desc_for_title
     @param bool $children
     @param int $child_of
     @param int $categories
     @param int $recurse
     @param string $feed
     @param string $feed_image
     @param string $exclude
     @param bool $hierarchical
     @return false|null
    
  **/
  public function list_cats(optionall:Int = 1, ?all:String, ?sort_column:String, sort_order:String = 'asc', file:String = '', list:Bool = true, optiondates:Int = 0, optioncount:Int = 0, hide_empty:Int = 1, use_desc_for_title:Int = 1, children:Bool = false, child_of:Int = 0, categories:Int = 0, recurse:Int = 0, feed:String = '', feed_image:String = '', exclude:String = '', hierarchical:Bool = false):Bool;
  /**
    
     Lists categories.
    
     @since 1.2.0
     @deprecated 2.1.0 Use wp_list_categories()
     @see wp_list_categories()
    
     @param string|array $args
     @return false|null|string
    
  **/
  public function wp_list_cats(args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):haxe.extern.EitherType<Bool, String>;
  /**
    
     Deprecated method for generating a drop-down of categories.
    
     @since 0.71
     @deprecated 2.1.0 Use wp_dropdown_categories()
     @see wp_dropdown_categories()
    
     @param int $optionall
     @param string $all
     @param string $orderby
     @param string $order
     @param int $show_last_update
     @param int $show_count
     @param int $hide_empty
     @param bool $optionnone
     @param int $selected
     @param int $exclude
     @return string
    
  **/
  public function dropdown_cats(optionall:Int = 1, ?all:String, ?orderby:String, order:String = 'asc', show_last_update:Int = 0, show_count:Int = 0, hide_empty:Int = 1, optionnone:Bool = false, selected:Int = 0, exclude:Int = 0):String;
  /**
    
     Lists authors.
    
     @since 1.2.0
     @deprecated 2.1.0 Use wp_list_authors()
     @see wp_list_authors()
    
     @param bool $optioncount
     @param bool $exclude_admin
     @param bool $show_fullname
     @param bool $hide_empty
     @param string $feed
     @param string $feed_image
     @return null|string
    
  **/
  public function list_authors(optioncount:Bool = false, exclude_admin:Bool = true, show_fullname:Bool = false, hide_empty:Bool = true, feed:String = '', feed_image:String = ''):String;
  /**
    
     Retrieves a list of post categories.
    
     @since 1.0.1
     @deprecated 2.1.0 Use wp_get_post_categories()
     @see wp_get_post_categories()
    
     @param int $blogid Not Used
     @param int $post_ID
     @return array
    
  **/
  public function wp_get_post_cats(blogid:Int = '1', post_ID:Int = 0):php.NativeArray;
  /**
    
     Sets the categories that the post id belongs to.
    
     @since 1.0.1
     @deprecated 2.1.0
     @deprecated Use wp_set_post_categories()
     @see wp_set_post_categories()
    
     @param int $blogid Not used
     @param int $post_ID
     @param array $post_categories
     @return bool|mixed
    
  **/
  public function wp_set_post_cats(blogid:Int = '1', post_ID:Int = 0, ?post_categories:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, Dynamic>;
  /**
    
     Retrieves a list of archives.
    
     @since 0.71
     @deprecated 2.1.0 Use wp_get_archives()
     @see wp_get_archives()
    
     @param string $type
     @param string $limit
     @param string $format
     @param string $before
     @param string $after
     @param bool $show_post_count
     @return string|null
    
  **/
  public function get_archives(type:String = '', limit:String = '', format:String = 'html', before:String = '', after:String = '', show_post_count:Bool = false):String;
  /**
    
     Returns or Prints link to the author's posts.
    
     @since 1.2.0
     @deprecated 2.1.0 Use get_author_posts_url()
     @see get_author_posts_url()
    
     @param bool $echo
     @param int $author_id
     @param string $author_nicename Optional.
     @return string|null
    
  **/
  public function get_author_link(echo:Bool, author_id:Int, author_nicename:String = ''):String;
  /**
    
     Print list of pages based on arguments.
    
     @since 0.71
     @deprecated 2.1.0 Use wp_link_pages()
     @see wp_link_pages()
    
     @param string $before
     @param string $after
     @param string $next_or_number
     @param string $nextpagelink
     @param string $previouspagelink
     @param string $pagelink
     @param string $more_file
     @return string
    
  **/
  public function link_pages(before:String = '<br />', after:String = '<br />', next_or_number:String = 'number', nextpagelink:String = 'next page', previouspagelink:String = 'previous page', pagelink:String = '%', more_file:String = ''):String;
  /**
    
     Get value based on option.
    
     @since 0.71
     @deprecated 2.1.0 Use get_option()
     @see get_option()
    
     @param string $option
     @return string
    
  **/
  public function get_settings(option:String):String;
  /**
    
     Print the permalink of the current post in the loop.
    
     @since 0.71
     @deprecated 1.2.0 Use the_permalink()
     @see the_permalink()
    
  **/
  public function permalink_link():Void;
  /**
    
     Print the permalink to the RSS feed.
    
     @since 0.71
     @deprecated 2.3.0 Use the_permalink_rss()
     @see the_permalink_rss()
    
     @param string $deprecated
    
  **/
  public function permalink_single_rss(deprecated:String = ''):Void;
  /**
    
     Gets the links associated with category.
    
     @since 1.0.1
     @deprecated 2.1.0 Use wp_list_bookmarks()
     @see wp_list_bookmarks()
    
     @param string $args a query string
     @return null|string
    
  **/
  public function wp_get_links(args:String = ''):String;
  /**
    
     Gets the links associated with category by id.
    
     @since 0.71
     @deprecated 2.1.0 Use get_bookmarks()
     @see get_bookmarks()
    
     @param int $category The category to use. If no category supplied uses all
     @param string $before the html to output before the link
     @param string $after the html to output after the link
     @param string $between the html to output between the link/image and its description.
    		Not used if no image or show_images == true
     @param bool $show_images whether to show images (if defined).
     @param string $orderby the order to output the links. E.g. 'id', 'name', 'url',
    		'description', or 'rating'. Or maybe owner. If you start the name with an
    		underscore the order will be reversed. You can also specify 'rand' as the order
    		which will return links in a random order.
     @param bool $show_description whether to show the description if show_images=false/not defined.
     @param bool $show_rating show rating stars/chars
     @param int $limit Limit to X entries. If not specified, all entries are shown.
     @param int $show_updated whether to show last updated timestamp
     @param bool $echo whether to echo the results, or return them instead
     @return null|string
    
  **/
  public function get_links(category:Int = , before:String, after:String, between:String, show_images:Bool, orderby:String, show_description:Bool, show_rating:Bool, limit:Int, show_updated:Int, echo:Bool):String;
  /**
    
     Output entire list of links by category.
    
     Output a list of all links, listed by category, using the settings in
     $wpdb->linkcategories and output it as a nested HTML unordered list.
    
     @since 1.0.1
     @deprecated 2.1.0 Use wp_list_bookmarks()
     @see wp_list_bookmarks()
    
     @param string $order Sort link categories by 'name' or 'id'
    
  **/
  public function get_links_list(order:String = 'name'):Void;
  /**
    
     Show the link to the links popup and the number of links.
    
     @since 0.71
     @deprecated 2.1.0
    
     @param string $text the text of the link
     @param int $width the width of the popup window
     @param int $height the height of the popup window
     @param string $file the page to open in the popup window
     @param bool $count the number of links in the db
    
  **/
  public function links_popup_script(?text:String, width:Int = 400, height:Int = 400, file:String = 'links.all.php', count:Bool = true):Void;
  /**
    
     Legacy function that retrieved the value of a link's link_rating field.
    
     @since 1.0.1
     @deprecated 2.1.0 Use sanitize_bookmark_field()
     @see sanitize_bookmark_field()
    
     @param object $link Link object.
     @return mixed Value of the 'link_rating' field, false otherwise.
    
  **/
  public function get_linkrating(link:Dynamic):Dynamic;
  /**
    
     Gets the name of category by id.
    
     @since 0.71
     @deprecated 2.1.0 Use get_category()
     @see get_category()
    
     @param int $id The category to get. If no category supplied uses 0
     @return string
    
  **/
  public function get_linkcatname(id:Int = 0):String;
  /**
    
     Print RSS comment feed link.
    
     @since 1.0.1
     @deprecated 2.5.0 Use post_comments_feed_link()
     @see post_comments_feed_link()
    
     @param string $link_text
    
  **/
  public function comments_rss_link(?link_text:String):Void;
  /**
    
     Print/Return link to category RSS2 feed.
    
     @since 1.2.0
     @deprecated 2.5.0 Use get_category_feed_link()
     @see get_category_feed_link()
    
     @param bool $echo
     @param int $cat_ID
     @return string
    
  **/
  public function get_category_rss_link(echo:Bool = false, cat_ID:Int = 1):String;
  /**
    
     Print/Return link to author RSS feed.
    
     @since 1.2.0
     @deprecated 2.5.0 Use get_author_feed_link()
     @see get_author_feed_link()
    
     @param bool $echo
     @param int $author_id
     @return string
    
  **/
  public function get_author_rss_link(echo:Bool = false, author_id:Int = 1):String;
  /**
    
     Return link to the post RSS feed.
    
     @since 1.5.0
     @deprecated 2.2.0 Use get_post_comments_feed_link()
     @see get_post_comments_feed_link()
    
     @return string
    
  **/
  public function comments_rss():String;
  /**
    
     An alias of wp_create_user().
    
     @since 2.0.0
     @deprecated 2.0.0 Use wp_create_user()
     @see wp_create_user()
    
     @param string $username The user's username.
     @param string $password The user's password.
     @param string $email    The user's email.
     @return int The new user's ID.
    
  **/
  public function create_user(username:String, password:String, email:String):Int;
  /**
    
     Unused function.
    
     @deprecated 2.5.0
    
  **/
  public function gzip_compression():Void;
  /**
    
     Retrieve an array of comment data about comment $comment_ID.
    
     @since 0.71
     @deprecated 2.7.0 Use get_comment()
     @see get_comment()
    
     @param int $comment_ID The ID of the comment
     @param int $no_cache Whether to use the cache (cast to bool)
     @param bool $include_unapproved Whether to include unapproved comments
     @return array The comment data
    
  **/
  public function get_commentdata(comment_ID:Int, no_cache:Int = 0, include_unapproved:Bool = false):php.NativeArray;
  /**
    
     Retrieve the category name by the category ID.
    
     @since 0.71
     @deprecated 2.8.0 Use get_cat_name()
     @see get_cat_name()
    
     @param int $cat_ID Category ID
     @return string category name
    
  **/
  public function get_catname(cat_ID:Int):String;
  /**
    
     Retrieve category children list separated before and after the term IDs.
    
     @since 1.2.0
     @deprecated 2.8.0 Use get_term_children()
     @see get_term_children()
    
     @param int $id Category ID to retrieve children.
     @param string $before Optional. Prepend before category term ID.
     @param string $after Optional, default is empty string. Append after category term ID.
     @param array $visited Optional. Category Term IDs that have already been added.
     @return string
    
  **/
  public function get_category_children(id:Int, before:String = '/', after:String = '', ?visited:php.NativeStructArray<Dynamic>):String;
  /**
    
     Retrieves all category IDs.
    
     @since 2.0.0
     @deprecated 4.0.0 Use get_terms()
     @see get_terms()
    
     @link https://codex.wordpress.org/Function_Reference/get_all_category_ids
    
     @return object List of all of the category IDs.
    
  **/
  public function get_all_category_ids():Dynamic;
  /**
    
     Retrieve the description of the author of the current post.
    
     @since 1.5.0
     @deprecated 2.8.0 Use get_the_author_meta()
     @see get_the_author_meta()
    
     @return string The author's description.
    
  **/
  public function get_the_author_description():String;
  /**
    
     Display the description of the author of the current post.
    
     @since 1.0.0
     @deprecated 2.8.0 Use the_author_meta()
     @see the_author_meta()
    
  **/
  public function the_author_description():Void;
  /**
    
     Retrieve the login name of the author of the current post.
    
     @since 1.5.0
     @deprecated 2.8.0 Use get_the_author_meta()
     @see get_the_author_meta()
    
     @return string The author's login name (username).
    
  **/
  public function get_the_author_login():String;
  /**
    
     Display the login name of the author of the current post.
    
     @since 0.71
     @deprecated 2.8.0 Use the_author_meta()
     @see the_author_meta()
    
  **/
  public function the_author_login():Void;
  /**
    
     Retrieve the first name of the author of the current post.
    
     @since 1.5.0
     @deprecated 2.8.0 Use get_the_author_meta()
     @see get_the_author_meta()
    
     @return string The author's first name.
    
  **/
  public function get_the_author_firstname():String;
  /**
    
     Display the first name of the author of the current post.
    
     @since 0.71
     @deprecated 2.8.0 Use the_author_meta()
     @see the_author_meta()
    
  **/
  public function the_author_firstname():Void;
  /**
    
     Retrieve the last name of the author of the current post.
    
     @since 1.5.0
     @deprecated 2.8.0 Use get_the_author_meta()
     @see get_the_author_meta()
    
     @return string The author's last name.
    
  **/
  public function get_the_author_lastname():String;
  /**
    
     Display the last name of the author of the current post.
    
     @since 0.71
     @deprecated 2.8.0 Use the_author_meta()
     @see the_author_meta()
    
  **/
  public function the_author_lastname():Void;
  /**
    
     Retrieve the nickname of the author of the current post.
    
     @since 1.5.0
     @deprecated 2.8.0 Use get_the_author_meta()
     @see get_the_author_meta()
    
     @return string The author's nickname.
    
  **/
  public function get_the_author_nickname():String;
  /**
    
     Display the nickname of the author of the current post.
    
     @since 0.71
     @deprecated 2.8.0 Use the_author_meta()
     @see the_author_meta()
    
  **/
  public function the_author_nickname():Void;
  /**
    
     Retrieve the email of the author of the current post.
    
     @since 1.5.0
     @deprecated 2.8.0 Use get_the_author_meta()
     @see get_the_author_meta()
    
     @return string The author's username.
    
  **/
  public function get_the_author_email():String;
  /**
    
     Display the email of the author of the current post.
    
     @since 0.71
     @deprecated 2.8.0 Use the_author_meta()
     @see the_author_meta()
    
  **/
  public function the_author_email():Void;
  /**
    
     Retrieve the ICQ number of the author of the current post.
    
     @since 1.5.0
     @deprecated 2.8.0 Use get_the_author_meta()
     @see get_the_author_meta()
    
     @return string The author's ICQ number.
    
  **/
  public function get_the_author_icq():String;
  /**
    
     Display the ICQ number of the author of the current post.
    
     @since 0.71
     @deprecated 2.8.0 Use the_author_meta()
     @see the_author_meta()
    
  **/
  public function the_author_icq():Void;
  /**
    
     Retrieve the Yahoo! IM name of the author of the current post.
    
     @since 1.5.0
     @deprecated 2.8.0 Use get_the_author_meta()
     @see get_the_author_meta()
    
     @return string The author's Yahoo! IM name.
    
  **/
  public function get_the_author_yim():String;
  /**
    
     Display the Yahoo! IM name of the author of the current post.
    
     @since 0.71
     @deprecated 2.8.0 Use the_author_meta()
     @see the_author_meta()
    
  **/
  public function the_author_yim():Void;
  /**
    
     Retrieve the MSN address of the author of the current post.
    
     @since 1.5.0
     @deprecated 2.8.0 Use get_the_author_meta()
     @see get_the_author_meta()
    
     @return string The author's MSN address.
    
  **/
  public function get_the_author_msn():String;
  /**
    
     Display the MSN address of the author of the current post.
    
     @since 0.71
     @deprecated 2.8.0 Use the_author_meta()
     @see the_author_meta()
    
  **/
  public function the_author_msn():Void;
  /**
    
     Retrieve the AIM address of the author of the current post.
    
     @since 1.5.0
     @deprecated 2.8.0 Use get_the_author_meta()
     @see get_the_author_meta()
    
     @return string The author's AIM address.
    
  **/
  public function get_the_author_aim():String;
  /**
    
     Display the AIM address of the author of the current post.
    
     @since 0.71
     @deprecated 2.8.0 Use the_author_meta('aim')
     @see the_author_meta()
    
  **/
  public function the_author_aim():Void;
  /**
    
     Retrieve the specified author's preferred display name.
    
     @since 1.0.0
     @deprecated 2.8.0 Use get_the_author_meta()
     @see get_the_author_meta()
    
     @param int $auth_id The ID of the author.
     @return string The author's display name.
    
  **/
  public function get_author_name(auth_id:Int = false):String;
  /**
    
     Retrieve the URL to the home page of the author of the current post.
    
     @since 1.5.0
     @deprecated 2.8.0 Use get_the_author_meta()
     @see get_the_author_meta()
    
     @return string The URL to the author's page.
    
  **/
  public function get_the_author_url():String;
  /**
    
     Display the URL to the home page of the author of the current post.
    
     @since 0.71
     @deprecated 2.8.0 Use the_author_meta()
     @see the_author_meta()
    
  **/
  public function the_author_url():Void;
  /**
    
     Retrieve the ID of the author of the current post.
    
     @since 1.5.0
     @deprecated 2.8.0 Use get_the_author_meta()
     @see get_the_author_meta()
    
     @return string|int The author's ID.
    
  **/
  public function get_the_author_ID():haxe.extern.EitherType<String, Int>;
  /**
    
     Display the ID of the author of the current post.
    
     @since 0.71
     @deprecated 2.8.0 Use the_author_meta()
     @see the_author_meta()
    
  **/
  public function the_author_ID():Void;
  /**
    
     Display the post content for the feed.
    
     For encoding the html or the $encode_html parameter, there are three possible
     values. '0' will make urls footnotes and use make_url_footnote(). '1' will
     encode special characters and automatically display all of the content. The
     value of '2' will strip all HTML tags from the content.
    
     Also note that you cannot set the amount of words and not set the html
     encoding. If that is the case, then the html encoding will default to 2,
     which will strip all HTML tags.
    
     To restrict the amount of words of the content, you can use the cut
     parameter. If the content is less than the amount, then there won't be any
     dots added to the end. If there is content left over, then dots will be added
     and the rest of the content will be removed.
    
     @since 0.71
    
     @deprecated 2.9.0 Use the_content_feed()
     @see the_content_feed()
    
     @param string $more_link_text Optional. Text to display when more content is available but not displayed.
     @param int $stripteaser Optional. Default is 0.
     @param string $more_file Optional.
     @param int $cut Optional. Amount of words to keep for the content.
     @param int $encode_html Optional. How to encode the content.
    
  **/
  public function the_content_rss(more_link_text:String = '(more...)', stripteaser:Int = 0, more_file:String = '', cut:Int = 0, encode_html:Int = 0):Void;
  /**
    
     Strip HTML and put links at the bottom of stripped content.
    
     Searches for all of the links, strips them out of the content, and places
     them at the bottom of the content with numbers.
    
     @since 0.71
     @deprecated 2.9.0
    
     @param string $content Content to get links
     @return string HTML stripped out of content with links at the bottom.
    
  **/
  public function make_url_footnote(content:String):String;
  /**
    
     Retrieve translated string with vertical bar context
    
     Quite a few times, there will be collisions with similar translatable text
     found in more than two places but with different translated context.
    
     In order to use the separate contexts, the _c() function is used and the
     translatable string uses a pipe ('|') which has the context the string is in.
    
     When the translated string is returned, it is everything before the pipe, not
     including the pipe character. If there is no pipe in the translated text then
     everything is returned.
    
     @since 2.2.0
     @deprecated 2.9.0 Use _x()
     @see _x()
    
     @param string $text Text to translate
     @param string $domain Optional. Domain to retrieve the translated text
     @return string Translated context string without pipe
    
  **/
  public function _c(text:String, domain:String = 'default'):String;
  /**
    
     Translates $text like translate(), but assumes that the text
     contains a context after its last vertical bar.
    
     @since 2.5.0
     @deprecated 3.0.0 Use _x()
     @see _x()
    
     @param string $text Text to translate
     @param string $domain Domain to retrieve the translated text
     @return string Translated text
    
  **/
  public function translate_with_context(text:String, domain:String = 'default'):String;
  /**
    
     Legacy version of _n(), which supports contexts.
    
     Strips everything from the translation after the last bar.
    
     @since 2.7.0
     @deprecated 3.0.0 Use _nx()
     @see _nx()
    
     @param string $single The text to be used if the number is singular.
     @param string $plural The text to be used if the number is plural.
     @param int    $number The number to compare against to use either the singular or plural form.
     @param string $domain Optional. Text domain. Unique identifier for retrieving translated strings.
                           Default 'default'.
     @return string The translated singular or plural form.
    
  **/
  public function _nc(single:String, plural:String, number:Int, domain:String = 'default'):String;
  /**
    
     Retrieve the plural or single form based on the amount.
    
     @since 1.2.0
     @deprecated 2.8.0 Use _n()
     @see _n()
    
  **/
  public function __ngettext():Void;
  /**
    
     Register plural strings in POT file, but don't translate them.
    
     @since 2.5.0
     @deprecated 2.8.0 Use _n_noop()
     @see _n_noop()
    
  **/
  public function __ngettext_noop():Void;
  /**
    
     Retrieve all autoload options, or all options if no autoloaded ones exist.
    
     @since 1.0.0
     @deprecated 3.0.0 Use wp_load_alloptions())
     @see wp_load_alloptions()
    
     @return array List of all options.
    
  **/
  public function get_alloptions():php.NativeArray;
  /**
    
     Retrieve HTML content of attachment image with link.
    
     @since 2.0.0
     @deprecated 2.5.0 Use wp_get_attachment_link()
     @see wp_get_attachment_link()
    
     @param int $id Optional. Post ID.
     @param bool $fullsize Optional, default is false. Whether to use full size image.
     @param array $max_dims Optional. Max image dimensions.
     @param bool $permalink Optional, default is false. Whether to include permalink to image.
     @return string
    
  **/
  public function get_the_attachment_link(id:Int = 0, fullsize:Bool = false, max_dims:php.NativeStructArray<Dynamic> = false, permalink:Bool = false):String;
  /**
    
     Retrieve icon URL and Path.
    
     @since 2.1.0
     @deprecated 2.5.0 Use wp_get_attachment_image_src()
     @see wp_get_attachment_image_src()
    
     @param int $id Optional. Post ID.
     @param bool $fullsize Optional, default to false. Whether to have full image.
     @return array Icon URL and full path to file, respectively.
    
  **/
  public function get_attachment_icon_src(id:Int = 0, fullsize:Bool = false):php.NativeArray;
  /**
    
     Retrieve HTML content of icon attachment image element.
    
     @since 2.0.0
     @deprecated 2.5.0 Use wp_get_attachment_image()
     @see wp_get_attachment_image()
    
     @param int $id Optional. Post ID.
     @param bool $fullsize Optional, default to false. Whether to have full size image.
     @param array $max_dims Optional. Dimensions of image.
     @return false|string HTML content.
    
  **/
  public function get_attachment_icon(id:Int = 0, fullsize:Bool = false, max_dims:php.NativeStructArray<Dynamic> = false):haxe.extern.EitherType<Bool, String>;
  /**
    
     Retrieve HTML content of image element.
    
     @since 2.0.0
     @deprecated 2.5.0 Use wp_get_attachment_image()
     @see wp_get_attachment_image()
    
     @param int $id Optional. Post ID.
     @param bool $fullsize Optional, default to false. Whether to have full size image.
     @param array $max_dims Optional. Dimensions of image.
     @return false|string
    
  **/
  public function get_attachment_innerHTML(id:Int = 0, fullsize:Bool = false, max_dims:php.NativeStructArray<Dynamic> = false):haxe.extern.EitherType<Bool, String>;
  /**
    
     Retrieves bookmark data based on ID.
    
     @since 2.0.0
     @deprecated 2.1.0 Use get_bookmark()
     @see get_bookmark()
    
     @param int    $bookmark_id ID of link
     @param string $output      Optional. Type of output. Accepts OBJECT, ARRAY_N, or ARRAY_A.
                                Default OBJECT.
     @param string $filter      Optional. How to filter the link for output. Accepts 'raw', 'edit',
                                'attribute', 'js', 'db', or 'display'. Default 'raw'.
     @return object|array Bookmark object or array, depending on the type specified by `$output`.
    
  **/
  public function get_link(bookmark_id:Int, ?output:String, filter:String = 'raw'):haxe.extern.EitherType<Dynamic, php.NativeStructArray<Dynamic>>;
  /**
    
     Performs esc_url() for database or redirect usage.
    
     @since 2.3.1
     @deprecated 2.8.0 Use esc_url_raw()
     @see esc_url_raw()
    
     @param string $url The URL to be cleaned.
     @param array $protocols An array of acceptable protocols.
     @return string The cleaned URL.
    
  **/
  public function sanitize_url(url:String, protocols:php.NativeStructArray<Dynamic> = null):String;
  /**
    
     Checks and cleans a URL.
    
     A number of characters are removed from the URL. If the URL is for displaying
     (the default behaviour) ampersands are also replaced. The 'clean_url' filter
     is applied to the returned cleaned URL.
    
     @since 1.2.0
     @deprecated 3.0.0 Use esc_url()
     @see esc_url()
    
     @param string $url The URL to be cleaned.
     @param array $protocols Optional. An array of acceptable protocols.
     @param string $context Optional. How the URL will be used. Default is 'display'.
     @return string The cleaned $url after the {@see 'clean_url'} filter is applied.
    
  **/
  public function clean_url(url:String, protocols:php.NativeStructArray<Dynamic> = null, context:String = 'display'):String;
  /**
    
     Escape single quotes, specialchar double quotes, and fix line endings.
    
     The filter {@see 'js_escape'} is also applied by esc_js().
    
     @since 2.0.4
     @deprecated 2.8.0 Use esc_js()
     @see esc_js()
    
     @param string $text The text to be escaped.
     @return string Escaped text.
    
  **/
  public function js_escape(text:String):String;
  /**
    
     Legacy escaping for HTML blocks.
    
     @deprecated 2.8.0 Use esc_html()
     @see esc_html()
    
     @param string       $string        String to escape.
     @param string       $quote_style   Unused.
     @param false|string $charset       Unused.
     @param false        $double_encode Whether to double encode. Unused.
     @return string Escaped `$string`.
    
  **/
  public function wp_specialchars(string:String, ?quote_style:String, charset:haxe.extern.EitherType<Bool, String> = false, double_encode:Bool = false):String;
  /**
    
     Escaping for HTML attributes.
    
     @since 2.0.6
     @deprecated 2.8.0 Use esc_attr()
     @see esc_attr()
    
     @param string $text
     @return string
    
  **/
  public function attribute_escape(text:String):String;
  /**
    
     Register widget for sidebar with backward compatibility.
    
     Allows $name to be an array that accepts either three elements to grab the
     first element and the third for the name or just uses the first element of
     the array for the name.
    
     Passes to wp_register_sidebar_widget() after argument list and backward
     compatibility is complete.
    
     @since 2.2.0
     @deprecated 2.8.0 Use wp_register_sidebar_widget()
     @see wp_register_sidebar_widget()
    
     @param string|int $name            Widget ID.
     @param callable   $output_callback Run when widget is called.
     @param string     $classname       Optional. Classname widget option. Default empty.
     @param mixed      $params ,...     Widget parameters.
    
  **/
  public function register_sidebar_widget(name:haxe.extern.EitherType<String, Int>, output_callback:Dynamic, classname:String = '', params:Dynamic):Void;
  /**
    
     Serves as an alias of wp_unregister_sidebar_widget().
    
     @since 2.2.0
     @deprecated 2.8.0 Use wp_unregister_sidebar_widget()
     @see wp_unregister_sidebar_widget()
    
     @param int|string $id Widget ID.
    
  **/
  public function unregister_sidebar_widget(id:haxe.extern.EitherType<Int, String>):Void;
  /**
    
     Registers widget control callback for customizing options.
    
     Allows $name to be an array that accepts either three elements to grab the
     first element and the third for the name or just uses the first element of
     the array for the name.
    
     Passes to wp_register_widget_control() after the argument list has
     been compiled.
    
     @since 2.2.0
     @deprecated 2.8.0 Use wp_register_widget_control()
     @see wp_register_widget_control()
    
     @param int|string $name Sidebar ID.
     @param callable $control_callback Widget control callback to display and process form.
     @param int $width Widget width.
     @param int $height Widget height.
    
  **/
  public function register_widget_control(name:haxe.extern.EitherType<Int, String>, control_callback:Dynamic, width:Int = '', height:Int = ''):Void;
  /**
    
     Alias of wp_unregister_widget_control().
    
     @since 2.2.0
     @deprecated 2.8.0 Use wp_unregister_widget_control()
     @see wp_unregister_widget_control()
    
     @param int|string $id Widget ID.
    
  **/
  public function unregister_widget_control(id:haxe.extern.EitherType<Int, String>):Void;
  /**
    
     Remove user meta data.
    
     @since 2.0.0
     @deprecated 3.0.0 Use delete_user_meta()
     @see delete_user_meta()
    
     @param int $user_id User ID.
     @param string $meta_key Metadata key.
     @param mixed $meta_value Metadata value.
     @return bool True deletion completed and false if user_id is not a number.
    
  **/
  public function delete_usermeta(user_id:Int, meta_key:String, meta_value:Dynamic = ''):Bool;
  /**
    
     Retrieve user metadata.
    
     If $user_id is not a number, then the function will fail over with a 'false'
     boolean return value. Other returned values depend on whether there is only
     one item to be returned, which be that single item type. If there is more
     than one metadata value, then it will be list of metadata values.
    
     @since 2.0.0
     @deprecated 3.0.0 Use get_user_meta()
     @see get_user_meta()
    
     @param int $user_id User ID
     @param string $meta_key Optional. Metadata key.
     @return mixed
    
  **/
  public function get_usermeta(user_id:Int, meta_key:String = ''):Dynamic;
  /**
    
     Update metadata of user.
    
     There is no need to serialize values, they will be serialized if it is
     needed. The metadata key can only be a string with underscores. All else will
     be removed.
    
     Will remove the metadata, if the meta value is empty.
    
     @since 2.0.0
     @deprecated 3.0.0 Use update_user_meta()
     @see update_user_meta()
    
     @param int $user_id User ID
     @param string $meta_key Metadata key.
     @param mixed $meta_value Metadata value.
     @return bool True on successful update, false on failure.
    
  **/
  public function update_usermeta(user_id:Int, meta_key:String, meta_value:Dynamic):Bool;
  /**
    
     Get users for the site.
    
     For setups that use the multisite feature. Can be used outside of the
     multisite feature.
    
     @since 2.2.0
     @deprecated 3.1.0 Use get_users()
     @see get_users()
    
     @global wpdb $wpdb    WordPress database abstraction object.
    
     @param int $id Site ID.
     @return array List of users that are part of that site ID
    
  **/
  public function get_users_of_blog(id:Int = ''):php.NativeArray;
  /**
    
     Enable/disable automatic general feed link outputting.
    
     @since 2.8.0
     @deprecated 3.0.0 Use add_theme_support()
     @see add_theme_support()
    
     @param bool $add Optional, default is true. Add or remove links. Defaults to true.
    
  **/
  public function automatic_feed_links(add:Bool = true):Void;
  /**
    
     Retrieve user data based on field.
    
     @since 1.5.0
     @deprecated 3.0.0 Use get_the_author_meta()
     @see get_the_author_meta()
    
     @param string    $field User meta field.
     @param false|int $user Optional. User ID to retrieve the field for. Default false (current user).
     @return string The author's field from the current author's DB object.
    
  **/
  public function get_profile(field:String, user:haxe.extern.EitherType<Bool, Int> = false):String;
  /**
    
     Retrieves the number of posts a user has written.
    
     @since 0.71
     @deprecated 3.0.0 Use count_user_posts()
     @see count_user_posts()
    
     @param int $userid User to count posts for.
     @return int Number of posts the given user has written.
    
  **/
  public function get_usernumposts(userid:Int):Int;
  /**
    
     Callback used to change %uXXXX to &#YYY; syntax
    
     @since 2.8.0
     @access private
     @deprecated 3.0.0
    
     @param array $matches Single Match
     @return string An HTML entity
    
  **/
  public function funky_javascript_callback(matches:php.NativeStructArray<Dynamic>):String;
  /**
    
     Fixes JavaScript bugs in browsers.
    
     Converts unicode characters to HTML numbered entities.
    
     @since 1.5.0
     @deprecated 3.0.0
    
     @global $is_macIE
     @global $is_winIE
    
     @param string $text Text to be made safe.
     @return string Fixed text.
    
  **/
  public function funky_javascript_fix(text:String):String;
  /**
    
     Checks that the taxonomy name exists.
    
     @since 2.3.0
     @deprecated 3.0.0 Use taxonomy_exists()
     @see taxonomy_exists()
    
     @param string $taxonomy Name of taxonomy object
     @return bool Whether the taxonomy exists.
    
  **/
  public function is_taxonomy(taxonomy:String):Bool;
  /**
    
     Check if Term exists.
    
     @since 2.3.0
     @deprecated 3.0.0 Use term_exists()
     @see term_exists()
    
     @param int|string $term The term to check
     @param string $taxonomy The taxonomy name to use
     @param int $parent ID of parent term under which to confine the exists search.
     @return mixed Get the term id or Term Object, if exists.
    
  **/
  public function is_term(term:haxe.extern.EitherType<Int, String>, taxonomy:String = '', parent:Int = 0):Dynamic;
  /**
    
     Determines whether the current admin page is generated by a plugin.
    
     Use global $plugin_page and/or get_plugin_page_hookname() hooks.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.5.0
     @deprecated 3.1.0
    
     @global $plugin_page
    
     @return bool
    
  **/
  public function is_plugin_page():Bool;
  /**
    
     Update the categories cache.
    
     This function does not appear to be used anymore or does not appear to be
     needed. It might be a legacy function left over from when there was a need
     for updating the category cache.
    
     @since 1.5.0
     @deprecated 3.1.0
    
     @return bool Always return True
    
  **/
  public function update_category_cache():Bool;
  /**
    
     Check for PHP timezone support
    
     @since 2.9.0
     @deprecated 3.2.0
    
     @return bool
    
  **/
  public function wp_timezone_supported():Bool;
  /**
    
     Displays an editor: TinyMCE, HTML, or both.
    
     @since 2.1.0
     @deprecated 3.3.0 Use wp_editor()
     @see wp_editor()
    
     @param string $content       Textarea content.
     @param string $id            Optional. HTML ID attribute value. Default 'content'.
     @param string $prev_id       Optional. Unused.
     @param bool   $media_buttons Optional. Whether to display media buttons. Default true.
     @param int    $tab_index     Optional. Unused.
     @param bool   $extended      Optional. Unused.
    
  **/
  public function the_editor(content:String, id:String = 'content', prev_id:String = 'title', media_buttons:Bool = true, tab_index:Int = 2, extended:Bool = true):Void;
  /**
    
     Perform the query to get the $metavalues array(s) needed by _fill_user and _fill_many_users
    
     @since 3.0.0
     @deprecated 3.3.0
    
     @param array $ids User ID numbers list.
     @return array of arrays. The array is indexed by user_id, containing $metavalues object arrays.
    
  **/
  public function get_user_metavalues(ids:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Sanitize every user field.
    
     If the context is 'raw', then the user object or array will get minimal santization of the int fields.
    
     @since 2.3.0
     @deprecated 3.3.0
    
     @param object|array $user The User Object or Array
     @param string $context Optional, default is 'display'. How to sanitize user fields.
     @return object|array The now sanitized User Object or Array (will be the same type as $user)
    
  **/
  public function sanitize_user_object(user:haxe.extern.EitherType<Dynamic, php.NativeStructArray<Dynamic>>, context:String = 'display'):haxe.extern.EitherType<Dynamic, php.NativeStructArray<Dynamic>>;
  /**
    
     Get boundary post relational link.
    
     Can either be start or end post relational link.
    
     @since 2.8.0
     @deprecated 3.3.0
    
     @param string $title Optional. Link title format.
     @param bool $in_same_cat Optional. Whether link should be in a same category.
     @param string $excluded_categories Optional. Excluded categories IDs.
     @param bool $start Optional, default is true. Whether to display link to first or last post.
     @return string
    
  **/
  public function get_boundary_post_rel_link(title:String = '%title', in_same_cat:Bool = false, excluded_categories:String = '', start:Bool = true):String;
  /**
    
     Display relational link for the first post.
    
     @since 2.8.0
     @deprecated 3.3.0
    
     @param string $title Optional. Link title format.
     @param bool $in_same_cat Optional. Whether link should be in a same category.
     @param string $excluded_categories Optional. Excluded categories IDs.
    
  **/
  public function start_post_rel_link(title:String = '%title', in_same_cat:Bool = false, excluded_categories:String = ''):Void;
  /**
    
     Get site index relational link.
    
     @since 2.8.0
     @deprecated 3.3.0
    
     @return string
    
  **/
  public function get_index_rel_link():String;
  /**
    
     Display relational link for the site index.
    
     @since 2.8.0
     @deprecated 3.3.0
    
  **/
  public function index_rel_link():Void;
  /**
    
     Get parent post relational link.
    
     @since 2.8.0
     @deprecated 3.3.0
    
     @param string $title Optional. Link title format. Default '%title'.
     @return string
    
  **/
  public function get_parent_post_rel_link(title:String = '%title'):String;
  /**
    
     Display relational link for parent item
    
     @since 2.8.0
     @deprecated 3.3.0
    
     @param string $title Optional. Link title format. Default '%title'.
    
  **/
  public function parent_post_rel_link(title:String = '%title'):Void;
  /**
    
     Add the "Dashboard"/"Visit Site" menu.
    
     @since 3.2.0
     @deprecated 3.3.0
    
     @param WP_Admin_Bar $wp_admin_bar WP_Admin_Bar instance.
    
  **/
  public function wp_admin_bar_dashboard_view_site_menu(wp_admin_bar:wp.extern.AdminBar):Void;
  /**
    
     Checks if the current user belong to a given site.
    
     @since MU (3.0.0)
     @deprecated 3.3.0 Use is_user_member_of_blog()
     @see is_user_member_of_blog()
    
     @param int $blog_id Site ID
     @return bool True if the current users belong to $blog_id, false if not.
    
  **/
  public function is_blog_user(blog_id:Int = 0):Bool;
  /**
    
     Open the file handle for debugging.
    
     @since 0.71
     @deprecated 3.4.0 Use error_log()
     @see error_log()
    
     @link https://secure.php.net/manual/en/function.error-log.php
    
     @param string $filename File name.
     @param string $mode     Type of access you required to the stream.
     @return false Always false.
    
  **/
  public function debug_fopen(filename:String, mode:String):Bool;
  /**
    
     Write contents to the file used for debugging.
    
     @since 0.71
     @deprecated 3.4.0 Use error_log()
     @see error_log()
    
     @link https://secure.php.net/manual/en/function.error-log.php
    
     @param mixed  $fp     Unused.
     @param string $string Message to log.
    
  **/
  public function debug_fwrite(fp:Dynamic, string:String):Void;
  /**
    
     Close the debugging file handle.
    
     @since 0.71
     @deprecated 3.4.0 Use error_log()
     @see error_log()
    
     @link https://secure.php.net/manual/en/function.error-log.php
    
     @param mixed $fp Unused.
    
  **/
  public function debug_fclose(fp:Dynamic):Void;
  /**
    
     Retrieve list of themes with theme data in theme directory.
    
     The theme is broken, if it doesn't have a parent theme and is missing either
     style.css and, or index.php. If the theme has a parent theme then it is
     broken, if it is missing style.css; index.php is optional.
    
     @since 1.5.0
     @deprecated 3.4.0 Use wp_get_themes()
     @see wp_get_themes()
    
     @return array Theme list with theme data.
    
  **/
  public function get_themes():php.NativeArray;
  /**
    
     Retrieve theme data.
    
     @since 1.5.0
     @deprecated 3.4.0 Use wp_get_theme()
     @see wp_get_theme()
    
     @param string $theme Theme name.
     @return array|null Null, if theme name does not exist. Theme data, if exists.
    
  **/
  public function get_theme(theme:String):php.NativeArray;
  /**
    
     Retrieve current theme name.
    
     @since 1.5.0
     @deprecated 3.4.0 Use wp_get_theme()
     @see wp_get_theme()
    
     @return string
    
  **/
  public function get_current_theme():String;
  /**
    
     Accepts matches array from preg_replace_callback in wpautop() or a string.
    
     Ensures that the contents of a `<pre>...</pre>` HTML block are not
     converted into paragraphs or line-breaks.
    
     @since 1.2.0
     @deprecated 3.4.0
    
     @param array|string $matches The array or string
     @return string The pre block without paragraph/line-break conversion.
    
  **/
  public function clean_pre(matches:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):String;
  /**
    
     Add callbacks for image header display.
    
     @since 2.1.0
     @deprecated 3.4.0 Use add_theme_support()
     @see add_theme_support()
    
     @param callable $wp_head_callback Call on the {@see 'wp_head'} action.
     @param callable $admin_head_callback Call on custom header administration screen.
     @param callable $admin_preview_callback Output a custom header image div on the custom header administration screen. Optional.
    
  **/
  public function add_custom_image_header(wp_head_callback:Dynamic, admin_head_callback:Dynamic, admin_preview_callback:Dynamic = ''):Void;
  /**
    
     Remove image header support.
    
     @since 3.1.0
     @deprecated 3.4.0 Use remove_theme_support()
     @see remove_theme_support()
    
     @return null|bool Whether support was removed.
    
  **/
  public function remove_custom_image_header():Bool;
  /**
    
     Add callbacks for background image display.
    
     @since 3.0.0
     @deprecated 3.4.0 Use add_theme_support()
     @see add_theme_support()
    
     @param callable $wp_head_callback Call on the {@see 'wp_head'} action.
     @param callable $admin_head_callback Call on custom background administration screen.
     @param callable $admin_preview_callback Output a custom background image div on the custom background administration screen. Optional.
    
  **/
  public function add_custom_background(wp_head_callback:Dynamic = '', admin_head_callback:Dynamic = '', admin_preview_callback:Dynamic = ''):Void;
  /**
    
     Remove custom background support.
    
     @since 3.1.0
     @deprecated 3.4.0 Use add_custom_background()
     @see add_custom_background()
    
     @return null|bool Whether support was removed.
    
  **/
  public function remove_custom_background():Bool;
  /**
    
     Retrieve theme data from parsed theme file.
    
     @since 1.5.0
     @deprecated 3.4.0 Use wp_get_theme()
     @see wp_get_theme()
    
     @param string $theme_file Theme file path.
     @return array Theme data.
    
  **/
  public function get_theme_data(theme_file:String):php.NativeArray;
  /**
    
     Alias of update_post_cache().
    
     @see update_post_cache() Posts and pages are the same, alias is intentional
    
     @since 1.5.1
     @deprecated 3.4.0 Use update_post_cache()
     @see update_post_cache()
    
     @param array $pages list of page objects
    
  **/
  public function update_page_cache(pages:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Will clean the page in the cache.
    
     Clean (read: delete) page from cache that matches $id. Will also clean cache
     associated with 'all_page_ids' and 'get_pages'.
    
     @since 2.0.0
     @deprecated 3.4.0 Use clean_post_cache
     @see clean_post_cache()
    
     @param int $id Page ID to clean
    
  **/
  public function clean_page_cache(id:Int):Void;
  /**
    
     Retrieve nonce action "Are you sure" message.
    
     Deprecated in 3.4.1 and 3.5.0. Backported to 3.3.3.
    
     @since 2.0.4
     @deprecated 3.4.1 Use wp_nonce_ays()
     @see wp_nonce_ays()
    
     @param string $action Nonce action.
     @return string Are you sure message.
    
  **/
  public function wp_explain_nonce(action:String):String;
  /**
    
     Display "sticky" CSS class, if a post is sticky.
    
     @since 2.7.0
     @deprecated 3.5.0 Use post_class()
     @see post_class()
    
     @param int $post_id An optional post ID.
    
  **/
  public function sticky_class(post_id:Int = null):Void;
  /**
    
     Retrieve post ancestors.
    
     This is no longer needed as WP_Post lazy-loads the ancestors
     property with get_post_ancestors().
    
     @since 2.3.4
     @deprecated 3.5.0 Use get_post_ancestors()
     @see get_post_ancestors()
    
     @param WP_Post $post Post object, passed by reference (unused).
    
  **/
  public function _get_post_ancestors(post:wp.extern.Post):Void;
  /**
    
     Load an image from a string, if PHP supports it.
    
     @since 2.1.0
     @deprecated 3.5.0 Use wp_get_image_editor()
     @see wp_get_image_editor()
    
     @param string $file Filename of the image to load.
     @return resource The resulting image resource on success, Error string on failure.
    
  **/
  public function wp_load_image(file:String):Dynamic;
  /**
    
     Scale down an image to fit a particular size and save a new copy of the image.
    
     The PNG transparency will be preserved using the function, as well as the
     image type. If the file going in is PNG, then the resized image is going to
     be PNG. The only supported image types are PNG, GIF, and JPEG.
    
     Some functionality requires API to exist, so some PHP version may lose out
     support. This is not the fault of WordPress (where functionality is
     downgraded, not actual defects), but of your PHP version.
    
     @since 2.5.0
     @deprecated 3.5.0 Use wp_get_image_editor()
     @see wp_get_image_editor()
    
     @param string $file Image file path.
     @param int $max_w Maximum width to resize to.
     @param int $max_h Maximum height to resize to.
     @param bool $crop Optional. Whether to crop image or resize.
     @param string $suffix Optional. File suffix.
     @param string $dest_path Optional. New image file path.
     @param int $jpeg_quality Optional, default is 90. Image quality percentage.
     @return mixed WP_Error on failure. String with new destination path.
    
  **/
  public function image_resize(file:String, max_w:Int, max_h:Int, crop:Bool = false, suffix:String = null, dest_path:String = null, jpeg_quality:Int = 90):Dynamic;
  /**
    
     Retrieve a single post, based on post ID.
    
     Has categories in 'post_category' property or key. Has tags in 'tags_input'
     property or key.
    
     @since 1.0.0
     @deprecated 3.5.0 Use get_post()
     @see get_post()
    
     @param int $postid Post ID.
     @param string $mode How to return result, either OBJECT, ARRAY_N, or ARRAY_A.
     @return WP_Post|null Post object or array holding post contents and information
    
  **/
  public function wp_get_single_post(postid:Int = 0, ?mode:String):wp.extern.Post;
  /**
    
     Check that the user login name and password is correct.
    
     @since 0.71
     @deprecated 3.5.0 Use wp_authenticate()
     @see wp_authenticate()
    
     @param string $user_login User name.
     @param string $user_pass User password.
     @return bool False if does not authenticate, true if username and password authenticates.
    
  **/
  public function user_pass_ok(user_login:String, user_pass:String):Bool;
  /**
    
     Callback formerly fired on the save_post hook. No longer needed.
    
     @since 2.3.0
     @deprecated 3.5.0
    
  **/
  public function _save_post_hook():Void;
  /**
    
     Check if the installed version of GD supports particular image type
    
     @since 2.9.0
     @deprecated 3.5.0 Use wp_image_editor_supports()
     @see wp_image_editor_supports()
    
     @param string $mime_type
     @return bool
    
  **/
  public function gd_edit_image_support(mime_type:String):Bool;
  /**
    
     Converts an integer byte value to a shorthand byte value.
    
     @since 2.3.0
     @deprecated 3.6.0 Use size_format()
     @see size_format()
    
     @param int $bytes An integer byte value.
     @return string A shorthand byte value.
    
  **/
  public function wp_convert_bytes_to_hr(bytes:Int):String;
  /**
    
     Formerly used internally to tidy up the search terms.
    
     @since 2.9.0
     @access private
     @deprecated 3.7.0
    
     @param string $t Search terms to "tidy", e.g. trim.
     @return string Trimmed search terms.
    
  **/
  public function _search_terms_tidy(t:String):String;
  /**
    
     Determine if TinyMCE is available.
    
     Checks to see if the user has deleted the tinymce files to slim down
     their WordPress installation.
    
     @since 2.1.0
     @deprecated 3.9.0
    
     @return bool Whether TinyMCE exists.
    
  **/
  public function rich_edit_exists():Bool;
  /**
    
     Old callback for tag link tooltips.
    
     @since 2.7.0
     @access private
     @deprecated 3.9.0
    
     @param int $count Number of topics.
     @return int Number of topics.
    
  **/
  public function default_topic_count_text(count:Int):Int;
  /**
    
     Formerly used to escape strings before inserting into the DB.
    
     Has not performed this function for many, many years. Use wpdb::prepare() instead.
    
     @since 0.71
     @deprecated 3.9.0
    
     @param string $content The text to format.
     @return string The very same text.
    
  **/
  public function format_to_post(content:String):String;
  /**
    
     Formerly used to escape strings before searching the DB. It was poorly documented and never worked as described.
    
     @since 2.5.0
     @deprecated 4.0.0 Use wpdb::esc_like()
     @see wpdb::esc_like()
    
     @param string $text The text to be escaped.
     @return string text, safe for inclusion in LIKE query.
    
  **/
  public function like_escape(text:String):String;
  /**
    
     Determines if the URL can be accessed over SSL.
    
     Determines if the URL can be accessed over SSL by using the WordPress HTTP API to access
     the URL using https as the scheme.
    
     @since 2.5.0
     @deprecated 4.0.0
    
     @param string $url The URL to test.
     @return bool Whether SSL access is available.
    
  **/
  public function url_is_accessable_via_ssl(url:String):Bool;
  /**
    
     Start preview theme output buffer.
    
     Will only perform task if the user has permissions and template and preview
     query variables exist.
    
     @since 2.6.0
     @deprecated 4.3.0
    
  **/
  public function preview_theme():Void;
  /**
    
     Private function to modify the current template when previewing a theme
    
     @since 2.9.0
     @deprecated 4.3.0
     @access private
    
     @return string
    
  **/
  public function _preview_theme_template_filter():String;
  /**
    
     Private function to modify the current stylesheet when previewing a theme
    
     @since 2.9.0
     @deprecated 4.3.0
     @access private
    
     @return string
    
  **/
  public function _preview_theme_stylesheet_filter():String;
  /**
    
     Callback function for ob_start() to capture all links in the theme.
    
     @since 2.6.0
     @deprecated 4.3.0
     @access private
    
     @param string $content
     @return string
    
  **/
  public function preview_theme_ob_filter(content:String):String;
  /**
    
     Manipulates preview theme links in order to control and maintain location.
    
     Callback function for preg_replace_callback() to accept and filter matches.
    
     @since 2.6.0
     @deprecated 4.3.0
     @access private
    
     @param array $matches
     @return string
    
  **/
  public function preview_theme_ob_filter_callback(matches:php.NativeStructArray<Dynamic>):String;
  /**
    
     Formats text for the rich text editor.
    
     The {@see 'richedit_pre'} filter is applied here. If $text is empty the filter will
     be applied to an empty string.
    
     @since 2.0.0
     @deprecated 4.3.0 Use format_for_editor()
     @see format_for_editor()
    
     @param string $text The text to be formatted.
     @return string The formatted text after filter is applied.
    
  **/
  public function wp_richedit_pre(text:String):String;
  /**
    
     Formats text for the HTML editor.
    
     Unless $output is empty it will pass through htmlspecialchars before the
     {@see 'htmledit_pre'} filter is applied.
    
     @since 2.5.0
     @deprecated 4.3.0 Use format_for_editor()
     @see format_for_editor()
    
     @param string $output The text to be formatted.
     @return string Formatted text after filter applied.
    
  **/
  public function wp_htmledit_pre(output:String):String;
  /**
    
     Retrieve permalink from post ID.
    
     @since 1.0.0
     @deprecated 4.4.0 Use get_permalink()
     @see get_permalink()
    
     @param int|WP_Post $post_id Optional. Post ID or WP_Post object. Default is global $post.
     @return string|false
    
  **/
  public function post_permalink(post_id:haxe.extern.EitherType<Int, wp.extern.Post> = 0):haxe.extern.EitherType<String, Bool>;
  /**
    
     Perform a HTTP HEAD or GET request.
    
     If $file_path is a writable filename, this will do a GET request and write
     the file to that path.
    
     @since 2.5.0
     @deprecated 4.4.0 Use WP_Http
     @see WP_Http
    
     @param string      $url       URL to fetch.
     @param string|bool $file_path Optional. File path to write request to. Default false.
     @param int         $red       Optional. The number of Redirects followed, Upon 5 being hit,
                                   returns false. Default 1.
     @return bool|string False on failure and string of headers if HEAD request.
    
  **/
  public function wp_get_http(url:String, file_path:haxe.extern.EitherType<String, Bool> = false, red:Int = 1):haxe.extern.EitherType<Bool, String>;
  /**
    
     Whether SSL login should be forced.
    
     @since 2.6.0
     @deprecated 4.4.0 Use force_ssl_admin()
     @see force_ssl_admin()
    
     @param string|bool $force Optional Whether to force SSL login. Default null.
     @return bool True if forced, false if not forced.
    
  **/
  public function force_ssl_login(force:haxe.extern.EitherType<String, Bool> = null):Bool;
  /**
    
     Retrieve path of comment popup template in current or parent template.
    
     @since 1.5.0
     @deprecated 4.5.0
    
     @return string Full path to comments popup template file.
    
  **/
  public function get_comments_popup_template():String;
  /**
    
     Determines whether the current URL is within the comments popup window.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 1.5.0
     @deprecated 4.5.0
    
     @return bool
    
  **/
  public function is_comments_popup():Bool;
  /**
    
     Display the JS popup script to show a comment.
    
     @since 0.71
     @deprecated 4.5.0
    
  **/
  public function comments_popup_script():Void;
  /**
    
     Adds element attributes to open links in new tabs.
    
     @since 0.71
     @deprecated 4.5.0
    
     @param string $text Content to replace links to open in a new tab.
     @return string Content that has filtered links.
    
  **/
  public function popuplinks(text:String):String;
  /**
    
     The Google Video embed handler callback.
    
     Deprecated function that previously assisted in turning Google Video URLs
     into embeds but that service has since been shut down.
    
     @since 2.9.0
     @deprecated 4.6.0
    
     @return string An empty string.
    
  **/
  public function wp_embed_handler_googlevideo(matches:Dynamic, attr:Dynamic, url:Dynamic, rawattr:Dynamic):String;
  /**
    
     Retrieve path of paged template in current or parent template.
    
     @since 1.5.0
     @deprecated 4.7.0 The paged.php template is no longer part of the theme template hierarchy.
    
     @return string Full path to paged template file.
    
  **/
  public function get_paged_template():String;
  /**
    
     Removes the HTML JavaScript entities found in early versions of Netscape 4.
    
     Previously, this function was pulled in from the original
     import of kses and removed a specific vulnerability only
     existent in early version of Netscape 4. However, this
     vulnerability never affected any other browsers and can
     be considered safe for the modern web.
    
     The regular expression which sanitized this vulnerability
     has been removed in consideration of the performance and
     energy demands it placed, now merely passing through its
     input to the return.
    
     @since 1.0.0
     @deprecated 4.7.0 Officially dropped security support for Netscape 4.
    
     @param string $string
     @return string
    
  **/
  public function wp_kses_js_entities(string:String):String;
  /**
    
     Sort categories by ID.
    
     Used by usort() as a callback, should not be used directly. Can actually be
     used to sort any term object.
    
     @since 2.3.0
     @deprecated 4.7.0 Use wp_list_sort()
     @access private
    
     @param object $a
     @param object $b
     @return int
    
  **/
  public function _usort_terms_by_ID(a:Dynamic, b:Dynamic):Int;
  /**
    
     Sort categories by name.
    
     Used by usort() as a callback, should not be used directly. Can actually be
     used to sort any term object.
    
     @since 2.3.0
     @deprecated 4.7.0 Use wp_list_sort()
     @access private
    
     @param object $a
     @param object $b
     @return int
    
  **/
  public function _usort_terms_by_name(a:Dynamic, b:Dynamic):Int;
  /**
    
     Sort menu items by the desired key.
    
     @since 3.0.0
     @deprecated 4.7.0 Use wp_list_sort()
     @access private
    
     @global string $_menu_item_sort_prop
    
     @param object $a The first object to compare
     @param object $b The second object to compare
     @return int -1, 0, or 1 if $a is considered to be respectively less than, equal to, or greater than $b.
    
  **/
  public function _sort_nav_menu_items(a:Dynamic, b:Dynamic):Int;
  /**
    
     Retrieves the Press This bookmarklet link.
    
     @since 2.6.0
     @deprecated 4.9.0
    
    
  **/
  public function get_shortcut_link():Void;
  /**
    
     Ajax handler for saving a post from Press This.
    
     @since 4.2.0
     @deprecated 4.9.0
    
  **/
  public function wp_ajax_press_this_save_post():Void;
  /**
    
     Ajax handler for creating new category from Press This.
    
     @since 4.2.0
     @deprecated 4.9.0
    
  **/
  public function wp_ajax_press_this_add_category():Void;
}
