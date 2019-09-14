package wp.extern;

@:native("WP_Network_Query")
extern class NetworkQuery {
  /**
    
     SQL for database query.
    
     @since 4.6.0
     @var string
    
  **/
  @:native("request") public var request:String;
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
    
     List of networks located by the query.
    
     @since 4.6.0
     @var array
    
  **/
  @:native("networks") public var networks:php.NativeStructArray<Dynamic>;
  /**
    
     The amount of found networks for the current query.
    
     @since 4.6.0
     @var int
    
  **/
  @:native("found_networks") public var foundNetworks:Int;
  /**
    
     The number of pages.
    
     @since 4.6.0
     @var int
    
  **/
  @:native("max_num_pages") public var maxNumPages:Int;
  /**
    
     Constructor.
    
     Sets up the network query, based on the query vars passed.
    
     @since 4.6.0
    
     @param string|array $query {
         Optional. Array or query string of network query parameters. Default empty.
    
         @type array        $network__in          Array of network IDs to include. Default empty.
         @type array        $network__not_in      Array of network IDs to exclude. Default empty.
         @type bool         $count                Whether to return a network count (true) or array of network objects.
                                                  Default false.
         @type string       $fields               Network fields to return. Accepts 'ids' (returns an array of network IDs)
                                                  or empty (returns an array of complete network objects). Default empty.
         @type int          $number               Maximum number of networks to retrieve. Default empty (no limit).
         @type int          $offset               Number of networks to offset the query. Used to build LIMIT clause.
                                                  Default 0.
         @type bool         $no_found_rows        Whether to disable the `SQL_CALC_FOUND_ROWS` query. Default true.
         @type string|array $orderby              Network status or array of statuses. Accepts 'id', 'domain', 'path',
                                                  'domain_length', 'path_length' and 'network__in'. Also accepts false,
                                                  an empty array, or 'none' to disable `ORDER BY` clause. Default 'id'.
         @type string       $order                How to order retrieved networks. Accepts 'ASC', 'DESC'. Default 'ASC'.
         @type string       $domain               Limit results to those affiliated with a given domain. Default empty.
         @type array        $domain__in           Array of domains to include affiliated networks for. Default empty.
         @type array        $domain__not_in       Array of domains to exclude affiliated networks for. Default empty.
         @type string       $path                 Limit results to those affiliated with a given path. Default empty.
         @type array        $path__in             Array of paths to include affiliated networks for. Default empty.
         @type array        $path__not_in         Array of paths to exclude affiliated networks for. Default empty.
         @type string       $search               Search term(s) to retrieve matching networks for. Default empty.
         @type bool         $update_network_cache Whether to prime the cache for found networks. Default true.
     }
    
  **/
  public function new(query:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Void;
  /**
    
     Parses arguments passed to the network query with default query parameters.
    
     @since 4.6.0
    
     @param string|array $query WP_Network_Query arguments. See WP_Network_Query::__construct()
    
  **/
  @:native("parse_query") public function parseQuery(query:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Void;
  /**
    
     Sets up the WordPress query for retrieving networks.
    
     @since 4.6.0
    
     @param string|array $query Array or URL query string of parameters.
     @return array|int List of WP_Network objects, a list of network ids when 'fields' is set to 'ids',
                       or the number of networks when 'count' is passed as a query var.
    
  **/
  @:native("query") public function query(query:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Int>;
  /**
    
     Gets a list of networks matching the query vars.
    
     @since 4.6.0
    
     @return array|int List of WP_Network objects, a list of network ids when 'fields' is set to 'ids',
                       or the number of networks when 'count' is passed as a query var.
    
  **/
  @:native("get_networks") public function getNetworks():haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Int>;
}
