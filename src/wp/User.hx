package wp;

import php.NativeArray;
import haxe.extern.EitherType;

@:native('Wp_User')
extern class User {
  public var data:Dynamic;
  @:native('ID') public var id:Int;
  public var caps:NativeArray;
  @:native('cap_key') public var capKey:String;
  public var roles:NativeArray;
  public var allcaps:NativeArray;
  public var filter:String;
  public function new(id:Int = 0, name:String = '', siteId:EitherType<Int, String> = ''):Void;
  public function init(data:Dynamic, _site_id:EitherType<Int, String> = ''):Void;
  public function exists():Bool;
  public function get(key:String):Dynamic;
  @:native('has_prop') public function hasProp(key:String):Bool;
  @:native('to_array') public function toArray():NativeArray;
  @:native('get_role_caps') public function getRoleCaps():NativeArray;
  @:native('add_role') public function addRole(role:String):Void;
  @:native('remove_role') public function removeRole(role:String):Void;
  @:native('set_role') public function setRole(role:String):Void;
  // @:native('level_reduction') public function levelReduction(max:Int, item:Dynamic):Void;
  @:native('update_user_level_from_caps') public function updateUserLevelFromCaps():Void;
  @:native('add_cap') public function addCap(cap:String, grant:Bool = true):Void;
  @:native('remove_cap') public function removeCap(cap:String):Void;
  @:native('remove_all_caps') public function removeAllCaps():Void;
  @:native('has_cap') public function hasCap(cap:String):Bool;
  @:native('translate_level_to_cap') public function translateLevelToCap(level:Int):String;
  @:native('for_blog') public function forBlog(blog_id:EitherType<Int, String> = ''):Void;
  @:native('for_site') public function forSite(site_id:EitherType<Int, String> = ''):Void;
  @:native('get_site_id') public function getSiteID():Int;
}
