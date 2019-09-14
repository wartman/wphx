package wp.extern;

@:native("WP_Site")
extern class Site {
  /**
    
     Site ID.
    
     A numeric string, for compatibility reasons.
    
     @since 4.5.0
     @var string
    
  **/
  @:native("blog_id") public var blogId:String;
  /**
    
     Domain of the site.
    
     @since 4.5.0
     @var string
    
  **/
  @:native("domain") public var domain:String;
  /**
    
     Path of the site.
    
     @since 4.5.0
     @var string
    
  **/
  @:native("path") public var path:String;
  /**
    
     The ID of the site's parent network.
    
     Named "site" vs. "network" for legacy reasons. An individual site's "site" is
     its network.
    
     A numeric string, for compatibility reasons.
    
     @since 4.5.0
     @var string
    
  **/
  @:native("site_id") public var id:String;
  /**
    
     The date on which the site was created or registered.
    
     @since 4.5.0
     @var string Date in MySQL's datetime format.
    
  **/
  @:native("registered") public var registered:String;
  /**
    
     The date and time on which site settings were last updated.
    
     @since 4.5.0
     @var string Date in MySQL's datetime format.
    
  **/
  @:native("last_updated") public var lastUpdated:String;
  /**
    
     Whether the site should be treated as public.
    
     A numeric string, for compatibility reasons.
    
     @since 4.5.0
     @var string
    
  **/
  @:native("public") public var public_:String;
  /**
    
     Whether the site should be treated as archived.
    
     A numeric string, for compatibility reasons.
    
     @since 4.5.0
     @var string
    
  **/
  @:native("archived") public var archived:String;
  /**
    
     Whether the site should be treated as mature.
    
     Handling for this does not exist throughout WordPress core, but custom
     implementations exist that require the property to be present.
    
     A numeric string, for compatibility reasons.
    
     @since 4.5.0
     @var string
    
  **/
  @:native("mature") public var mature:String;
  /**
    
     Whether the site should be treated as spam.
    
     A numeric string, for compatibility reasons.
    
     @since 4.5.0
     @var string
    
  **/
  @:native("spam") public var spam:String;
  /**
    
     Whether the site should be treated as deleted.
    
     A numeric string, for compatibility reasons.
    
     @since 4.5.0
     @var string
    
  **/
  @:native("deleted") public var deleted:String;
  /**
    
     The language pack associated with this site.
    
     A numeric string, for compatibility reasons.
    
     @since 4.5.0
     @var string
    
  **/
  @:native("lang_id") public var langId:String;
  /**
    
     Retrieves a site from the database by its ID.
    
     @since 4.5.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int $site_id The ID of the site to retrieve.
     @return WP_Site|false The site's object if found. False if not.
    
  **/
  @:native("get_instance") public static function getInstance(site_id:Int):haxe.extern.EitherType<wp.extern.Site, Bool>;
  /**
    
     Creates a new WP_Site object.
    
     Will populate object properties from the object provided and assign other
     default properties based on that information.
    
     @since 4.5.0
    
     @param WP_Site|object $site A site object.
    
  **/
  public function new(site:haxe.extern.EitherType<wp.extern.Site, Dynamic>):Void;
  /**
    
     Converts an object to array.
    
     @since 4.6.0
    
     @return array Object as array.
    
  **/
  @:native("to_array") public function toArray():php.NativeArray;
  /**
    
     Getter.
    
     Allows current multisite naming conventions when getting properties.
     Allows access to extended site properties.
    
     @since 4.6.0
    
     @param string $key Property to get.
     @return mixed Value of the property. Null if not available.
    
  **/
  @:native("__get") public function __get(key:String):Dynamic;
  /**
    
     Isset-er.
    
     Allows current multisite naming conventions when checking for properties.
     Checks for extended site properties.
    
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
}
