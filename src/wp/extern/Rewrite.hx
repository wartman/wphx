package wp.extern;

@:native("WP_Rewrite")
extern class Rewrite {
  /**
    
     Permalink structure for posts.
    
     @since 1.5.0
     @var string
    
  **/
  @:native("permalink_structure") public var permalinkStructure:String;
  /**
    
     Whether to add trailing slashes.
    
     @since 2.2.0
     @var bool
    
  **/
  @:native("use_trailing_slashes") public var useTrailingSlashes:Bool;
  /**
    
     Pagination permalink base.
    
     @since 3.1.0
     @var string
    
  **/
  @:native("pagination_base") public var paginationBase:String;
  /**
    
     The static portion of the post permalink structure.
    
     If the permalink structure is "/archive/%post_id%" then the front
     is "/archive/". If the permalink structure is "/%year%/%postname%/"
     then the front is "/".
    
     @since 1.5.0
     @var string
    
     @see WP_Rewrite::init()
    
  **/
  @:native("front") public var front:String;
  /**
    
     The prefix for all permalink structures.
    
     If PATHINFO/index permalinks are in use then the root is the value of
     `WP_Rewrite::$index` with a trailing slash appended. Otherwise the root
     will be empty.
    
     @since 1.5.0
     @var string
    
     @see WP_Rewrite::init()
     @see WP_Rewrite::using_index_permalinks()
    
  **/
  @:native("root") public var root:String;
  /**
    
     The name of the index file which is the entry point to all requests.
    
     @since 1.5.0
     @var string
    
  **/
  @:native("index") public var index:String;
  /**
    
     Whether to write every mod_rewrite rule for WordPress into the .htaccess file.
    
     This is off by default, turning it on might print a lot of rewrite rules
     to the .htaccess file.
    
     @since 2.0.0
     @var bool
    
     @see WP_Rewrite::mod_rewrite_rules()
    
  **/
  @:native("use_verbose_rules") public var useVerboseRules:Bool;
  /**
    
     Could post permalinks be confused with those of pages?
    
     If the first rewrite tag in the post permalink structure is one that could
     also match a page name (e.g. %postname% or %author%) then this flag is
     set to true. Prior to WordPress 3.3 this flag indicated that every page
     would have a set of rules added to the top of the rewrite rules array.
     Now it tells WP::parse_request() to check if a URL matching the page
     permastruct is actually a page before accepting it.
    
     @since 2.5.0
     @var bool
    
     @see WP_Rewrite::init()
    
  **/
  @:native("use_verbose_page_rules") public var useVerbosePageRules:Bool;
  /**
    
     Supported default feeds.
    
     @since 1.5.0
     @var array
    
  **/
  @:native("feeds") public var feeds:php.NativeStructArray<Dynamic>;
  /**
    
     Determines whether permalinks are being used.
    
     This can be either rewrite module or permalink in the HTTP query string.
    
     @since 1.5.0
    
     @return bool True, if permalinks are enabled.
    
  **/
  @:native("using_permalinks") public function usingPermalinks():Bool;
  /**
    
     Determines whether permalinks are being used and rewrite module is not enabled.
    
     Means that permalink links are enabled and index.php is in the URL.
    
     @since 1.5.0
    
     @return bool Whether permalink links are enabled and index.php is in the URL.
    
  **/
  @:native("using_index_permalinks") public function usingIndexPermalinks():Bool;
  /**
    
     Determines whether permalinks are being used and rewrite module is enabled.
    
     Using permalinks and index.php is not in the URL.
    
     @since 1.5.0
    
     @return bool Whether permalink links are enabled and index.php is NOT in the URL.
    
  **/
  @:native("using_mod_rewrite_permalinks") public function usingModRewritePermalinks():Bool;
  /**
    
     Indexes for matches for usage in preg_*() functions.
    
     The format of the string is, with empty matches property value, '$NUM'.
     The 'NUM' will be replaced with the value in the $number parameter. With
     the matches property not empty, the value of the returned string will
     contain that value of the matches property. The format then will be
     '$MATCHES[NUM]', with MATCHES as the value in the property and NUM the
     value of the $number parameter.
    
     @since 1.5.0
    
     @param int $number Index number.
     @return string
    
  **/
  @:native("preg_index") public function pregIndex(number:Int):String;
  /**
    
     Retrieves all page and attachments for pages URIs.
    
     The attachments are for those that have pages as parents and will be
     retrieved.
    
     @since 2.5.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @return array Array of page URIs as first element and attachment URIs as second element.
    
  **/
  @:native("page_uri_index") public function pageUriIndex():php.NativeArray;
  /**
    
     Retrieves all of the rewrite rules for pages.
    
     @since 1.5.0
    
     @return array Page rewrite rules.
    
  **/
  @:native("page_rewrite_rules") public function pageRewriteRules():php.NativeArray;
  /**
    
     Retrieves date permalink structure, with year, month, and day.
    
     The permalink structure for the date, if not set already depends on the
     permalink structure. It can be one of three formats. The first is year,
     month, day; the second is day, month, year; and the last format is month,
     day, year. These are matched against the permalink structure for which
     one is used. If none matches, then the default will be used, which is
     year, month, day.
    
     Prevents post ID and date permalinks from overlapping. In the case of
     post_id, the date permalink will be prepended with front permalink with
     'date/' before the actual permalink to form the complete date permalink
     structure.
    
     @since 1.5.0
    
     @return string|false False on no permalink structure. Date permalink structure.
    
  **/
  @:native("get_date_permastruct") public function getDatePermastruct():haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieves the year permalink structure without month and day.
    
     Gets the date permalink structure and strips out the month and day
     permalink structures.
    
     @since 1.5.0
    
     @return false|string False on failure. Year structure on success.
    
  **/
  @:native("get_year_permastruct") public function getYearPermastruct():haxe.extern.EitherType<Bool, String>;
  /**
    
     Retrieves the month permalink structure without day and with year.
    
     Gets the date permalink structure and strips out the day permalink
     structures. Keeps the year permalink structure.
    
     @since 1.5.0
    
     @return false|string False on failure. Year/Month structure on success.
    
  **/
  @:native("get_month_permastruct") public function getMonthPermastruct():haxe.extern.EitherType<Bool, String>;
  /**
    
     Retrieves the day permalink structure with month and year.
    
     Keeps date permalink structure with all year, month, and day.
    
     @since 1.5.0
    
     @return string|false False on failure. Year/Month/Day structure on success.
    
  **/
  @:native("get_day_permastruct") public function getDayPermastruct():haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieves the permalink structure for categories.
    
     If the category_base property has no value, then the category structure
     will have the front property value, followed by 'category', and finally
     '%category%'. If it does, then the root property will be used, along with
     the category_base property value.
    
     @since 1.5.0
    
     @return string|false False on failure. Category permalink structure.
    
  **/
  @:native("get_category_permastruct") public function getCategoryPermastruct():haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieve the permalink structure for tags.
    
     If the tag_base property has no value, then the tag structure will have
     the front property value, followed by 'tag', and finally '%tag%'. If it
     does, then the root property will be used, along with the tag_base
     property value.
    
     @since 2.3.0
    
     @return string|false False on failure. Tag permalink structure.
    
  **/
  @:native("get_tag_permastruct") public function getTagPermastruct():haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieves an extra permalink structure by name.
    
     @since 2.5.0
    
     @param string $name Permalink structure name.
     @return string|false False if not found. Permalink structure string.
    
  **/
  @:native("get_extra_permastruct") public function getExtraPermastruct(name:String):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieves the author permalink structure.
    
     The permalink structure is front property, author base, and finally
     '/%author%'. Will set the author_structure property and then return it
     without attempting to set the value again.
    
     @since 1.5.0
    
     @return string|false False if not found. Permalink structure string.
    
  **/
  @:native("get_author_permastruct") public function getAuthorPermastruct():haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieves the search permalink structure.
    
     The permalink structure is root property, search base, and finally
     '/%search%'. Will set the search_structure property and then return it
     without attempting to set the value again.
    
     @since 1.5.0
    
     @return string|false False if not found. Permalink structure string.
    
  **/
  @:native("get_search_permastruct") public function getSearchPermastruct():haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieves the page permalink structure.
    
     The permalink structure is root property, and '%pagename%'. Will set the
     page_structure property and then return it without attempting to set the
     value again.
    
     @since 1.5.0
    
     @return string|false False if not found. Permalink structure string.
    
  **/
  @:native("get_page_permastruct") public function getPagePermastruct():haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieves the feed permalink structure.
    
     The permalink structure is root property, feed base, and finally
     '/%feed%'. Will set the feed_structure property and then return it
     without attempting to set the value again.
    
     @since 1.5.0
    
     @return string|false False if not found. Permalink structure string.
    
  **/
  @:native("get_feed_permastruct") public function getFeedPermastruct():haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieves the comment feed permalink structure.
    
     The permalink structure is root property, comment base property, feed
     base and finally '/%feed%'. Will set the comment_feed_structure property
     and then return it without attempting to set the value again.
    
     @since 1.5.0
    
     @return string|false False if not found. Permalink structure string.
    
  **/
  @:native("get_comment_feed_permastruct") public function getCommentFeedPermastruct():haxe.extern.EitherType<String, Bool>;
  /**
    
     Adds or updates existing rewrite tags (e.g. %postname%).
    
     If the tag already exists, replace the existing pattern and query for
     that tag, otherwise add the new tag.
    
     @since 1.5.0
    
     @see WP_Rewrite::$rewritecode
     @see WP_Rewrite::$rewritereplace
     @see WP_Rewrite::$queryreplace
    
     @param string $tag   Name of the rewrite tag to add or update.
     @param string $regex Regular expression to substitute the tag for in rewrite rules.
     @param string $query String to append to the rewritten query. Must end in '='.
    
  **/
  @:native("add_rewrite_tag") public function addRewriteTag(tag:String, regex:String, query:String):Void;
  /**
    
     Removes an existing rewrite tag.
    
     @since 4.5.0
    
     @see WP_Rewrite::$rewritecode
     @see WP_Rewrite::$rewritereplace
     @see WP_Rewrite::$queryreplace
    
     @param string $tag Name of the rewrite tag to remove.
    
  **/
  @:native("remove_rewrite_tag") public function removeRewriteTag(tag:String):Void;
  /**
    
     Generates rewrite rules from a permalink structure.
    
     The main WP_Rewrite function for building the rewrite rule list. The
     contents of the function is a mix of black magic and regular expressions,
     so best just ignore the contents and move to the parameters.
    
     @since 1.5.0
    
     @param string $permalink_structure The permalink structure.
     @param int    $ep_mask             Optional. Endpoint mask defining what endpoints are added to the structure.
                                        Accepts `EP_NONE`, `EP_PERMALINK`, `EP_ATTACHMENT`, `EP_DATE`, `EP_YEAR`,
                                        `EP_MONTH`, `EP_DAY`, `EP_ROOT`, `EP_COMMENTS`, `EP_SEARCH`, `EP_CATEGORIES`,
                                        `EP_TAGS`, `EP_AUTHORS`, `EP_PAGES`, `EP_ALL_ARCHIVES`, and `EP_ALL`.
                                        Default `EP_NONE`.
     @param bool   $paged               Optional. Whether archive pagination rules should be added for the structure.
                                        Default true.
     @param bool   $feed                Optional Whether feed rewrite rules should be added for the structure.
                                        Default true.
     @param bool   $forcomments         Optional. Whether the feed rules should be a query for a comments feed.
                                        Default false.
     @param bool   $walk_dirs           Optional. Whether the 'directories' making up the structure should be walked
                                        over and rewrite rules built for each in-turn. Default true.
     @param bool   $endpoints           Optional. Whether endpoints should be applied to the generated rewrite rules.
                                        Default true.
     @return array Rewrite rule list.
    
  **/
  @:native("generate_rewrite_rules") public function generateRewriteRules(permalink_structure:String, ?ep_mask:Int, paged:Bool = true, feed:Bool = true, forcomments:Bool = false, walk_dirs:Bool = true, endpoints:Bool = true):php.NativeArray;
  /**
    
     Generates rewrite rules with permalink structure and walking directory only.
    
     Shorten version of WP_Rewrite::generate_rewrite_rules() that allows for shorter
     list of parameters. See the method for longer description of what generating
     rewrite rules does.
    
     @since 1.5.0
    
     @see WP_Rewrite::generate_rewrite_rules() See for long description and rest of parameters.
    
     @param string $permalink_structure The permalink structure to generate rules.
     @param bool   $walk_dirs           Optional, default is false. Whether to create list of directories to walk over.
     @return array
    
  **/
  @:native("generate_rewrite_rule") public function generateRewriteRule(permalink_structure:String, walk_dirs:Bool = false):php.NativeArray;
  /**
    
     Constructs rewrite matches and queries from permalink structure.
    
     Runs the action {@see 'generate_rewrite_rules'} with the parameter that is an
     reference to the current WP_Rewrite instance to further manipulate the
     permalink structures and rewrite rules. Runs the {@see 'rewrite_rules_array'}
     filter on the full rewrite rule array.
    
     There are two ways to manipulate the rewrite rules, one by hooking into
     the {@see 'generate_rewrite_rules'} action and gaining full control of the
     object or just manipulating the rewrite rule array before it is passed
     from the function.
    
     @since 1.5.0
    
     @return array An associate array of matches and queries.
    
  **/
  @:native("rewrite_rules") public function rules():php.NativeArray;
  /**
    
     Retrieves the rewrite rules.
    
     The difference between this method and WP_Rewrite::rewrite_rules() is that
     this method stores the rewrite rules in the 'rewrite_rules' option and retrieves
     it. This prevents having to process all of the permalinks to get the rewrite rules
     in the form of caching.
    
     @since 1.5.0
    
     @return array Rewrite rules.
    
  **/
  @:native("wp_rewrite_rules") public function wpRewriteRules():php.NativeArray;
  /**
    
     Retrieves mod_rewrite-formatted rewrite rules to write to .htaccess.
    
     Does not actually write to the .htaccess file, but creates the rules for
     the process that will.
    
     Will add the non_wp_rules property rules to the .htaccess file before
     the WordPress rewrite rules one.
    
     @since 1.5.0
    
     @return string
    
  **/
  @:native("mod_rewrite_rules") public function modRewriteRules():String;
  /**
    
     Retrieves IIS7 URL Rewrite formatted rewrite rules to write to web.config file.
    
     Does not actually write to the web.config file, but creates the rules for
     the process that will.
    
     @since 2.8.0
    
     @param bool $add_parent_tags Optional. Whether to add parent tags to the rewrite rule sets.
                                  Default false.
     @return string IIS7 URL rewrite rule sets.
    
  **/
  @:native("iis7_url_rewrite_rules") public function iis7UrlRewriteRules(add_parent_tags:Bool = false):String;
  /**
    
     Adds a rewrite rule that transforms a URL structure to a set of query vars.
    
     Any value in the $after parameter that isn't 'bottom' will result in the rule
     being placed at the top of the rewrite rules.
    
     @since 2.1.0
     @since 4.4.0 Array support was added to the `$query` parameter.
    
     @param string       $regex Regular expression to match request against.
     @param string|array $query The corresponding query vars for this rewrite rule.
     @param string       $after Optional. Priority of the new rule. Accepts 'top'
                                or 'bottom'. Default 'bottom'.
    
  **/
  @:native("add_rule") public function addRule(regex:String, query:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, after:String = 'bottom'):Void;
  /**
    
     Adds a rewrite rule that doesn't correspond to index.php.
    
     @since 2.1.0
    
     @param string $regex Regular expression to match request against.
     @param string $query The corresponding query vars for this rewrite rule.
    
  **/
  @:native("add_external_rule") public function addExternalRule(regex:String, query:String):Void;
  /**
    
     Adds an endpoint, like /trackback/.
    
     @since 2.1.0
     @since 3.9.0 $query_var parameter added.
     @since 4.3.0 Added support for skipping query var registration by passing `false` to `$query_var`.
    
     @see add_rewrite_endpoint() for full documentation.
     @global WP $wp
    
     @param string      $name      Name of the endpoint.
     @param int         $places    Endpoint mask describing the places the endpoint should be added.
     @param string|bool $query_var Optional. Name of the corresponding query variable. Pass `false` to
                                   skip registering a query_var for this endpoint. Defaults to the
                                   value of `$name`.
    
  **/
  @:native("add_endpoint") public function addEndpoint(name:String, places:Int, query_var:haxe.extern.EitherType<String, Bool> = true):Void;
  /**
    
     Adds a new permalink structure.
    
     A permalink structure (permastruct) is an abstract definition of a set of rewrite rules;
     it is an easy way of expressing a set of regular expressions that rewrite to a set of
     query strings. The new permastruct is added to the WP_Rewrite::$extra_permastructs array.
    
     When the rewrite rules are built by WP_Rewrite::rewrite_rules(), all of these extra
     permastructs are passed to WP_Rewrite::generate_rewrite_rules() which transforms them
     into the regular expressions that many love to hate.
    
     The `$args` parameter gives you control over how WP_Rewrite::generate_rewrite_rules()
     works on the new permastruct.
    
     @since 2.5.0
    
     @param string $name   Name for permalink structure.
     @param string $struct Permalink structure (e.g. category/%category%)
     @param array  $args   {
         Optional. Arguments for building rewrite rules based on the permalink structure.
         Default empty array.
    
         @type bool $with_front  Whether the structure should be prepended with `WP_Rewrite::$front`.
                                 Default true.
         @type int  $ep_mask     The endpoint mask defining which endpoints are added to the structure.
                                 Accepts `EP_NONE`, `EP_PERMALINK`, `EP_ATTACHMENT`, `EP_DATE`, `EP_YEAR`,
                                 `EP_MONTH`, `EP_DAY`, `EP_ROOT`, `EP_COMMENTS`, `EP_SEARCH`, `EP_CATEGORIES`,
                                 `EP_TAGS`, `EP_AUTHORS`, `EP_PAGES`, `EP_ALL_ARCHIVES`, and `EP_ALL`.
                                 Default `EP_NONE`.
         @type bool $paged       Whether archive pagination rules should be added for the structure.
                                 Default true.
         @type bool $feed        Whether feed rewrite rules should be added for the structure. Default true.
         @type bool $forcomments Whether the feed rules should be a query for a comments feed. Default false.
         @type bool $walk_dirs   Whether the 'directories' making up the structure should be walked over
                                 and rewrite rules built for each in-turn. Default true.
         @type bool $endpoints   Whether endpoints should be applied to the generated rules. Default true.
     }
    
  **/
  @:native("add_permastruct") public function addPermastruct(name:String, struct:String, ?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Removes a permalink structure.
    
     @since 4.5.0
    
     @param string $name Name for permalink structure.
    
  **/
  @:native("remove_permastruct") public function removePermastruct(name:String):Void;
  /**
    
     Removes rewrite rules and then recreate rewrite rules.
    
     Calls WP_Rewrite::wp_rewrite_rules() after removing the 'rewrite_rules' option.
     If the function named 'save_mod_rewrite_rules' exists, it will be called.
    
     @since 2.0.1
    
     @staticvar bool $do_hard_later
    
     @param bool $hard Whether to update .htaccess (hard flush) or just update rewrite_rules option (soft flush). Default is true (hard).
    
  **/
  @:native("flush_rules") public function flushRules(hard:Bool = true):Void;
  /**
    
     Sets up the object's properties.
    
     The 'use_verbose_page_rules' object property will be set to true if the
     permalink structure begins with one of the following: '%postname%', '%category%',
     '%tag%', or '%author%'.
    
     @since 1.5.0
    
  **/
  @:native("init") public function init():Void;
  /**
    
     Sets the main permalink structure for the site.
    
     Will update the 'permalink_structure' option, if there is a difference
     between the current permalink structure and the parameter value. Calls
     WP_Rewrite::init() after the option is updated.
    
     Fires the {@see 'permalink_structure_changed'} action once the init call has
     processed passing the old and new values
    
     @since 1.5.0
    
     @param string $permalink_structure Permalink structure.
    
  **/
  @:native("set_permalink_structure") public function setPermalinkStructure(permalink_structure:String):Void;
  /**
    
     Sets the category base for the category permalink.
    
     Will update the 'category_base' option, if there is a difference between
     the current category base and the parameter value. Calls WP_Rewrite::init()
     after the option is updated.
    
     @since 1.5.0
    
     @param string $category_base Category permalink structure base.
    
  **/
  @:native("set_category_base") public function setCategoryBase(category_base:String):Void;
  /**
    
     Sets the tag base for the tag permalink.
    
     Will update the 'tag_base' option, if there is a difference between the
     current tag base and the parameter value. Calls WP_Rewrite::init() after
     the option is updated.
    
     @since 2.3.0
    
     @param string $tag_base Tag permalink structure base.
    
  **/
  @:native("set_tag_base") public function setTagBase(tag_base:String):Void;
  /**
    
     Constructor - Calls init(), which runs setup.
    
     @since 1.5.0
    
  **/
  public function new():Void;
}
