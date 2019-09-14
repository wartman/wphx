package wp.extern;

extern class TaxonomyApi implements wp.util.ApiFunctions {
  /**
    
     Creates the initial taxonomies.
    
     This function fires twice: in wp-settings.php before plugins are loaded (for
     backward compatibility reasons), and again on the {@see 'init'} action. We must
     avoid registering rewrite rules before the {@see 'init'} action.
    
     @since 2.8.0
    
     @global WP_Rewrite $wp_rewrite The WordPress rewrite class.
    
  **/
  public function create_initial_taxonomies():Void;
  /**
    
     Retrieves a list of registered taxonomy names or objects.
    
     @since 3.0.0
    
     @global array $wp_taxonomies The registered taxonomies.
    
     @param array  $args     Optional. An array of `key => value` arguments to match against the taxonomy objects.
                             Default empty array.
     @param string $output   Optional. The type of output to return in the array. Accepts either taxonomy 'names'
                             or 'objects'. Default 'names'.
     @param string $operator Optional. The logical operation to perform. Accepts 'and' or 'or'. 'or' means only
                             one element from the array needs to match; 'and' means all elements must match.
                             Default 'and'.
     @return string[]|WP_Taxonomy[] An array of taxonomy names or objects.
    
  **/
  public function get_taxonomies(?args:php.NativeStructArray<Dynamic>, output:String = 'names', operator_:String = 'and'):haxe.extern.EitherType<php.NativeIndexedArray<String>, php.NativeIndexedArray<wp.extern.Taxonomy>>;
  /**
    
     Return the names or objects of the taxonomies which are registered for the requested object or object type, such as
     a post object or post type name.
    
     Example:
    
         $taxonomies = get_object_taxonomies( 'post' );
    
     This results in:
    
         Array( 'category', 'post_tag' )
    
     @since 2.3.0
    
     @global array $wp_taxonomies The registered taxonomies.
    
     @param array|string|WP_Post $object Name of the type of taxonomy object, or an object (row from posts)
     @param string               $output Optional. The type of output to return in the array. Accepts either
                                         taxonomy 'names' or 'objects'. Default 'names'.
     @return array The names of all taxonomy of $object_type.
    
  **/
  public function get_object_taxonomies(object:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, haxe.extern.EitherType<String, wp.extern.Post>>, output:String = 'names'):php.NativeArray;
  /**
    
     Retrieves the taxonomy object of $taxonomy.
    
     The get_taxonomy function will first check that the parameter string given
     is a taxonomy object and if it is, it will return it.
    
     @since 2.3.0
    
     @global array $wp_taxonomies The registered taxonomies.
    
     @param string $taxonomy Name of taxonomy object to return.
     @return WP_Taxonomy|false The Taxonomy Object or false if $taxonomy doesn't exist.
    
  **/
  public function get_taxonomy(taxonomy:String):haxe.extern.EitherType<wp.extern.Taxonomy, Bool>;
  /**
    
     Determines whether the taxonomy name exists.
    
     Formerly is_taxonomy(), introduced in 2.3.0.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 3.0.0
    
     @global array $wp_taxonomies The registered taxonomies.
    
     @param string $taxonomy Name of taxonomy object.
     @return bool Whether the taxonomy exists.
    
  **/
  public function taxonomy_exists(taxonomy:String):Bool;
  /**
    
     Determines whether the taxonomy object is hierarchical.
    
     Checks to make sure that the taxonomy is an object first. Then Gets the
     object, and finally returns the hierarchical value in the object.
    
     A false return value might also mean that the taxonomy does not exist.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 2.3.0
    
     @param string $taxonomy Name of taxonomy object.
     @return bool Whether the taxonomy is hierarchical.
    
  **/
  public function is_taxonomy_hierarchical(taxonomy:String):Bool;
  /**
    
     Creates or modifies a taxonomy object.
    
     Note: Do not use before the {@see 'init'} hook.
    
     A simple function for creating or modifying a taxonomy object based on
     the parameters given. If modifying an existing taxonomy object, note
     that the `$object_type` value from the original registration will be
     overwritten.
    
     @since 2.3.0
     @since 4.2.0 Introduced `show_in_quick_edit` argument.
     @since 4.4.0 The `show_ui` argument is now enforced on the term editing screen.
     @since 4.4.0 The `public` argument now controls whether the taxonomy can be queried on the front end.
     @since 4.5.0 Introduced `publicly_queryable` argument.
     @since 4.7.0 Introduced `show_in_rest`, 'rest_base' and 'rest_controller_class'
                  arguments to register the Taxonomy in REST API.
     @since 5.1.0 Introduced `meta_box_sanitize_cb` argument.
    
     @global array $wp_taxonomies Registered taxonomies.
    
     @param string       $taxonomy    Taxonomy key, must not exceed 32 characters.
     @param array|string $object_type Object type or array of object types with which the taxonomy should be associated.
     @param array|string $args        {
         Optional. Array or query string of arguments for registering a taxonomy.
    
         @type array         $labels                An array of labels for this taxonomy. By default, Tag labels are
                                                    used for non-hierarchical taxonomies, and Category labels are used
                                                    for hierarchical taxonomies. See accepted values in
                                                    get_taxonomy_labels(). Default empty array.
         @type string        $description           A short descriptive summary of what the taxonomy is for. Default empty.
         @type bool          $public                Whether a taxonomy is intended for use publicly either via
                                                    the admin interface or by front-end users. The default settings
                                                    of `$publicly_queryable`, `$show_ui`, and `$show_in_nav_menus`
                                                    are inherited from `$public`.
         @type bool          $publicly_queryable    Whether the taxonomy is publicly queryable.
                                                    If not set, the default is inherited from `$public`
         @type bool          $hierarchical          Whether the taxonomy is hierarchical. Default false.
         @type bool          $show_ui               Whether to generate and allow a UI for managing terms in this taxonomy in
                                                    the admin. If not set, the default is inherited from `$public`
                                                    (default true).
         @type bool          $show_in_menu          Whether to show the taxonomy in the admin menu. If true, the taxonomy is
                                                    shown as a submenu of the object type menu. If false, no menu is shown.
                                                    `$show_ui` must be true. If not set, default is inherited from `$show_ui`
                                                    (default true).
         @type bool          $show_in_nav_menus     Makes this taxonomy available for selection in navigation menus. If not
                                                    set, the default is inherited from `$public` (default true).
         @type bool          $show_in_rest          Whether to include the taxonomy in the REST API.
         @type string        $rest_base             To change the base url of REST API route. Default is $taxonomy.
         @type string        $rest_controller_class REST API Controller class name. Default is 'WP_REST_Terms_Controller'.
         @type bool          $show_tagcloud         Whether to list the taxonomy in the Tag Cloud Widget controls. If not set,
                                                    the default is inherited from `$show_ui` (default true).
         @type bool          $show_in_quick_edit    Whether to show the taxonomy in the quick/bulk edit panel. It not set,
                                                    the default is inherited from `$show_ui` (default true).
         @type bool          $show_admin_column     Whether to display a column for the taxonomy on its post type listing
                                                    screens. Default false.
         @type bool|callable $meta_box_cb           Provide a callback function for the meta box display. If not set,
                                                    post_categories_meta_box() is used for hierarchical taxonomies, and
                                                    post_tags_meta_box() is used for non-hierarchical. If false, no meta
                                                    box is shown.
         @type callable      $meta_box_sanitize_cb  Callback function for sanitizing taxonomy data saved from a meta
                                                    box. If no callback is defined, an appropriate one is determined
                                                    based on the value of `$meta_box_cb`.
         @type array         $capabilities {
             Array of capabilities for this taxonomy.
    
             @type string $manage_terms Default 'manage_categories'.
             @type string $edit_terms   Default 'manage_categories'.
             @type string $delete_terms Default 'manage_categories'.
             @type string $assign_terms Default 'edit_posts'.
         }
         @type bool|array    $rewrite {
             Triggers the handling of rewrites for this taxonomy. Default true, using $taxonomy as slug. To prevent
             rewrite, set to false. To specify rewrite rules, an array can be passed with any of these keys:
    
             @type string $slug         Customize the permastruct slug. Default `$taxonomy` key.
             @type bool   $with_front   Should the permastruct be prepended with WP_Rewrite::$front. Default true.
             @type bool   $hierarchical Either hierarchical rewrite tag or not. Default false.
             @type int    $ep_mask      Assign an endpoint mask. Default `EP_NONE`.
         }
         @type string        $query_var             Sets the query var key for this taxonomy. Default `$taxonomy` key. If
                                                    false, a taxonomy cannot be loaded at `?{query_var}={term_slug}`. If a
                                                    string, the query `?{query_var}={term_slug}` will be valid.
         @type callable      $update_count_callback Works much like a hook, in that it will be called when the count is
                                                    updated. Default _update_post_term_count() for taxonomies attached
                                                    to post types, which confirms that the objects are published before
                                                    counting them. Default _update_generic_term_count() for taxonomies
                                                    attached to other object types, such as users.
         @type bool          $_builtin              This taxonomy is a "built-in" taxonomy. INTERNAL USE ONLY!
                                                    Default false.
     }
     @return WP_Error|void WP_Error, if errors.
    
  **/
  public function register_taxonomy(taxonomy:String, object_type:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>, ?args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):wp.extern.Error;
  /**
    
     Unregisters a taxonomy.
    
     Can not be used to unregister built-in taxonomies.
    
     @since 4.5.0
    
     @global WP    $wp            Current WordPress environment instance.
     @global array $wp_taxonomies List of taxonomies.
    
     @param string $taxonomy Taxonomy name.
     @return bool|WP_Error True on success, WP_Error on failure or if the taxonomy doesn't exist.
    
  **/
  public function unregister_taxonomy(taxonomy:String):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Builds an object with all taxonomy labels out of a taxonomy object.
    
     @since 3.0.0
     @since 4.3.0 Added the `no_terms` label.
     @since 4.4.0 Added the `items_list_navigation` and `items_list` labels.
     @since 4.9.0 Added the `most_used` and `back_to_items` labels.
    
     @param WP_Taxonomy $tax Taxonomy object.
     @return object {
         Taxonomy labels object. The first default value is for non-hierarchical taxonomies
         (like tags) and the second one is for hierarchical taxonomies (like categories).
    
         @type string $name                       General name for the taxonomy, usually plural. The same
                                                  as and overridden by `$tax->label`. Default 'Tags'/'Categories'.
         @type string $singular_name              Name for one object of this taxonomy. Default 'Tag'/'Category'.
         @type string $search_items               Default 'Search Tags'/'Search Categories'.
         @type string $popular_items              This label is only used for non-hierarchical taxonomies.
                                                  Default 'Popular Tags'.
         @type string $all_items                  Default 'All Tags'/'All Categories'.
         @type string $parent_item                This label is only used for hierarchical taxonomies. Default
                                                  'Parent Category'.
         @type string $parent_item_colon          The same as `parent_item`, but with colon `:` in the end.
         @type string $edit_item                  Default 'Edit Tag'/'Edit Category'.
         @type string $view_item                  Default 'View Tag'/'View Category'.
         @type string $update_item                Default 'Update Tag'/'Update Category'.
         @type string $add_new_item               Default 'Add New Tag'/'Add New Category'.
         @type string $new_item_name              Default 'New Tag Name'/'New Category Name'.
         @type string $separate_items_with_commas This label is only used for non-hierarchical taxonomies. Default
                                                  'Separate tags with commas', used in the meta box.
         @type string $add_or_remove_items        This label is only used for non-hierarchical taxonomies. Default
                                                  'Add or remove tags', used in the meta box when JavaScript
                                                  is disabled.
         @type string $choose_from_most_used      This label is only used on non-hierarchical taxonomies. Default
                                                  'Choose from the most used tags', used in the meta box.
         @type string $not_found                  Default 'No tags found'/'No categories found', used in
                                                  the meta box and taxonomy list table.
         @type string $no_terms                   Default 'No tags'/'No categories', used in the posts and media
                                                  list tables.
         @type string $items_list_navigation      Label for the table pagination hidden heading.
         @type string $items_list                 Label for the table hidden heading.
         @type string $most_used                  Title for the Most Used tab. Default 'Most Used'.
         @type string $back_to_items              Label displayed after a term has been updated.
     }
    
  **/
  public function get_taxonomy_labels(tax:wp.extern.Taxonomy):Dynamic;
  /**
    
     Add an already registered taxonomy to an object type.
    
     @since 3.0.0
    
     @global array $wp_taxonomies The registered taxonomies.
    
     @param string $taxonomy    Name of taxonomy object.
     @param string $object_type Name of the object type.
     @return bool True if successful, false if not.
    
  **/
  public function register_taxonomy_for_object_type(taxonomy:String, object_type:String):Bool;
  /**
    
     Remove an already registered taxonomy from an object type.
    
     @since 3.7.0
    
     @global array $wp_taxonomies The registered taxonomies.
    
     @param string $taxonomy    Name of taxonomy object.
     @param string $object_type Name of the object type.
     @return bool True if successful, false if not.
    
  **/
  public function unregister_taxonomy_for_object_type(taxonomy:String, object_type:String):Bool;
  /**
    
     Retrieve object_ids of valid taxonomy and term.
    
     The strings of $taxonomies must exist before this function will continue. On
     failure of finding a valid taxonomy, it will return an WP_Error class, kind
     of like Exceptions in PHP 5, except you can't catch them. Even so, you can
     still test for the WP_Error class and get the error message.
    
     The $terms aren't checked the same as $taxonomies, but still need to exist
     for $object_ids to be returned.
    
     It is possible to change the order that object_ids is returned by either
     using PHP sort family functions or using the database by using $args with
     either ASC or DESC array. The value should be in the key named 'order'.
    
     @since 2.3.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int|array    $term_ids   Term id or array of term ids of terms that will be used.
     @param string|array $taxonomies String of taxonomy name or Array of string values of taxonomy names.
     @param array|string $args       Change the order of the object_ids, either ASC or DESC.
     @return WP_Error|array If the taxonomy does not exist, then WP_Error will be returned. On success.
      the array can be empty meaning that there are no $object_ids found or it will return the $object_ids found.
    
  **/
  public function get_objects_in_term(term_ids:haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>>, taxonomies:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, ?args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):haxe.extern.EitherType<wp.extern.Error, php.NativeStructArray<Dynamic>>;
  /**
    
     Given a taxonomy query, generates SQL to be appended to a main query.
    
     @since 3.1.0
    
     @see WP_Tax_Query
    
     @param array  $tax_query         A compact tax query
     @param string $primary_table
     @param string $primary_id_column
     @return array
    
  **/
  public function get_tax_sql(tax_query:php.NativeStructArray<Dynamic>, primary_table:String, primary_id_column:String):php.NativeArray;
  /**
    
     Get all Term data from database by Term ID.
    
     The usage of the get_term function is to apply filters to a term object. It
     is possible to get a term object from the database before applying the
     filters.
    
     $term ID must be part of $taxonomy, to get from the database. Failure, might
     be able to be captured by the hooks. Failure would be the same value as $wpdb
     returns for the get_row method.
    
     There are two hooks, one is specifically for each term, named 'get_term', and
     the second is for the taxonomy name, 'term_$taxonomy'. Both hooks gets the
     term object, and the taxonomy name as parameters. Both hooks are expected to
     return a Term object.
    
     {@see 'get_term'} hook - Takes two parameters the term Object and the taxonomy name.
     Must return term object. Used in get_term() as a catch-all filter for every
     $term.
    
     {@see 'get_$taxonomy'} hook - Takes two parameters the term Object and the taxonomy
     name. Must return term object. $taxonomy will be the taxonomy name, so for
     example, if 'category', it would be 'get_category' as the filter name. Useful
     for custom taxonomies or plugging into default taxonomies.
    
     @todo Better formatting for DocBlock
    
     @since 2.3.0
     @since 4.4.0 Converted to return a WP_Term object if `$output` is `OBJECT`.
                  The `$taxonomy` parameter was made optional.
    
     @see sanitize_term_field() The $context param lists the available values for get_term_by() $filter param.
    
     @param int|WP_Term|object $term If integer, term data will be fetched from the database, or from the cache if
                                     available. If stdClass object (as in the results of a database query), will apply
                                     filters and return a `WP_Term` object corresponding to the `$term` data. If `WP_Term`,
                                     will return `$term`.
     @param string     $taxonomy Optional. Taxonomy name that $term is part of.
     @param string     $output   Optional. The required return type. One of OBJECT, ARRAY_A, or ARRAY_N, which correspond to
                                 a WP_Term object, an associative array, or a numeric array, respectively. Default OBJECT.
     @param string     $filter   Optional, default is raw or no WordPress defined filter will applied.
     @return array|WP_Term|WP_Error|null Object of the type specified by `$output` on success. When `$output` is 'OBJECT',
                                         a WP_Term instance is returned. If taxonomy does not exist, a WP_Error is
                                         returned. Returns null for miscellaneous failure.
    
  **/
  public function get_term(term:haxe.extern.EitherType<Int, haxe.extern.EitherType<wp.extern.Term, Dynamic>>, taxonomy:String = '', ?output:String, filter:String = 'raw'):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, haxe.extern.EitherType<wp.extern.Term, wp.extern.Error>>;
  /**
    
     Get all Term data from database by Term field and data.
    
     Warning: $value is not escaped for 'name' $field. You must do it yourself, if
     required.
    
     The default $field is 'id', therefore it is possible to also use null for
     field, but not recommended that you do so.
    
     If $value does not exist, the return value will be false. If $taxonomy exists
     and $field and $value combinations exist, the Term will be returned.
    
     This function will always return the first term that matches the `$field`-
     `$value`-`$taxonomy` combination specified in the parameters. If your query
     is likely to match more than one term (as is likely to be the case when
     `$field` is 'name', for example), consider using get_terms() instead; that
     way, you will get all matching terms, and can provide your own logic for
     deciding which one was intended.
    
     @todo Better formatting for DocBlock.
    
     @since 2.3.0
     @since 4.4.0 `$taxonomy` is optional if `$field` is 'term_taxonomy_id'. Converted to return
                  a WP_Term object if `$output` is `OBJECT`.
    
     @see sanitize_term_field() The $context param lists the available values for get_term_by() $filter param.
    
     @param string     $field    Either 'slug', 'name', 'id' (term_id), or 'term_taxonomy_id'
     @param string|int $value    Search for this term value
     @param string     $taxonomy Taxonomy name. Optional, if `$field` is 'term_taxonomy_id'.
     @param string     $output   Optional. The required return type. One of OBJECT, ARRAY_A, or ARRAY_N, which correspond to
                                 a WP_Term object, an associative array, or a numeric array, respectively. Default OBJECT.
     @param string     $filter   Optional, default is raw or no WordPress defined filter will applied.
     @return WP_Term|array|false WP_Term instance (or array) on success. Will return false if `$taxonomy` does not exist
                                 or `$term` was not found.
    
  **/
  public function get_term_by(field:String, value:haxe.extern.EitherType<String, Int>, taxonomy:String = '', ?output:String, filter:String = 'raw'):haxe.extern.EitherType<wp.extern.Term, haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>>;
  /**
    
     Merge all term children into a single array of their IDs.
    
     This recursive function will merge all of the children of $term into the same
     array of term IDs. Only useful for taxonomies which are hierarchical.
    
     Will return an empty array if $term does not exist in $taxonomy.
    
     @since 2.3.0
    
     @param int    $term_id  ID of Term to get children.
     @param string $taxonomy Taxonomy Name.
     @return array|WP_Error List of Term IDs. WP_Error returned if `$taxonomy` does not exist.
    
  **/
  public function get_term_children(term_id:Int, taxonomy:String):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Get sanitized Term field.
    
     The function is for contextual reasons and for simplicity of usage.
    
     @since 2.3.0
     @since 4.4.0 The `$taxonomy` parameter was made optional. `$term` can also now accept a WP_Term object.
    
     @see sanitize_term_field()
    
     @param string      $field    Term field to fetch.
     @param int|WP_Term $term     Term ID or object.
     @param string      $taxonomy Optional. Taxonomy Name. Default empty.
     @param string      $context  Optional, default is display. Look at sanitize_term_field() for available options.
     @return string|int|null|WP_Error Will return an empty string if $term is not an object or if $field is not set in $term.
    
  **/
  public function get_term_field(field:String, term:haxe.extern.EitherType<Int, wp.extern.Term>, taxonomy:String = '', context:String = 'display'):haxe.extern.EitherType<String, haxe.extern.EitherType<Int, wp.extern.Error>>;
  /**
    
     Sanitizes Term for editing.
    
     Return value is sanitize_term() and usage is for sanitizing the term for
     editing. Function is for contextual and simplicity.
    
     @since 2.3.0
    
     @param int|object $id       Term ID or object.
     @param string     $taxonomy Taxonomy name.
     @return string|int|null|WP_Error Will return empty string if $term is not an object.
    
  **/
  public function get_term_to_edit(id:haxe.extern.EitherType<Int, Dynamic>, taxonomy:String):haxe.extern.EitherType<String, haxe.extern.EitherType<Int, wp.extern.Error>>;
  /**
    
     Retrieve the terms in a given taxonomy or list of taxonomies.
    
     You can fully inject any customizations to the query before it is sent, as
     well as control the output with a filter.
    
     The {@see 'get_terms'} filter will be called when the cache has the term and will
     pass the found term along with the array of $taxonomies and array of $args.
     This filter is also called before the array of terms is passed and will pass
     the array of terms, along with the $taxonomies and $args.
    
     The {@see 'list_terms_exclusions'} filter passes the compiled exclusions along with
     the $args.
    
     The {@see 'get_terms_orderby'} filter passes the `ORDER BY` clause for the query
     along with the $args array.
    
     Prior to 4.5.0, the first parameter of `get_terms()` was a taxonomy or list of taxonomies:
    
         $terms = get_terms( 'post_tag', array(
             'hide_empty' => false,
         ) );
    
     Since 4.5.0, taxonomies should be passed via the 'taxonomy' argument in the `$args` array:
    
         $terms = get_terms( array(
             'taxonomy' => 'post_tag',
             'hide_empty' => false,
         ) );
    
     @since 2.3.0
     @since 4.2.0 Introduced 'name' and 'childless' parameters.
     @since 4.4.0 Introduced the ability to pass 'term_id' as an alias of 'id' for the `orderby` parameter.
                  Introduced the 'meta_query' and 'update_term_meta_cache' parameters. Converted to return
                  a list of WP_Term objects.
     @since 4.5.0 Changed the function signature so that the `$args` array can be provided as the first parameter.
                  Introduced 'meta_key' and 'meta_value' parameters. Introduced the ability to order results by metadata.
     @since 4.8.0 Introduced 'suppress_filter' parameter.
    
     @internal The `$deprecated` parameter is parsed for backward compatibility only.
    
     @param string|array $args       Optional. Array or string of arguments. See WP_Term_Query::__construct()
                                     for information on accepted arguments. Default empty.
     @param array        $deprecated Argument array, when using the legacy function parameter format. If present, this
                                     parameter will be interpreted as `$args`, and the first function parameter will
                                     be parsed as a taxonomy or array of taxonomies.
     @return array|int|WP_Error List of WP_Term instances and their children. Will return WP_Error, if any of $taxonomies
                                do not exist.
    
  **/
  public function get_terms(?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, deprecated:php.NativeStructArray<Dynamic> = ''):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, haxe.extern.EitherType<Int, wp.extern.Error>>;
  /**
    
     Adds metadata to a term.
    
     @since 4.4.0
    
     @param int    $term_id    Term ID.
     @param string $meta_key   Metadata name.
     @param mixed  $meta_value Metadata value.
     @param bool   $unique     Optional. Whether to bail if an entry with the same key is found for the term.
                               Default false.
     @return int|WP_Error|bool Meta ID on success. WP_Error when term_id is ambiguous between taxonomies.
                               False on failure.
    
  **/
  public function add_term_meta(term_id:Int, meta_key:String, meta_value:Dynamic, unique:Bool = false):haxe.extern.EitherType<Int, haxe.extern.EitherType<wp.extern.Error, Bool>>;
  /**
    
     Removes metadata matching criteria from a term.
    
     @since 4.4.0
    
     @param int    $term_id    Term ID.
     @param string $meta_key   Metadata name.
     @param mixed  $meta_value Optional. Metadata value. If provided, rows will only be removed that match the value.
     @return bool True on success, false on failure.
    
  **/
  public function delete_term_meta(term_id:Int, meta_key:String, meta_value:Dynamic = ''):Bool;
  /**
    
     Retrieves metadata for a term.
    
     @since 4.4.0
    
     @param int    $term_id Term ID.
     @param string $key     Optional. The meta key to retrieve. If no key is provided, fetches all metadata for the term.
     @param bool   $single  Whether to return a single value. If false, an array of all values matching the
                            `$term_id`/`$key` pair will be returned. Default: false.
     @return mixed If `$single` is false, an array of metadata values. If `$single` is true, a single metadata value.
    
  **/
  public function get_term_meta(term_id:Int, key:String = '', single:Bool = false):Dynamic;
  /**
    
     Updates term metadata.
    
     Use the `$prev_value` parameter to differentiate between meta fields with the same key and term ID.
    
     If the meta field for the term does not exist, it will be added.
    
     @since 4.4.0
    
     @param int    $term_id    Term ID.
     @param string $meta_key   Metadata key.
     @param mixed  $meta_value Metadata value.
     @param mixed  $prev_value Optional. Previous value to check before removing.
     @return int|WP_Error|bool Meta ID if the key didn't previously exist. True on successful update.
                               WP_Error when term_id is ambiguous between taxonomies. False on failure.
    
  **/
  public function update_term_meta(term_id:Int, meta_key:String, meta_value:Dynamic, prev_value:Dynamic = ''):haxe.extern.EitherType<Int, haxe.extern.EitherType<wp.extern.Error, Bool>>;
  /**
    
     Updates metadata cache for list of term IDs.
    
     Performs SQL query to retrieve all metadata for the terms matching `$term_ids` and stores them in the cache.
     Subsequent calls to `get_term_meta()` will not need to query the database.
    
     @since 4.4.0
    
     @param array $term_ids List of term IDs.
     @return array|false Returns false if there is nothing to update. Returns an array of metadata on success.
    
  **/
  public function update_termmeta_cache(term_ids:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Get all meta data, including meta IDs, for the given term ID.
    
     @since 4.9.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int $term_id Term ID.
     @return array|false Array with meta data, or false when the meta table is not installed.
    
  **/
  public function has_term_meta(term_id:Int):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Registers a meta key for terms.
    
     @since 4.9.8
    
     @param string $taxonomy Taxonomy to register a meta key for. Pass an empty string
                             to register the meta key across all existing taxonomies.
     @param string $meta_key The meta key to register.
     @param array  $args     Data used to describe the meta key when registered. See
                             {@see register_meta()} for a list of supported arguments.
     @return bool True if the meta key was successfully registered, false if not.
    
  **/
  public function register_term_meta(taxonomy:String, meta_key:String, args:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Unregisters a meta key for terms.
    
     @since 4.9.8
    
     @param string $taxonomy Taxonomy the meta key is currently registered for. Pass
                             an empty string if the meta key is registered across all
                             existing taxonomies.
     @param string $meta_key The meta key to unregister.
     @return bool True on success, false if the meta key was not previously registered.
    
  **/
  public function unregister_term_meta(taxonomy:String, meta_key:String):Bool;
  /**
    
     Determines whether a term exists.
    
     Formerly is_term(), introduced in 2.3.0.
    
     For more information on this and similar theme functions, check out
     the {@link https://developer.wordpress.org/themes/basics/conditional-tags/
     Conditional Tags} article in the Theme Developer Handbook.
    
     @since 3.0.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int|string $term     The term to check. Accepts term ID, slug, or name.
     @param string     $taxonomy The taxonomy name to use
     @param int        $parent   Optional. ID of parent term under which to confine the exists search.
     @return mixed Returns null if the term does not exist. Returns the term ID
                   if no taxonomy is specified and the term ID exists. Returns
                   an array of the term ID and the term taxonomy ID if the taxonomy
                   is specified and the pairing exists.
    
  **/
  public function term_exists(term:haxe.extern.EitherType<Int, String>, taxonomy:String = '', parent:Int = null):Dynamic;
  /**
    
     Check if a term is an ancestor of another term.
    
     You can use either an id or the term object for both parameters.
    
     @since 3.4.0
    
     @param int|object $term1    ID or object to check if this is the parent term.
     @param int|object $term2    The child term.
     @param string     $taxonomy Taxonomy name that $term1 and `$term2` belong to.
     @return bool Whether `$term2` is a child of `$term1`.
    
  **/
  public function term_is_ancestor_of(term1:haxe.extern.EitherType<Int, Dynamic>, term2:haxe.extern.EitherType<Int, Dynamic>, taxonomy:String):Bool;
  /**
    
     Sanitize Term all fields.
    
     Relies on sanitize_term_field() to sanitize the term. The difference is that
     this function will sanitize <strong>all</strong> fields. The context is based
     on sanitize_term_field().
    
     The $term is expected to be either an array or an object.
    
     @since 2.3.0
    
     @param array|object $term     The term to check.
     @param string       $taxonomy The taxonomy name to use.
     @param string       $context  Optional. Context in which to sanitize the term. Accepts 'edit', 'db',
                                   'display', 'attribute', or 'js'. Default 'display'.
     @return array|object Term with all fields sanitized.
    
  **/
  public function sanitize_term(term:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Dynamic>, taxonomy:String, context:String = 'display'):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Dynamic>;
  /**
    
     Cleanse the field value in the term based on the context.
    
     Passing a term field value through the function should be assumed to have
     cleansed the value for whatever context the term field is going to be used.
    
     If no context or an unsupported context is given, then default filters will
     be applied.
    
     There are enough filters for each context to support a custom filtering
     without creating your own filter function. Simply create a function that
     hooks into the filter you need.
    
     @since 2.3.0
    
     @param string $field    Term field to sanitize.
     @param string $value    Search for this term value.
     @param int    $term_id  Term ID.
     @param string $taxonomy Taxonomy Name.
     @param string $context  Context in which to sanitize the term field. Accepts 'edit', 'db', 'display',
                             'attribute', or 'js'.
     @return mixed Sanitized field.
    
  **/
  public function sanitize_term_field(field:String, value:String, term_id:Int, taxonomy:String, context:String):Dynamic;
  /**
    
     Count how many terms are in Taxonomy.
    
     Default $args is 'hide_empty' which can be 'hide_empty=true' or array('hide_empty' => true).
    
     @since 2.3.0
    
     @param string       $taxonomy Taxonomy name.
     @param array|string $args     Optional. Array of arguments that get passed to get_terms().
                                   Default empty array.
     @return array|int|WP_Error Number of terms in that taxonomy or WP_Error if the taxonomy does not exist.
    
  **/
  public function wp_count_terms(taxonomy:String, ?args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, haxe.extern.EitherType<Int, wp.extern.Error>>;
  /**
    
     Will unlink the object from the taxonomy or taxonomies.
    
     Will remove all relationships between the object and any terms in
     a particular taxonomy or taxonomies. Does not remove the term or
     taxonomy itself.
    
     @since 2.3.0
    
     @param int          $object_id  The term Object Id that refers to the term.
     @param string|array $taxonomies List of Taxonomy Names or single Taxonomy name.
    
  **/
  public function wp_delete_object_term_relationships(object_id:Int, taxonomies:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):Void;
  /**
    
     Removes a term from the database.
    
     If the term is a parent of other terms, then the children will be updated to
     that term's parent.
    
     Metadata associated with the term will be deleted.
    
     @since 2.3.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int          $term     Term ID.
     @param string       $taxonomy Taxonomy Name.
     @param array|string $args {
         Optional. Array of arguments to override the default term ID. Default empty array.
    
         @type int  $default       The term ID to make the default term. This will only override
                                   the terms found if there is only one term found. Any other and
                                   the found terms are used.
         @type bool $force_default Optional. Whether to force the supplied term as default to be
                                   assigned even if the object was not going to be term-less.
                                   Default false.
     }
     @return bool|int|WP_Error True on success, false if term does not exist. Zero on attempted
                               deletion of default Category. WP_Error if the taxonomy does not exist.
    
  **/
  public function wp_delete_term(term:Int, taxonomy:String, ?args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):haxe.extern.EitherType<Bool, haxe.extern.EitherType<Int, wp.extern.Error>>;
  /**
    
     Deletes one existing category.
    
     @since 2.0.0
    
     @param int $cat_ID Category term ID.
     @return bool|int|WP_Error Returns true if completes delete action; false if term doesn't exist;
      Zero on attempted deletion of default Category; WP_Error object is also a possibility.
    
  **/
  public function wp_delete_category(cat_ID:Int):haxe.extern.EitherType<Bool, haxe.extern.EitherType<Int, wp.extern.Error>>;
  /**
    
     Retrieves the terms associated with the given object(s), in the supplied taxonomies.
    
     @since 2.3.0
     @since 4.2.0 Added support for 'taxonomy', 'parent', and 'term_taxonomy_id' values of `$orderby`.
                  Introduced `$parent` argument.
     @since 4.4.0 Introduced `$meta_query` and `$update_term_meta_cache` arguments. When `$fields` is 'all' or
                  'all_with_object_id', an array of `WP_Term` objects will be returned.
     @since 4.7.0 Refactored to use WP_Term_Query, and to support any WP_Term_Query arguments.
    
     @param int|array    $object_ids The ID(s) of the object(s) to retrieve.
     @param string|array $taxonomies The taxonomies to retrieve terms from.
     @param array|string $args       See WP_Term_Query::__construct() for supported arguments.
     @return array|WP_Error The requested term data or empty array if no terms found.
                            WP_Error if any of the $taxonomies don't exist.
    
  **/
  public function wp_get_object_terms(object_ids:haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>>, taxonomies:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, ?args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Add a new term to the database.
    
     A non-existent term is inserted in the following sequence:
     1. The term is added to the term table, then related to the taxonomy.
     2. If everything is correct, several actions are fired.
     3. The 'term_id_filter' is evaluated.
     4. The term cache is cleaned.
     5. Several more actions are fired.
     6. An array is returned containing the term_id and term_taxonomy_id.
    
     If the 'slug' argument is not empty, then it is checked to see if the term
     is invalid. If it is not a valid, existing term, it is added and the term_id
     is given.
    
     If the taxonomy is hierarchical, and the 'parent' argument is not empty,
     the term is inserted and the term_id will be given.
    
     Error handling:
     If $taxonomy does not exist or $term is empty,
     a WP_Error object will be returned.
    
     If the term already exists on the same hierarchical level,
     or the term slug and name are not unique, a WP_Error object will be returned.
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @since 2.3.0
    
     @param string       $term     The term to add or update.
     @param string       $taxonomy The taxonomy to which to add the term.
     @param array|string $args {
         Optional. Array or string of arguments for inserting a term.
    
         @type string $alias_of    Slug of the term to make this term an alias of.
                                   Default empty string. Accepts a term slug.
         @type string $description The term description. Default empty string.
         @type int    $parent      The id of the parent term. Default 0.
         @type string $slug        The term slug to use. Default empty string.
     }
     @return array|WP_Error An array containing the `term_id` and `term_taxonomy_id`,
                            WP_Error otherwise.
    
  **/
  public function wp_insert_term(term:String, taxonomy:String, ?args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Create Term and Taxonomy Relationships.
    
     Relates an object (post, link etc) to a term and taxonomy type. Creates the
     term and taxonomy relationship if it doesn't already exist. Creates a term if
     it doesn't exist (using the slug).
    
     A relationship means that the term is grouped in or belongs to the taxonomy.
     A term has no meaning until it is given context by defining which taxonomy it
     exists under.
    
     @since 2.3.0
    
     @global wpdb $wpdb The WordPress database abstraction object.
    
     @param int              $object_id The object to relate to.
     @param string|int|array $terms     A single term slug, single term id, or array of either term slugs or ids.
                                        Will replace all existing related terms in this taxonomy. Passing an
                                        empty value will remove all related terms.
     @param string           $taxonomy  The context in which to relate the term to the object.
     @param bool             $append    Optional. If false will delete difference of terms. Default false.
     @return array|WP_Error Term taxonomy IDs of the affected terms.
    
  **/
  public function wp_set_object_terms(object_id:Int, terms:haxe.extern.EitherType<String, haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>>>, taxonomy:String, append:Bool = false):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Add term(s) associated with a given object.
    
     @since 3.6.0
    
     @param int              $object_id The ID of the object to which the terms will be added.
     @param string|int|array $terms     The slug(s) or ID(s) of the term(s) to add.
     @param array|string     $taxonomy  Taxonomy name.
     @return array|WP_Error Term taxonomy IDs of the affected terms.
    
  **/
  public function wp_add_object_terms(object_id:Int, terms:haxe.extern.EitherType<String, haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>>>, taxonomy:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Remove term(s) associated with a given object.
    
     @since 3.6.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int              $object_id The ID of the object from which the terms will be removed.
     @param string|int|array $terms     The slug(s) or ID(s) of the term(s) to remove.
     @param array|string     $taxonomy  Taxonomy name.
     @return bool|WP_Error True on success, false or WP_Error on failure.
    
  **/
  public function wp_remove_object_terms(object_id:Int, terms:haxe.extern.EitherType<String, haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>>>, taxonomy:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Will make slug unique, if it isn't already.
    
     The `$slug` has to be unique global to every taxonomy, meaning that one
     taxonomy term can't have a matching slug with another taxonomy term. Each
     slug has to be globally unique for every taxonomy.
    
     The way this works is that if the taxonomy that the term belongs to is
     hierarchical and has a parent, it will append that parent to the $slug.
    
     If that still doesn't return an unique slug, then it try to append a number
     until it finds a number that is truly unique.
    
     The only purpose for `$term` is for appending a parent, if one exists.
    
     @since 2.3.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $slug The string that will be tried for a unique slug.
     @param object $term The term object that the `$slug` will belong to.
     @return string Will return a true unique slug.
    
  **/
  public function wp_unique_term_slug(slug:String, term:Dynamic):String;
  /**
    
     Update term based on arguments provided.
    
     The $args will indiscriminately override all values with the same field name.
     Care must be taken to not override important information need to update or
     update will fail (or perhaps create a new term, neither would be acceptable).
    
     Defaults will set 'alias_of', 'description', 'parent', and 'slug' if not
     defined in $args already.
    
     'alias_of' will create a term group, if it doesn't already exist, and update
     it for the $term.
    
     If the 'slug' argument in $args is missing, then the 'name' in $args will be
     used. It should also be noted that if you set 'slug' and it isn't unique then
     a WP_Error will be passed back. If you don't pass any slug, then a unique one
     will be created for you.
    
     For what can be overrode in `$args`, check the term scheme can contain and stay
     away from the term keys.
    
     @since 2.3.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int          $term_id  The ID of the term
     @param string       $taxonomy The context in which to relate the term to the object.
     @param array|string $args     Optional. Array of get_terms() arguments. Default empty array.
     @return array|WP_Error Returns Term ID and Taxonomy Term ID
    
  **/
  public function wp_update_term(term_id:Int, taxonomy:String, ?args:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Enable or disable term counting.
    
     @since 2.5.0
    
     @staticvar bool $_defer
    
     @param bool $defer Optional. Enable if true, disable if false.
     @return bool Whether term counting is enabled or disabled.
    
  **/
  public function wp_defer_term_counting(defer:Bool = null):Bool;
  /**
    
     Updates the amount of terms in taxonomy.
    
     If there is a taxonomy callback applied, then it will be called for updating
     the count.
    
     The default action is to count what the amount of terms have the relationship
     of term ID. Once that is done, then update the database.
    
     @since 2.3.0
    
     @staticvar array $_deferred
    
     @param int|array $terms       The term_taxonomy_id of the terms.
     @param string    $taxonomy    The context of the term.
     @param bool      $do_deferred Whether to flush the deferred term counts too. Default false.
     @return bool If no terms will return false, and if successful will return true.
    
  **/
  public function wp_update_term_count(terms:haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>>, taxonomy:String, do_deferred:Bool = false):Bool;
  /**
    
     Perform term count update immediately.
    
     @since 2.5.0
    
     @param array  $terms    The term_taxonomy_id of terms to update.
     @param string $taxonomy The context of the term.
     @return true Always true when complete.
    
  **/
  public function wp_update_term_count_now(terms:php.NativeStructArray<Dynamic>, taxonomy:String):Bool;
  /**
    
     Removes the taxonomy relationship to terms from the cache.
    
     Will remove the entire taxonomy relationship containing term `$object_id`. The
     term IDs have to exist within the taxonomy `$object_type` for the deletion to
     take place.
    
     @since 2.3.0
    
     @global bool $_wp_suspend_cache_invalidation
    
     @see get_object_taxonomies() for more on $object_type.
    
     @param int|array    $object_ids  Single or list of term object ID(s).
     @param array|string $object_type The taxonomy object type.
    
  **/
  public function clean_object_term_cache(object_ids:haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>>, object_type:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):Void;
  /**
    
     Will remove all of the term ids from the cache.
    
     @since 2.3.0
    
     @global wpdb $wpdb WordPress database abstraction object.
     @global bool $_wp_suspend_cache_invalidation
    
     @param int|array $ids            Single or list of Term IDs.
     @param string    $taxonomy       Optional. Can be empty and will assume `tt_ids`, else will use for context.
                                      Default empty.
     @param bool      $clean_taxonomy Optional. Whether to clean taxonomy wide caches (true), or just individual
                                      term object caches (false). Default true.
    
  **/
  public function clean_term_cache(ids:haxe.extern.EitherType<Int, php.NativeStructArray<Dynamic>>, taxonomy:String = '', clean_taxonomy:Bool = true):Void;
  /**
    
     Clean the caches for a taxonomy.
    
     @since 4.9.0
    
     @param string $taxonomy Taxonomy slug.
    
  **/
  public function clean_taxonomy_cache(taxonomy:String):Void;
  /**
    
     Retrieves the taxonomy relationship to the term object id.
    
     Upstream functions (like get_the_terms() and is_object_in_term()) are
     responsible for populating the object-term relationship cache. The current
     function only fetches relationship data that is already in the cache.
    
     @since 2.3.0
     @since 4.7.0 Returns a `WP_Error` object if `get_term()` returns an error for
                  any of the matched terms.
    
     @param int    $id       Term object ID.
     @param string $taxonomy Taxonomy name.
     @return bool|array|WP_Error Array of `WP_Term` objects, if cached.
                                 False if cache is empty for `$taxonomy` and `$id`.
                                 WP_Error if get_term() returns an error object for any term.
    
  **/
  public function get_object_term_cache(id:Int, taxonomy:String):haxe.extern.EitherType<Bool, haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>>;
  /**
    
     Updates the cache for the given term object ID(s).
    
     Note: Due to performance concerns, great care should be taken to only update
     term caches when necessary. Processing time can increase exponentially depending
     on both the number of passed term IDs and the number of taxonomies those terms
     belong to.
    
     Caches will only be updated for terms not already cached.
    
     @since 2.3.0
    
     @param string|array $object_ids  Comma-separated list or array of term object IDs.
     @param array|string $object_type The taxonomy object type.
     @return void|false False if all of the terms in `$object_ids` are already cached.
    
  **/
  public function update_object_term_cache(object_ids:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, object_type:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, String>):Bool;
  /**
    
     Updates Terms to Taxonomy in cache.
    
     @since 2.3.0
    
     @param array  $terms    List of term objects to change.
     @param string $taxonomy Optional. Update Term to this taxonomy in cache. Default empty.
    
  **/
  public function update_term_cache(terms:php.NativeStructArray<Dynamic>, taxonomy:String = ''):Void;
  /**
    
     Retrieves children of taxonomy as Term IDs.
    
     @ignore
     @since 2.3.0
    
     @param string $taxonomy Taxonomy name.
     @return array Empty if $taxonomy isn't hierarchical or returns children as Term IDs.
    
  **/
  public function _get_term_hierarchy(taxonomy:String):php.NativeArray;
  /**
    
     Get the subset of $terms that are descendants of $term_id.
    
     If `$terms` is an array of objects, then _get_term_children() returns an array of objects.
     If `$terms` is an array of IDs, then _get_term_children() returns an array of IDs.
    
     @access private
     @since 2.3.0
    
     @param int    $term_id   The ancestor term: all returned terms should be descendants of `$term_id`.
     @param array  $terms     The set of terms - either an array of term objects or term IDs - from which those that
                              are descendants of $term_id will be chosen.
     @param string $taxonomy  The taxonomy which determines the hierarchy of the terms.
     @param array  $ancestors Optional. Term ancestors that have already been identified. Passed by reference, to keep
                              track of found terms when recursing the hierarchy. The array of located ancestors is used
                              to prevent infinite recursion loops. For performance, `term_ids` are used as array keys,
                              with 1 as value. Default empty array.
     @return array|WP_Error The subset of $terms that are descendants of $term_id.
    
  **/
  public function _get_term_children(term_id:Int, terms:php.NativeStructArray<Dynamic>, taxonomy:String, ancestors:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Add count of children to parent count.
    
     Recalculates term counts by including items from child terms. Assumes all
     relevant children are already in the $terms argument.
    
     @access private
     @since 2.3.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array  $terms    List of term objects (passed by reference).
     @param string $taxonomy Term context.
    
  **/
  public function _pad_term_counts(terms:php.NativeStructArray<Dynamic>, taxonomy:String):Void;
  /**
    
     Adds any terms from the given IDs to the cache that do not already exist in cache.
    
     @since 4.6.0
     @access private
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array $term_ids          Array of term IDs.
     @param bool  $update_meta_cache Optional. Whether to update the meta cache. Default true.
    
  **/
  public function _prime_term_caches(term_ids:php.NativeStructArray<Dynamic>, update_meta_cache:Bool = true):Void;
  /**
    
     Will update term count based on object types of the current taxonomy.
    
     Private function for the default callback for post_tag and category
     taxonomies.
    
     @access private
     @since 2.3.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array  $terms    List of Term taxonomy IDs.
     @param object $taxonomy Current taxonomy object of terms.
    
  **/
  public function _update_post_term_count(terms:php.NativeStructArray<Dynamic>, taxonomy:Dynamic):Void;
  /**
    
     Will update term count based on number of objects.
    
     Default callback for the 'link_category' taxonomy.
    
     @since 3.3.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array  $terms    List of term taxonomy IDs.
     @param object $taxonomy Current taxonomy object of terms.
    
  **/
  public function _update_generic_term_count(terms:php.NativeStructArray<Dynamic>, taxonomy:Dynamic):Void;
  /**
    
     Create a new term for a term_taxonomy item that currently shares its term
     with another term_taxonomy.
    
     @ignore
     @since 4.2.0
     @since 4.3.0 Introduced `$record` parameter. Also, `$term_id` and
                  `$term_taxonomy_id` can now accept objects.
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int|object $term_id          ID of the shared term, or the shared term object.
     @param int|object $term_taxonomy_id ID of the term_taxonomy item to receive a new term, or the term_taxonomy object
                                         (corresponding to a row from the term_taxonomy table).
     @param bool       $record           Whether to record data about the split term in the options table. The recording
                                         process has the potential to be resource-intensive, so during batch operations
                                         it can be beneficial to skip inline recording and do it just once, after the
                                         batch is processed. Only set this to `false` if you know what you are doing.
                                         Default: true.
     @return int|WP_Error When the current term does not need to be split (or cannot be split on the current
                          database schema), `$term_id` is returned. When the term is successfully split, the
                          new term_id is returned. A WP_Error is returned for miscellaneous errors.
    
  **/
  public function _split_shared_term(term_id:haxe.extern.EitherType<Int, Dynamic>, term_taxonomy_id:haxe.extern.EitherType<Int, Dynamic>, record:Bool = true):haxe.extern.EitherType<Int, wp.extern.Error>;
  /**
    
     Splits a batch of shared taxonomy terms.
    
     @since 4.3.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
  **/
  public function _wp_batch_split_terms():Void;
  /**
    
     In order to avoid the _wp_batch_split_terms() job being accidentally removed,
     check that it's still scheduled while we haven't finished splitting terms.
    
     @ignore
     @since 4.3.0
    
  **/
  public function _wp_check_for_scheduled_split_terms():Void;
  /**
    
     Check default categories when a term gets split to see if any of them need to be updated.
    
     @ignore
     @since 4.2.0
    
     @param int    $term_id          ID of the formerly shared term.
     @param int    $new_term_id      ID of the new term created for the $term_taxonomy_id.
     @param int    $term_taxonomy_id ID for the term_taxonomy row affected by the split.
     @param string $taxonomy         Taxonomy for the split term.
    
  **/
  public function _wp_check_split_default_terms(term_id:Int, new_term_id:Int, term_taxonomy_id:Int, taxonomy:String):Void;
  /**
    
     Check menu items when a term gets split to see if any of them need to be updated.
    
     @ignore
     @since 4.2.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int    $term_id          ID of the formerly shared term.
     @param int    $new_term_id      ID of the new term created for the $term_taxonomy_id.
     @param int    $term_taxonomy_id ID for the term_taxonomy row affected by the split.
     @param string $taxonomy         Taxonomy for the split term.
    
  **/
  public function _wp_check_split_terms_in_menus(term_id:Int, new_term_id:Int, term_taxonomy_id:Int, taxonomy:String):Void;
  /**
    
     If the term being split is a nav_menu, change associations.
    
     @ignore
     @since 4.3.0
    
     @param int    $term_id          ID of the formerly shared term.
     @param int    $new_term_id      ID of the new term created for the $term_taxonomy_id.
     @param int    $term_taxonomy_id ID for the term_taxonomy row affected by the split.
     @param string $taxonomy         Taxonomy for the split term.
    
  **/
  public function _wp_check_split_nav_menu_terms(term_id:Int, new_term_id:Int, term_taxonomy_id:Int, taxonomy:String):Void;
  /**
    
     Get data about terms that previously shared a single term_id, but have since been split.
    
     @since 4.2.0
    
     @param int $old_term_id Term ID. This is the old, pre-split term ID.
     @return array Array of new term IDs, keyed by taxonomy.
    
  **/
  public function wp_get_split_terms(old_term_id:Int):php.NativeArray;
  /**
    
     Get the new term ID corresponding to a previously split term.
    
     @since 4.2.0
    
     @param int    $old_term_id Term ID. This is the old, pre-split term ID.
     @param string $taxonomy    Taxonomy that the term belongs to.
     @return int|false If a previously split term is found corresponding to the old term_id and taxonomy,
                       the new term_id will be returned. If no previously split term is found matching
                       the parameters, returns false.
    
  **/
  public function wp_get_split_term(old_term_id:Int, taxonomy:String):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Determine whether a term is shared between multiple taxonomies.
    
     Shared taxonomy terms began to be split in 4.3, but failed cron tasks or
     other delays in upgrade routines may cause shared terms to remain.
    
     @since 4.4.0
    
     @param int $term_id Term ID.
     @return bool Returns false if a term is not shared between multiple taxonomies or
                  if splittng shared taxonomy terms is finished.
    
  **/
  public function wp_term_is_shared(term_id:Int):Bool;
  /**
    
     Generate a permalink for a taxonomy term archive.
    
     @since 2.5.0
    
     @global WP_Rewrite $wp_rewrite
    
     @param object|int|string $term     The term object, ID, or slug whose link will be retrieved.
     @param string            $taxonomy Optional. Taxonomy. Default empty.
     @return string|WP_Error HTML link to taxonomy term archive on success, WP_Error if term does not exist.
    
  **/
  public function get_term_link(term:haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Int, String>>, taxonomy:String = ''):haxe.extern.EitherType<String, wp.extern.Error>;
  /**
    
     Display the taxonomies of a post with available options.
    
     This function can be used within the loop to display the taxonomies for a
     post without specifying the Post ID. You can also use it outside the Loop to
     display the taxonomies for a specific post.
    
     @since 2.5.0
    
     @param array $args {
         Arguments about which post to use and how to format the output. Shares all of the arguments
         supported by get_the_taxonomies(), in addition to the following.
    
         @type  int|WP_Post $post   Post ID or object to get taxonomies of. Default current post.
         @type  string      $before Displays before the taxonomies. Default empty string.
         @type  string      $sep    Separates each taxonomy. Default is a space.
         @type  string      $after  Displays after the taxonomies. Default empty string.
     }
    
  **/
  public function the_taxonomies(?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Retrieve all taxonomies associated with a post.
    
     This function can be used within the loop. It will also return an array of
     the taxonomies with links to the taxonomy and name.
    
     @since 2.5.0
    
     @param int|WP_Post $post Optional. Post ID or WP_Post object. Default is global $post.
     @param array $args {
         Optional. Arguments about how to format the list of taxonomies. Default empty array.
    
         @type string $template      Template for displaying a taxonomy label and list of terms.
                                     Default is "Label: Terms."
         @type string $term_template Template for displaying a single term in the list. Default is the term name
                                     linked to its archive.
     }
     @return array List of taxonomies.
    
  **/
  public function get_the_taxonomies(post:haxe.extern.EitherType<Int, wp.extern.Post> = 0, ?args:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Retrieve all taxonomies of a post with just the names.
    
     @since 2.5.0
    
     @param int|WP_Post $post Optional. Post ID or WP_Post object. Default is global $post.
     @return array An array of all taxonomy names for the given post.
    
  **/
  public function get_post_taxonomies(post:haxe.extern.EitherType<Int, wp.extern.Post> = 0):php.NativeArray;
  /**
    
     Determine if the given object is associated with any of the given terms.
    
     The given terms are checked against the object's terms' term_ids, names and slugs.
     Terms given as integers will only be checked against the object's terms' term_ids.
     If no terms are given, determines if object is associated with any terms in the given taxonomy.
    
     @since 2.7.0
    
     @param int              $object_id ID of the object (post ID, link ID, ...).
     @param string           $taxonomy  Single taxonomy name.
     @param int|string|array $terms     Optional. Term term_id, name, slug or array of said. Default null.
     @return bool|WP_Error WP_Error on input error.
    
  **/
  public function is_object_in_term(object_id:Int, taxonomy:String, terms:haxe.extern.EitherType<Int, haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>> = null):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Determine if the given object type is associated with the given taxonomy.
    
     @since 3.0.0
    
     @param string $object_type Object type string.
     @param string $taxonomy    Single taxonomy name.
     @return bool True if object is associated with the taxonomy, otherwise false.
    
  **/
  public function is_object_in_taxonomy(object_type:String, taxonomy:String):Bool;
  /**
    
     Get an array of ancestor IDs for a given object.
    
     @since 3.1.0
     @since 4.1.0 Introduced the `$resource_type` argument.
    
     @param int    $object_id     Optional. The ID of the object. Default 0.
     @param string $object_type   Optional. The type of object for which we'll be retrieving
                                  ancestors. Accepts a post type or a taxonomy name. Default empty.
     @param string $resource_type Optional. Type of resource $object_type is. Accepts 'post_type'
                                  or 'taxonomy'. Default empty.
     @return array An array of ancestors from lowest to highest in the hierarchy.
    
  **/
  public function get_ancestors(object_id:Int = 0, object_type:String = '', resource_type:String = ''):php.NativeArray;
  /**
    
     Returns the term's parent's term_ID.
    
     @since 3.1.0
    
     @param int    $term_id  Term ID.
     @param string $taxonomy Taxonomy name.
     @return int|false False on error.
    
  **/
  public function wp_get_term_taxonomy_parent_id(term_id:Int, taxonomy:String):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Checks the given subset of the term hierarchy for hierarchy loops.
     Prevents loops from forming and breaks those that it finds.
    
     Attached to the {@see 'wp_update_term_parent'} filter.
    
     @since 3.1.0
    
     @param int    $parent   `term_id` of the parent for the term we're checking.
     @param int    $term_id  The term we're checking.
     @param string $taxonomy The taxonomy of the term we're checking.
    
     @return int The new parent for the term.
    
  **/
  public function wp_check_term_hierarchy_for_loops(parent:Int, term_id:Int, taxonomy:String):Int;
  /**
    
     Determines whether a taxonomy is considered "viewable".
    
     @since 5.1.0
    
     @param string|WP_Taxonomy $taxonomy Taxonomy name or object.
     @return bool Whether the taxonomy should be considered viewable.
    
  **/
  public function is_taxonomy_viewable(taxonomy:haxe.extern.EitherType<String, wp.extern.Taxonomy>):Bool;
  /**
    
     Sets the last changed time for the 'terms' cache group.
    
     @since 5.0.0
    
  **/
  public function wp_cache_set_terms_last_changed():Void;
  /**
    
     Aborts calls to term meta if it is not supported.
    
     @since 5.0.0
    
     @param mixed $check Skip-value for whether to proceed term meta function execution.
     @return mixed Original value of $check, or false if term meta is not supported.
    
  **/
  public function wp_check_term_meta_support_prefilter(check:Dynamic):Dynamic;
}
