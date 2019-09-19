package wp.extern;

@:native("SimplePie")
extern class SimplePie {
  /**
    
     @var array Raw data
     @access private
    
  **/
  @:native("data") public var data:php.NativeStructArray<Dynamic>;
  /**
    
     @var mixed Error string
     @access private
    
  **/
  @:native("error") public var error:Dynamic;
  /**
    
     @var object Instance of SimplePie_Sanitize (or other class)
     @see SimplePie::set_sanitize_class()
     @access private
    
  **/
  @:native("sanitize") public var sanitize:Dynamic;
  /**
    
     @var string SimplePie Useragent
     @see SimplePie::set_useragent()
     @access private
    
  **/
  @:native("useragent") public var useragent:String;
  /**
    
     @var string Feed URL
     @see SimplePie::set_feed_url()
     @access private
    
  **/
  @:native("feed_url") public var feedUrl:String;
  /**
    
     @var object Instance of SimplePieFile to use as a feed
     @see SimplePie::set_file()
     @access private
    
  **/
  @:native("file") public var file:Dynamic;
  /**
    
     @var string Raw feed data
     @see SimplePie::set_raw_data()
     @access private
    
  **/
  @:native("raw_data") public var rawData:String;
  /**
    
     @var int Timeout for fetching remote files
     @see SimplePie::set_timeout()
     @access private
    
  **/
  @:native("timeout") public var timeout:Int;
  /**
    
     @var bool Forces fsockopen() to be used for remote files instead
     of cURL, even if a new enough version is installed
     @see SimplePie::force_fsockopen()
     @access private
    
  **/
  @:native("force_fsockopen") public var forceFsockopen:Bool;
  /**
    
     @var bool Force the given data/URL to be treated as a feed no matter what
     it appears like
     @see SimplePie::force_feed()
     @access private
    
  **/
  @:native("force_feed") public var forceFeed:Bool;
  /**
    
     @var bool Enable/Disable Caching
     @see SimplePie::enable_cache()
     @access private
    
  **/
  @:native("cache") public var cache:Bool;
  /**
    
     @var int Cache duration (in seconds)
     @see SimplePie::set_cache_duration()
     @access private
    
  **/
  @:native("cache_duration") public var cacheDuration:Int;
  /**
    
     @var int Auto-discovery cache duration (in seconds)
     @see SimplePie::set_autodiscovery_cache_duration()
     @access private
    
  **/
  @:native("autodiscovery_cache_duration") public var autodiscoveryCacheDuration:Int;
  /**
    
     @var string Cache location (relative to executing script)
     @see SimplePie::set_cache_location()
     @access private
    
  **/
  @:native("cache_location") public var cacheLocation:String;
  /**
    
     @var string Function that creates the cache filename
     @see SimplePie::set_cache_name_function()
     @access private
    
  **/
  @:native("cache_name_function") public var cacheNameFunction:String;
  /**
    
     @var bool Reorder feed by date descending
     @see SimplePie::enable_order_by_date()
     @access private
    
  **/
  @:native("order_by_date") public var orderByDate:Bool;
  /**
    
     @var mixed Force input encoding to be set to the follow value
     (false, or anything type-cast to false, disables this feature)
     @see SimplePie::set_input_encoding()
     @access private
    
  **/
  @:native("input_encoding") public var inputEncoding:Dynamic;
  /**
    
     @var int Feed Autodiscovery Level
     @see SimplePie::set_autodiscovery_level()
     @access private
    
  **/
  @:native("autodiscovery") public var autodiscovery:Int;
  /**
    
     Class registry object
    
     @var SimplePie_Registry
    
  **/
  @:native("registry") public var registry:SimplePie_Registry;
  /**
    
     @var int Maximum number of feeds to check with autodiscovery
     @see SimplePie::set_max_checked_feeds()
     @access private
    
  **/
  @:native("max_checked_feeds") public var maxCheckedFeeds:Int;
  /**
    
     @var array All the feeds found during the autodiscovery process
     @see SimplePie::get_all_discovered_feeds()
     @access private
    
  **/
  @:native("all_discovered_feeds") public var allDiscoveredFeeds:php.NativeStructArray<Dynamic>;
  /**
    
     @var string Web-accessible path to the handler_image.php file.
     @see SimplePie::set_image_handler()
     @access private
    
  **/
  @:native("image_handler") public var imageHandler:String;
  /**
    
     @var array Stores the URLs when multiple feeds are being initialized.
     @see SimplePie::set_feed_url()
     @access private
    
  **/
  @:native("multifeed_url") public var multifeedUrl:php.NativeStructArray<Dynamic>;
  /**
    
     @var array Stores SimplePie objects when multiple feeds initialized.
     @access private
    
  **/
  @:native("multifeed_objects") public var multifeedObjects:php.NativeStructArray<Dynamic>;
  /**
    
     @var array Stores the get_object_vars() array for use with multifeeds.
     @see SimplePie::set_feed_url()
     @access private
    
  **/
  @:native("config_settings") public var configSettings:php.NativeStructArray<Dynamic>;
  /**
    
     @var integer Stores the number of items to return per-feed with multifeeds.
     @see SimplePie::set_item_limit()
     @access private
    
  **/
  @:native("item_limit") public var itemLimit:Int;
  /**
    
     @var array Stores the default attributes to be stripped by strip_attributes().
     @see SimplePie::strip_attributes()
     @access private
    
  **/
  @:native("strip_attributes") public var stripAttributes:php.NativeStructArray<Dynamic>;
  /**
    
     @var array Stores the default tags to be stripped by strip_htmltags().
     @see SimplePie::strip_htmltags()
     @access private
    
  **/
  @:native("strip_htmltags") public var stripHtmltags:php.NativeStructArray<Dynamic>;
  /**
    
     The SimplePie class contains feed level data and options
    
     To use SimplePie, create the SimplePie object with no parameters. You can
     then set configuration options using the provided methods. After setting
     them, you must initialise the feed using $feed->init(). At that point the
     object's methods and properties will be available to you.
    
     Previously, it was possible to pass in the feed URL along with cache
     options directly into the constructor. This has been removed as of 1.3 as
     it caused a lot of confusion.
    
     @since 1.0 Preview Release
    
  **/
  public function new():Void;
  /**
    
     Used for converting object to a string
    
  **/
  @:native("__toString") public function __toString():Void;
  /**
    
     Remove items that link back to this before destroying this object
    
  **/
  @:native("__destruct") public function __destruct():Void;
  /**
    
     Force the given data/URL to be treated as a feed
    
     This tells SimplePie to ignore the content-type provided by the server.
     Be careful when using this option, as it will also disable autodiscovery.
    
     @since 1.1
     @param bool $enable Force the given data/URL to be treated as a feed
    
  **/
  @:native("force_feed") public function forceFeed(enable:Bool = false):Void;
  /**
    
     Set the URL of the feed you want to parse
    
     This allows you to enter the URL of the feed you want to parse, or the
     website you want to try to use auto-discovery on. This takes priority
     over any set raw data.
    
     You can set multiple feeds to mash together by passing an array instead
     of a string for the $url. Remember that with each additional feed comes
     additional processing and resources.
    
     @since 1.0 Preview Release
     @see set_raw_data()
     @param string|array $url This is the URL (or array of URLs) that you want to parse.
    
  **/
  @:native("set_feed_url") public function setFeedUrl(url:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):Void;
  /**
    
     Set an instance of {@see SimplePieFile} to use as a feed
    
     @param SimplePieFile &$file
     @return bool True on success, false on failure
    
  **/
  @:native("set_file") public function setFile(file:SimplePieFile):Bool;
  /**
    
     Set the raw XML data to parse
    
     Allows you to use a string of RSS/Atom data instead of a remote feed.
    
     If you have a feed available as a string in PHP, you can tell SimplePie
     to parse that data string instead of a remote feed. Any set feed URL
     takes precedence.
    
     @since 1.0 Beta 3
     @param string $data RSS or Atom data as a string.
     @see set_feed_url()
    
  **/
  @:native("set_raw_data") public function setRawData(data:String):Void;
  /**
    
     Set the the default timeout for fetching remote feeds
    
     This allows you to change the maximum time the feed's server to respond
     and send the feed back.
    
     @since 1.0 Beta 3
     @param int $timeout The maximum number of seconds to spend waiting to retrieve a feed.
    
  **/
  @:native("set_timeout") public function setTimeout(timeout:Int = 10):Void;
  /**
    
     Force SimplePie to use fsockopen() instead of cURL
    
     @since 1.0 Beta 3
     @param bool $enable Force fsockopen() to be used
    
  **/
  @:native("force_fsockopen") public function forceFsockopen(enable:Bool = false):Void;
  /**
    
     Enable/disable caching in SimplePie.
    
     This option allows you to disable caching all-together in SimplePie.
     However, disabling the cache can lead to longer load times.
    
     @since 1.0 Preview Release
     @param bool $enable Enable caching
    
  **/
  @:native("enable_cache") public function enableCache(enable:Bool = true):Void;
  /**
    
     Set the length of time (in seconds) that the contents of a feed will be
     cached
    
     @param int $seconds The feed content cache duration
    
  **/
  @:native("set_cache_duration") public function setCacheDuration(seconds:Int = 3600):Void;
  /**
    
     Set the length of time (in seconds) that the autodiscovered feed URL will
     be cached
    
     @param int $seconds The autodiscovered feed URL cache duration.
    
  **/
  @:native("set_autodiscovery_cache_duration") public function setAutodiscoveryCacheDuration(seconds:Int = 604800):Void;
  /**
    
     Set the file system location where the cached files should be stored
    
     @param string $location The file system location.
    
  **/
  @:native("set_cache_location") public function setCacheLocation(location:String = './cache'):Void;
  /**
    
     Set whether feed items should be sorted into reverse chronological order
    
     @param bool $enable Sort as reverse chronological order.
    
  **/
  @:native("enable_order_by_date") public function enableOrderByDate(enable:Bool = true):Void;
  /**
    
     Set the character encoding used to parse the feed
    
     This overrides the encoding reported by the feed, however it will fall
     back to the normal encoding detection if the override fails
    
     @param string $encoding Character encoding
    
  **/
  @:native("set_input_encoding") public function setInputEncoding(encoding:String = cast false):Void;
  /**
    
     Set how much feed autodiscovery to do
    
     @see SIMPLEPIE_LOCATOR_NONE
     @see SIMPLEPIE_LOCATOR_AUTODISCOVERY
     @see SIMPLEPIE_LOCATOR_LOCAL_EXTENSION
     @see SIMPLEPIE_LOCATOR_LOCAL_BODY
     @see SIMPLEPIE_LOCATOR_REMOTE_EXTENSION
     @see SIMPLEPIE_LOCATOR_REMOTE_BODY
     @see SIMPLEPIE_LOCATOR_ALL
     @param int $level Feed Autodiscovery Level (level can be a combination of the above constants, see bitwise OR operator)
    
  **/
  @:native("set_autodiscovery_level") public function setAutodiscoveryLevel(?level:Int):Void;
  /**
    
     Get the class registry
    
     Use this to override SimplePie's default classes
     @see SimplePie_Registry
     @return SimplePie_Registry
    
  **/
  @:native("&get_registry") public function getRegistry():SimplePie_Registry;
  /**
    
     Set which class SimplePie uses for caching
    
  **/
  @:native("set_cache_class") public function setCacheClass(?class_:Dynamic):Void;
  /**
    
     Set which class SimplePie uses for auto-discovery
    
  **/
  @:native("set_locator_class") public function setLocatorClass(?class_:Dynamic):Void;
  /**
    
     Set which class SimplePie uses for XML parsing
    
  **/
  @:native("set_parser_class") public function setParserClass(?class_:Dynamic):Void;
  /**
    
     Set which class SimplePie uses for remote file fetching
    
  **/
  @:native("set_file_class") public function setFileClass(?class_:Dynamic):Void;
  /**
    
     Set which class SimplePie uses for data sanitization
    
  **/
  @:native("set_sanitize_class") public function setSanitizeClass(?class_:Dynamic):Void;
  /**
    
     Set which class SimplePie uses for handling feed items
    
  **/
  @:native("set_item_class") public function setItemClass(?class_:Dynamic):Void;
  /**
    
     Set which class SimplePie uses for handling author data
    
  **/
  @:native("set_author_class") public function setAuthorClass(?class_:Dynamic):Void;
  /**
    
     Set which class SimplePie uses for handling category data
    
  **/
  @:native("set_category_class") public function setCategoryClass(?class_:Dynamic):Void;
  /**
    
     Set which class SimplePie uses for feed enclosures
    
  **/
  @:native("set_enclosure_class") public function setEnclosureClass(?class_:Dynamic):Void;
  /**
    
     Set which class SimplePie uses for `<media:text>` captions
    
  **/
  @:native("set_caption_class") public function setCaptionClass(?class_:Dynamic):Void;
  /**
    
     Set which class SimplePie uses for `<media:copyright>`
    
  **/
  @:native("set_copyright_class") public function setCopyrightClass(?class_:Dynamic):Void;
  /**
    
     Set which class SimplePie uses for `<media:credit>`
    
  **/
  @:native("set_credit_class") public function setCreditClass(?class_:Dynamic):Void;
  /**
    
     Set which class SimplePie uses for `<media:rating>`
    
  **/
  @:native("set_rating_class") public function setRatingClass(?class_:Dynamic):Void;
  /**
    
     Set which class SimplePie uses for `<media:restriction>`
    
  **/
  @:native("set_restriction_class") public function setRestrictionClass(?class_:Dynamic):Void;
  /**
    
     Set which class SimplePie uses for content-type sniffing
    
  **/
  @:native("set_content_type_sniffer_class") public function setContentTypeSnifferClass(?class_:Dynamic):Void;
  /**
    
     Set which class SimplePie uses item sources
    
  **/
  @:native("set_source_class") public function setSourceClass(?class_:Dynamic):Void;
  /**
    
     Set the user agent string
    
     @param string $ua New user agent string.
    
  **/
  @:native("set_useragent") public function setUseragent(?ua:String):Void;
  /**
    
     Set callback function to create cache filename with
    
     @param mixed $function Callback function
    
  **/
  @:native("set_cache_name_function") public function setCacheNameFunction(function_:Dynamic = 'md5'):Void;
  /**
    
     Set options to make SP as fast as possible
    
     Forgoes a substantial amount of data sanitization in favor of speed. This
     turns SimplePie into a dumb parser of feeds.
    
     @param bool $set Whether to set them or not
    
  **/
  @:native("set_stupidly_fast") public function setStupidlyFast(set:Bool = false):Void;
  /**
    
     Set maximum number of feeds to check with autodiscovery
    
     @param int $max Maximum number of feeds to check
    
  **/
  @:native("set_max_checked_feeds") public function setMaxCheckedFeeds(max:Int = 10):Void;
  /**
    
     Set the output encoding
    
     Allows you to override SimplePie's output to match that of your webpage.
     This is useful for times when your webpages are not being served as
     UTF-8.  This setting will be obeyed by {@see handle_content_type()}, and
     is similar to {@see set_input_encoding()}.
    
     It should be noted, however, that not all character encodings can support
     all characters.  If your page is being served as ISO-8859-1 and you try
     to display a Japanese feed, you'll likely see garbled characters.
     Because of this, it is highly recommended to ensure that your webpages
     are served as UTF-8.
    
     The number of supported character encodings depends on whether your web
     host supports {@link http://php.net/mbstring mbstring},
     {@link http://php.net/iconv iconv}, or both. See
     {@link http://simplepie.org/wiki/faq/Supported_Character_Encodings} for
     more information.
    
     @param string $encoding
    
  **/
  @:native("set_output_encoding") public function setOutputEncoding(?encoding:String):Void;
  /**
    
     Set element/attribute key/value pairs of HTML attributes
     containing URLs that need to be resolved relative to the feed
    
     Defaults to |a|@href, |area|@href, |blockquote|@cite, |del|@cite,
     |form|@action, |img|@longdesc, |img|@src, |input|@src, |ins|@cite,
     |q|@cite
    
     @since 1.0
     @param array|null $element_attribute Element/attribute key/value pairs, null for default
    
  **/
  @:native("set_url_replacements") public function setUrlReplacements(element_attribute:php.NativeArray = null):Void;
  /**
    
     Set the handler to enable the display of cached images.
    
     @param str $page Web-accessible path to the handler_image.php file.
     @param str $qs The query string that the value should be passed to.
    
  **/
  @:native("set_image_handler") public function setImageHandler(page:String = false, qs:String = 'i'):Void;
  /**
    
     Set the limit for items returned per-feed with multifeeds
    
     @param integer $limit The maximum number of items to return.
    
  **/
  @:native("set_item_limit") public function setItemLimit(limit:Int = 0):Void;
  /**
    
     Initialize the feed object
    
     This is what makes everything happen.  Period.  This is where all of the
     configuration options get processed, feeds are fetched, cached, and
     parsed, and all of that other good stuff.
    
     @return boolean True if successful, false otherwise
    
  **/
  @:native("init") public function init():Bool;
  /**
    
     Get the error message for the occurred error.
    
     @return string|array Error message, or array of messages for multifeeds
    
  **/
  @:native("error") public function error():haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>;
  /**
    
     Get the raw XML
    
     This is the same as the old `$feed->enable_xml_dump(true)`, but returns
     the data instead of printing it.
    
     @return string|boolean Raw XML data, false if the cache is used
    
  **/
  @:native("get_raw_data") public function getRawData():haxe.extern.EitherType<String, Bool>;
  /**
    
     Get the character encoding used for output
    
     @since Preview Release
     @return string
    
  **/
  @:native("get_encoding") public function getEncoding():String;
  /**
    
     Send the content-type header with correct encoding
    
     This method ensures that the SimplePie-enabled page is being served with
     the correct {@link http://www.iana.org/assignments/media-types/ mime-type}
     and character encoding HTTP headers (character encoding determined by the
     {@see set_output_encoding} config option).
    
     This won't work properly if any content or whitespace has already been
     sent to the browser, because it relies on PHP's
     {@link http://php.net/header header()} function, and these are the
     circumstances under which the function works.
    
     Because it's setting these settings for the entire page (as is the nature
     of HTTP headers), this should only be used once per page (again, at the
     top).
    
     @param string $mime MIME type to serve the page as
    
  **/
  @:native("handle_content_type") public function handleContentType(mime:String = 'text/html'):Void;
  /**
    
     Get the type of the feed
    
     This returns a SIMPLEPIE_TYPE_* constant, which can be tested against
     using {@link http://php.net/language.operators.bitwise bitwise operators}
    
     @since 0.8 (usage changed to using constants in 1.0)
     @see SIMPLEPIE_TYPE_NONE Unknown.
     @see SIMPLEPIE_TYPE_RSS_090 RSS 0.90.
     @see SIMPLEPIE_TYPE_RSS_091_NETSCAPE RSS 0.91 (Netscape).
     @see SIMPLEPIE_TYPE_RSS_091_USERLAND RSS 0.91 (Userland).
     @see SIMPLEPIE_TYPE_RSS_091 RSS 0.91.
     @see SIMPLEPIE_TYPE_RSS_092 RSS 0.92.
     @see SIMPLEPIE_TYPE_RSS_093 RSS 0.93.
     @see SIMPLEPIE_TYPE_RSS_094 RSS 0.94.
     @see SIMPLEPIE_TYPE_RSS_10 RSS 1.0.
     @see SIMPLEPIE_TYPE_RSS_20 RSS 2.0.x.
     @see SIMPLEPIE_TYPE_RSS_RDF RDF-based RSS.
     @see SIMPLEPIE_TYPE_RSS_SYNDICATION Non-RDF-based RSS (truly intended as syndication format).
     @see SIMPLEPIE_TYPE_RSS_ALL Any version of RSS.
     @see SIMPLEPIE_TYPE_ATOM_03 Atom 0.3.
     @see SIMPLEPIE_TYPE_ATOM_10 Atom 1.0.
     @see SIMPLEPIE_TYPE_ATOM_ALL Any version of Atom.
     @see SIMPLEPIE_TYPE_ALL Any known/supported feed type.
     @return int SIMPLEPIE_TYPE_* constant
    
  **/
  @:native("get_type") public function getType():Int;
  /**
    
     Get the URL for the feed
    
     May or may not be different from the URL passed to {@see set_feed_url()},
     depending on whether auto-discovery was used.
    
     @since Preview Release (previously called `get_feed_url()` since SimplePie 0.8.)
     @todo If we have a perm redirect we should return the new URL
     @todo When we make the above change, let's support <itunes:new-feed-url> as well
     @todo Also, |atom:link|@rel=self
     @return string|null
    
  **/
  @:native("subscribe_url") public function subscribeUrl():String;
  /**
    
     Get data for an feed-level element
    
     This method allows you to get access to ANY element/attribute that is a
     sub-element of the opening feed tag.
    
     The return value is an indexed array of elements matching the given
     namespace and tag name. Each element has `attribs`, `data` and `child`
     subkeys. For `attribs` and `child`, these contain namespace subkeys.
     `attribs` then has one level of associative name => value data (where
     `value` is a string) after the namespace. `child` has tag-indexed keys
     after the namespace, each member of which is an indexed array matching
     this same format.
    
     For example:
     <pre>
     // This is probably a bad example because we already support
     // <media:content> natively, but it shows you how to parse through
     // the nodes.
     $group = $item->get_item_tags(SIMPLEPIE_NAMESPACE_MEDIARSS, 'group');
     $content = $group[0]['child'][SIMPLEPIE_NAMESPACE_MEDIARSS]['content'];
     $file = $content[0]['attribs']['']['url'];
     echo $file;
     </pre>
    
     @since 1.0
     @see http://simplepie.org/wiki/faq/supported_xml_namespaces
     @param string $namespace The URL of the XML namespace of the elements you're trying to access
     @param string $tag Tag name
     @return array
    
  **/
  @:native("get_feed_tags") public function getFeedTags(namespace:String, tag:String):php.NativeArray;
  /**
    
     Get data for an channel-level element
    
     This method allows you to get access to ANY element/attribute in the
     channel/header section of the feed.
    
     See {@see SimplePie::get_feed_tags()} for a description of the return value
    
     @since 1.0
     @see http://simplepie.org/wiki/faq/supported_xml_namespaces
     @param string $namespace The URL of the XML namespace of the elements you're trying to access
     @param string $tag Tag name
     @return array
    
  **/
  @:native("get_channel_tags") public function getChannelTags(namespace:String, tag:String):php.NativeArray;
  /**
    
     Get data for an channel-level element
    
     This method allows you to get access to ANY element/attribute in the
     image/logo section of the feed.
    
     See {@see SimplePie::get_feed_tags()} for a description of the return value
    
     @since 1.0
     @see http://simplepie.org/wiki/faq/supported_xml_namespaces
     @param string $namespace The URL of the XML namespace of the elements you're trying to access
     @param string $tag Tag name
     @return array
    
  **/
  @:native("get_image_tags") public function getImageTags(namespace:String, tag:String):php.NativeArray;
  /**
    
     Get the base URL value from the feed
    
     Uses `<xml:base>` if available, otherwise uses the first link in the
     feed, or failing that, the URL of the feed itself.
    
     @see get_link
     @see subscribe_url
    
     @param array $element
     @return string
    
  **/
  @:native("get_base") public function getBase(?element:php.NativeStructArray<Dynamic>):String;
  /**
    
     Sanitize feed data
    
     @access private
     @see SimplePie_Sanitize::sanitize()
     @param string $data Data to sanitize
     @param int $type One of the SIMPLEPIE_CONSTRUCT_* constants
     @param string $base Base URL to resolve URLs against
     @return string Sanitized data
    
  **/
  @:native("sanitize") public function sanitize(data:String, type:Int, base:String = ''):String;
  /**
    
     Get the title of the feed
    
     Uses `<atom:title>`, `<title>` or `<dc:title>`
    
     @since 1.0 (previously called `get_feed_title` since 0.8)
     @return string|null
    
  **/
  @:native("get_title") public function getTitle():String;
  /**
    
     Get a category for the feed
    
     @since Unknown
     @param int $key The category that you want to return.  Remember that arrays begin with 0, not 1
     @return SimplePie_Category|null
    
  **/
  @:native("get_category") public function getCategory(key:Int = 0):SimplePie_Category;
  /**
    
     Get all categories for the feed
    
     Uses `<atom:category>`, `<category>` or `<dc:subject>`
    
     @since Unknown
     @return array|null List of {@see SimplePie_Category} objects
    
  **/
  @:native("get_categories") public function getCategories():php.NativeArray;
  /**
    
     Get an author for the feed
    
     @since 1.1
     @param int $key The author that you want to return.  Remember that arrays begin with 0, not 1
     @return SimplePie_Author|null
    
  **/
  @:native("get_author") public function getAuthor(key:Int = 0):SimplePie_Author;
  /**
    
     Get all authors for the feed
    
     Uses `<atom:author>`, `<author>`, `<dc:creator>` or `<itunes:author>`
    
     @since 1.1
     @return array|null List of {@see SimplePie_Author} objects
    
  **/
  @:native("get_authors") public function getAuthors():php.NativeArray;
  /**
    
     Get a contributor for the feed
    
     @since 1.1
     @param int $key The contrbutor that you want to return.  Remember that arrays begin with 0, not 1
     @return SimplePie_Author|null
    
  **/
  @:native("get_contributor") public function getContributor(key:Int = 0):SimplePie_Author;
  /**
    
     Get all contributors for the feed
    
     Uses `<atom:contributor>`
    
     @since 1.1
     @return array|null List of {@see SimplePie_Author} objects
    
  **/
  @:native("get_contributors") public function getContributors():php.NativeArray;
  /**
    
     Get a single link for the feed
    
     @since 1.0 (previously called `get_feed_link` since Preview Release, `get_feed_permalink()` since 0.8)
     @param int $key The link that you want to return.  Remember that arrays begin with 0, not 1
     @param string $rel The relationship of the link to return
     @return string|null Link URL
    
  **/
  @:native("get_link") public function getLink(key:Int = 0, rel:String = 'alternate'):String;
  /**
    
     Get the permalink for the item
    
     Returns the first link available with a relationship of "alternate".
     Identical to {@see get_link()} with key 0
    
     @see get_link
     @since 1.0 (previously called `get_feed_link` since Preview Release, `get_feed_permalink()` since 0.8)
     @internal Added for parity between the parent-level and the item/entry-level.
     @return string|null Link URL
    
  **/
  @:native("get_permalink") public function getPermalink():String;
  /**
    
     Get all links for the feed
    
     Uses `<atom:link>` or `<link>`
    
     @since Beta 2
     @param string $rel The relationship of links to return
     @return array|null Links found for the feed (strings)
    
  **/
  @:native("get_links") public function getLinks(rel:String = 'alternate'):php.NativeArray;
  /**
    
     Get the content for the item
    
     Uses `<atom:subtitle>`, `<atom:tagline>`, `<description>`,
     `<dc:description>`, `<itunes:summary>` or `<itunes:subtitle>`
    
     @since 1.0 (previously called `get_feed_description()` since 0.8)
     @return string|null
    
  **/
  @:native("get_description") public function getDescription():String;
  /**
    
     Get the copyright info for the feed
    
     Uses `<atom:rights>`, `<atom:copyright>` or `<dc:rights>`
    
     @since 1.0 (previously called `get_feed_copyright()` since 0.8)
     @return string|null
    
  **/
  @:native("get_copyright") public function getCopyright():String;
  /**
    
     Get the language for the feed
    
     Uses `<language>`, `<dc:language>`, or @xml_lang
    
     @since 1.0 (previously called `get_feed_language()` since 0.8)
     @return string|null
    
  **/
  @:native("get_language") public function getLanguage():String;
  /**
    
     Get the latitude coordinates for the item
    
     Compatible with the W3C WGS84 Basic Geo and GeoRSS specifications
    
     Uses `<geo:lat>` or `<georss:point>`
    
     @since 1.0
     @link http://www.w3.org/2003/01/geo/ W3C WGS84 Basic Geo
     @link http://www.georss.org/ GeoRSS
     @return string|null
    
  **/
  @:native("get_latitude") public function getLatitude():String;
  /**
    
     Get the longitude coordinates for the feed
    
     Compatible with the W3C WGS84 Basic Geo and GeoRSS specifications
    
     Uses `<geo:long>`, `<geo:lon>` or `<georss:point>`
    
     @since 1.0
     @link http://www.w3.org/2003/01/geo/ W3C WGS84 Basic Geo
     @link http://www.georss.org/ GeoRSS
     @return string|null
    
  **/
  @:native("get_longitude") public function getLongitude():String;
  /**
    
     Get the feed logo's title
    
     RSS 0.9.0, 1.0 and 2.0 feeds are allowed to have a "feed logo" title.
    
     Uses `<image><title>` or `<image><dc:title>`
    
     @return string|null
    
  **/
  @:native("get_image_title") public function getImageTitle():String;
  /**
    
     Get the feed logo's URL
    
     RSS 0.9.0, 2.0, Atom 1.0, and feeds with iTunes RSS tags are allowed to
     have a "feed logo" URL. This points directly to the image itself.
    
     Uses `<itunes:image>`, `<atom:logo>`, `<atom:icon>`,
     `<image><title>` or `<image><dc:title>`
    
     @return string|null
    
  **/
  @:native("get_image_url") public function getImageUrl():String;
  /**
    
     Get the feed logo's link
    
     RSS 0.9.0, 1.0 and 2.0 feeds are allowed to have a "feed logo" link. This
     points to a human-readable page that the image should link to.
    
     Uses `<itunes:image>`, `<atom:logo>`, `<atom:icon>`,
     `<image><title>` or `<image><dc:title>`
    
     @return string|null
    
  **/
  @:native("get_image_link") public function getImageLink():String;
  /**
    
     Get the feed logo's link
    
     RSS 2.0 feeds are allowed to have a "feed logo" width.
    
     Uses `<image><width>` or defaults to 88.0 if no width is specified and
     the feed is an RSS 2.0 feed.
    
     @return int|float|null
    
  **/
  @:native("get_image_width") public function getImageWidth():haxe.extern.EitherType<Int, Int>;
  /**
    
     Get the feed logo's height
    
     RSS 2.0 feeds are allowed to have a "feed logo" height.
    
     Uses `<image><height>` or defaults to 31.0 if no height is specified and
     the feed is an RSS 2.0 feed.
    
     @return int|float|null
    
  **/
  @:native("get_image_height") public function getImageHeight():haxe.extern.EitherType<Int, Int>;
  /**
    
     Get the number of items in the feed
    
     This is well-suited for {@link http://php.net/for for()} loops with
     {@see get_item()}
    
     @param int $max Maximum value to return. 0 for no limit
     @return int Number of items in the feed
    
  **/
  @:native("get_item_quantity") public function getItemQuantity(max:Int = 0):Int;
  /**
    
     Get a single item from the feed
    
     This is better suited for {@link http://php.net/for for()} loops, whereas
     {@see get_items()} is better suited for
     {@link http://php.net/foreach foreach()} loops.
    
     @see get_item_quantity()
     @since Beta 2
     @param int $key The item that you want to return.  Remember that arrays begin with 0, not 1
     @return SimplePie_Item|null
    
  **/
  @:native("get_item") public function getItem(key:Int = 0):SimplePie_Item;
  /**
    
     Get all items from the feed
    
     This is better suited for {@link http://php.net/for for()} loops, whereas
     {@see get_items()} is better suited for
     {@link http://php.net/foreach foreach()} loops.
    
     @see get_item_quantity
     @since Beta 2
     @param int $start Index to start at
     @param int $end Number of items to return. 0 for all items after `$start`
     @return array|null List of {@see SimplePie_Item} objects
    
  **/
  @:native("get_items") public function getItems(start:Int = 0, end:Int = 0):php.NativeArray;
  /**
    
     Set the favicon handler
    
     @deprecated Use your own favicon handling instead
    
  **/
  @:native("set_favicon_handler") public function setFaviconHandler(page:Dynamic = false, qs:Dynamic = 'i'):Void;
  /**
    
     Get the favicon for the current feed
    
     @deprecated Use your own favicon handling instead
    
  **/
  @:native("get_favicon") public function getFavicon():Void;
  /**
    
     Magic method handler
    
     @param string $method Method name
     @param array $args Arguments to the method
     @return mixed
    
  **/
  @:native("__call") public function __call(method:String, args:php.NativeStructArray<Dynamic>):Dynamic;
  /**
    
     Sorting callback for items
    
     @access private
     @param SimplePie $a
     @param SimplePie $b
     @return boolean
    
  **/
  @:native("sort_items") public static function sortItems(a:SimplePie, b:SimplePie):Bool;
  /**
    
     Merge items from several feeds into one
    
     If you're merging multiple feeds together, they need to all have dates
     for the items or else SimplePie will refuse to sort them.
    
     @link http://simplepie.org/wiki/tutorial/sort_multiple_feeds_by_time_and_date#if_feeds_require_separate_per-feed_settings
     @param array $urls List of SimplePie feed objects to merge
     @param int $start Starting item
     @param int $end Number of items to return
     @param int $limit Maximum number of items per feed
     @return array
    
  **/
  @:native("merge_items") public static function mergeItems(urls:php.NativeStructArray<Dynamic>, start:Int = 0, end:Int = 0, limit:Int = 0):php.NativeArray;
}
