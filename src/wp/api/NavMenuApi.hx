package wp.api;

import php.NativeStructArray;
import php.NativeArray;
import haxe.extern.EitherType;
import wp.Term;
import wp.WpError;

// for: wp-includes\nav-menu.php
class NavMenuApi implements Api {
  function wp_get_nav_menu_object(menu:EitherType<String, Int>):Term;
  function is_nav_menu(menu:EitherType<EitherType<String, Int>, Term>):Bool;
  function register_nav_menus(locations:NativeArray):Void;
  function unregister_nav_menu(locations:NativeArray):Void;
  function register_nav_menu(location:String, description:String):Void;
  function get_registered_nav_menus():NativeArray;
  function get_nav_menu_locations():NativeArray;
  function has_nav_menu(location:String):Bool;
  function wp_get_nav_menu_name(location:String):String;
  function is_nav_menu_item(menu_item_id:Int = 0):Bool;
  function wp_create_nav_menu(menu_name:String):EitherType<Int, WpError>;
  function wp_delete_nav_menu(menu:EitherType<EitherType<String, Int>, Term>):EitherType<Bool, WpError>;
  function wp_update_nav_menu_object(menu_id:Int = 0, menu_data:NativeStructArray<Dynamic>):EitherType<Int, WpError>;
  function wp_update_nav_menu_item(menu_id:Int = 0, menu_item_db_id:Int = 0, menu_item_data:NativeStructArray<Dynamic>):EitherType<Int, WpError>;
  function wp_get_nav_menus(args:NativeStructArray<Dynamic>):NativeArray;
  function wp_get_nav_menu_items(menu:EitherType<EitherType<String, Int>, Term>, args:NativeStructArray<Dynamic>):EitherType<Bool, NativeArray>;
  function wp_setup_nav_menu_item(menu_item:Dynamic):Dynamic;
  function wp_get_associated_nav_menu_items(object_id:Int = 0, object_type:String = 'post_type', taxonomy:String = ''):NativeArray;
  function wp_map_nav_menu_locations(new_nav_menu_locations:NativeArray, old_nav_menu_locations:NativeArray):NativeArray;
}