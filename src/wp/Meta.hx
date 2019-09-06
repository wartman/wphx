package wp;

import wp.api.MetaApi;

typedef MetaObject = {
  kind:MetaKind,
  key:String,
  objectId:Int,
  value:Dynamic,
  unique:Bool
};

@:forward
abstract Meta(MetaObject) from MetaObject to MetaObject {

  public static inline function add(meta:Meta) {
    MetaApi.addMetadata(meta.kind, meta.objectId, meta.key, meta.value, meta.unique);
  }

  public static function get(kind:MetaKind, objectId:Int, key:String):Meta {
    var value = MetaApi.getMetadata(kind, objectId, key, true);
    return new Meta(kind, key, objectId, value, false);
  }

  public static function find(kind:MetaKind, objectId:Int, key:String):Array<Meta> {
    var values:Array<Dynamic> = MetaApi.getMetadata(kind, objectId, key, false);
    return values.map(value -> new Meta(kind, key, objectId, value, false));
  }

  public function new(kind:MetaKind, key:String, objectId:Int, value:String, unique:Bool) {
    this = {
      kind: kind,
      key: key,
      objectId: objectId,
      value: value,
      unique: unique
    };
  }

  public function insert()
    return MetaApi.addMetadata(this.kind, this.objectId, this.key, this.value, this.unique);

  public function update()
    return MetaApi.updateMetadata(this.kind, this.objectId, this.key, this.value);

  public function remove()
    return MetaApi.deleteMetadata(this.kind, this.objectId, this.key, this.value);

  public function exists()
    return MetaApi.metadataExists(this.kind, this.objectId, this.key);

}
