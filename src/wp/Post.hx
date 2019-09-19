package wp;

import php.*;
import haxe.extern.EitherType;
import wp.extern.*;
import wp.extern.Post as WpPost;
import wp.util.PossibleError;

using php.Lib;
using wp.util.OutcomeTools;

@:forward
abstract Post(WpPost) to WpPost from WpPost {
  
  public function new(?post:Dynamic) {
    if (post == null) {
      post = {};
    }
    this = new WpPost(post);
  }

  public var permalink(get, never):String;
  inline function get_permalink() 
    return LinkTemplateApi.getPermalink(this);

  @:to public inline function toNativeArray():php.NativeArray {
    return this.toArray();
  }

  public static function get(id:Int):PossibleError<Post> {
    var post:WpPost = PostApi.getPost(id);
    if (post == null) {
      return new Error(404, 'No post found for the id ${id}');
    }
    return post;
  }

  public static inline function all():Array<Post> {
    return PostApi.getPosts({}).toHaxeArray().map(p -> (p:Post));
  }

  // todo: make an extern for query args
  public static inline function find(args:NativeStructArray<Dynamic>):Array<Post> {
    return PostApi.getPosts(args).toHaxeArray().map(p -> (p:Post));
  }

  public static inline function add(args):Post {
    var id = PostApi.wpInsertPost(args);
    return Post.get(id).sure();
  }

  public inline function getFilteredContent():String {
    return PluginApi.applyFilters('the_content', 
      PluginApi.applyFilters('get_the_content', this.content)
    );
  }

  public inline function insert():PossibleError<Int> {
    return PostApi.wpInsertPost(this);
  }

  public inline function update():PossibleError<Int> {
    return PostApi.wpUpdatePost(this);
  }

  public inline function remove(forceDelete:Bool = false):PossibleError<Post> {
    return generateErrorIfNotFound(PostApi.wpDeletePost(this.id, forceDelete));
  }

  public inline function trash():PossibleError<Post>
    return generateErrorIfNotFound(PostApi.wpTrashPost(this.id));

  public inline function untrash():PossibleError<Post>
    return generateErrorIfNotFound(PostApi.wpUntrashPost(this.id));

  public function exists():Bool
    return this.id != null && PostApi.getPost(this.id) != null;

  public inline function isPublished():Bool
    return this.status == 'published';

  public inline function markPublished() {
    PostApi.wpPublishPost(this);
    return this;
  }

  public inline function getComments(args:Dynamic):Array<Comment> {
    Reflect.setField(args, 'post_id', this.id);
    return [ for (c in (CommentApi.getComments(cast args.associativeArrayOfObject()):NativeArray)) c ];
  }

  public inline function getApprovedComments():Array<Comment> {
    return [ for (c in (CommentApi.getApprovedComments(this.id):NativeArray)) c ];
  }

  public inline function getMeta<T>(key:String):Meta<T> {
    return Meta.get(MPost, this.id, key);
  }

  public inline function findMeta<T>(key:String):Array<Meta<T>> {
    return Meta.find(MPost, this.id, key);
  }

  public function addMeta<T>(key:String, value:T, ?unique:Bool = false):Bool {
    var meta = new Meta(MPost, key, this.id, value, unique);
    if (meta.exists()) {
      return meta.update();
    }
    return meta.insert();
  }

  public inline function getPostType():PostType {
    return PostApi.getPostTypeObject(this.type);
  }

  public function getTerms(taxonomy:String, args:NativeStructArray<Dynamic>):PossibleError<Array<Term>> {
    var terms = PostApi.wpGetPostTerms(this.id, taxonomy, args);
    if (Std.is(terms, Error)) {
      var t:Error = terms;
      return t;
    }
    var t:php.NativeArray = terms;
    return t.toHaxeArray().map(t -> (t:Term));
  }

  // todo: add attachments

  function generateErrorIfNotFound(post:EitherType<Post, Bool>):PossibleError<Post> {
    if (Std.is(post, WpPost)) {
      var p:Post = post;
      return p;
    }
    return new Error(404, 'Post could not be found');
  }

}
