package wp;

import wp.extern.MetaApi;

enum abstract MetaKind(String) from String to String {
  var MUser = 'user';
  var MPost = 'post';
  var MComment = 'comment';
  var MTaxonomy = 'taxonomy';
}

typedef MetaObject<T> = {
  kind:MetaKind,
  key:String,
  objectId:Int,
  value:T,
  unique:Bool
};

@:forward
abstract Meta<T>(MetaObject<T>) from MetaObject<T> to MetaObject<T> {

  public static inline function add<T>(meta:Meta<T>) {
    MetaApi.addMetadata(meta.kind, meta.objectId, meta.key, meta.value, meta.unique);
  }

  public static function get<T>(kind:MetaKind, objectId:Int, key:String):Meta<T> {
    var value = MetaApi.getMetadata(kind, objectId, key, true);
    return new Meta(kind, key, objectId, value, false);
  }

  public static function find<T>(kind:MetaKind, objectId:Int, key:String):Array<Meta<T>> {
    var values:Array<Dynamic> = MetaApi.getMetadata(kind, objectId, key, false);
    return values.map(value -> new Meta(kind, key, objectId, value, false));
  }

  public function new(kind:MetaKind, key:String, objectId:Int, value:T, unique:Bool) {
    this = {
      kind: kind,
      key: key,
      objectId: objectId,
      value: value,
      unique: unique
    };
  }

  public inline function insert()
    return MetaApi.addMetadata(this.kind, this.objectId, this.key, this.value, this.unique);

  public inline function update()
    return MetaApi.updateMetadata(this.kind, this.objectId, this.key, this.value);

  public inline function remove()
    return MetaApi.deleteMetadata(this.kind, this.objectId, this.key, this.value);

  public inline function exists()
    return MetaApi.metadataExists(this.kind, this.objectId, this.key);

}
