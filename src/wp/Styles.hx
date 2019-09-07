package wp;

import haxe.extern.EitherType;
import php.NativeArray;

@:native('Wp_Styles')
extern class Styles extends Dependencies {
  @:native('base_url') public var baseUrl:String;
  @:native('content_url') public var contentUrl:String;
  @:native('default_version') public var defaultVersion:String;
  @:native('text_direction') public var textDirection:String;
  public var concat:String;
  @:native('concat_version') public var concatVersion:String;
  @:native('do_concat') public var doConcat:Bool;
  @:native('print_html') public var printHtml:String;
  @:native('print_code') public var printCode:String;
  @:native('default_dirs') public var defaultDirs:NativeArray;
  public function new():Void;
  @:native('do_item') public function doItem(handle:String):Bool;
  @:native('add_inline_style') public function addInlilneStyle(handle:String, code:String):Bool;
  @:native('print_inline_style') public function printInlineStyle(handle:String, echo:Bool = true):EitherType<String, Bool>;
  @:native('all_deps') public function allDeps(handles:Dynamic, recursion:Bool, group:EitherType<Int, Bool>):Bool;
  @:native('in_default_dir') public function inDefaultDir(src:String):Bool;
  @:native('do_footer_items') public function doFooterItems():NativeArray;
  public function reset():Void;
}