package wp;

import wp.api.ThemeApi;
import haxe.extern.EitherType;

@:native('WP_Theme')
@:arrayAccess
extern class ThemeObject {
  
  public var update:Bool;
  
  public function new(themeDir:String, themeRoot:String, ?_child:WpError):Void;
  public function __toString():String;
  public function errors():EitherType<WpError, Bool>;
  public function exists():Bool;
  public function parent():EitherType<Theme, Bool>;
  @:native('cache_delete') public function cacheDelete():Void;
  public function get(header:String):EitherType<String, Bool>;
  public function display(header:String, markup:Bool = true, translate:Bool = true):EitherType<String, Bool>;
  @:native('get_stylesheet') public function getStylesheet():String;
  @:native('get_template') public function getTemplate():String;
  @:native('get_stylesheet_directory') public function getStylesheetDirectory():String;
  @:native('get_template_directory') public function getTemplateDirectory():String;
  @:native('get_stylesheet_directory_uri') public function getStylesheetDirectoryUri():String;
  @:native('get_template_directory_uri') public function getTemplateDirectoryUri():String;
  @:native('get_theme_root') public function getThemeRoot():String;
  @:native('get_theme_root_uri') public function getThemeRootUri():String;
  @:native('get_screenshot') public function getScreenshot(uri:String = 'uri'):EitherType<String, Bool>;
  // etc

}

@:forward
abstract Theme(ThemeObject) to ThemeObject from ThemeObject {
  
  public static inline final init = new Action('init');
  public static inline final setup = new Action('after_setup_theme');
  public static inline final enqueueAssets = new Action('wp_enqueue_scripts');

  public static inline function get(?stylesheet:String, ?themeRoot:String):Theme {
    return ThemeApi.wpGetTheme(stylesheet, themeRoot);
  }

  public function new(themeDir:String, themeRoot:String) {
    this = new ThemeObject(themeDir, themeRoot);
  }

}
