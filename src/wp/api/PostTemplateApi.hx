package wp.api;

import haxe.extern.EitherType;
import wp.util.Assoc;

// For: wp-includes/post-template.php
extern class PostTemplateApi implements Api {
  function the_id():Int;
  function get_the_id():Int;
  function the_title(before:String = '', after:String = '');
  function the_title_attribute(args:Assoc<{
    ?before:String,
    ?after:String,
    ?echo:Bool,
    ?post:wp.Post
  }>):String;
  function get_the_title(post:PostOrId = 0):String;
  function the_guid(post:PostOrId = 0);
  function get_the_guid(post:PostOrId = 0);
  function the_content(?moreLinkText:String, stripTeaser:Bool = false):String;
  function get_the_content(?moreLinkText:String, stripTeaser:Bool = false):String;
  function the_excerpt():String;
  function get_the_excerpt(?post:PostOrId):String;
  function has_excerpt(post:PostOrId = 0):Bool;
  function post_class(?classNames:Array<String>, ?post:PostOrId):String;
  function get_post_class(?classNames:Array<String>, ?post:PostOrId):String;
  function body_class(?classNames:Array<String>):String;
  function get_body_class(?classNames:Array<String>):String;
  function post_password_required(?post:PostOrId):Bool;

  // todo: more
  // starting at wp_link_pages
}