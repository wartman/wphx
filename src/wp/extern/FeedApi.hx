package wp.extern;

extern class FeedApi implements wp.util.ApiFunctions {
  /**
    
     RSS container for the bloginfo function.
    
     You can retrieve anything that you can using the get_bloginfo() function.
     Everything will be stripped of tags and characters converted, when the values
     are retrieved for use in the feeds.
    
     @since 1.5.1
     @see get_bloginfo() For the list of possible values to display.
    
     @param string $show See get_bloginfo() for possible values.
     @return string
    
  **/
  public function get_bloginfo_rss(show:String = ''):String;
  /**
    
     Display RSS container for the bloginfo function.
    
     You can retrieve anything that you can using the get_bloginfo() function.
     Everything will be stripped of tags and characters converted, when the values
     are retrieved for use in the feeds.
    
     @since 0.71
     @see get_bloginfo() For the list of possible values to display.
    
     @param string $show See get_bloginfo() for possible values.
    
  **/
  public function bloginfo_rss(show:String = ''):Void;
  /**
    
     Retrieve the default feed.
    
     The default feed is 'rss2', unless a plugin changes it through the
     {@see 'default_feed'} filter.
    
     @since 2.5.0
    
     @return string Default feed, or for example 'rss2', 'atom', etc.
    
  **/
  public function get_default_feed():String;
  /**
    
     Retrieve the blog title for the feed title.
    
     @since 2.2.0
     @since 4.4.0 The optional `$sep` parameter was deprecated and renamed to `$deprecated`.
    
     @param string $deprecated Unused..
     @return string The document title.
    
  **/
  public function get_wp_title_rss(deprecated:String = '&#8211;'):String;
  /**
    
     Display the blog title for display of the feed title.
    
     @since 2.2.0
     @since 4.4.0 The optional `$sep` parameter was deprecated and renamed to `$deprecated`.
    
     @param string $deprecated Unused.
    
  **/
  public function wp_title_rss(deprecated:String = '&#8211;'):Void;
  /**
    
     Retrieve the current post title for the feed.
    
     @since 2.0.0
    
     @return string Current post title.
    
  **/
  public function get_the_title_rss():String;
  /**
    
     Display the post title in the feed.
    
     @since 0.71
    
  **/
  public function the_title_rss():Void;
  /**
    
     Retrieve the post content for feeds.
    
     @since 2.9.0
     @see get_the_content()
    
     @param string $feed_type The type of feed. rss2 | atom | rss | rdf
     @return string The filtered content.
    
  **/
  public function get_the_content_feed(feed_type:String = null):String;
  /**
    
     Display the post content for feeds.
    
     @since 2.9.0
    
     @param string $feed_type The type of feed. rss2 | atom | rss | rdf
    
  **/
  public function the_content_feed(feed_type:String = null):Void;
  /**
    
     Display the post excerpt for the feed.
    
     @since 0.71
    
  **/
  public function the_excerpt_rss():Void;
  /**
    
     Display the permalink to the post for use in feeds.
    
     @since 2.3.0
    
  **/
  public function the_permalink_rss():Void;
  /**
    
     Outputs the link to the comments for the current post in an xml safe way
    
     @since 3.0.0
     @return none
    
  **/
  public function comments_link_feed():none;
  /**
    
     Display the feed GUID for the current comment.
    
     @since 2.5.0
    
     @param int|WP_Comment $comment_id Optional comment object or id. Defaults to global comment object.
    
  **/
  public function comment_guid(comment_id:haxe.extern.EitherType<Int, wp.extern.Comment> = null):Void;
  /**
    
     Retrieve the feed GUID for the current comment.
    
     @since 2.5.0
    
     @param int|WP_Comment $comment_id Optional comment object or id. Defaults to global comment object.
     @return false|string false on failure or guid for comment on success.
    
  **/
  public function get_comment_guid(comment_id:haxe.extern.EitherType<Int, wp.extern.Comment> = null):haxe.extern.EitherType<Bool, String>;
  /**
    
     Display the link to the comments.
    
     @since 1.5.0
     @since 4.4.0 Introduced the `$comment` argument.
    
     @param int|WP_Comment $comment Optional. Comment object or id. Defaults to global comment object.
    
  **/
  public function comment_link(comment:haxe.extern.EitherType<Int, wp.extern.Comment> = null):Void;
  /**
    
     Retrieve the current comment author for use in the feeds.
    
     @since 2.0.0
    
     @return string Comment Author
    
  **/
  public function get_comment_author_rss():String;
  /**
    
     Display the current comment author in the feed.
    
     @since 1.0.0
    
  **/
  public function comment_author_rss():Void;
  /**
    
     Display the current comment content for use in the feeds.
    
     @since 1.0.0
    
  **/
  public function comment_text_rss():Void;
  /**
    
     Retrieve all of the post categories, formatted for use in feeds.
    
     All of the categories for the current post in the feed loop, will be
     retrieved and have feed markup added, so that they can easily be added to the
     RSS2, Atom, or RSS1 and RSS0.91 RDF feeds.
    
     @since 2.1.0
    
     @param string $type Optional, default is the type returned by get_default_feed().
     @return string All of the post categories for displaying in the feed.
    
  **/
  public function get_the_category_rss(type:String = null):String;
  /**
    
     Display the post categories in the feed.
    
     @since 0.71
     @see get_the_category_rss() For better explanation.
    
     @param string $type Optional, default is the type returned by get_default_feed().
    
  **/
  public function the_category_rss(type:String = null):Void;
  /**
    
     Display the HTML type based on the blog setting.
    
     The two possible values are either 'xhtml' or 'html'.
    
     @since 2.2.0
    
  **/
  public function html_type_rss():Void;
  /**
    
     Display the rss enclosure for the current post.
    
     Uses the global $post to check whether the post requires a password and if
     the user has the password for the post. If not then it will return before
     displaying.
    
     Also uses the function get_post_custom() to get the post's 'enclosure'
     metadata field and parses the value to display the enclosure(s). The
     enclosure(s) consist of enclosure HTML tag(s) with a URI and other
     attributes.
    
     @since 1.5.0
    
  **/
  public function rss_enclosure():Void;
  /**
    
     Display the atom enclosure for the current post.
    
     Uses the global $post to check whether the post requires a password and if
     the user has the password for the post. If not then it will return before
     displaying.
    
     Also uses the function get_post_custom() to get the post's 'enclosure'
     metadata field and parses the value to display the enclosure(s). The
     enclosure(s) consist of link HTML tag(s) with a URI and other attributes.
    
     @since 2.2.0
    
  **/
  public function atom_enclosure():Void;
  /**
    
     Determine the type of a string of data with the data formatted.
    
     Tell whether the type is text, html, or xhtml, per RFC 4287 section 3.1.
    
     In the case of WordPress, text is defined as containing no markup,
     xhtml is defined as "well formed", and html as tag soup (i.e., the rest).
    
     Container div tags are added to xhtml values, per section 3.1.1.3.
    
     @link http://www.atomenabled.org/developers/syndication/atom-format-spec.php#rfc.section.3.1
    
     @since 2.5.0
    
     @param string $data Input string
     @return array array(type, value)
    
  **/
  public function prep_atom_text_construct(data:String):php.NativeArray;
  /**
    
     Displays Site Icon in atom feeds.
    
     @since 4.3.0
    
     @see get_site_icon_url()
    
  **/
  public function atom_site_icon():Void;
  /**
    
     Displays Site Icon in RSS2.
    
     @since 4.3.0
    
  **/
  public function rss2_site_icon():Void;
  /**
    
     Display the link for the currently displayed feed in a XSS safe way.
    
     Generate a correct link for the atom:self element.
    
     @since 2.5.0
    
  **/
  public function self_link():Void;
  /**
    
     Return the content type for specified feed type.
    
     @since 2.8.0
    
     @param string $type Type of feed. Possible values include 'rss', rss2', 'atom', and 'rdf'.
    
  **/
  public function feed_content_type(type:String = ''):Void;
  /**
    
     Build SimplePie object based on RSS or Atom feed from URL.
    
     @since 2.8.0
    
     @param mixed $url URL of feed to retrieve. If an array of URLs, the feeds are merged
     using SimplePie's multifeed feature.
     See also {@link http://simplepie.org/wiki/faq/typical_multifeed_gotchas}
    
     @return WP_Error|SimplePie WP_Error object on failure or SimplePie object on success
    
  **/
  public function fetch_feed(url:Dynamic):haxe.extern.EitherType<wp.extern.Error, SimplePie>;
}
