package wp;

#if php
  import wp.api.PostApi;
#end

class PostTools {

  public static inline function getMeta<T>(post:Post, ?key:String):Array<T> {
    return PostApi.getPostMeta(post.id, key, false);
  }

  public static inline function addMeta(post:Post, key:String, value:Dynamic, unique:Bool = false) {
    return PostApi.addPostMeta(post.id, key, value, unique);
  }

  public static inline function updateMeta(post:Post, key:String, value:Dynamic, ?prevValue:Dynamic) {
    return PostApi.updatePostMeta(post.id, key, value, prevValue);
  }

  public static inline function getPostType(post:Post):PostTypeDescription {
    return PostApi.getPostTypeObject(post.type);
  }

}
