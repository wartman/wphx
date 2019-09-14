package wp.extern;

@:native("WP_Term")
extern class Term {
  /**
    
     Term ID.
    
     @since 4.4.0
     @var int
    
  **/
  @:native("term_id") public var id:Int;
  /**
    
     The term's name.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("name") public var name:String;
  /**
    
     The term's slug.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("slug") public var slug:String;
  /**
    
     The term's term_group.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("term_group") public var group:String;
  /**
    
     Term Taxonomy ID.
    
     @since 4.4.0
     @var int
    
  **/
  @:native("term_taxonomy_id") public var taxonomyId:Int;
  /**
    
     The term's taxonomy name.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("taxonomy") public var taxonomy:String;
  /**
    
     The term's description.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("description") public var description:String;
  /**
    
     ID of a term's parent term.
    
     @since 4.4.0
     @var int
    
  **/
  @:native("parent") public var parent:Int;
  /**
    
     Cached object count for this term.
    
     @since 4.4.0
     @var int
    
  **/
  @:native("count") public var count:Int;
  /**
    
     Stores the term object's sanitization level.
    
     Does not correspond to a database field.
    
     @since 4.4.0
     @var string
    
  **/
  @:native("filter") public var filter:String;
  /**
    
     Retrieve WP_Term instance.
    
     @since 4.4.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int    $term_id  Term ID.
     @param string $taxonomy Optional. Limit matched terms to those matching `$taxonomy`. Only used for
                             disambiguating potentially shared terms.
     @return WP_Term|WP_Error|false Term object, if found. WP_Error if `$term_id` is shared between taxonomies and
                                    there's insufficient data to distinguish which term is intended.
                                    False for other failures.
    
  **/
  @:native("get_instance") public static function getInstance(term_id:Int, taxonomy:String = null):haxe.extern.EitherType<wp.extern.Term, haxe.extern.EitherType<wp.extern.Error, Bool>>;
  /**
    
     Constructor.
    
     @since 4.4.0
    
     @param WP_Term|object $term Term object.
    
  **/
  public function new(term:haxe.extern.EitherType<wp.extern.Term, Dynamic>):Void;
  /**
    
     Sanitizes term fields, according to the filter type provided.
    
     @since 4.4.0
    
     @param string $filter Filter context. Accepts 'edit', 'db', 'display', 'attribute', 'js', 'raw'.
    
  **/
  @:native("filter") public function getFilter(filter:String):Void;
  /**
    
     Converts an object to array.
    
     @since 4.4.0
    
     @return array Object as array.
    
  **/
  @:native("to_array") public function toArray():php.NativeArray;
  /**
    
     Getter.
    
     @since 4.4.0
    
     @param string $key Property to get.
     @return mixed Property value.
    
  **/
  @:native("__get") public function __get(key:String):Dynamic;
}
