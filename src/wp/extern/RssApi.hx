package wp.extern;

extern class RssApi implements wp.util.ApiFunctions {
  /**
    
     PHP4 constructor.
    
  **/
  public function MagpieRSS(source:Dynamic):Void;
  /**
    
     Build Magpie object based on RSS from URL.
    
     @since 1.5.0
     @package External
     @subpackage MagpieRSS
    
     @param string $url URL to retrieve feed
     @return bool|MagpieRSS false on failure or MagpieRSS object on success.
    
  **/
  public function fetch_rss (url:String):haxe.extern.EitherType<Bool, MagpieRSS>;
  /**
    
     Retrieve URL headers and content using WP HTTP Request API.
    
     @since 1.5.0
     @package External
     @subpackage MagpieRSS
    
     @param string $url URL to retrieve
     @param array $headers Optional. Headers to send to the URL.
     @return Snoopy style response
    
  **/
  public function _fetch_remote_file(url:String, headers:php.NativeStructArray<Dynamic> = ""):Snoopy;
  /**
    
     Retrieve
    
     @since 1.5.0
     @package External
     @subpackage MagpieRSS
    
     @param array $resp
     @return MagpieRSS|bool
    
  **/
  public function _response_to_rss (resp:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<MagpieRSS, Bool>;
  /**
    
     Set up constants with default values, unless user overrides.
    
     @since 1.5.0
     @package External
     @subpackage MagpieRSS
    
  **/
  public function init ():Void;
  /**
    
     PHP4 constructor.
    
  **/
  public function RSSCache(base:Dynamic = '', age:Dynamic = ''):Void;
  /**
    
     Display all RSS items in a HTML ordered list.
    
     @since 1.5.0
     @package External
     @subpackage MagpieRSS
    
     @param string $url URL of feed to display. Will not auto sense feed URL.
     @param int $num_items Optional. Number of items to display, default is all.
    
  **/
  public function wp_rss(url:String, num_items:Int = ):Void;
  /**
    
     Display RSS items in HTML list items.
    
     You have to specify which HTML list you want, either ordered or unordered
     before using the function. You also have to specify how many items you wish
     to display. You can't display all of them like you can with wp_rss()
     function.
    
     @since 1.5.0
     @package External
     @subpackage MagpieRSS
    
     @param string $url URL of feed to display. Will not auto sense feed URL.
     @param int $num_items Optional. Number of items to display, default is all.
     @return bool False on failure.
    
  **/
  public function get_rss (url:String, num_items:Int = 5):Bool;
}
