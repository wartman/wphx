package wp.api;

import haxe.extern.EitherType;
import wp.Query;
import wp.Post;

// For: wp-includes/query.php
extern class QueryApi implements Api {
  function get_query_var(key:String, ?def:Dynamic):Dynamic;  
  function get_queried_object():Query;
  function get_queried_object_id():Int;
  function set_query_var(key:String, value:Dynamic):Void;
  function query_posts(query:Query):Array<Post>;
  function reset_query():Void;
  function reset_postdata():Void;
  function is_archive():Bool;
  function is_post_type_archive(?postTypes:EitherType<String, Array<String>>):Bool;
  function is_attachment(?attachmentId:Int):Bool;
  function is_author(?authorId:Int):Bool;
  function is_category(?category:EitherType<Int, Array<Int>>):Bool;
  function is_tag(?tag:EitherType<Int, Array<Int>>):Bool;
  function is_tax(taxonmoy:EitherType<String, Array<String>> = '', term:EitherType<String, Array<String>> = ''):Bool;
  function is_date():Bool;
  function is_day():Bool;
  function is_feed(feeds:EitherType<String, Array<String>> = ''):Bool;
  function is_comment_feed():Bool;
  function is_front_page():Bool;
  function is_home():Bool;
  function is_month():Bool;
  function is_page(?page:EitherType<Int, Array<Int>>):Bool;
  function is_paged():Bool;
  function is_preview():Bool;
  function is_robots():Bool;
  function is_search():Bool;
  function is_single(?post:Int):Bool;
  function is_singular(postTypes:EitherType<String, Array<String>> = ''):Bool;
  function is_time():Bool;
  function is_trackback():Bool;
  function is_year():Bool;
  function is_404():Bool;
  function is_embed():Bool;
  function is_main_query():Bool;
  function have_posts():Bool;
  function in_the_loop():Bool;
  function rewind_posts():Void;
  function the_post():Void;
  function have_comments():Bool;
  function the_comment():Void;
  function setup_postdata(post:EitherType<Post, Int>):Bool;
  function wp_old_slug_redirect():Void;
}
