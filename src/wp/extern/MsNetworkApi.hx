package wp.extern;

extern class MsNetworkApi implements wp.util.ApiFunctions {
  /**
    
     Retrieves network data given a network ID or network object.
    
     Network data will be cached and returned after being passed through a filter.
     If the provided network is empty, the current network global will be used.
    
     @since 4.6.0
    
     @global WP_Network $current_site
    
     @param WP_Network|int|null $network Optional. Network to retrieve. Default is the current network.
     @return WP_Network|null The network object or null if not found.
    
  **/
  public function get_network(network:haxe.extern.EitherType<wp.extern.Network, Int> = null):wp.extern.Network;
  /**
    
     Retrieves a list of networks.
    
     @since 4.6.0
    
     @param string|array $args Optional. Array or string of arguments. See WP_Network_Query::parse_query()
                               for information on accepted arguments. Default empty array.
     @return array|int List of WP_Network objects, a list of network ids when 'fields' is set to 'ids',
                       or the number of networks when 'count' is passed as a query var.
    
  **/
  public function get_networks(?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Int>;
  /**
    
     Removes a network from the object cache.
    
     @since 4.6.0
    
     @global bool $_wp_suspend_cache_invalidation
    
     @param int|array $ids Network ID or an array of network IDs to remove from cache.
    
  **/
  public function clean_network_cache(ids:haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>>):Void;
  /**
    
     Updates the network cache of given networks.
    
     Will add the networks in $networks to the cache. If network ID already exists
     in the network cache then it will not be updated. The network is added to the
     cache using the network group with the key using the ID of the networks.
    
     @since 4.6.0
    
     @param array $networks Array of network row objects.
    
  **/
  public function update_network_cache(networks:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Adds any networks from the given IDs to the cache that do not already exist in cache.
    
     @since 4.6.0
     @access private
    
     @see update_network_cache()
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array $network_ids Array of network IDs.
    
  **/
  public function _prime_network_caches(network_ids:php.NativeStructArray<Dynamic>):Void;
}
