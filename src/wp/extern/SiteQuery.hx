package wp.extern;

@:native("WP_Site_Query")
extern class SiteQuery {
  /**
    
     SQL for database query.
    
     @since 4.6.0
     @var string
    
  **/
  @:native("request") public var request:String;
  /**
    
     Metadata query container.
    
     @since 5.1.0
     @var WP_Meta_Query
    
  **/
  @:native("meta_query") public var metaQuery:wp.extern.MetaQuery;
  /**
    
     Date query container.
    
     @since 4.6.0
     @var object WP_Date_Query
    
  **/
  @:native("date_query") public var dateQuery:Dynamic;
  /**
    
     Query vars set by the user.
    
     @since 4.6.0
     @var array
    
  **/
  @:native("query_vars") public var queryVars:php.NativeStructArray<Dynamic>;
  /**
    
     Default values for query vars.
    
     @since 4.6.0
     @var array
    
  **/
  @:native("query_var_defaults") public var queryVarDefaults:php.NativeStructArray<Dynamic>;
  /**
    
     List of sites located by the query.
    
     @since 4.6.0
     @var array
    
  **/
  @:native("sites") public var sites:php.NativeStructArray<Dynamic>;
  /**
    
     The amount of found sites for the current query.
    
     @since 4.6.0
     @var int
    
  **/
  @:native("found_sites") public var foundSites:Int;
  /**
    
     The number of pages.
    
     @since 4.6.0
     @var int
    
  **/
  @:native("max_num_pages") public var maxNumPages:Int;
  /**
    
     Sets up the site query, based on the query vars passed.
    
     @since 4.6.0
     @since 4.8.0 Introduced the 'lang_id', 'lang__in', and 'lang__not_in' parameters.
     @since 5.1.0 Introduced the 'update_site_meta_cache', 'meta_query', 'meta_key',
                  'meta_value', 'meta_type' and 'meta_compare' parameters.
    
     @param string|array $query {
         Optional. Array or query string of site query parameters. Default empty.
    
         @type array        $site__in               Array of site IDs to include. Default empty.
         @type array        $site__not_in           Array of site IDs to exclude. Default empty.
         @type bool         $count                  Whether to return a site count (true) or array of site objects.
                                                    Default false.
         @type array        $date_query             Date query clauses to limit sites by. See WP_Date_Query.
                                                    Default null.
         @type string       $fields                 Site fields to return. Accepts 'ids' (returns an array of site IDs)
                                                    or empty (returns an array of complete site objects). Default empty.
         @type int          $ID                     A site ID to only return that site. Default empty.
         @type int          $number                 Maximum number of sites to retrieve. Default 100.
         @type int          $offset                 Number of sites to offset the query. Used to build LIMIT clause.
                                                    Default 0.
         @type bool         $no_found_rows          Whether to disable the `SQL_CALC_FOUND_ROWS` query. Default true.
         @type string|array $orderby                Site status or array of statuses. Accepts 'id', 'domain', 'path',
                                                    'network_id', 'last_updated', 'registered', 'domain_length',
                                                    'path_length', 'site__in' and 'network__in'. Also accepts false,
                                                    an empty array, or 'none' to disable `ORDER BY` clause.
                                                    Default 'id'.
         @type string       $order                  How to order retrieved sites. Accepts 'ASC', 'DESC'. Default 'ASC'.
         @type int          $network_id             Limit results to those affiliated with a given network ID. If 0,
                                                    include all networks. Default 0.
         @type array        $network__in            Array of network IDs to include affiliated sites for. Default empty.
         @type array        $network__not_in        Array of network IDs to exclude affiliated sites for. Default empty.
         @type string       $domain                 Limit results to those affiliated with a given domain. Default empty.
         @type array        $domain__in             Array of domains to include affiliated sites for. Default empty.
         @type array        $domain__not_in         Array of domains to exclude affiliated sites for. Default empty.
         @type string       $path                   Limit results to those affiliated with a given path. Default empty.
         @type array        $path__in               Array of paths to include affiliated sites for. Default empty.
         @type array        $path__not_in           Array of paths to exclude affiliated sites for. Default empty.
         @type int          $public                 Limit results to public sites. Accepts '1' or '0'. Default empty.
         @type int          $archived               Limit results to archived sites. Accepts '1' or '0'. Default empty.
         @type int          $mature                 Limit results to mature sites. Accepts '1' or '0'. Default empty.
         @type int          $spam                   Limit results to spam sites. Accepts '1' or '0'. Default empty.
         @type int          $deleted                Limit results to deleted sites. Accepts '1' or '0'. Default empty.
         @type int          $lang_id                Limit results to a language ID. Default empty.
         @type array        $lang__in               Array of language IDs to include affiliated sites for. Default empty.
         @type array        $lang__not_in           Array of language IDs to exclude affiliated sites for. Default empty.
         @type string       $search                 Search term(s) to retrieve matching sites for. Default empty.
         @type array        $search_columns         Array of column names to be searched. Accepts 'domain' and 'path'.
                                                    Default empty array.
         @type bool         $update_site_cache      Whether to prime the cache for found sites. Default true.
         @type bool         $update_site_meta_cache Whether to prime the metadata cache for found sites. Default true.
         @type array        $meta_query             Meta query clauses to limit retrieved sites by. See `WP_Meta_Query`.
                                                    Default empty.
         @type string       $meta_key               Limit sites to those matching a specific metadata key.
                                                    Can be used in conjunction with `$meta_value`. Default empty.
         @type string       $meta_value             Limit sites to those matching a specific metadata value.
                                                    Usually used in conjunction with `$meta_key`. Default empty.
         @type string       $meta_type              Data type that the `$meta_value` column will be CAST to for
                                                    comparisons. Default empty.
         @type string       $meta_compare           Comparison operator to test the `$meta_value`. Default empty.
     }
    
  **/
  public function new(query:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Void;
  /**
    
     Parses arguments passed to the site query with default query parameters.
    
     @since 4.6.0
    
     @see WP_Site_Query::__construct()
    
     @param string|array $query Array or string of WP_Site_Query arguments. See WP_Site_Query::__construct().
    
  **/
  @:native("parse_query") public function parseQuery(query:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Void;
  /**
    
     Sets up the WordPress query for retrieving sites.
    
     @since 4.6.0
    
     @param string|array $query Array or URL query string of parameters.
     @return array|int List of WP_Site objects, a list of site ids when 'fields' is set to 'ids',
                       or the number of sites when 'count' is passed as a query var.
    
  **/
  @:native("query") public function query(query:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Int>;
  /**
    
     Retrieves a list of sites matching the query vars.
    
     @since 4.6.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @return array|int List of WP_Site objects, a list of site ids when 'fields' is set to 'ids',
                       or the number of sites when 'count' is passed as a query var.
    
  **/
  @:native("get_sites") public function getSites():haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Int>;
}
