package wp.api;

import php.NativeStructArray;
import php.NativeAssocArray;
import php.NativeArray;
import haxe.extern.EitherType;

typedef MetaDescriptor = {
  ?type:String,
  ?object_subtype:String,
  ?description:String,
  ?single:Bool,
  ?sanitize_callback:Dynamic,
  ?auth_callback:Dynamic,
  ?show_in_rest:Bool
};

enum abstract MetaKind(String) from String to String {
  var MUser = 'user';
  var MPost = 'post';
  var MComment = 'comment';
  var MTaxonomy = 'taxonomy';
}

// For: wp_includes/meta.php
extern class MetaApi implements Api {
  function add_metadata(metaKind:MetaKind, objectId:Int, metaKey:String, metaValue:Dynamic, unique:Bool = false):EitherType<Int, Bool>;
  function update_metadata(metaKind:MetaKind, objectId:Int, metaKey:String, metaValue:Dynamic, prevValue:Dynamic = ''):EitherType<Int, Bool>;
  function delete_metadata(metaKind:MetaKind, objectId:Int, metaKey:String, metaValue:Dynamic = '', deleteAll:Bool = false):Bool;
  function get_metadata(metaKind:MetaKind, objectId:Int, metaKey:String = '', single:Bool = false):Dynamic;
  function metadata_exists(metaKind:MetaKind, objectId:Int, metaKey:String):Bool;
  function get_metadata_by_mid(metaKind:MetaKind, metaId:Int):EitherType<{
    
    // If user:
    ?umeta_id:Int,
    ?user_id:Int,

    // If post:
    ?meta_id:Int,
    ?post_id:Int,
    
    meta_key:String,
    meta_value:String

  }, Bool>;
  function update_metadata_by_mid(metaKind:MetaKind, metaId:Int, metaValue:Dynamic, metaKey:EitherType<String, Bool> = false):Bool;
  function delete_metadata_by_mid(metaKind:MetaKind, metaId:Int):Bool;
  function update_metadata_cache(metaKind:MetaKind, objectIds:EitherType<Int, NativeArray>):EitherType<NativeArray, Bool>;
  // Needs a Wp_Metadata_Lazyloader extern:
  // function wp_metadata_lazyloader():MetadataLazyloader;
  function get_meta_sql(metaQuery:String, type:String, primaryTable:String, primaryIdColumn:String, context:Dynamic = null):NativeAssocArray<Dynamic>;
  function is_protected_meta(metaKey:String, ?metaKind:MetaKind):Bool;
  function sanitize_meta(metaKey:String, metaValue:Dynamic, objectType:String, objectSubtype:String):Dynamic;
  function register_meta(objectType:String, metaKey:String, args:NativeStructArray<MetaDescriptor>):Bool;
  function registered_meta_key_exists(objectType:String, metaKey:String, objectSubtype:String = ''):Bool;
  function unregister_meta_key(objectType:String, metaKey:String, objectSubtype:String):Bool;
  function get_registered_meta_keys(objectType:String, objectSubtype:String = ''):NativeArray;
  function get_registered_metadata(objectType:String, objectId:Int, metaKey:String = ''):EitherType<NativeArray, Dynamic>;
  function get_object_subtype(objectType:String, objectId:Int):String;
}
