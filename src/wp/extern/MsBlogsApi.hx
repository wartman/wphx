package wp.extern;

extern class MsBlogsApi implements wp.util.ApiFunctions {
  /**
    
     Update the last_updated field for the current site.
    
     @since MU (3.0.0)
    
  **/
  public function wpmu_update_blogs_date():Void;
  /**
    
     Get a full blog URL, given a blog id.
    
     @since MU (3.0.0)
    
     @param int $blog_id Blog ID
     @return string Full URL of the blog if found. Empty string if not.
    
  **/
  public function get_blogaddress_by_id(blog_id:Int):String;
  /**
    
     Get a full blog URL, given a blog name.
    
     @since MU (3.0.0)
    
     @param string $blogname The (subdomain or directory) name
     @return string
    
  **/
  public function get_blogaddress_by_name(blogname:String):String;
  /**
    
     Retrieves a sites ID given its (subdomain or directory) slug.
    
     @since MU (3.0.0)
     @since 4.7.0 Converted to use `get_sites()`.
    
     @param string $slug A site's slug.
     @return int|null The site ID, or null if no site is found for the given slug.
    
  **/
  public function get_id_from_blogname(slug:String):Int;
  /**
    
     Retrieve the details for a blog from the blogs table and blog options.
    
     @since MU (3.0.0)
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int|string|array $fields  Optional. A blog ID, a blog slug, or an array of fields to query against.
                                      If not specified the current blog ID is used.
     @param bool             $get_all Whether to retrieve all details or only the details in the blogs table.
                                      Default is true.
     @return WP_Site|false Blog details on success. False on failure.
    
  **/
  public function get_blog_details(fields:haxe.extern.EitherType<Int, haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>> = null, get_all:Bool = true):haxe.extern.EitherType<wp.extern.Site, Bool>;
  /**
    
     Clear the blog details cache.
    
     @since MU (3.0.0)
    
     @param int $blog_id Optional. Blog ID. Defaults to current blog.
    
  **/
  public function refresh_blog_details(blog_id:Int = 0):Void;
  /**
    
     Update the details for a blog. Updates the blogs table for a given blog id.
    
     @since MU (3.0.0)
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int   $blog_id Blog ID
     @param array $details Array of details keyed by blogs table field names.
     @return bool True if update succeeds, false otherwise.
    
  **/
  public function update_blog_details(blog_id:Int, ?details:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Cleans the site details cache for a site.
    
     @since 4.7.4
    
     @param int $site_id Optional. Site ID. Default is the current site ID.
    
  **/
  public function clean_site_details_cache(site_id:Int = 0):Void;
  /**
    
     Retrieve option value for a given blog id based on name of option.
    
     If the option does not exist or does not have a value, then the return value
     will be false. This is useful to check whether you need to install an option
     and is commonly used during installation of plugin options and to test
     whether upgrading is required.
    
     If the option was serialized then it will be unserialized when it is returned.
    
     @since MU (3.0.0)
    
     @param int    $id      A blog ID. Can be null to refer to the current blog.
     @param string $option  Name of option to retrieve. Expected to not be SQL-escaped.
     @param mixed  $default Optional. Default value to return if the option does not exist.
     @return mixed Value set for the option.
    
  **/
  public function get_blog_option(id:Int, option:String, default:Dynamic = false):Dynamic;
  /**
    
     Add a new option for a given blog id.
    
     You do not need to serialize values. If the value needs to be serialized, then
     it will be serialized before it is inserted into the database. Remember,
     resources can not be serialized or added as an option.
    
     You can create options without values and then update the values later.
     Existing options will not be updated and checks are performed to ensure that you
     aren't adding a protected WordPress option. Care should be taken to not name
     options the same as the ones which are protected.
    
     @since MU (3.0.0)
    
     @param int    $id     A blog ID. Can be null to refer to the current blog.
     @param string $option Name of option to add. Expected to not be SQL-escaped.
     @param mixed  $value  Optional. Option value, can be anything. Expected to not be SQL-escaped.
     @return bool False if option was not added and true if option was added.
    
  **/
  public function add_blog_option(id:Int, option:String, value:Dynamic):Bool;
  /**
    
     Removes option by name for a given blog id. Prevents removal of protected WordPress options.
    
     @since MU (3.0.0)
    
     @param int    $id     A blog ID. Can be null to refer to the current blog.
     @param string $option Name of option to remove. Expected to not be SQL-escaped.
     @return bool True, if option is successfully deleted. False on failure.
    
  **/
  public function delete_blog_option(id:Int, option:String):Bool;
  /**
    
     Update an option for a particular blog.
    
     @since MU (3.0.0)
    
     @param int    $id         The blog id.
     @param string $option     The option key.
     @param mixed  $value      The option value.
     @param mixed  $deprecated Not used.
     @return bool True on success, false on failure.
    
  **/
  public function update_blog_option(id:Int, option:String, value:Dynamic, deprecated:Dynamic = null):Bool;
  /**
    
     Switch the current blog.
    
     This function is useful if you need to pull posts, or other information,
     from other blogs. You can switch back afterwards using restore_current_blog().
    
     Things that aren't switched:
      - plugins. See #14941
    
     @see restore_current_blog()
     @since MU (3.0.0)
    
     @global wpdb            $wpdb
     @global int             $blog_id
     @global array           $_wp_switched_stack
     @global bool            $switched
     @global string          $table_prefix
     @global WP_Object_Cache $wp_object_cache
    
     @param int  $new_blog   The id of the blog you want to switch to. Default: current blog
     @param bool $deprecated Deprecated argument
     @return true Always returns True.
    
  **/
  public function switch_to_blog(new_blog:Int, deprecated:Bool = null):Bool;
  /**
    
     Restore the current blog, after calling switch_to_blog()
    
     @see switch_to_blog()
     @since MU (3.0.0)
    
     @global wpdb            $wpdb
     @global array           $_wp_switched_stack
     @global int             $blog_id
     @global bool            $switched
     @global string          $table_prefix
     @global WP_Object_Cache $wp_object_cache
    
     @return bool True on success, false if we're already on the current blog
    
  **/
  public function restore_current_blog():Bool;
  /**
    
     Switches the initialized roles and current user capabilities to another site.
    
     @since 4.9.0
    
     @param int $new_site_id New site ID.
     @param int $old_site_id Old site ID.
    
  **/
  public function wp_switch_roles_and_user(new_site_id:Int, old_site_id:Int):Void;
  /**
    
     Determines if switch_to_blog() is in effect
    
     @since 3.5.0
    
     @global array $_wp_switched_stack
    
     @return bool True if switched, false otherwise.
    
  **/
  public function ms_is_switched():Bool;
  /**
    
     Check if a particular blog is archived.
    
     @since MU (3.0.0)
    
     @param int $id The blog id
     @return string Whether the blog is archived or not
    
  **/
  public function is_archived(id:Int):String;
  /**
    
     Update the 'archived' status of a particular blog.
    
     @since MU (3.0.0)
    
     @param int    $id       The blog id
     @param string $archived The new status
     @return string $archived
    
  **/
  public function update_archived(id:Int, archived:String):String;
  /**
    
     Update a blog details field.
    
     @since MU (3.0.0)
     @since 5.1.0 Use wp_update_site() internally.
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int    $blog_id BLog ID
     @param string $pref    A field name
     @param string $value   Value for $pref
     @param null   $deprecated
     @return string|false $value
    
  **/
  public function update_blog_status(blog_id:Int, pref:String, value:String, deprecated:Dynamic = null):haxe.extern.EitherType<String, Bool>;
  /**
    
     Get a blog details field.
    
     @since MU (3.0.0)
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param int    $id   The blog id
     @param string $pref A field name
     @return bool|string|null $value
    
  **/
  public function get_blog_status(id:Int, pref:String):haxe.extern.EitherType<Bool, String>;
  /**
    
     Get a list of most recently updated blogs.
    
     @since MU (3.0.0)
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param mixed $deprecated Not used
     @param int   $start      The offset
     @param int   $quantity   The maximum number of blogs to retrieve. Default is 40.
     @return array The list of blogs
    
  **/
  public function get_last_updated(deprecated:Dynamic = '', start:Int = 0, quantity:Int = 40):php.NativeArray;
  /**
    
     Handler for updating the site's last updated date when a post is published or
     an already published post is changed.
    
     @since 3.3.0
    
     @param string $new_status The new post status
     @param string $old_status The old post status
     @param object $post       Post object
    
  **/
  public function _update_blog_date_on_post_publish(new_status:String, old_status:String, post:Dynamic):Void;
  /**
    
     Handler for updating the current site's last updated date when a published
     post is deleted.
    
     @since 3.4.0
    
     @param int $post_id Post ID
    
  **/
  public function _update_blog_date_on_post_delete(post_id:Int):Void;
  /**
    
     Handler for updating the current site's posts count when a post is deleted.
    
     @since 4.0.0
    
     @param int $post_id Post ID.
    
  **/
  public function _update_posts_count_on_delete(post_id:Int):Void;
  /**
    
     Handler for updating the current site's posts count when a post status changes.
    
     @since 4.0.0
     @since 4.9.0 Added the `$post` parameter.
    
     @param string  $new_status The status the post is changing to.
     @param string  $old_status The status the post is changing from.
     @param WP_Post $post       Post object
    
  **/
  public function _update_posts_count_on_transition_post_status(new_status:String, old_status:String, post:wp.extern.Post = null):Void;
}
