package wp.extern;

extern class MsSiteApi implements wp.util.ApiFunctions {
  /**
    
     Inserts a new site into the database.
    
     @since 5.1.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array $data {
         Data for the new site that should be inserted.
    
         @type string $domain       Site domain. Default empty string.
         @type string $path         Site path. Default '/'.
         @type int    $network_id   The site's network ID. Default is the current network ID.
         @type string $registered   When the site was registered, in SQL datetime format. Default is
                                    the current time.
         @type string $last_updated When the site was last updated, in SQL datetime format. Default is
                                    the value of $registered.
         @type int    $public       Whether the site is public. Default 1.
         @type int    $archived     Whether the site is archived. Default 0.
         @type int    $mature       Whether the site is mature. Default 0.
         @type int    $spam         Whether the site is spam. Default 0.
         @type int    $deleted      Whether the site is deleted. Default 0.
         @type int    $lang_id      The site's language ID. Currently unused. Default 0.
     }
     @return int|WP_Error The new site's ID on success, or error object on failure.
    
  **/
  public function wp_insert_site(data:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Int, wp.extern.Error>;
  /**
    
     Updates a site in the database.
    
     @since 5.1.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int   $site_id ID of the site that should be updated.
     @param array $data    Site data to update. See {@see wp_insert_site()} for the list of supported keys.
     @return int|WP_Error The updated site's ID on success, or error object on failure.
    
  **/
  public function wp_update_site(site_id:Int, data:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Int, wp.extern.Error>;
  /**
    
     Deletes a site from the database.
    
     @since 5.1.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int $site_id ID of the site that should be deleted.
     @return WP_Site|WP_Error The deleted site object on success, or error object on failure.
    
  **/
  public function wp_delete_site(site_id:Int):haxe.extern.EitherType<wp.extern.Site, wp.extern.Error>;
  /**
    
     Retrieves site data given a site ID or site object.
    
     Site data will be cached and returned after being passed through a filter.
     If the provided site is empty, the current site global will be used.
    
     @since 4.6.0
    
     @param WP_Site|int|null $site Optional. Site to retrieve. Default is the current site.
     @return WP_Site|null The site object or null if not found.
    
  **/
  public function get_site(site:haxe.extern.EitherType<wp.extern.Site, Int> = null):wp.extern.Site;
  /**
    
     Adds any sites from the given ids to the cache that do not already exist in cache.
    
     @since 4.6.0
     @since 5.1.0 Introduced the `$update_meta_cache` parameter.
     @access private
    
     @see update_site_cache()
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param array $ids               ID list.
     @param bool  $update_meta_cache Optional. Whether to update the meta cache. Default true.
    
  **/
  public function _prime_site_caches(ids:php.NativeStructArray<Dynamic>, update_meta_cache:Bool = true):Void;
  /**
    
     Updates sites in cache.
    
     @since 4.6.0
     @since 5.1.0 Introduced the `$update_meta_cache` parameter.
    
     @param array $sites             Array of site objects.
     @param bool  $update_meta_cache Whether to update site meta cache. Default true.
    
  **/
  public function update_site_cache(sites:php.NativeStructArray<Dynamic>, update_meta_cache:Bool = true):Void;
  /**
    
     Updates metadata cache for list of site IDs.
    
     Performs SQL query to retrieve all metadata for the sites matching `$site_ids` and stores them in the cache.
     Subsequent calls to `get_site_meta()` will not need to query the database.
    
     @since 5.1.0
    
     @param array $site_ids List of site IDs.
     @return array|false Returns false if there is nothing to update. Returns an array of metadata on success.
    
  **/
  public function update_sitemeta_cache(site_ids:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Retrieves a list of sites matching requested arguments.
    
     @since 4.6.0
     @since 4.8.0 Introduced the 'lang_id', 'lang__in', and 'lang__not_in' parameters.
    
     @see WP_Site_Query::parse_query()
    
     @param string|array $args {
         Optional. Array or query string of site query parameters. Default empty.
    
         @type array        $site__in          Array of site IDs to include. Default empty.
         @type array        $site__not_in      Array of site IDs to exclude. Default empty.
         @type bool         $count             Whether to return a site count (true) or array of site objects.
                                               Default false.
         @type array        $date_query        Date query clauses to limit sites by. See WP_Date_Query.
                                               Default null.
         @type string       $fields            Site fields to return. Accepts 'ids' (returns an array of site IDs)
                                               or empty (returns an array of complete site objects). Default empty.
         @type int          $ID                A site ID to only return that site. Default empty.
         @type int          $number            Maximum number of sites to retrieve. Default 100.
         @type int          $offset            Number of sites to offset the query. Used to build LIMIT clause.
                                               Default 0.
         @type bool         $no_found_rows     Whether to disable the `SQL_CALC_FOUND_ROWS` query. Default true.
         @type string|array $orderby           Site status or array of statuses. Accepts 'id', 'domain', 'path',
                                               'network_id', 'last_updated', 'registered', 'domain_length',
                                               'path_length', 'site__in' and 'network__in'. Also accepts false,
                                               an empty array, or 'none' to disable `ORDER BY` clause.
                                               Default 'id'.
         @type string       $order             How to order retrieved sites. Accepts 'ASC', 'DESC'. Default 'ASC'.
         @type int          $network_id        Limit results to those affiliated with a given network ID. If 0,
                                               include all networks. Default 0.
         @type array        $network__in       Array of network IDs to include affiliated sites for. Default empty.
         @type array        $network__not_in   Array of network IDs to exclude affiliated sites for. Default empty.
         @type string       $domain            Limit results to those affiliated with a given domain. Default empty.
         @type array        $domain__in        Array of domains to include affiliated sites for. Default empty.
         @type array        $domain__not_in    Array of domains to exclude affiliated sites for. Default empty.
         @type string       $path              Limit results to those affiliated with a given path. Default empty.
         @type array        $path__in          Array of paths to include affiliated sites for. Default empty.
         @type array        $path__not_in      Array of paths to exclude affiliated sites for. Default empty.
         @type int          $public            Limit results to public sites. Accepts '1' or '0'. Default empty.
         @type int          $archived          Limit results to archived sites. Accepts '1' or '0'. Default empty.
         @type int          $mature            Limit results to mature sites. Accepts '1' or '0'. Default empty.
         @type int          $spam              Limit results to spam sites. Accepts '1' or '0'. Default empty.
         @type int          $deleted           Limit results to deleted sites. Accepts '1' or '0'. Default empty.
         @type int          $lang_id           Limit results to a language ID. Default empty.
         @type array        $lang__in          Array of language IDs to include affiliated sites for. Default empty.
         @type array        $lang__not_in      Array of language IDs to exclude affiliated sites for. Default empty.
         @type string       $search            Search term(s) to retrieve matching sites for. Default empty.
         @type array        $search_columns    Array of column names to be searched. Accepts 'domain' and 'path'.
                                               Default empty array.
         @type bool         $update_site_cache Whether to prime the cache for found sites. Default true.
     }
     @return array|int List of WP_Site objects, a list of site ids when 'fields' is set to 'ids',
                       or the number of sites when 'count' is passed as a query var.
    
  **/
  public function get_sites(?args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Int>;
  /**
    
     Prepares site data for insertion or update in the database.
    
     @since 5.1.0
    
     @param array        $data     Associative array of site data passed to the respective function.
                                   See {@see wp_insert_site()} for the possibly included data.
     @param array        $defaults Site data defaults to parse $data against.
     @param WP_Site|null $old_site Optional. Old site object if an update, or null if an insertion.
                                   Default null.
     @return array|WP_Error Site data ready for a database transaction, or WP_Error in case a validation
                            error occurred.
    
  **/
  public function wp_prepare_site_data(data:php.NativeStructArray<Dynamic>, defaults:php.NativeStructArray<Dynamic>, old_site:wp.extern.Site = null):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Normalizes data for a site prior to inserting or updating in the database.
    
     @since 5.1.0
    
     @param array $data Associative array of site data passed to the respective function.
                        See {@see wp_insert_site()} for the possibly included data.
     @return array Normalized site data.
    
  **/
  public function wp_normalize_site_data(data:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Validates data for a site prior to inserting or updating in the database.
    
     @since 5.1.0
    
     @param WP_Error     $errors   Error object, passed by reference. Will contain validation errors if
                                   any occurred.
     @param array        $data     Associative array of complete site data. See {@see wp_insert_site()}
                                   for the included data.
     @param WP_Site|null $old_site The old site object if the data belongs to a site being updated,
                                   or null if it is a new site being inserted.
    
  **/
  public function wp_validate_site_data(errors:wp.extern.Error, data:php.NativeStructArray<Dynamic>, old_site:wp.extern.Site = null):Void;
  /**
    
     Runs the initialization routine for a given site.
    
     This process includes creating the site's database tables and
     populating them with defaults.
    
     @since 5.1.0
    
     @global wpdb     $wpdb     WordPress database abstraction object.
     @global WP_Roles $wp_roles WordPress role management object.
    
     @param int|WP_Site $site_id Site ID or object.
     @param array       $args    {
         Optional. Arguments to modify the initialization behavior.
    
         @type int    $user_id Required. User ID for the site administrator.
         @type string $title   Site title. Default is 'Site %d' where %d is the
                               site ID.
         @type array  $options Custom option $key => $value pairs to use. Default
                               empty array.
         @type array  $meta    Custom site metadata $key => $value pairs to use.
                               Default empty array.
     }
     @return bool|WP_Error True on success, or error object on failure.
    
  **/
  public function wp_initialize_site(site_id:haxe.extern.EitherType<Int, wp.extern.Site>, args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Runs the uninitialization routine for a given site.
    
     This process includes dropping the site's database tables and deleting its uploads directory.
    
     @since 5.1.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int|WP_Site $site_id Site ID or object.
     @return bool|WP_Error True on success, or error object on failure.
    
  **/
  public function wp_uninitialize_site(site_id:haxe.extern.EitherType<Int, wp.extern.Site>):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Checks whether a site is initialized.
    
     A site is considered initialized when its database tables are present.
    
     @since 5.1.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int|WP_Site $site_id Site ID or object.
     @return bool True if the site is initialized, false otherwise.
    
  **/
  public function wp_is_site_initialized(site_id:haxe.extern.EitherType<Int, wp.extern.Site>):Bool;
  /**
    
     Clean the blog cache
    
     @since 3.5.0
    
     @global bool $_wp_suspend_cache_invalidation
    
     @param WP_Site|int $blog The site object or ID to be cleared from cache.
    
  **/
  public function clean_blog_cache(blog:haxe.extern.EitherType<wp.extern.Site, Int>):Void;
  /**
    
     Adds metadata to a site.
    
     @since 5.1.0
    
     @param int    $site_id    Site ID.
     @param string $meta_key   Metadata name.
     @param mixed  $meta_value Metadata value. Must be serializable if non-scalar.
     @param bool   $unique     Optional. Whether the same key should not be added.
                               Default false.
     @return int|false Meta ID on success, false on failure.
    
  **/
  public function add_site_meta(site_id:Int, meta_key:String, meta_value:Dynamic, unique:Bool = false):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Removes metadata matching criteria from a site.
    
     You can match based on the key, or key and value. Removing based on key and
     value, will keep from removing duplicate metadata with the same key. It also
     allows removing all metadata matching key, if needed.
    
     @since 5.1.0
    
     @param int    $site_id    Site ID.
     @param string $meta_key   Metadata name.
     @param mixed  $meta_value Optional. Metadata value. Must be serializable if
                               non-scalar. Default empty.
     @return bool True on success, false on failure.
    
  **/
  public function delete_site_meta(site_id:Int, meta_key:String, meta_value:Dynamic = ''):Bool;
  /**
    
     Retrieves metadata for a site.
    
     @since 5.1.0
    
     @param int    $site_id Site ID.
     @param string $key     Optional. The meta key to retrieve. By default, returns
                            data for all keys. Default empty.
     @param bool   $single  Optional. Whether to return a single value. Default false.
     @return mixed Will be an array if $single is false. Will be value of meta data
                   field if $single is true.
    
  **/
  public function get_site_meta(site_id:Int, key:String = '', single:Bool = false):Dynamic;
  /**
    
     Updates metadata for a site.
    
     Use the $prev_value parameter to differentiate between meta fields with the
     same key and site ID.
    
     If the meta field for the site does not exist, it will be added.
    
     @since 5.1.0
    
     @param int    $site_id    Site ID.
     @param string $meta_key   Metadata key.
     @param mixed  $meta_value Metadata value. Must be serializable if non-scalar.
     @param mixed  $prev_value Optional. Previous value to check before removing.
                               Default empty.
     @return int|bool Meta ID if the key didn't exist, true on successful update,
                      false on failure.
    
  **/
  public function update_site_meta(site_id:Int, meta_key:String, meta_value:Dynamic, prev_value:Dynamic = ''):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Deletes everything from site meta matching meta key.
    
     @since 5.1.0
    
     @param string $meta_key Metadata key to search for when deleting.
     @return bool Whether the site meta key was deleted from the database.
    
  **/
  public function delete_site_meta_by_key(meta_key:String):Bool;
  /**
    
     Updates the count of sites for a network based on a changed site.
    
     @since 5.1.0
    
     @param WP_Site      $new_site The site object that has been inserted, updated or deleted.
     @param WP_Site|null $old_site Optional. If $new_site has been updated, this must be the previous
                                   state of that site. Default null.
    
  **/
  public function wp_maybe_update_network_site_counts_on_update(new_site:wp.extern.Site, old_site:wp.extern.Site = null):Void;
  /**
    
     Triggers actions on site status updates.
    
     @since 5.1.0
    
     @param WP_Site      $new_site The site object after the update.
     @param WP_Site|null $old_site Optional. If $new_site has been updated, this must be the previous
                                   state of that site. Default null.
    
  **/
  public function wp_maybe_transition_site_statuses_on_update(new_site:wp.extern.Site, old_site:wp.extern.Site = null):Void;
  /**
    
     Cleans the necessary caches after specific site data has been updated.
    
     @since 5.1.0
    
     @param WP_Site $new_site The site object after the update.
     @param WP_Site $old_site The site obejct prior to the update.
    
  **/
  public function wp_maybe_clean_new_site_cache_on_update(new_site:wp.extern.Site, old_site:wp.extern.Site):Void;
  /**
    
     Updates the `blog_public` option for a given site ID.
    
     @since 5.1.0
    
     @param int    $site_id Site ID.
     @param string $public  The value of the site status.
    
  **/
  public function wp_update_blog_public_option_on_site_update(site_id:Int, public_:String):Void;
  /**
    
     Sets the last changed time for the 'sites' cache group.
    
     @since 5.1.0
    
  **/
  public function wp_cache_set_sites_last_changed():Void;
  /**
    
     Aborts calls to site meta if it is not supported.
    
     @since 5.1.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param mixed $check Skip-value for whether to proceed site meta function execution.
     @return mixed Original value of $check, or false if site meta is not supported.
    
  **/
  public function wp_check_site_meta_support_prefilter(check:Dynamic):Dynamic;
}
