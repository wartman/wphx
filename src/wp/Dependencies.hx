package wp;

import haxe.extern.EitherType;
import php.NativeArray;

@:native('WP_Dependencies')
extern class Dependencies {
  public var registered:NativeArray;
  public var queue:NativeArray;
  @:native('to_do') public var toDo:NativeArray;
  public var done:NativeArray;
  public var args:NativeArray;
  public var groups:NativeArray;
  public var group:Int;
  @:native('do_items') public function doItems(handles:Dynamic = false, group:Dynamic = false):NativeArray;
  @:native('do_item') public function doItem(handle:String):Bool;
  @:native('all_deps') public function allDeps(handles:Dynamic, recursion:Bool, group:EitherType<Int, Bool>):Bool;
  public function add(handle:String, src:EitherType<String, Bool>, ?deps:NativeArray, ?ver:EitherType<String, Bool>, ?args:Dynamic):Bool;
  @:native('add_data') public function addData(handle:String, key:String, value:Dynamic):Bool;
  @:native('get_data') public function getData(handle:String, key:String):Dynamic;
  public function remove(handles:Dynamic):Void;
  public function enqueue(handles:Dynamic):Void;
  public function dequeue(handles:Dynamic):Void;
  @:native('recurse_deps') public function recurseDeps(handle:NativeArray, handle:String):Bool;
  public function query(handle:String, list:String = 'registered'):EitherType<Bool, Dependency>;
  @:native('set_group') public function setGroup(handle:String, recursion:Bool, group:Dynamic):Bool;
}