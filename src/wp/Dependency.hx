package wp;

import haxe.extern.EitherType;
import php.NativeArray;

@:native('_WP_Dependency')
extern class Dependency {
  public var handle:String;
  public var src:String;
  public var deps:NativeArray;
  public var ver:EitherType<Bool, String>;
  public var args:Dynamic;
  public var extra:NativeArray;
  public var textdomain:String;
  @:native('translations_path') public var translationsPath:String;
  public function new():Void;
  @:native('add_data') public function addData(name:String, data:Dynamic):Bool;
  @:native('set_translations') public function setTranslations(domain:String, ?path:String):Bool;
}