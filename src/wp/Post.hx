package wp;

import php.NativeStructArray;
import wp.api.PostApi;

using tink.CoreApi;
using wp.util.Util;

@:native('WP_Post')
extern class PostObject {

  @:native('get_instance') public static function getInstance(id:Int):Post;

  @:native('ID') public var id:Int;
  @:native('post_author') public var author:String;
  @:native('post_name') public var name:String;
  @:native('post_type') public var type:String;
  @:native('post_title') public var title:String;
  @:native('post_date') public var date:String;
  @:native('post_date_gmt') public var dateGmt:String;
  @:native('post_content') public var content:String;
  @:native('post_excerpt') public var excerpt:String;
  @:native('post_status') public var status:String;
  @:native('comment_status') public var commentStatus:String;
  @:native('ping_status') public var pingStatus:String;
  @:native('post_password') public var password:String;
  @:native('post_parent') public var parent:Int;
  @:native('post_modified') public var modified:String;
  @:native('post_modified_gmt') public var modifiedGmt:String;
  @:native('comment_count') public var commentCount:String; // Numeric string
  @:native('menu_order') public var menuOrder:String;

  public function new(post:Dynamic);

  public function filter(filter:String):Dynamic;

  @:native('to_array') public function toArray():php.NativeArray;

}

@:forward
abstract Post(PostObject) from PostObject to PostObject {

  public function new(?post:Dynamic) {
    if (post == null) {
      post = {};
    }
    this = new PostObject(post);
  }

  @:to public inline function toNativeArray():php.NativeArray
    return this.toArray();

  public static function get(id:Int):Outcome<Post, WpError> {
    var post = PostApi.getPost(id);
    return post == null ? Failure(new WpError(404, 'No post found for ${id}')) : Success(post);
  }

  // todo: make an extern for query args
  public static inline function find(args:NativeStructArray<Dynamic>) 
    return PostApi.getPosts(args);

  public static function add(args) {
    var id = PostApi.wpInsertPost(args);
    return Post.get(id);
  }

  public inline function insert()
    return PostApi.wpInsertPost(this).toOutcome();

  public inline function update()
    return PostApi.wpUpdatePost(this).toOutcome();

  public inline function remove(forceDelete:Bool = false)
    return PostApi.wpDeletePost(this.id, forceDelete);

  public inline function trash()
    return PostApi.wpTrashPost(this.id);

  public inline function untrash()
    return PostApi.wpUntrashPost(this.id);

  public function exists()
    return this.id != null && PostApi.getPost(this.id) != null;

  public inline function isPublished()
    return this.status == 'published';

  public inline function markPublished() {
    PostApi.wpPublishPost(this);
    return this;
  }

  public inline function getMeta(key:String, ?single:Bool = true)
    return PostApi.getPostMeta(this.id, key, single).toOutcome();

  public inline function addMeta(key:String, value:Dynamic, ?unique:Bool = false)
    return PostApi.addPostMeta(this.id, key, value, unique);

  // public var meta(get, never):Meta;
  // public function get_meta()
  //   return new Meta('post', this.id);

  public var postType(get, never):PostType; 
  public inline function get_postType():PostType
    return PostApi.getPostTypeObject(this.type);

  // todo: add attachments

}
