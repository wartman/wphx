package wp;

import haxe.extern.EitherType;
import php.NativeArray;

@:native('WP_Scripts')
extern class Scripts extends Dependencies {
  @:native('base_url') public var baseUrl:String;
  @:native('content_url') public var contentUrl:String;
  @:native('default_version') public var defaultVersion:String;
  @:native('in_footer') public var inFooter:NativeArray;
  public var concat:String;
  @:native('concat_version') public var concatVersion:String;
  @:native('do_concat') public var doConcat:Bool;
  @:native('print_html') public var printHtml:String;
  @:native('print_code') public var printCode:String;
  @:native('default_dirs') public var defaultDirs:NativeArray;
  public function new():Void;
  public function init():Void;
  @:native('print_scripts') public function printScripts(?handles:Dynamic, ?group:Int):NativeArray;
  @:native('print_scripts_l10n') public function printScriptsL10n(handle:String, echo:Bool = true):EitherType<Bool, String>;
  @:native('print_extra_script') public function printExtraScript(handle:String, echo:Bool = true):EitherType<Bool, String>;
  @:native('do_item') public function doItem(handle:String, group:EitherType<Int, Bool> = false):Bool;
  @:native('add_inline_script') public function addInlineScript(handle:String, data:String, ?position:String):Bool;
  @:native('print_inline_script') public function printInlineScript(handle:String, position:String = 'after', echo:Bool = true):EitherType<String, Bool>;
	public function localize(handle:String, objectName:String, l10n:NativeArray):Bool;
  @:native('set_group') public function setGroup(handle:String, recursion:Bool, group:Bool = false):Bool;
  @:native('set_translations') public function setTranslations(handle:String, domain:String = 'default', ?path:String):Bool;
  @:native('print_translations') public function printTranslations(handle:String, echo:Bool = true):EitherType<String, Bool>;
  @:native('all_deps') public function allDeps(handles:Dynamic, recursion:Bool = false, group:EitherType<Int, Bool> = false):Bool;
  @:native('do_head_items') public function doHeadItems():NativeArray;
  @:native('do_footer_items') public function doFooterItems():NativeArray;
  @:native('in_default_dir') public function inDefaultDir(src:String):Bool;
  public function reset():Void;
}