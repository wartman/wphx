package wp.api;

import php.NativeStructArray;
import haxe.extern.EitherType;
import php.NativeArray;
import wp.*;

// for wp-includes\theme.php
extern class ThemeApi implements Api {
  public function wp_get_themes(?args:Dynamic):NativeArray;
  // public function wp_get_theme(?stylesheet:String, ?themeRoot:String):Theme;
  function wp_clean_themes_cache(clear_update_cache:Bool = true):Void;
  function is_child_theme():Bool;
  function get_stylesheet():String;
  function get_stylesheet_directory():String;
  function get_stylesheet_directory_uri():String;
  function get_stylesheet_uri():String;
  // function get_locale_stylesheet_uri():Locale;
  function get_template():String;
  function get_template_directory():String;
  function get_template_directory_uri():String;
  function get_theme_roots():EitherType<String, NativeArray>;
  function register_theme_directory(directory:String):Bool;
  function search_theme_directories(force:Bool = false):EitherType<NativeArray, Bool>;
  function get_theme_root(stylesheet_or_template:EitherType<String, Bool> = false):String;
  function get_theme_root_uri(stylesheet_or_template:EitherType<String, Bool> = false, theme_root:EitherType<String, Bool> = false):String;
  function get_raw_theme_root(stylesheet_or_template:EitherType<String, Bool> = false, skipCache:Bool = false):String;
  function locale_stylesheet():Void;
  function switch_theme(stylesheet:String):Void;
  function validate_current_theme():Bool;
  function get_theme_mods():NativeArray;
  function get_theme_mod(name:String, def:Dynamic = false):Dynamic;
  function set_theme_mod(name:String, value:Dynamic):Void;
  function remove_theme_mod(name:String):Void;
  function remove_theme_mods():Void;
  function get_header_textcolor():String;
  function header_textcolor():String;
  function display_header_text():Bool;
  function has_header_image():Bool;
  function get_header_image():String;
  function get_header_image_tag(attr:NativeStructArray<Dynamic>):String;
  function the_header_image_tag(attr:NativeStructArray<Dynamic>):Void;
  function get_random_header_image():String;
  function is_random_header_image(type:String = 'any'):Bool;
  function header_image():Void;
  function get_uploaded_header_images():NativeArray;
  function get_custom_header():Dynamic;
  function register_default_headers(headers:NativeStructArray<Dynamic>):Void;
  function unregister_default_headers(header:EitherType<String, NativeArray>):Bool;
  function has_header_video():Bool;
  function get_header_video_url():String;
  function the_header_video_url():Void;
  function get_header_video_settings():NativeArray;
  function has_custom_header():Bool;
  // ETC. 
}