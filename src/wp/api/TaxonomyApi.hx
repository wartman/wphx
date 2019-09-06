package wp.api;

import php.NativeArray;
import php.NativeStructArray;
import haxe.extern.EitherType;
import wp.WpError;
import wp.Post;
import wp.Taxonomy;
import wp.Term;
import wp.api.Types;

// For wp-includes/taxonomy.php
extern class TaxonomyApi implements Api {
  function create_initial_taxonomies():Void;
  function get_taxonomies(args:NativeStructArray<Dynamic>, output:String = 'names', op:String = 'and'):NativeArray;
  function get_object_taxonomies(object:EitherType<Post, String>, output:String = 'names'):NativeArray;
  function get_taxonomy(taxonomy:String):EitherType<Taxonomy, Bool>;
  function taxonomy_exists(taxonomy:String):Bool;
  function is_taxonomy_hierarchical(taxonomy:String):Bool;
  function register_taxonomy(taxonomy:String, object_type:String, args:NativeStructArray<Dynamic>):Null<WpError>;
  function unregister_taxonomy(taxonomy:String):EitherType<Bool, WpError>;
  function get_taxonomy_labels(tax:Taxonomy):Dynamic;
  function register_taxonomy_for_object_type(taxonomy:String, object_type:String):Bool;
  function unregister_taxonomy_for_object_type(taxonomy:String, object_type:String):Bool;
  function get_objects_in_term(term_ids:EitherType<Int, Array<Int>>, taxonomies:EitherType<String, NativeArray>, args:NativeStructArray<Dynamic>):EitherType<WpError, NativeArray>;
  function get_tax_sql(tax_query:NativeArray, primary_table:String, primary_id_column:String):NativeArray;
  // function get_term(term:EitherType<Int, Term>, taxonomy:String = '', $output = OBJECT, $filter = 'raw' )
  function get_term(term:EitherType<Int, Term>, taxonomy:String = ''):EitherType<Term, WpError>;
  // function get_term_by(field:String, value:EitherType<String, Int>, taxonomy:String = '', output = OBJECT, $filter = 'raw' )
  function get_term_by(field:String, value:EitherType<String, Int>, taxonomy:String = ''):EitherType<Term, Bool>;
  function get_term_children(term_id:Int, taxonomy:String):EitherType<NativeArray, WpError>;
  function get_term_field(field:String, term:EitherType<Int, Term>, taxonomy:String = '', context:String = 'display'):Null<MaybeError<StringOrInt>>;
  function get_term_to_edit(id:EitherType<Int, Term>, taxonomy:String):Null<MaybeError<StringOrInt>>;
  function get_terms(args:NativeStructArray<Dynamic>):MaybeError<EitherType<NativeArray, Int>>;
  function add_term_meta(term_id:Int, meta_key:String, meta_value:Dynamic, unique:Bool = false):MaybeError<EitherType<Int, Bool>>;
  function delete_term_meta(term_id:Int, meta_key:String, meta_value:Dynamic = ''):Bool;
  function get_term_meta(term_id:Int, key:String = '', single:Bool = false):Dynamic;
  function update_term_meta(term_id:Int, meta_key:String, meta_value:Dynamic, prev_value:Dynamic = ''):MaybeError<EitherType<Int, Bool>>;
  function update_termmeta_cache(term_ids:NativeArray):EitherType<NativeArray, Bool>;
  function has_term_meta(term_id:Int):EitherType<NativeArray, Bool>;
  function register_term_meta(taxonomy:String, meta_key:String, args:NativeStructArray<Dynamic>):Bool;
  function unregister_term_meta(taxonomy:String, meta_key:String):Bool;
  function term_exists(term:String, taxonomy:String = '', ?parent:Int):Dynamic;
  function term_is_ancestor_of(term1:EitherType<Int, Term>, term2:EitherType<Int, Term>, taxonomy:String):Bool;
  function sanitize_term(term:Dynamic, taxonomy:String, context:String = 'display'):Dynamic;
  function sanitize_term_field(field:String, value:String, term_id:Int, taxonomy:String, context:String):Dynamic;
  function wp_count_terms(taxonomy:String, args:NativeStructArray<Dynamic>):MaybeError<EitherType<NativeArray, Int>>;
  function wp_delete_object_term_relationships(object_id:Int, taxonomies:EitherType<String, NativeArray>):Void;
  function wp_delete_term(term:Int, taxonomy:String, args:NativeStructArray<Dynamic>):MaybeError<EitherType<Int, Bool>>;
  function wp_delete_category(cat_ID:Int):MaybeError<EitherType<Int, Bool>>;
  function wp_get_object_terms(object_ids:EitherType<Int, NativeArray>, taxonomies:EitherType<String, NativeArray>, args:NativeStructArray<Dynamic>):MaybeError<NativeArray>;
  function wp_insert_term(term:String, taxonomy:String, args:NativeStructArray<{
    ?alias_of:String,
    ?description:String,
    ?parent:Int,
    ?slug:String
  }>):MaybeError<NativeStructArray<{ term_id:Int, term_taxonomy_id:Int }>>;
  function wp_set_object_terms(object_id:Int, terms:EitherType<EitherType<Int, String>, NativeArray>, taxonomy:String, append:Bool = false):MaybeError<NativeArray>;
  function wp_add_object_terms(object_id:Int, terms:EitherType<EitherType<Int, String>, NativeArray>, taxonomy:EitherType<String, NativeArray>):MaybeError<NativeArray>;
  function wp_remove_object_terms(object_id:Int, terms:EitherType<EitherType<Int, String>, NativeArray>, taxonomy:EitherType<String, NativeArray>):MaybeError<Bool>;
  function wp_unique_term_slug(slug:String, term:Term):String;
  function wp_update_term(term_id:Int, taxonomy:String, args:NativeStructArray<Dynamic>):MaybeError<NativeStructArray<{ term_id:Int, term_taxonomy_id:Int }>>;
  function wp_defer_term_counting(?defer:Bool):Bool;
  function wp_update_term_count(terms:EitherType<NativeArray, Int>, taxonomy:String, do_deferred:Bool = false):Bool;
  function wp_update_term_count_now(terms:EitherType<NativeArray, Int>, taxonomy:String):Bool;
  function clean_object_term_cache(object_ids:EitherType<Int, NativeArray>, object_type:EitherType<NativeArray, String>):Void;
  function clean_term_cache(ids:EitherType<Int, NativeArray>, taxonomy:String = '', clean_taxonomy:Bool = true):Void;
  function clean_taxonomy_cache(taxonomy:String):Void;
  function get_object_term_cache(id:Int, taxonomy:String):MaybeError<EitherType<NativeArray, Bool>>;
  function update_object_term_cache(object_ids:EitherType<String, NativeArray>, object_type:EitherType<String, NativeArray>):Null<Bool>;
  function update_term_cache(terms:NativeArray, taxonomy:String = ''):Void;
  function wp_get_split_terms(old_term_id:Int):NativeArray;
  function wp_get_split_term(old_term_id:Int, taxonomy:String):EitherType<Int, Bool>;
  function wp_term_is_shared(term_id:Int):Bool;
  function get_term_link(term:EitherType<StringOrInt, Term>, taxonomy:String = ''):MaybeError<String>;
  function the_taxonomies(args:NativeStructArray<Dynamic>):Void;
  function get_the_taxonomies(post:EitherType<Int, Post> = 0, ?args:NativeStructArray<{ ?template:String, ?term_template:String }>):NativeArray;
  function get_post_taxonomies(post:EitherType<Int, Post> = 0):NativeArray;
  function is_object_in_term(object_id:Int, taxonomy:String, ?terms:EitherType<StringOrInt, NativeArray>):MaybeError<Bool>;
  function is_object_in_taxonomy(object_type:String, taxonomy:String):Bool;
  function get_ancestors(object_id:Int = 0, object_type:String = '', resource_type:String = ''):NativeArray;
  function wp_get_term_taxonomy_parent_id(term_id:Int, taxonomy:String):EitherType<Int, Bool>;
  function wp_check_term_hierarchy_for_loops(parent:Int, term_id:Int, taxonomy:String):Int;
}
