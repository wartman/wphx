package wp;

import php.SuperGlobal;
import php.NativeStructArray;
import haxe.extern.EitherType;

@:native('WP_Query')
extern class QueryObject {
  @:native('query') public var queryData:NativeStructArray<Dynamic>;
  @:native('query_vars') public var queryVars:NativeStructArray<Dynamic>;
  // @:native('tax_query') public var taxQuery:TaxQuery;
  // @:native('meta_query') public var metaQuery:MetaQuery;
  // @:native('date_query') public var dateQuery:DateQuery;
  @:native('queried_object') public var queriedObject:Dynamic;
  public var request:String;
  public var posts:Array<Post>;
  public var post:Post;
  @:native('post_count') public var postCount:Int;
  @:native('current_post') public var currentPost:Int;
  @:native('in_the_loop') public var inTheLoop:Bool;
  public var comments:Array<Dynamic>; // Array<Comment>?
  @:native('comment_count') public var commentCount:Int;
  @:native('current_comment') public var currentComment:Int;
  public var comment:Int;
  @:native('found_posts') public var foundPosts:Int;
  @:native('max_num_pages') public var maxNumPages:Int;
  @:native('max_num_comment_pages') public var maxNumCommentPages:Int;
  @:native('is_single') public var isSingle:Bool;
  @:native('is_preview') public var isPreview:Bool;
  @:native('is_page') public var isPage:Bool;
  @:native('is_archive') public var isArchive:Bool;
  @:native('is_date') public var isDate:Bool;
  @:native('is_month') public var isMonth:Bool;
  @:native('is_day') public var isDay:Bool;
  @:native('is_time') public var isTime:Bool;
  @:native('is_author') public var isAuthor:Bool;
  @:native('is_category') public var isCategory:Bool;
  @:native('is_tax') public var isTax:Bool;
  @:native('is_search') public var isSearch:Bool;
  @:native('is_feed') public var isFeed:Bool;
  @:native('is_comment_feed') public var isCommentFeed:Bool;
  @:native('is_trackback') public var isTrackback:Bool;
  @:native('is_home') public var isHome:Bool;
  @:native('is_404') public var is404:Bool;
  @:native('is_embed') public var isEmbed:Bool;
  @:native('is_paged') public var isPaged:Bool;
  @:native('is_admin') public var isAdmin:Bool;
  @:native('is_attachment') public var isAttachment:Bool;
  @:native('is_singular') public var isSingular:Bool;
  @:native('is_robots') public var isRobots:Bool;
  @:native('is_posts_page') public var isPostsPage:Bool;
  @:native('is_post_type_archive') public var isPostTypeArchive:Bool;
  @:native('query_vars_hash') public var queryVarsHash:EitherType<Bool, String>;
  public function new(query:EitherType<String, NativeStructArray<Dynamic>> = ''):Void;
  public function init():Void;
  @:native('parse_query_vars') public function parseQueryVars():Void;
  @:native('fill_query_vars') public function fillQueryVars(arr:Array<String>):php.NativeStructArray<Dynamic>;
  @:native('parse_query') public function parseQuery(query:EitherType<NativeStructArray<Dynamic>, String>):Void;
  @:native('parse_tax_query') public function parseTaxQuery(q:NativeStructArray<Dynamic>):Void;
  @:native('set_404') public function set_404():Void;
  public function get(queryVar:String, def:Dynamic = ''):Dynamic;
  public function set(queryVar:String, value:Dynamic):Void;
  @:native('get_posts') public function getPosts():EitherType<Array<Post>, Array<Int>>;
  @:native('next_post') public function nextPost():Post;
  @:native('the_post') public function thePost():Post;
  @:native('have_posts') public function havePosts():Bool;
  @:native('rewind_posts') public function rewindPosts():Void;
  @:native('next_comment') public function nextComment():Comment;
  @:native('the_comment') public function theComment():Comment;
  @:native('have_comments') public function haveComments():Bool;
  @:native('rewind_comments') public function rewindComments():Void;
  public function query(query:NativeStructArray<Dynamic>):Array<Post>;
  @:native('get_queried_object') public function getQueriedObject():Dynamic;
  @:native('get_queried_object_id') public function getQueriedObjectId():Int;
  @:native('is_archive') public function getIsArchive():Bool;
  @:native('is_post_type_archive') public function getIsPostTypeArchive(postTypes:Dynamic = ''):Bool;
  @:native('is_attachment') public function getIsAttachment(attachment:Dynamic = ''):Bool;
  @:native('is_author') public function getIsAuthor(author:Dynamic = ''):Bool;
  @:native('is_category') public function getIsCategory(category:Dynamic = ''):Bool;
  @:native('is_tag') public function getIsTag(tag:Dynamic = ''):Bool;
  @:native('is_tax') public function getIsTax(taxonomy:Dynamic = '', term:Dynamic = ''):Bool;
  @:native('is_comments_popup') public function getIsCommentsPopup():Bool;
  @:native('is_date') public function getIsDate():Bool;
  @:native('is_day') public function getIsDay():Bool;
  @:native('is_feed') public function getIsFeed(feeds:Dynamic = ''):Bool;
  @:native('is_comment_feed') public function getIsCommentFeed():Bool;
  @:native('is_front_page') public function getIsFrontPage():Bool;
  @:native('is_home') public function getIsHome():Bool;
  @:native('is_month') public function getIsMonth():Bool;
  @:native('is_page') public function getIsPage(page:Dynamic = ''):Bool;
  @:native('is_paged') public function getIsPaged():Bool;
  @:native('is_preview') public function getIsPreview():Bool;
  @:native('is_robots') public function getIsRobots():Bool;
  @:native('is_search') public function getIsSearch():Bool;
  @:native('is_single') public function getIsSingle(post:Dynamic = ''):Bool;
  @:native('is_singular') public function getIsSingular(post_types:Dynamic = ''):Bool;
  @:native('is_time') public function getIsTime():Bool;
  @:native('is_trackback') public function getIsTrackback():Bool;
  @:native('is_year') public function getIsYear():Bool;
  @:native('is_404') public function getIs404():Bool;
  @:native('is_embed') public function getIsEmbed():Bool;
  @:native('is_main_query') public function getIsMainQuery():Bool;
  @:native('setup_postdata') public function setupPostdata(post:EitherType<Post, Int>):Bool;
  @:native('reset_postdata') public function resetPostdata():Void;
}

@:forward
abstract Query(QueryObject) from QueryObject to QueryObject {
  
  public inline static function instance():Query {
    return (SuperGlobal.GLOBALS['wp_query']:QueryObject);
  }

  public inline function new(query) {
    this = new QueryObject(query);
  }

  public inline function iterator():Iterator<Post> {
    return new PostIterator(this);
  }

}
