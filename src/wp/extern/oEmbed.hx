package wp.extern;

@:native("WP_oEmbed")
extern class oEmbed {
  /**
    
     A list of oEmbed providers.
    
     @since 2.9.0
     @var array
    
  **/
  @:native("providers") public var providers:php.NativeStructArray<Dynamic>;
  /**
    
     A list of an early oEmbed providers.
    
     @since 4.0.0
     @var array
    
  **/
  @:native("early_providers") public static var earlyProviders:php.NativeStructArray<Dynamic>;
  /**
    
     Constructor.
    
     @since 2.9.0
    
  **/
  public function new():Void;
  /**
    
     Exposes private/protected methods for backward compatibility.
    
     @since 4.0.0
    
     @param string   $name      Method to call.
     @param array    $arguments Arguments to pass when calling.
     @return mixed|bool Return value of the callback, false otherwise.
    
  **/
  @:native("__call") public function __call(name:String, arguments:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Dynamic, Bool>;
  /**
    
     Takes a URL and returns the corresponding oEmbed provider's URL, if there is one.
    
     @since 4.0.0
    
     @see WP_oEmbed::discover()
    
     @param string        $url  The URL to the content.
     @param string|array  $args Optional provider arguments.
     @return false|string False on failure, otherwise the oEmbed provider URL.
    
  **/
  @:native("get_provider") public function getProvider(url:String, args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):haxe.extern.EitherType<Bool, String>;
  /**
    
     Adds an oEmbed provider.
    
     The provider is added just-in-time when wp_oembed_add_provider() is called before
     the {@see 'plugins_loaded'} hook.
    
     The just-in-time addition is for the benefit of the {@see 'oembed_providers'} filter.
    
     @since 4.0.0
    
     @see wp_oembed_add_provider()
    
     @param string $format   Format of URL that this provider can handle. You can use
                             asterisks as wildcards.
     @param string $provider The URL to the oEmbed provider..
     @param bool   $regex    Optional. Whether the $format parameter is in a regex format.
                             Default false.
    
  **/
  @:native("_add_provider_early") public static function _addProviderEarly(format:String, provider:String, regex:Bool = false):Void;
  /**
    
     Removes an oEmbed provider.
    
     The provider is removed just-in-time when wp_oembed_remove_provider() is called before
     the {@see 'plugins_loaded'} hook.
    
     The just-in-time removal is for the benefit of the {@see 'oembed_providers'} filter.
    
     @since 4.0.0
    
     @see wp_oembed_remove_provider()
    
     @param string $format The format of URL that this provider can handle. You can use
                           asterisks as wildcards.
    
  **/
  @:native("_remove_provider_early") public static function _removeProviderEarly(format:String):Void;
  /**
    
     Takes a URL and attempts to return the oEmbed data.
    
     @see WP_oEmbed::fetch()
    
     @since 4.8.0
    
     @param string       $url  The URL to the content that should be attempted to be embedded.
     @param array|string $args Optional. Arguments, usually passed from a shortcode. Default empty.
     @return false|object False on failure, otherwise the result in the form of an object.
    
  **/
  @:native("get_data") public function getData(url:String, args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = ''):haxe.extern.EitherType<Bool, Dynamic>;
  /**
    
     The do-it-all function that takes a URL and attempts to return the HTML.
    
     @see WP_oEmbed::fetch()
     @see WP_oEmbed::data2html()
    
     @since 2.9.0
    
     @param string       $url  The URL to the content that should be attempted to be embedded.
     @param array|string $args Optional. Arguments, usually passed from a shortcode. Default empty.
     @return false|string False on failure, otherwise the UNSANITIZED (and potentially unsafe) HTML that should be used to embed.
    
  **/
  @:native("get_html") public function getHtml(url:String, args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = ''):haxe.extern.EitherType<Bool, String>;
  /**
    
     Attempts to discover link tags at the given URL for an oEmbed provider.
    
     @since 2.9.0
    
     @param string $url The URL that should be inspected for discovery `<link>` tags.
     @return false|string False on failure, otherwise the oEmbed provider URL.
    
  **/
  @:native("discover") public function discover(url:String):haxe.extern.EitherType<Bool, String>;
  /**
    
     Connects to a oEmbed provider and returns the result.
    
     @since 2.9.0
    
     @param string       $provider The URL to the oEmbed provider.
     @param string       $url      The URL to the content that is desired to be embedded.
     @param array|string $args     Optional. Arguments, usually passed from a shortcode. Default empty.
     @return false|object False on failure, otherwise the result in the form of an object.
    
  **/
  @:native("fetch") public function fetch(provider:String, url:String, args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String> = ''):haxe.extern.EitherType<Bool, Dynamic>;
  /**
    
     Converts a data object from WP_oEmbed::fetch() and returns the HTML.
    
     @since 2.9.0
    
     @param object $data A data object result from an oEmbed provider.
     @param string $url The URL to the content that is desired to be embedded.
     @return false|string False on error, otherwise the HTML needed to embed.
    
  **/
  @:native("data2html") public function data2html(data:Dynamic, url:String):haxe.extern.EitherType<Bool, String>;
  /**
    
     Strips any new lines from the HTML.
    
     @since 2.9.0 as strip_scribd_newlines()
     @since 3.0.0
    
     @param string $html Existing HTML.
     @param object $data Data object from WP_oEmbed::data2html()
     @param string $url The original URL passed to oEmbed.
     @return string Possibly modified $html
    
  **/
  @:native("_strip_newlines") public function _stripNewlines(html:String, data:Dynamic, url:String):String;
}
