package wp.api;

import haxe.extern.EitherType;
import php.NativeArray;
import php.NativeStructArray;
import wp.Post;
import wp.Term;
import wp.api.Types;

// For: wp-includes/link-template.php
class LinkTemplateApi implements Api {
  function the_permalink(post:PostOrId = 0):Void;
  function user_trailingslashit(string:String, type_of_url:String = ''):String;
  function permalink_anchor(mode:String = 'id'):Void;
  function get_the_permalink(post:PostOrId = 0, leavename:Bool = false):StringOrBool;
  function get_permalink(post:PostOrId = 0, leavename:Bool = false):StringOrBool;
  function get_post_permalink(id:PostOrId = 0, leavename:Bool = false, sample:Bool = false):MaybeError<String>;
  function get_page_link(post:PostOrId = 0, leavename:Bool = false, sample:Bool = false):String;
  function get_attachment_link(post:PostOrId = null, leavename:Bool = false):String;
  function get_year_link(year:EitherType<Bool, Int>):String;
  function get_month_link(year:EitherType<Bool, Int>, month:EitherType<Bool, Int>):String;
  function get_day_link(year:EitherType<Bool, Int>, month:EitherType<Bool, Int>, day:EitherType<Bool, Int>):String;
  function the_feed_link(anchor:String, feed:String = ''):Void;
  function get_feed_link(feed:String = ''):String;
  function get_post_comments_feed_link(post_id:PostOrId = 0, feed:String = ''):String;
  function post_comments_feed_link(link_text:String = '', post_id:Int = 0, feed:String = ''):Void;
  function get_author_feed_link(author_id:Int, feed:String = ''):String;
  function get_category_feed_link(cat_id:Int, feed:String = ''):String;
  function get_term_feed_link(term_id:Int, taxonomy:String = 'category', feed:String = ''):StringOrBool;
  function get_tag_feed_link(tag_id:Int, feed:String = ''):String;
  function get_edit_tag_link(tag_id:Int, taxonomy:String = 'post_tag'):String;
  function edit_tag_link(link:String = '', before:String = '', after:String = '', ?tag:Term):Void;
  function get_edit_term_link(term_id:Int, taxonomy:String = '', object_type:String = ''):Null<String>;
  function edit_term_link(link:String = '', before:String = '', after:String = '', ?term:Term, echo:Bool = false):Null<String>;
  function get_search_link(query:String = ''):String;
  function get_search_feed_link(search_query:String = '', feed:String = ''):String;
  function get_search_comments_feed_link(search_query:String = '', feed:String = ''):String;
  function get_post_type_archive_link(post_type:String):EitherType<String, Bool>;
  function get_post_type_archive_feed_link(post_type:String, feed:String = ''):EitherType<String, Bool>;
  function get_preview_post_link(post:PostOrId = null, query_args:NativeStructArray<Dynamic>, preview_link:String = ''):Null<String>;
  function get_edit_post_link(id:PostOrId = 0, context:String = 'display'):Null<String>;
  function edit_post_link(text:String = null, before:String = '', after:String = '', id:PostOrId = 0, clss:String = 'post-edit-link'):Void;
  function get_delete_post_link(id:PostOrId = 0, deprecated:String = '', force_delete:Bool = false):String;
  function get_edit_comment_link(comment_id:EitherType<Comment, Int> = 0):String;
  function edit_comment_link(text:String = null, before:String = '', after:String = ''):Void;
  function get_edit_bookmark_link(link:EitherType<Int, Dynamic> = 0):String;
  function edit_bookmark_link(link:String = '', before:String = '', after:String = '', bookmark:Int = null):Void;
  function get_edit_user_link(user_id:Int = null):String;
  function get_previous_post(in_same_term:Bool = false, excluded_terms:String = '', taxonomy:String = 'category'):Null<EitherType<Post, String>>;
  function get_next_post(in_same_term:Bool = false, excluded_terms:String = '', taxonomy:String = 'category'):Null<EitherType<Post, String>>;
  function get_adjacent_post(in_same_term:Bool = false, excluded_terms:EitherType<NativeArray, String> = '', previous:Bool = true, taxonomy:String = 'category'):Null<EitherType<String, Post>>;
  // function get_adjacent_post_rel_link( $title = '%title', $in_same_term = false, $excluded_terms = '', $previous = true, $taxonomy = 'category' )
  // function adjacent_posts_rel_link( $title = '%title', $in_same_term = false, $excluded_terms = '', $taxonomy = 'category' )
  // function adjacent_posts_rel_link_wp_head()
  // function next_post_rel_link( $title = '%title', $in_same_term = false, $excluded_terms = '', $taxonomy = 'category' )
  // function prev_post_rel_link( $title = '%title', $in_same_term = false, $excluded_terms = '', $taxonomy = 'category' )
  // function get_boundary_post( $in_same_term = false, $excluded_terms = '', $start = true, $taxonomy = 'category' )
  // function get_previous_post_link( $format = '&laquo; %link', $link = '%title', $in_same_term = false, $excluded_terms = '', $taxonomy = 'category' )
  // function previous_post_link( $format = '&laquo; %link', $link = '%title', $in_same_term = false, $excluded_terms = '', $taxonomy = 'category' )
  // function get_next_post_link( $format = '%link &raquo;', $link = '%title', $in_same_term = false, $excluded_terms = '', $taxonomy = 'category' )
  // function next_post_link( $format = '%link &raquo;', $link = '%title', $in_same_term = false, $excluded_terms = '', $taxonomy = 'category' )
  // function get_adjacent_post_link( $format, $link, $in_same_term = false, $excluded_terms = '', $previous = true, $taxonomy = 'category' )
  // function adjacent_post_link( $format, $link, $in_same_term = false, $excluded_terms = '', $previous = true, $taxonomy = 'category' )
  // function get_pagenum_link($pagenum = 1, $escape = true )
  // function get_next_posts_page_link($max_page = 0)
  // function next_posts( $max_page = 0, $echo = true )
  // function get_next_posts_link( $label = null, $max_page = 0 )
  // function next_posts_link( $label = null, $max_page = 0 )
  // function get_previous_posts_page_link()
  // function previous_posts( $echo = true )
  // function get_previous_posts_link( $label = null )
  // function previous_posts_link( $label = null )
  // function get_posts_nav_link( $args = array() )
  // function posts_nav_link( $sep = '', $prelabel = '', $nxtlabel = '' )
  // function get_the_post_navigation( $args = array() )
  // function the_post_navigation( $args = array() )
  // function get_the_posts_navigation( $args = array() )
  // function the_posts_navigation( $args = array() )
  // function get_the_posts_pagination( $args = array() )
  // function the_posts_pagination( $args = array() )
  // function _navigation_markup( $links, $class = 'posts-navigation', $screen_reader_text = '' )
  // function get_comments_pagenum_link( $pagenum = 1, $max_page = 0 )
  // function get_next_comments_link( $label = '', $max_page = 0 )
  // function next_comments_link( $label = '', $max_page = 0 )
  // function get_previous_comments_link( $label = '' )
  // function previous_comments_link( $label = '' )
  // function paginate_comments_links( $args = array() )
  // function get_the_comments_navigation( $args = array() )
  // function the_comments_navigation( $args = array() )
  // function get_the_comments_pagination( $args = array() )
  // function the_comments_pagination( $args = array() )
  // function home_url( $path = '', $scheme = null )
  function get_home_url(blog_id:Int = null, path:String = '', scheme:String = null):String;
  // function site_url( $path = '', $scheme = null )
  // function get_site_url( $blog_id = null, $path = '', $scheme = null )
  // function admin_url( $path = '', $scheme = 'admin' )
  // function get_admin_url( $blog_id = null, $path = '', $scheme = 'admin' )
  // function includes_url( $path = '', $scheme = null )
  // function content_url( $path = '' )
  // function plugins_url( $path = '', $plugin = '' )
  // function network_site_url( $path = '', $scheme = null )
  // function network_home_url( $path = '', $scheme = null )
  // function network_admin_url( $path = '', $scheme = 'admin' )
  // function user_admin_url( $path = '', $scheme = 'admin' )
  // function self_admin_url( $path = '', $scheme = 'admin' )
  // function set_url_scheme( $url, $scheme = null )
  // function get_dashboard_url( $user_id = 0, $path = '', $scheme = 'admin' )
  // function get_edit_profile_url( $user_id = 0, $scheme = 'admin' )
  // function wp_get_canonical_url( $post = null )
  // function rel_canonical()
  // function wp_get_shortlink( $id = 0, $context = 'post', $allow_slugs = true )
  // function wp_shortlink_wp_head()
  // function wp_shortlink_header()
  // function the_shortlink( $text = '', $title = '', $before = '', $after = '' )
  // function get_avatar_url( $id_or_email, $args = null )
  // function get_avatar_data( $id_or_email, $args = null )
  function get_theme_file_uri(file:String = ''):String;
  function get_parent_theme_file_uri(file:String = ''):String;
  function get_theme_file_path(file:String = ''):String;
  function get_parent_theme_file_path(file:String = ''):String;
  // function get_privacy_policy_url()
  // function the_privacy_policy_link( $before = '', $after = '' )
  // function get_the_privacy_policy_link( $before = '', $after = '' )
}
