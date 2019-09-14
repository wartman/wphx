package wp.extern;

extern class TemplateApi implements wp.util.ApiFunctions {
  /**
    
     Retrieve path to a template
    
     Used to quickly retrieve the path of a template without including the file
     extension. It will also check the parent theme, if the file exists, with
     the use of locate_template(). Allows for more generic template location
     without the use of the other get_*_template() functions.
    
     @since 1.5.0
    
     @param string $type      Filename without extension.
     @param array  $templates An optional list of template candidates
     @return string Full path to template file.
    
  **/
  public function get_query_template(type:String, ?templates:php.NativeStructArray<Dynamic>):String;
  /**
    
     Retrieve path of index template in current or parent template.
    
     The template hierarchy and template path are filterable via the {@see '$type_template_hierarchy'}
     and {@see '$type_template'} dynamic hooks, where `$type` is 'index'.
    
     @since 3.0.0
    
     @see get_query_template()
    
     @return string Full path to index template file.
    
  **/
  public function get_index_template():String;
  /**
    
     Retrieve path of 404 template in current or parent template.
    
     The template hierarchy and template path are filterable via the {@see '$type_template_hierarchy'}
     and {@see '$type_template'} dynamic hooks, where `$type` is '404'.
    
     @since 1.5.0
    
     @see get_query_template()
    
     @return string Full path to 404 template file.
    
  **/
  public function get_404_template():String;
  /**
    
     Retrieve path of archive template in current or parent template.
    
     The template hierarchy and template path are filterable via the {@see '$type_template_hierarchy'}
     and {@see '$type_template'} dynamic hooks, where `$type` is 'archive'.
    
     @since 1.5.0
    
     @see get_query_template()
    
     @return string Full path to archive template file.
    
  **/
  public function get_archive_template():String;
  /**
    
     Retrieve path of post type archive template in current or parent template.
    
     The template hierarchy and template path are filterable via the {@see '$type_template_hierarchy'}
     and {@see '$type_template'} dynamic hooks, where `$type` is 'archive'.
    
     @since 3.7.0
    
     @see get_archive_template()
    
     @return string Full path to archive template file.
    
  **/
  public function get_post_type_archive_template():String;
  /**
    
     Retrieve path of author template in current or parent template.
    
     The hierarchy for this template looks like:
    
     1. author-{nicename}.php
     2. author-{id}.php
     3. author.php
    
     An example of this is:
    
     1. author-john.php
     2. author-1.php
     3. author.php
    
     The template hierarchy and template path are filterable via the {@see '$type_template_hierarchy'}
     and {@see '$type_template'} dynamic hooks, where `$type` is 'author'.
    
     @since 1.5.0
    
     @see get_query_template()
    
     @return string Full path to author template file.
    
  **/
  public function get_author_template():String;
  /**
    
     Retrieve path of category template in current or parent template.
    
     The hierarchy for this template looks like:
    
     1. category-{slug}.php
     2. category-{id}.php
     3. category.php
    
     An example of this is:
    
     1. category-news.php
     2. category-2.php
     3. category.php
    
     The template hierarchy and template path are filterable via the {@see '$type_template_hierarchy'}
     and {@see '$type_template'} dynamic hooks, where `$type` is 'category'.
    
     @since 1.5.0
     @since 4.7.0 The decoded form of `category-{slug}.php` was added to the top of the
                  template hierarchy when the category slug contains multibyte characters.
    
     @see get_query_template()
    
     @return string Full path to category template file.
    
  **/
  public function get_category_template():String;
  /**
    
     Retrieve path of tag template in current or parent template.
    
     The hierarchy for this template looks like:
    
     1. tag-{slug}.php
     2. tag-{id}.php
     3. tag.php
    
     An example of this is:
    
     1. tag-wordpress.php
     2. tag-3.php
     3. tag.php
    
     The template hierarchy and template path are filterable via the {@see '$type_template_hierarchy'}
     and {@see '$type_template'} dynamic hooks, where `$type` is 'tag'.
    
     @since 2.3.0
     @since 4.7.0 The decoded form of `tag-{slug}.php` was added to the top of the
                  template hierarchy when the tag slug contains multibyte characters.
    
     @see get_query_template()
    
     @return string Full path to tag template file.
    
  **/
  public function get_tag_template():String;
  /**
    
     Retrieve path of custom taxonomy term template in current or parent template.
    
     The hierarchy for this template looks like:
    
     1. taxonomy-{taxonomy_slug}-{term_slug}.php
     2. taxonomy-{taxonomy_slug}.php
     3. taxonomy.php
    
     An example of this is:
    
     1. taxonomy-location-texas.php
     2. taxonomy-location.php
     3. taxonomy.php
    
     The template hierarchy and template path are filterable via the {@see '$type_template_hierarchy'}
     and {@see '$type_template'} dynamic hooks, where `$type` is 'taxonomy'.
    
     @since 2.5.0
     @since 4.7.0 The decoded form of `taxonomy-{taxonomy_slug}-{term_slug}.php` was added to the top of the
                  template hierarchy when the term slug contains multibyte characters.
    
     @see get_query_template()
    
     @return string Full path to custom taxonomy term template file.
    
  **/
  public function get_taxonomy_template():String;
  /**
    
     Retrieve path of date template in current or parent template.
    
     The template hierarchy and template path are filterable via the {@see '$type_template_hierarchy'}
     and {@see '$type_template'} dynamic hooks, where `$type` is 'date'.
    
     @since 1.5.0
    
     @see get_query_template()
    
     @return string Full path to date template file.
    
  **/
  public function get_date_template():String;
  /**
    
     Retrieve path of home template in current or parent template.
    
     The template hierarchy and template path are filterable via the {@see '$type_template_hierarchy'}
     and {@see '$type_template'} dynamic hooks, where `$type` is 'home'.
    
     @since 1.5.0
    
     @see get_query_template()
    
     @return string Full path to home template file.
    
  **/
  public function get_home_template():String;
  /**
    
     Retrieve path of front page template in current or parent template.
    
     The template hierarchy and template path are filterable via the {@see '$type_template_hierarchy'}
     and {@see '$type_template'} dynamic hooks, where `$type` is 'frontpage'.
    
     @since 3.0.0
    
     @see get_query_template()
    
     @return string Full path to front page template file.
    
  **/
  public function get_front_page_template():String;
  /**
    
     Retrieve path of page template in current or parent template.
    
     The hierarchy for this template looks like:
    
     1. {Page Template}.php
     2. page-{page_name}.php
     3. page-{id}.php
     4. page.php
    
     An example of this is:
    
     1. page-templates/full-width.php
     2. page-about.php
     3. page-4.php
     4. page.php
    
     The template hierarchy and template path are filterable via the {@see '$type_template_hierarchy'}
     and {@see '$type_template'} dynamic hooks, where `$type` is 'page'.
    
     @since 1.5.0
     @since 4.7.0 The decoded form of `page-{page_name}.php` was added to the top of the
                  template hierarchy when the page name contains multibyte characters.
    
     @see get_query_template()
    
     @return string Full path to page template file.
    
  **/
  public function get_page_template():String;
  /**
    
     Retrieve path of search template in current or parent template.
    
     The template hierarchy and template path are filterable via the {@see '$type_template_hierarchy'}
     and {@see '$type_template'} dynamic hooks, where `$type` is 'search'.
    
     @since 1.5.0
    
     @see get_query_template()
    
     @return string Full path to search template file.
    
  **/
  public function get_search_template():String;
  /**
    
     Retrieve path of single template in current or parent template. Applies to single Posts,
     single Attachments, and single custom post types.
    
     The hierarchy for this template looks like:
    
     1. {Post Type Template}.php
     2. single-{post_type}-{post_name}.php
     3. single-{post_type}.php
     4. single.php
    
     An example of this is:
    
     1. templates/full-width.php
     2. single-post-hello-world.php
     3. single-post.php
     4. single.php
    
     The template hierarchy and template path are filterable via the {@see '$type_template_hierarchy'}
     and {@see '$type_template'} dynamic hooks, where `$type` is 'single'.
    
     @since 1.5.0
     @since 4.4.0 `single-{post_type}-{post_name}.php` was added to the top of the template hierarchy.
     @since 4.7.0 The decoded form of `single-{post_type}-{post_name}.php` was added to the top of the
                  template hierarchy when the post name contains multibyte characters.
     @since 4.7.0 `{Post Type Template}.php` was added to the top of the template hierarchy.
    
     @see get_query_template()
    
     @return string Full path to single template file.
    
  **/
  public function get_single_template():String;
  /**
    
     Retrieves an embed template path in the current or parent template.
    
     The hierarchy for this template looks like:
    
     1. embed-{post_type}-{post_format}.php
     2. embed-{post_type}.php
     3. embed.php
    
     An example of this is:
    
     1. embed-post-audio.php
     2. embed-post.php
     3. embed.php
    
     The template hierarchy and template path are filterable via the {@see '$type_template_hierarchy'}
     and {@see '$type_template'} dynamic hooks, where `$type` is 'embed'.
    
     @since 4.5.0
    
     @see get_query_template()
    
     @return string Full path to embed template file.
    
  **/
  public function get_embed_template():String;
  /**
    
     Retrieves the path of the singular template in current or parent template.
    
     The template hierarchy and template path are filterable via the {@see '$type_template_hierarchy'}
     and {@see '$type_template'} dynamic hooks, where `$type` is 'singular'.
    
     @since 4.3.0
    
     @see get_query_template()
    
     @return string Full path to singular template file
    
  **/
  public function get_singular_template():String;
  /**
    
     Retrieve path of attachment template in current or parent template.
    
     The hierarchy for this template looks like:
    
     1. {mime_type}-{sub_type}.php
     2. {sub_type}.php
     3. {mime_type}.php
     4. attachment.php
    
     An example of this is:
    
     1. image-jpeg.php
     2. jpeg.php
     3. image.php
     4. attachment.php
    
     The template hierarchy and template path are filterable via the {@see '$type_template_hierarchy'}
     and {@see '$type_template'} dynamic hooks, where `$type` is 'attachment'.
    
     @since 2.0.0
     @since 4.3.0 The order of the mime type logic was reversed so the hierarchy is more logical.
    
     @see get_query_template()
    
     @global array $posts
    
     @return string Full path to attachment template file.
    
  **/
  public function get_attachment_template():String;
  /**
    
     Retrieve the name of the highest priority template file that exists.
    
     Searches in the STYLESHEETPATH before TEMPLATEPATH and wp-includes/theme-compat
     so that themes which inherit from a parent theme can just overload one file.
    
     @since 2.7.0
    
     @param string|array $template_names Template file(s) to search for, in order.
     @param bool         $load           If true the template file will be loaded if it is found.
     @param bool         $require_once   Whether to require_once or require. Default true. Has no effect if $load is false.
     @return string The template filename if one is located.
    
  **/
  public function locate_template(template_names:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, load:Bool = false, require_once:Bool = true):String;
  /**
    
     Require the template file with WordPress environment.
    
     The globals are set up for the template file to ensure that the WordPress
     environment is available from within the function. The query variables are
     also available.
    
     @since 1.5.0
    
     @global array      $posts
     @global WP_Post    $post
     @global bool       $wp_did_header
     @global WP_Query   $wp_query
     @global WP_Rewrite $wp_rewrite
     @global wpdb       $wpdb
     @global string     $wp_version
     @global WP         $wp
     @global int        $id
     @global WP_Comment $comment
     @global int        $user_ID
    
     @param string $_template_file Path to template file.
     @param bool   $require_once   Whether to require_once or require. Default true.
    
  **/
  public function load_template(_template_file:String, require_once:Bool = true):Void;
}
