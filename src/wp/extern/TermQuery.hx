package wp.extern;

@:native("WP_Term_Query")
extern class TermQuery {
  /**
    
     SQL string used to perform database query.
    
     @since 4.6.0
     @var string
    
  **/
  @:native("request") public var request:String;
  /**
    
     Metadata query container.
    
     @since 4.6.0
     @var object WP_Meta_Query
    
  **/
  @:native("meta_query") public var metaQuery:Dynamic;
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
    
     List of terms located by the query.
    
     @since 4.6.0
     @var array
    
  **/
  @:native("terms") public var terms:php.NativeStructArray<Dynamic>;
  /**
    
     Constructor.
    
     Sets up the term query, based on the query vars passed.
    
     @since 4.6.0
     @since 4.6.0 Introduced 'term_taxonomy_id' parameter.
     @since 4.7.0 Introduced 'object_ids' parameter.
     @since 4.9.0 Added 'slug__in' support for 'orderby'.
    
     @param string|array $query {
         Optional. Array or query string of term query parameters. Default empty.
    
         @type string|array $taxonomy               Taxonomy name, or array of taxonomies, to which results should
                                                    be limited.
         @type int|array    $object_ids             Optional. Object ID, or array of object IDs. Results will be
                                                    limited to terms associated with these objects.
         @type string       $orderby                Field(s) to order terms by. Accepts term fields ('name',
                                                    'slug', 'term_group', 'term_id', 'id', 'description', 'parent'),
                                                    'count' for term taxonomy count, 'include' to match the
                                                    'order' of the $include param, 'slug__in' to match the
                                                    'order' of the $slug param, 'meta_value', 'meta_value_num',
                                                    the value of `$meta_key`, the array keys of `$meta_query`, or
                                                    'none' to omit the ORDER BY clause. Defaults to 'name'.
         @type string       $order                  Whether to order terms in ascending or descending order.
                                                    Accepts 'ASC' (ascending) or 'DESC' (descending).
                                                    Default 'ASC'.
         @type bool|int     $hide_empty             Whether to hide terms not assigned to any posts. Accepts
                                                    1|true or 0|false. Default 1|true.
         @type array|string $include                Array or comma/space-separated string of term ids to include.
                                                    Default empty array.
         @type array|string $exclude                Array or comma/space-separated string of term ids to exclude.
                                                    If $include is non-empty, $exclude is ignored.
                                                    Default empty array.
         @type array|string $exclude_tree           Array or comma/space-separated string of term ids to exclude
                                                    along with all of their descendant terms. If $include is
                                                    non-empty, $exclude_tree is ignored. Default empty array.
         @type int|string   $number                 Maximum number of terms to return. Accepts ''|0 (all) or any
                                                    positive number. Default ''|0 (all). Note that $number may
                                                    not return accurate results when coupled with $object_ids.
                                                    See #41796 for details.
         @type int          $offset                 The number by which to offset the terms query. Default empty.
         @type string       $fields                 Term fields to query for. Accepts 'all' (returns an array of
                                                    complete term objects), 'all_with_object_id' (returns an
                                                    array of term objects with the 'object_id' param; works only
                                                    when the `$object_ids` parameter is populated), 'ids'
                                                    (returns an array of ids), 'tt_ids' (returns an array of
                                                    term taxonomy ids), 'id=>parent' (returns an associative
                                                    array with ids as keys, parent term IDs as values), 'names'
                                                    (returns an array of term names), 'count' (returns the number
                                                    of matching terms), 'id=>name' (returns an associative array
                                                    with ids as keys, term names as values), or 'id=>slug'
                                                    (returns an associative array with ids as keys, term slugs
                                                    as values). Default 'all'.
         @type bool         $count                  Whether to return a term count (true) or array of term objects
                                                    (false). Will take precedence over `$fields` if true.
                                                    Default false.
         @type string|array $name                   Optional. Name or array of names to return term(s) for.
                                                    Default empty.
         @type string|array $slug                   Optional. Slug or array of slugs to return term(s) for.
                                                    Default empty.
         @type int|array    $term_taxonomy_id       Optional. Term taxonomy ID, or array of term taxonomy IDs,
                                                    to match when querying terms.
         @type bool         $hierarchical           Whether to include terms that have non-empty descendants (even
                                                    if $hide_empty is set to true). Default true.
         @type string       $search                 Search criteria to match terms. Will be SQL-formatted with
                                                    wildcards before and after. Default empty.
         @type string       $name__like             Retrieve terms with criteria by which a term is LIKE
                                                    `$name__like`. Default empty.
         @type string       $description__like      Retrieve terms where the description is LIKE
                                                    `$description__like`. Default empty.
         @type bool         $pad_counts             Whether to pad the quantity of a term's children in the
                                                    quantity of each term's "count" object variable.
                                                    Default false.
         @type string       $get                    Whether to return terms regardless of ancestry or whether the
                                                    terms are empty. Accepts 'all' or empty (disabled).
                                                    Default empty.
         @type int          $child_of               Term ID to retrieve child terms of. If multiple taxonomies
                                                    are passed, $child_of is ignored. Default 0.
         @type int|string   $parent                 Parent term ID to retrieve direct-child terms of.
                                                    Default empty.
         @type bool         $childless              True to limit results to terms that have no children.
                                                    This parameter has no effect on non-hierarchical taxonomies.
                                                    Default false.
         @type string       $cache_domain           Unique cache key to be produced when this query is stored in
                                                    an object cache. Default is 'core'.
         @type bool         $update_term_meta_cache Whether to prime meta caches for matched terms. Default true.
         @type array        $meta_query             Optional. Meta query clauses to limit retrieved terms by.
                                                    See `WP_Meta_Query`. Default empty.
         @type string       $meta_key               Limit terms to those matching a specific metadata key.
                                                    Can be used in conjunction with `$meta_value`. Default empty.
         @type string       $meta_value             Limit terms to those matching a specific metadata value.
                                                    Usually used in conjunction with `$meta_key`. Default empty.
         @type string       $meta_type              MySQL data type that the `$meta_value` will be CAST to for
                                                    comparisons. Default empty.
         @type string       $meta_compare           Comparison operator to test the 'meta_value'. Default empty.
     }
    
  **/
  public function new(query:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Void;
  /**
    
     Parse arguments passed to the term query with default query parameters.
    
     @since 4.6.0
    
     @param string|array $query WP_Term_Query arguments. See WP_Term_Query::__construct()
    
  **/
  @:native("parse_query") public function parseQuery(query:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):Void;
  /**
    
     Sets up the query for retrieving terms.
    
     @since 4.6.0
    
     @param string|array $query Array or URL query string of parameters.
     @return array|int List of terms, or number of terms when 'count' is passed as a query var.
    
  **/
  @:native("query") public function query(query:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Int>;
  /**
    
     Get terms, based on query_vars.
    
     @since 4.6.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @return array List of terms.
    
  **/
  @:native("get_terms") public function getTerms():php.NativeArray;
}
