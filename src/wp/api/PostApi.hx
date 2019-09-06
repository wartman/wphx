package wp.api;

import php.NativeStructArray;
import php.NativeArray;
import haxe.extern.EitherType;
import wp.Post;
import wp.PostType;
import wp.WpError;

// Externs for: https://github.com/WordPress/WordPress/blob/master/wp-includes/post.php
extern class PostApi implements Api {
  function create_initial_post_types():Void;
  function get_attached_file(attachment_id:Int, unfiltered:Bool = false ):EitherType<Bool, String>;
  function update_attached_file(attachment_id:Int, file:String):Bool;
  function get_children(args:EitherType<NativeStructArray<Dynamic>, String> = '', output:String):NativeArray;
  function get_extended(post:String):NativeStructArray<{ main:String, extended:String, more_text:String }>;
  // function get_post( ?post:EitherType<Int, Post>, output = OBJECT, filter = 'raw' )
  function get_post(?post:EitherType<Int, Post>):Post;
  function get_post_ancestors(?post:EitherType<Int, Post>):Array<Int>;
  function get_post_field(field:String, ?post:EitherType<Int, Post>, context:String = 'display'):String;
  function get_post_mime_type(?post:EitherType<Int, Post>):EitherType<String, Bool>;
  function get_post_status(?post:EitherType<Int, Post>):EitherType<String, Bool>;
  function get_post_statuses():NativeStructArray<Dynamic>;
  function get_page_statuses():NativeStructArray<Dynamic>;
  function register_post_status(post_status:String, args:NativeStructArray<Dynamic>):Dynamic;
  function get_post_status_object(post_status:String):Null<Dynamic>;
  function get_post_stati(args:NativeStructArray<Dynamic>, output:String = 'names', op:String = 'and'):NativeArray;
  function is_post_type_hierarchical(post_type:String):Bool;
  function post_type_exists(post_type:String):Bool;
  function get_post_type(?post:EitherType<Int, Post>):EitherType<String, Bool>;
  function get_post_type_object(post_type:String):PostType;
  function get_post_types(args:NativeStructArray<Dynamic>, output:String = 'names', op:String = 'and'):EitherType<Array<String>, Array<PostType>>;
  function register_post_type(post_type:String, args:NativeStructArray<Dynamic>):EitherType<PostType, WpError>;
  function unregister_post_type(post_type:String):EitherType<Bool, WpError>;
  function get_post_type_capabilities(args:Dynamic):Dynamic;
  function add_post_type_support(post_type:String, feature:EitherType<String, Array<String>>):Void;
  function remove_post_type_support(post_type:String, feature:String):Void;
  function get_all_post_type_supports(post_type:String):NativeArray;
  function post_type_supports(post_type:String, feature:String):Bool;
  function get_post_types_by_support(feature:String, op:String = 'and'):Array<String>;
  function set_post_type(post_id:Int = 0, post_type:String = 'post'):EitherType<Int, Bool>;
  function is_post_type_viewable(post_type:EitherType<String, PostType>):Bool;
  // function get_posts(?args:NativeStructArray<Dynamic>):EitherType<Array<Post>, Array<Int>>;
  function get_posts(?args:NativeStructArray<Dynamic>):Array<Post>;
  function add_post_meta(post_id:Int, meta_key:String, meta_value:Dynamic, unique:Bool = false):EitherType<Int, Bool>;
  function delete_post_meta(post_id:Int, meta_key:String, meta_value:Dynamic = ''):Bool;
  function get_post_meta(post_id:Int, key:String = '', single:Bool = false):Dynamic;
  function update_post_meta(post_id:Int, meta_key:String, meta_value:Dynamic, prev_value:Dynamic = ''):EitherType<Int, Bool>;
  function delete_post_meta_by_key(post_meta_key:String):Bool;
  function register_post_meta(post_type:String, meta_key:String, args:NativeArray):Bool;
  function unregister_post_meta(post_type:String, meta_key:String):Bool;
  function get_post_custom(post_id:Int = 0):NativeArray;
  function get_post_custom_keys(post_id:Int = 0):Null<Array<String>>;
  function get_post_custom_values(key:String = '', post_id:Int = 0):Null<Array<String>>;
  function is_sticky(post_id:Int = 0):Bool;
  function sanitize_post(post:Post, context:String = 'display'):Post;
  function sanitize_post_field(field:String, value:Dynamic, post_id:Int, context:String = 'display'):Dynamic;
  function stick_post(post_id:Int):Void;
  function unstick_post(post_id:Int):Void;
  function wp_count_posts(type:String = 'post', perm:String = ''):Dynamic;
  function wp_count_attachments(mime_type:String = ''):Dynamic;
  function get_post_mime_types():NativeStructArray<Dynamic>;
  function wp_match_mime_types(wildcard_mime_types:EitherType<String, NativeArray>, real_mime_types:EitherType<String, NativeArray>):NativeStructArray<Dynamic>;
  function wp_post_mime_type_where(post_mime_types:EitherType<String, NativeArray>, table_alias:String = ''):String;
  function wp_delete_post(postid:Int = 0, force_delete:Bool = false):Null<EitherType<Post, Bool>>;
  function wp_trash_post(post_id:Int = 0):Null<EitherType<Post, Bool>>;
  function wp_untrash_post(post_id:Int = 0):Null<EitherType<Post, Bool>>;
  function wp_trash_post_comments(?post:EitherType<Int, Post>):Dynamic;
  function wp_untrash_post_comments(?post:EitherType<Int, Post>):Dynamic;
  function wp_get_post_categories(post_id:Int = 0, args:NativeStructArray<Dynamic>):NativeArray;
  function wp_get_post_tags(post_id:Int = 0, args:NativeStructArray<Dynamic>):EitherType<NativeArray, WpError>;
  function wp_get_post_terms(post_id:Int = 0, taxonomy:String = 'post_tag', args:NativeStructArray<Dynamic>):EitherType<NativeArray, WpError>;
  // function wp_get_recent_posts( args = array(), output = ARRAY_A )
  function wp_get_recent_posts(args:NativeStructArray<Dynamic>):EitherType<NativeArray, Bool>;
  function wp_insert_post(postarr:NativeStructArray<Dynamic>, wp_error:Bool = false):EitherType<Int, WpError>;
  function wp_update_post(postarr:NativeStructArray<Dynamic>, wp_error:Bool = false):EitherType<Int, WpError>;
  function wp_publish_post(post:EitherType<Post, Int>):Void;
  function check_and_publish_future_post(post_id:EitherType<Post, Int>):Void;
  function wp_unique_post_slug(slug:String, post_ID:Int, post_status:String, post_type:String, post_parent:Int):String;
  function wp_add_post_tags(post_id:Int = 0, tags:EitherType<String, NativeArray> = ''):EitherType<Bool, EitherType<NativeArray, WpError>>;
  function wp_set_post_tags(post_id:Int = 0, tags:EitherType<String, NativeArray> = '', append:Bool = false):EitherType<Bool, EitherType<NativeArray, WpError>>;
  function wp_set_post_terms(post_id:Int = 0, tags:EitherType<String, NativeArray> = '', taxonomy:String = 'post_tag', append:Bool = false):EitherType<Bool, EitherType<NativeArray, WpError>>;
  function wp_set_post_categories(post_ID:Int, post_categories:EitherType<Int, NativeArray>, append:Bool = false):EitherType<Bool, EitherType<NativeArray, WpError>>;
  function wp_transition_post_status(new_status:String, old_status:String, post:Post):Void;
  function add_ping(post_id:EitherType<Post, Int>, uri:EitherType<String, NativeArray>):EitherType<Int, Bool>;
  function get_enclosed(post_id:Int):NativeArray;
  function get_pung(post_id:EitherType<Post, Int>):EitherType<Bool, Array<String>>;
  function get_to_ping(post_id:EitherType<Post, Int>):NativeArray;
  function trackback_url_list(tb_list:String, post_id:Int):Void;
  function get_all_page_ids():NativeArray;
  // function get_page_by_path(page_path:String, output: = OBJECT, post_type = 'page' )
  function get_page_by_path(page_path:String):Null<Post>;
  // function get_page_by_title( page_title, output = OBJECT, post_type = 'page' )
  function get_page_by_title(page_title:String):Null<Post>;
  function get_page_children(page_id:Int, pages:NativeArray):NativeArray;
  // function get_page_hierarchy( &pages, page_id = 0 )
  function get_page_uri(page:EitherType<Int, Post> = 0):EitherType<String, Bool>;
  function get_pages(args:NativeStructArray<Dynamic>):EitherType<NativeArray, Bool>;
  function is_local_attachment(url:String):Bool;
  function wp_insert_attachment(args:NativeStructArray<Dynamic>, ?file:String, parent:Int = 0, wp_error:Bool = false):EitherType<Int, WpError>;
  function wp_delete_attachment(post_id:Int, force_delete:Bool = false):Null<EitherType<Post, Bool>>;
  function wp_delete_attachment_files(post_id:Int, meta:NativeStructArray<Dynamic>, backup_sizes:NativeStructArray<Dynamic>, file:String):Bool;
  function wp_get_attachment_metadata(attachment_id:Int = 0, unfiltered:Bool = false):Dynamic;
  function wp_update_attachment_metadata(attachment_id:Int, data:NativeArray):EitherType<Int, Bool>;
  function wp_get_attachment_url(attachment_id:Int = 0):EitherType<String, Bool>;
  function wp_get_attachment_caption(post_id:Int = 0):EitherType<String, Bool>;
  function wp_get_attachment_thumb_file(post_id:Int= 0):EitherType<String, Bool>;
  function wp_get_attachment_thumb_url(post_id:Int = 0):EitherType<String, Bool>;
  function wp_attachment_is(type:String, ?post:EitherType<Int, Post>):Bool;
  function wp_attachment_is_image(?post:EitherType<Int, Post>):Bool;
  function wp_mime_type_icon(mime:EitherType<String, Int> = 0):EitherType<String, Bool>;
  function wp_check_for_changed_slugs(post_id:Int, post:Post, post_before:Post):Void;
  function wp_check_for_changed_dates(post_id:Int, post:Post, post_before:Post):Void;
  function get_private_posts_cap_sql(post_type:EitherType<String, NativeArray>):String;
  function get_posts_by_author_sql(post_type:EitherType<String, Array<String>>, full:Bool = true, ?post_author:Int, public_only:Bool = false):String;
  function get_lastpostdate(timezone:String = 'server', post_type:String = 'any'):String;
  function get_lastpostmodified(timezone:String = 'server', post_type:String = 'any'):String;
  // function update_post_cache( &posts )
  // function clean_post_cache( post )
  // function update_post_caches( &posts, post_type = 'post', update_term_cache = true, update_meta_cache = true )
  // function update_postmeta_cache( post_ids )
  // function clean_attachment_cache( id, clean_terms = false )
  function wp_get_post_parent_id(post:EitherType<Int, Post>):EitherType<Int, Bool>;
  function wp_check_post_hierarchy_for_loops(post_parent:Int, post_ID:Int):Int;
  function set_post_thumbnail(post:EitherType<Int, Post>, thumbnail_id:Int):EitherType<Int, Bool>;
  function delete_post_thumbnail(post:EitherType<Int, Post>):Bool;
  function wp_delete_auto_drafts():Void;
  function wp_queue_posts_for_term_meta_lazyload(posts:Array<Post>):Void;
  function wp_add_trashed_suffix_to_post_name_for_trashed_posts(post_name:String, post_ID:EitherType<Int, String> = 0):Void;
  function wp_add_trashed_suffix_to_post_name_for_post(post:Post):String;
}

enum abstract PostApiOpenOrClosed(String) to String {
  var Open = 'open';
  var Closed = 'closed';
}

// typedef PostApiInsertPost = {
//   ?ID:Int,
//   ?post_author:String,
//   ?post_date:String,
//   ?post_date_gmt:String,
//   ?post_content:String,
//   ?post_content_filtered:String,
//   ?post_title:String,
//   ?post_excerpt:String,
//   ?post_status:String,
//   ?post_type:String,
//   ?comment_status:PostApiOpenOrClosed,
//   ?ping_status:PostApiOpenOrClosed,
//   ?post_password:String,
//   ?post_name:String,
//   ?to_ping:String,
//   ?pinged:String,
//   ?post_modified:String,
//   ?post_modified_gmt:String,
//   ?post_parent:Int,
//   ?menu_order:Int,
//   ?post_mime_type:String,
//   ?guid:String,
//   ?post_category:Array<Dynamic>,
//   ?tags_input:Array<EitherType<Int, String>>,
//   ?tax_input:Array<Dynamic>,
//   ?meta_input:Array<Dynamic>
// };
