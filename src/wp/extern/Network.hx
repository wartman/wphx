package wp.extern;

@:native("WP_Network")
extern class Network {
  /**
    
     Domain of the network.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("domain") public var domain:String;
  /**
    
     Path of the network.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("path") public var path:String;
  /**
    
     Domain used to set cookies for this network.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("cookie_domain") public var cookieDomain:String;
  /**
    
     Name of this network.
    
     Named "site" vs. "network" for legacy reasons.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("site_name") public var siteName:String;
  /**
    
     Retrieve a network from the database by its ID.
    
     @since 4.4.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int $network_id The ID of the network to retrieve.
     @return WP_Network|bool The network's object if found. False if not.
    
  **/
  @:native("get_instance") public static function getInstance(network_id:Int):haxe.extern.EitherType<wp.extern.Network, Bool>;
  /**
    
     Create a new WP_Network object.
    
     Will populate object properties from the object provided and assign other
     default properties based on that information.
    
     @since 4.4.0
    
     @param WP_Network|object $network A network object.
    
  **/
  public function new(network:haxe.extern.EitherType<wp.extern.Network, Dynamic>):Void;
  /**
    
     Getter.
    
     Allows current multisite naming conventions when getting properties.
    
     @since 4.6.0
    
     @param string $key Property to get.
     @return mixed Value of the property. Null if not available.
    
  **/
  @:native("__get") public function __get(key:String):Dynamic;
  /**
    
     Isset-er.
    
     Allows current multisite naming conventions when checking for properties.
    
     @since 4.6.0
    
     @param string $key Property to check if set.
     @return bool Whether the property is set.
    
  **/
  @:native("__isset") public function __isset(key:String):Bool;
  /**
    
     Setter.
    
     Allows current multisite naming conventions while setting properties.
    
     @since 4.6.0
    
     @param string $key   Property to set.
     @param mixed  $value Value to assign to the property.
    
  **/
  @:native("__set") public function __set(key:String, value:Dynamic):Void;
  /**
    
     Retrieve the closest matching network for a domain and path.
    
     This will not necessarily return an exact match for a domain and path. Instead, it
     breaks the domain and path into pieces that are then used to match the closest
     possibility from a query.
    
     The intent of this method is to match a network during bootstrap for a
     requested site address.
    
     @since 4.4.0
    
     @param string   $domain   Domain to check.
     @param string   $path     Path to check.
     @param int|null $segments Path segments to use. Defaults to null, or the full path.
     @return WP_Network|bool Network object if successful. False when no network is found.
    
  **/
  @:native("get_by_path") public static function getByPath(domain:String = '', path:String = '', segments:Int = null):haxe.extern.EitherType<wp.extern.Network, Bool>;
}
