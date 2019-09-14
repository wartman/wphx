package wp.extern;

extern class GeneralTemplateApi implements wp.util.ApiFunctions {
  /**
    
     Load header template.
    
     Includes the header template for a theme or if a name is specified then a
     specialised header will be included.
    
     For the parameter, if the file is called "header-special.php" then specify
     "special".
    
     @since 1.5.0
    
     @param string $name The name of the specialised header.
    
  **/
  public function get_header(name:String = null):Void;
  /**
    
     Load footer template.
    
     Includes the footer template for a theme or if a name is specified then a
     specialised footer will be included.
    
     For the parameter, if the file is called "footer-special.php" then specify
     "special".
    
     @since 1.5.0
    
     @param string $name The name of the specialised footer.
    
  **/
  public function get_footer(name:String = null):Void;
  /**
    
     Load sidebar template.
    
     Includes the sidebar template for a theme or if a name is specified then a
     specialised sidebar will be included.
    
     For the parameter, if the file is called "sidebar-special.php" then specify
     "special".
    
     @since 1.5.0
    
     @param string $name The name of the specialised sidebar.
    
  **/
  public function get_sidebar(name:String = null):Void;
  /**
    
     Loads a template part into a template.
    
     Provides a simple mechanism for child themes to overload reusable sections of code
     in the theme.
    
     Includes the named template part for a theme or if a name is specified then a
     specialised part will be included. If the theme contains no {slug}.php file
     then no template will be included.
    
     The template is included using require, not require_once, so you may include the
     same template part multiple times.
    
     For the $name parameter, if the file is called "{slug}-special.php" then specify
     "special".
    
     @since 3.0.0
    
     @param string $slug The slug name for the generic template.
     @param string $name The name of the specialised template.
    
  **/
  public function get_template_part(slug:String, name:String = null):Void;
  /**
    
     Display search form.
    
     Will first attempt to locate the searchform.php file in either the child or
     the parent, then load it. If it doesn't exist, then the default search form
     will be displayed. The default search form is HTML, which will be displayed.
     There is a filter applied to the search form HTML in order to edit or replace
     it. The filter is {@see 'get_search_form'}.
    
     This function is primarily used by themes which want to hardcode the search
     form into the sidebar and also by the search widget in WordPress.
    
     There is also an action that is called whenever the function is run called,
     {@see 'pre_get_search_form'}. This can be useful for outputting JavaScript that the
     search relies on or various formatting that applies to the beginning of the
     search. To give a few examples of what it can be used for.
    
     @since 2.7.0
    
     @param bool $echo Default to echo and not return the form.
     @return string|void String when $echo is false.
    
  **/
  public function get_search_form(echo:Bool = true):String;
  /**
    
     Display the Log In/Out link.
    
     Displays a link, which allows users to navigate to the Log In page to log in
     or log out depending on whether they are currently logged in.
    
     @since 1.5.0
    
     @param string $redirect Optional path to redirect to on login/logout.
     @param bool   $echo     Default to echo and not return the link.
     @return string|void String when retrieving.
    
  **/
  public function wp_loginout(redirect:String = '', echo:Bool = true):String;
  /**
    
     Retrieves the logout URL.
    
     Returns the URL that allows the user to log out of the site.
    
     @since 2.7.0
    
     @param string $redirect Path to redirect to on logout.
     @return string The logout URL. Note: HTML-encoded via esc_html() in wp_nonce_url().
    
  **/
  public function wp_logout_url(redirect:String = ''):String;
  /**
    
     Retrieves the login URL.
    
     @since 2.7.0
    
     @param string $redirect     Path to redirect to on log in.
     @param bool   $force_reauth Whether to force reauthorization, even if a cookie is present.
                                 Default false.
     @return string The login URL. Not HTML-encoded.
    
  **/
  public function wp_login_url(redirect:String = '', force_reauth:Bool = false):String;
  /**
    
     Returns the URL that allows the user to register on the site.
    
     @since 3.6.0
    
     @return string User registration URL.
    
  **/
  public function wp_registration_url():String;
  /**
    
     Provides a simple login form for use anywhere within WordPress.
    
     The login format HTML is echoed by default. Pass a false value for `$echo` to return it instead.
    
     @since 3.0.0
    
     @param array $args {
         Optional. Array of options to control the form output. Default empty array.
    
         @type bool   $echo           Whether to display the login form or return the form HTML code.
                                      Default true (echo).
         @type string $redirect       URL to redirect to. Must be absolute, as in "https://example.com/mypage/".
                                      Default is to redirect back to the request URI.
         @type string $form_id        ID attribute value for the form. Default 'loginform'.
         @type string $label_username Label for the username or email address field. Default 'Username or Email Address'.
         @type string $label_password Label for the password field. Default 'Password'.
         @type string $label_remember Label for the remember field. Default 'Remember Me'.
         @type string $label_log_in   Label for the submit button. Default 'Log In'.
         @type string $id_username    ID attribute value for the username field. Default 'user_login'.
         @type string $id_password    ID attribute value for the password field. Default 'user_pass'.
         @type string $id_remember    ID attribute value for the remember field. Default 'rememberme'.
         @type string $id_submit      ID attribute value for the submit button. Default 'wp-submit'.
         @type bool   $remember       Whether to display the "rememberme" checkbox in the form.
         @type string $value_username Default value for the username field. Default empty.
         @type bool   $value_remember Whether the "Remember Me" checkbox should be checked by default.
                                      Default false (unchecked).
    
     }
     @return string|void String when retrieving.
    
  **/
  public function wp_login_form(?args:php.NativeStructArray<Dynamic>):String;
  /**
    
     Returns the URL that allows the user to retrieve the lost password
    
     @since 2.8.0
    
     @param string $redirect Path to redirect to on login.
     @return string Lost password URL.
    
  **/
  public function wp_lostpassword_url(redirect:String = ''):String;
  /**
    
     Display the Registration or Admin link.
    
     Display a link which allows the user to navigate to the registration page if
     not logged in and registration is enabled or to the dashboard if logged in.
    
     @since 1.5.0
    
     @param string $before Text to output before the link. Default `<li>`.
     @param string $after  Text to output after the link. Default `</li>`.
     @param bool   $echo   Default to echo and not return the link.
     @return string|void String when retrieving.
    
  **/
  public function wp_register(before:String = '<li>', after:String = '</li>', echo:Bool = true):String;
  /**
    
     Theme container function for the 'wp_meta' action.
    
     The {@see 'wp_meta'} action can have several purposes, depending on how you use it,
     but one purpose might have been to allow for theme switching.
    
     @since 1.5.0
    
     @link https://core.trac.wordpress.org/ticket/1458 Explanation of 'wp_meta' action.
    
  **/
  public function wp_meta():Void;
  /**
    
     Displays information about the current site.
    
     @since 0.71
    
     @see get_bloginfo() For possible `$show` values
    
     @param string $show Optional. Site information to display. Default empty.
    
  **/
  public function bloginfo(show:String = ''):Void;
  /**
    
     Retrieves information about the current site.
    
     Possible values for `$show` include:
    
     - 'name' - Site title (set in Settings > General)
     - 'description' - Site tagline (set in Settings > General)
     - 'wpurl' - The WordPress address (URL) (set in Settings > General)
     - 'url' - The Site address (URL) (set in Settings > General)
     - 'admin_email' - Admin email (set in Settings > General)
     - 'charset' - The "Encoding for pages and feeds"  (set in Settings > Reading)
     - 'version' - The current WordPress version
     - 'html_type' - The content-type (default: "text/html"). Themes and plugins
       can override the default value using the {@see 'pre_option_html_type'} filter
     - 'text_direction' - The text direction determined by the site's language. is_rtl()
       should be used instead
     - 'language' - Language code for the current site
     - 'stylesheet_url' - URL to the stylesheet for the active theme. An active child theme
       will take precedence over this value
     - 'stylesheet_directory' - Directory path for the active theme.  An active child theme
       will take precedence over this value
     - 'template_url' / 'template_directory' - URL of the active theme's directory. An active
       child theme will NOT take precedence over this value
     - 'pingback_url' - The pingback XML-RPC file URL (xmlrpc.php)
     - 'atom_url' - The Atom feed URL (/feed/atom)
     - 'rdf_url' - The RDF/RSS 1.0 feed URL (/feed/rdf)
     - 'rss_url' - The RSS 0.92 feed URL (/feed/rss)
     - 'rss2_url' - The RSS 2.0 feed URL (/feed)
     - 'comments_atom_url' - The comments Atom feed URL (/comments/feed)
     - 'comments_rss2_url' - The comments RSS 2.0 feed URL (/comments/feed)
    
     Some `$show` values are deprecated and will be removed in future versions.
     These options will trigger the _deprecated_argument() function.
    
     Deprecated arguments include:
    
     - 'siteurl' - Use 'url' instead
     - 'home' - Use 'url' instead
    
     @since 0.71
    
     @global string $wp_version
    
     @param string $show   Optional. Site info to retrieve. Default empty (site name).
     @param string $filter Optional. How to filter what is retrieved. Default 'raw'.
     @return string Mostly string values, might be empty.
    
  **/
  public function get_bloginfo(show:String = '', filter:String = 'raw'):String;
  /**
    
     Returns the Site Icon URL.
    
     @since 4.3.0
    
     @param int    $size    Optional. Size of the site icon. Default 512 (pixels).
     @param string $url     Optional. Fallback url if no site icon is found. Default empty.
     @param int    $blog_id Optional. ID of the blog to get the site icon for. Default current blog.
     @return string Site Icon URL.
    
  **/
  public function get_site_icon_url(size:Int = 512, url:String = '', blog_id:Int = 0):String;
  /**
    
     Displays the Site Icon URL.
    
     @since 4.3.0
    
     @param int    $size    Optional. Size of the site icon. Default 512 (pixels).
     @param string $url     Optional. Fallback url if no site icon is found. Default empty.
     @param int    $blog_id Optional. ID of the blog to get the site icon for. Default current blog.
    
  **/
  public function site_icon_url(size:Int = 512, url:String = '', blog_id:Int = 0):Void;
  /**
    
     Whether the site has a Site Icon.
    
     @since 4.3.0
    
     @param int $blog_id Optional. ID of the blog in question. Default current blog.
     @return bool Whether the site has a site icon or not.
    
  **/
  public function has_site_icon(blog_id:Int = 0):Bool;
  /**
    
     Determines whether the site has a custom logo.
    
     @since 4.5.0
    
     @param int $blog_id Optional. ID of the blog in question. Default is the ID of the current blog.
     @return bool Whether the site has a custom logo or not.
    
  **/
  public function has_custom_logo(blog_id:Int = 0):Bool;
  /**
    
     Returns a custom logo, linked to home.
    
     @since 4.5.0
    
     @param int $blog_id Optional. ID of the blog in question. Default is the ID of the current blog.
     @return string Custom logo markup.
    
  **/
  public function get_custom_logo(blog_id:Int = 0):String;
  /**
    
     Displays a custom logo, linked to home.
    
     @since 4.5.0
    
     @param int $blog_id Optional. ID of the blog in question. Default is the ID of the current blog.
    
  **/
  public function the_custom_logo(blog_id:Int = 0):Void;
  /**
    
     Returns document title for the current page.
    
     @since 4.4.0
    
     @global int $page  Page number of a single post.
     @global int $paged Page number of a list of posts.
    
     @return string Tag with the document title.
    
  **/
  public function wp_get_document_title():String;
  /**
    
     Displays title tag with content.
    
     @ignore
     @since 4.1.0
     @since 4.4.0 Improved title output replaced `wp_title()`.
     @access private
    
  **/
  public function _wp_render_title_tag():Void;
  /**
    
     Display or retrieve page title for all areas of blog.
    
     By default, the page title will display the separator before the page title,
     so that the blog title will be before the page title. This is not good for
     title display, since the blog title shows up on most tabs and not what is
     important, which is the page that the user is looking at.
    
     There are also SEO benefits to having the blog title after or to the 'right'
     of the page title. However, it is mostly common sense to have the blog title
     to the right with most browsers supporting tabs. You can achieve this by
     using the seplocation parameter and setting the value to 'right'. This change
     was introduced around 2.5.0, in case backward compatibility of themes is
     important.
    
     @since 1.0.0
    
     @global WP_Locale $wp_locale
    
     @param string $sep         Optional, default is '&raquo;'. How to separate the various items
                                within the page title.
     @param bool   $display     Optional, default is true. Whether to display or retrieve title.
     @param string $seplocation Optional. Direction to display title, 'right'.
     @return string|null String on retrieve, null when displaying.
    
  **/
  public function wp_title(sep:String = '&raquo;', display:Bool = true, seplocation:String = ''):String;
  /**
    
     Display or retrieve page title for post.
    
     This is optimized for single.php template file for displaying the post title.
    
     It does not support placing the separator after the title, but by leaving the
     prefix parameter empty, you can set the title separator manually. The prefix
     does not automatically place a space between the prefix, so if there should
     be a space, the parameter value will need to have it at the end.
    
     @since 0.71
    
     @param string $prefix  Optional. What to display before the title.
     @param bool   $display Optional, default is true. Whether to display or retrieve title.
     @return string|void Title when retrieving.
    
  **/
  public function single_post_title(prefix:String = '', display:Bool = true):String;
  /**
    
     Display or retrieve title for a post type archive.
    
     This is optimized for archive.php and archive-{$post_type}.php template files
     for displaying the title of the post type.
    
     @since 3.1.0
    
     @param string $prefix  Optional. What to display before the title.
     @param bool   $display Optional, default is true. Whether to display or retrieve title.
     @return string|void Title when retrieving, null when displaying or failure.
    
  **/
  public function post_type_archive_title(prefix:String = '', display:Bool = true):String;
  /**
    
     Display or retrieve page title for category archive.
    
     Useful for category template files for displaying the category page title.
     The prefix does not automatically place a space between the prefix, so if
     there should be a space, the parameter value will need to have it at the end.
    
     @since 0.71
    
     @param string $prefix  Optional. What to display before the title.
     @param bool   $display Optional, default is true. Whether to display or retrieve title.
     @return string|void Title when retrieving.
    
  **/
  public function single_cat_title(prefix:String = '', display:Bool = true):String;
  /**
    
     Display or retrieve page title for tag post archive.
    
     Useful for tag template files for displaying the tag page title. The prefix
     does not automatically place a space between the prefix, so if there should
     be a space, the parameter value will need to have it at the end.
    
     @since 2.3.0
    
     @param string $prefix  Optional. What to display before the title.
     @param bool   $display Optional, default is true. Whether to display or retrieve title.
     @return string|void Title when retrieving.
    
  **/
  public function single_tag_title(prefix:String = '', display:Bool = true):String;
  /**
    
     Display or retrieve page title for taxonomy term archive.
    
     Useful for taxonomy term template files for displaying the taxonomy term page title.
     The prefix does not automatically place a space between the prefix, so if there should
     be a space, the parameter value will need to have it at the end.
    
     @since 3.1.0
    
     @param string $prefix  Optional. What to display before the title.
     @param bool   $display Optional, default is true. Whether to display or retrieve title.
     @return string|void Title when retrieving.
    
  **/
  public function single_term_title(prefix:String = '', display:Bool = true):String;
  /**
    
     Display or retrieve page title for post archive based on date.
    
     Useful for when the template only needs to display the month and year,
     if either are available. The prefix does not automatically place a space
     between the prefix, so if there should be a space, the parameter value
     will need to have it at the end.
    
     @since 0.71
    
     @global WP_Locale $wp_locale
    
     @param string $prefix  Optional. What to display before the title.
     @param bool   $display Optional, default is true. Whether to display or retrieve title.
     @return string|void Title when retrieving.
    
  **/
  public function single_month_title(prefix:String = '', display:Bool = true):String;
  /**
    
     Display the archive title based on the queried object.
    
     @since 4.1.0
    
     @see get_the_archive_title()
    
     @param string $before Optional. Content to prepend to the title. Default empty.
     @param string $after  Optional. Content to append to the title. Default empty.
    
  **/
  public function the_archive_title(before:String = '', after:String = ''):Void;
  /**
    
     Retrieve the archive title based on the queried object.
    
     @since 4.1.0
    
     @return string Archive title.
    
  **/
  public function get_the_archive_title():String;
  /**
    
     Display category, tag, term, or author description.
    
     @since 4.1.0
    
     @see get_the_archive_description()
    
     @param string $before Optional. Content to prepend to the description. Default empty.
     @param string $after  Optional. Content to append to the description. Default empty.
    
  **/
  public function the_archive_description(before:String = '', after:String = ''):Void;
  /**
    
     Retrieves the description for an author, post type, or term archive.
    
     @since 4.1.0
     @since 4.7.0 Added support for author archives.
     @since 4.9.0 Added support for post type archives.
    
     @see term_description()
    
     @return string Archive description.
    
  **/
  public function get_the_archive_description():String;
  /**
    
     Retrieves the description for a post type archive.
    
     @since 4.9.0
    
     @return string The post type description.
    
  **/
  public function get_the_post_type_description():String;
  /**
    
     Retrieve archive link content based on predefined or custom code.
    
     The format can be one of four styles. The 'link' for head element, 'option'
     for use in the select element, 'html' for use in list (either ol or ul HTML
     elements). Custom content is also supported using the before and after
     parameters.
    
     The 'link' format uses the `<link>` HTML element with the **archives**
     relationship. The before and after parameters are not used. The text
     parameter is used to describe the link.
    
     The 'option' format uses the option HTML element for use in select element.
     The value is the url parameter and the before and after parameters are used
     between the text description.
    
     The 'html' format, which is the default, uses the li HTML element for use in
     the list HTML elements. The before parameter is before the link and the after
     parameter is after the closing link.
    
     The custom format uses the before parameter before the link ('a' HTML
     element) and the after parameter after the closing link tag. If the above
     three values for the format are not used, then custom format is assumed.
    
     @since 1.0.0
    
     @param string $url    URL to archive.
     @param string $text   Archive text description.
     @param string $format Optional, default is 'html'. Can be 'link', 'option', 'html', or custom.
     @param string $before Optional. Content to prepend to the description. Default empty.
     @param string $after  Optional. Content to append to the description. Default empty.
     @return string HTML link content for archive.
    
  **/
  public function get_archives_link(url:String, text:String, format:String = 'html', before:String = '', after:String = ''):String;
  /**
    
     Display archive links based on type and format.
    
     @since 1.2.0
     @since 4.4.0 $post_type arg was added.
    
     @see get_archives_link()
    
     @global wpdb      $wpdb
     @global WP_Locale $wp_locale
    
     @param string|array $args {
         Default archive links arguments. Optional.
    
         @type string     $type            Type of archive to retrieve. Accepts 'daily', 'weekly', 'monthly',
                                           'yearly', 'postbypost', or 'alpha'. Both 'postbypost' and 'alpha'
                                           display the same archive link list as well as post titles instead
                                           of displaying dates. The difference between the two is that 'alpha'
                                           will order by post title and 'postbypost' will order by post date.
                                           Default 'monthly'.
         @type string|int $limit           Number of links to limit the query to. Default empty (no limit).
         @type string     $format          Format each link should take using the $before and $after args.
                                           Accepts 'link' (`<link>` tag), 'option' (`<option>` tag), 'html'
                                           (`<li>` tag), or a custom format, which generates a link anchor
                                           with $before preceding and $after succeeding. Default 'html'.
         @type string     $before          Markup to prepend to the beginning of each link. Default empty.
         @type string     $after           Markup to append to the end of each link. Default empty.
         @type bool       $show_post_count Whether to display the post count alongside the link. Default false.
         @type bool|int   $echo            Whether to echo or return the links list. Default 1|true to echo.
         @type string     $order           Whether to use ascending or descending order. Accepts 'ASC', or 'DESC'.
                                           Default 'DESC'.
         @type string     $post_type       Post type. Default 'post'.
     }
     @return string|void String when retrieving.
    
  **/
  public function wp_get_archives(args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):String;
  /**
    
     Get number of days since the start of the week.
    
     @since 1.5.0
    
     @param int $num Number of day.
     @return float Days since the start of the week.
    
  **/
  public function calendar_week_mod(num:Int):Int;
  /**
    
     Display calendar with days that have posts as links.
    
     The calendar is cached, which will be retrieved, if it exists. If there are
     no posts for the month, then it will not be displayed.
    
     @since 1.0.0
    
     @global wpdb      $wpdb
     @global int       $m
     @global int       $monthnum
     @global int       $year
     @global WP_Locale $wp_locale
     @global array     $posts
    
     @param bool $initial Optional, default is true. Use initial calendar names.
     @param bool $echo    Optional, default is true. Set to false for return.
     @return string|void String when retrieving.
    
  **/
  public function get_calendar(initial:Bool = true, echo:Bool = true):String;
  /**
    
     Purge the cached results of get_calendar.
    
     @see get_calendar
     @since 2.1.0
    
  **/
  public function delete_get_calendar_cache():Void;
  /**
    
     Display all of the allowed tags in HTML format with attributes.
    
     This is useful for displaying in the comment area, which elements and
     attributes are supported. As well as any plugins which want to display it.
    
     @since 1.0.1
    
     @global array $allowedtags
    
     @return string HTML allowed tags entity encoded.
    
  **/
  public function allowed_tags():String;
  /**
    
     Outputs the date in iso8601 format for xml files.
    
     @since 1.0.0
    
  **/
  public function the_date_xml():Void;
  /**
    
     Display or Retrieve the date the current post was written (once per date)
    
     Will only output the date if the current post's date is different from the
     previous one output.
    
     i.e. Only one date listing will show per day worth of posts shown in the loop, even if the
     function is called several times for each post.
    
     HTML output can be filtered with 'the_date'.
     Date string output can be filtered with 'get_the_date'.
    
     @since 0.71
    
     @global string|int|bool $currentday
     @global string|int|bool $previousday
    
     @param string $d      Optional. PHP date format defaults to the date_format option if not specified.
     @param string $before Optional. Output before the date.
     @param string $after  Optional. Output after the date.
     @param bool   $echo   Optional, default is display. Whether to echo the date or return it.
     @return string|void String if retrieving.
    
  **/
  public function the_date(d:String = '', before:String = '', after:String = '', echo:Bool = true):String;
  /**
    
     Retrieve the date on which the post was written.
    
     Unlike the_date() this function will always return the date.
     Modify output with the {@see 'get_the_date'} filter.
    
     @since 3.0.0
    
     @param  string      $d    Optional. PHP date format defaults to the date_format option if not specified.
     @param  int|WP_Post $post Optional. Post ID or WP_Post object. Default current post.
     @return false|string Date the current post was written. False on failure.
    
  **/
  public function get_the_date(d:String = '', post:haxe.extern.EitherType<Int, wp.extern.Post> = null):haxe.extern.EitherType<Bool, String>;
  /**
    
     Display the date on which the post was last modified.
    
     @since 2.1.0
    
     @param string $d      Optional. PHP date format defaults to the date_format option if not specified.
     @param string $before Optional. Output before the date.
     @param string $after  Optional. Output after the date.
     @param bool   $echo   Optional, default is display. Whether to echo the date or return it.
     @return string|void String if retrieving.
    
  **/
  public function the_modified_date(d:String = '', before:String = '', after:String = '', echo:Bool = true):String;
  /**
    
     Retrieve the date on which the post was last modified.
    
     @since 2.1.0
     @since 4.6.0 Added the `$post` parameter.
    
     @param string      $d    Optional. PHP date format defaults to the date_format option if not specified.
     @param int|WP_Post $post Optional. Post ID or WP_Post object. Default current post.
     @return false|string Date the current post was modified. False on failure.
    
  **/
  public function get_the_modified_date(d:String = '', post:haxe.extern.EitherType<Int, wp.extern.Post> = null):haxe.extern.EitherType<Bool, String>;
  /**
    
     Display the time at which the post was written.
    
     @since 0.71
    
     @param string $d Either 'G', 'U', or php date format.
    
  **/
  public function the_time(d:String = ''):Void;
  /**
    
     Retrieve the time at which the post was written.
    
     @since 1.5.0
    
     @param string      $d    Optional. Format to use for retrieving the time the post
                              was written. Either 'G', 'U', or php date format defaults
                              to the value specified in the time_format option. Default empty.
     @param int|WP_Post $post WP_Post object or ID. Default is global $post object.
     @return string|int|false Formatted date string or Unix timestamp if `$d` is 'U' or 'G'. False on failure.
    
  **/
  public function get_the_time(d:String = '', post:haxe.extern.EitherType<Int, wp.extern.Post> = null):haxe.extern.EitherType<String, haxe.extern.EitherType<Int, Bool>>;
  /**
    
     Retrieve the time at which the post was written.
    
     @since 2.0.0
    
     @param string      $d         Optional. Format to use for retrieving the time the post
                                   was written. Either 'G', 'U', or php date format. Default 'U'.
     @param bool        $gmt       Optional. Whether to retrieve the GMT time. Default false.
     @param int|WP_Post $post      WP_Post object or ID. Default is global $post object.
     @param bool        $translate Whether to translate the time string. Default false.
     @return string|int|false Formatted date string or Unix timestamp if `$d` is 'U' or 'G'. False on failure.
    
  **/
  public function get_post_time(?d:String, gmt:Bool = false, post:haxe.extern.EitherType<Int, wp.extern.Post> = null, translate:Bool = false):haxe.extern.EitherType<String, haxe.extern.EitherType<Int, Bool>>;
  /**
    
     Display the time at which the post was last modified.
    
     @since 2.0.0
    
     @param string $d Optional Either 'G', 'U', or php date format defaults to the value specified in the time_format option.
    
  **/
  public function the_modified_time(d:String = ''):Void;
  /**
    
     Retrieve the time at which the post was last modified.
    
     @since 2.0.0
     @since 4.6.0 Added the `$post` parameter.
    
     @param string      $d     Optional. Format to use for retrieving the time the post
                               was modified. Either 'G', 'U', or php date format defaults
                               to the value specified in the time_format option. Default empty.
     @param int|WP_Post $post  Optional. Post ID or WP_Post object. Default current post.
     @return false|string Formatted date string or Unix timestamp. False on failure.
    
  **/
  public function get_the_modified_time(d:String = '', post:haxe.extern.EitherType<Int, wp.extern.Post> = null):haxe.extern.EitherType<Bool, String>;
  /**
    
     Retrieve the time at which the post was last modified.
    
     @since 2.0.0
    
     @param string      $d         Optional. Format to use for retrieving the time the post
                                   was modified. Either 'G', 'U', or php date format. Default 'U'.
     @param bool        $gmt       Optional. Whether to retrieve the GMT time. Default false.
     @param int|WP_Post $post      WP_Post object or ID. Default is global $post object.
     @param bool        $translate Whether to translate the time string. Default false.
     @return string|int|false Formatted date string or Unix timestamp if `$d` is 'U' or 'G'. False on failure.
    
  **/
  public function get_post_modified_time(?d:String, gmt:Bool = false, post:haxe.extern.EitherType<Int, wp.extern.Post> = null, translate:Bool = false):haxe.extern.EitherType<String, haxe.extern.EitherType<Int, Bool>>;
  /**
    
     Display the weekday on which the post was written.
    
     @since 0.71
    
     @global WP_Locale $wp_locale
    
  **/
  public function the_weekday():Void;
  /**
    
     Display the weekday on which the post was written.
    
     Will only output the weekday if the current post's weekday is different from
     the previous one output.
    
     @since 0.71
    
     @global WP_Locale       $wp_locale
     @global string|int|bool $currentday
     @global string|int|bool $previousweekday
    
     @param string $before Optional Output before the date.
     @param string $after Optional Output after the date.
    
  **/
  public function the_weekday_date(before:String = '', after:String = ''):Void;
  /**
    
     Fire the wp_head action.
    
     See {@see 'wp_head'}.
    
     @since 1.2.0
    
  **/
  public function wp_head():Void;
  /**
    
     Fire the wp_footer action.
    
     See {@see 'wp_footer'}.
    
     @since 1.5.1
    
  **/
  public function wp_footer():Void;
  /**
    
     Display the links to the general feeds.
    
     @since 2.8.0
    
     @param array $args Optional arguments.
    
  **/
  public function feed_links(?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Display the links to the extra feeds such as category feeds.
    
     @since 2.8.0
    
     @param array $args Optional arguments.
    
  **/
  public function feed_links_extra(?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Display the link to the Really Simple Discovery service endpoint.
    
     @link http://archipelago.phrasewise.com/rsd
     @since 2.0.0
    
  **/
  public function rsd_link():Void;
  /**
    
     Display the link to the Windows Live Writer manifest file.
    
     @link https://msdn.microsoft.com/en-us/library/bb463265.aspx
     @since 2.3.1
    
  **/
  public function wlwmanifest_link():Void;
  /**
    
     Displays a noindex meta tag if required by the blog configuration.
    
     If a blog is marked as not being public then the noindex meta tag will be
     output to tell web robots not to index the page content. Add this to the
     {@see 'wp_head'} action.
    
     Typical usage is as a {@see 'wp_head'} callback:
    
         add_action( 'wp_head', 'noindex' );
    
     @see wp_no_robots
    
     @since 2.1.0
    
  **/
  public function noindex():Void;
  /**
    
     Display a noindex meta tag.
    
     Outputs a noindex meta tag that tells web robots not to index the page content.
     Typical usage is as a wp_head callback. add_action( 'wp_head', 'wp_no_robots' );
    
     @since 3.3.0
    
  **/
  public function wp_no_robots():Void;
  /**
    
     Display a noindex,noarchive meta tag and referrer origin-when-cross-origin meta tag.
    
     Outputs a noindex,noarchive meta tag that tells web robots not to index or cache the page content.
     Outputs a referrer origin-when-cross-origin meta tag that tells the browser not to send the full
     url as a referrer to other sites when cross-origin assets are loaded.
    
     Typical usage is as a wp_head callback. add_action( 'wp_head', 'wp_sensitive_page_meta' );
    
     @since 5.0.1
    
  **/
  public function wp_sensitive_page_meta():Void;
  /**
    
     Display site icon meta tags.
    
     @since 4.3.0
    
     @link https://www.whatwg.org/specs/web-apps/current-work/multipage/links.html#rel-icon HTML5 specification link icon.
    
  **/
  public function wp_site_icon():Void;
  /**
    
     Prints resource hints to browsers for pre-fetching, pre-rendering
     and pre-connecting to web sites.
    
     Gives hints to browsers to prefetch specific pages or render them
     in the background, to perform DNS lookups or to begin the connection
     handshake (DNS, TCP, TLS) in the background.
    
     These performance improving indicators work by using `<link rel"…">`.
    
     @since 4.6.0
    
  **/
  public function wp_resource_hints():Void;
  /**
    
     Retrieves a list of unique hosts of all enqueued scripts and styles.
    
     @since 4.6.0
    
     @return array A list of unique hosts of enqueued scripts and styles.
    
  **/
  public function wp_dependencies_unique_hosts():php.NativeArray;
  /**
    
     Whether the user can access the visual editor.
    
     Checks if the user can access the visual editor and that it's supported by the user's browser.
    
     @since 2.0.0
    
     @global bool $wp_rich_edit Whether the user can access the visual editor.
     @global bool $is_gecko     Whether the browser is Gecko-based.
     @global bool $is_opera     Whether the browser is Opera.
     @global bool $is_safari    Whether the browser is Safari.
     @global bool $is_chrome    Whether the browser is Chrome.
     @global bool $is_IE        Whether the browser is Internet Explorer.
     @global bool $is_edge      Whether the browser is Microsoft Edge.
    
     @return bool True if the user can access the visual editor, false otherwise.
    
  **/
  public function user_can_richedit():Bool;
  /**
    
     Find out which editor should be displayed by default.
    
     Works out which of the two editors to display as the current editor for a
     user. The 'html' setting is for the "Text" editor tab.
    
     @since 2.5.0
    
     @return string Either 'tinymce', or 'html', or 'test'
    
  **/
  public function wp_default_editor():String;
  /**
    
     Renders an editor.
    
     Using this function is the proper way to output all needed components for both TinyMCE and Quicktags.
     _WP_Editors should not be used directly. See https://core.trac.wordpress.org/ticket/17144.
    
     NOTE: Once initialized the TinyMCE editor cannot be safely moved in the DOM. For that reason
     running wp_editor() inside of a meta box is not a good idea unless only Quicktags is used.
     On the post edit screen several actions can be used to include additional editors
     containing TinyMCE: 'edit_page_form', 'edit_form_advanced' and 'dbx_post_sidebar'.
     See https://core.trac.wordpress.org/ticket/19173 for more information.
    
     @see _WP_Editors::editor()
     @since 3.3.0
    
     @param string $content   Initial content for the editor.
     @param string $editor_id HTML ID attribute value for the textarea and TinyMCE. Can only be /[a-z]+/.
     @param array  $settings  See _WP_Editors::editor().
    
  **/
  public function wp_editor(content:String, editor_id:String, ?settings:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Outputs the editor scripts, stylesheets, and default settings.
    
     The editor can be initialized when needed after page load.
     See wp.editor.initialize() in wp-admin/js/editor.js for initialization options.
    
     @uses _WP_Editors
     @since 4.8.0
    
  **/
  public function wp_enqueue_editor():Void;
  /**
    
     Enqueue assets needed by the code editor for the given settings.
    
     @since 4.9.0
    
     @see wp_enqueue_editor()
     @see wp_get_code_editor_settings();
     @see _WP_Editors::parse_settings()
    
     @param array $args {
         Args.
    
         @type string   $type       The MIME type of the file to be edited.
         @type string   $file       Filename to be edited. Extension is used to sniff the type. Can be supplied as alternative to `$type` param.
         @type WP_Theme $theme      Theme being edited when on theme editor.
         @type string   $plugin     Plugin being edited when on plugin editor.
         @type array    $codemirror Additional CodeMirror setting overrides.
         @type array    $csslint    CSSLint rule overrides.
         @type array    $jshint     JSHint rule overrides.
         @type array    $htmlhint   JSHint rule overrides.
     }
     @return array|false Settings for the enqueued code editor, or false if the editor was not enqueued.
    
  **/
  public function wp_enqueue_code_editor(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Generate and return code editor settings.
    
     @since 5.0.0
    
     @see wp_enqueue_code_editor()
    
     @param array $args {
         Args.
    
         @type string   $type       The MIME type of the file to be edited.
         @type string   $file       Filename to be edited. Extension is used to sniff the type. Can be supplied as alternative to `$type` param.
         @type WP_Theme $theme      Theme being edited when on theme editor.
         @type string   $plugin     Plugin being edited when on plugin editor.
         @type array    $codemirror Additional CodeMirror setting overrides.
         @type array    $csslint    CSSLint rule overrides.
         @type array    $jshint     JSHint rule overrides.
         @type array    $htmlhint   JSHint rule overrides.
     }
     @return array|false Settings for the code editor.
    
  **/
  public function wp_get_code_editor_settings(args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, Bool>;
  /**
    
     Retrieves the contents of the search WordPress query variable.
    
     The search query string is passed through esc_attr() to ensure that it is safe
     for placing in an html attribute.
    
     @since 2.3.0
    
     @param bool $escaped Whether the result is escaped. Default true.
                          Only use when you are later escaping it. Do not use unescaped.
     @return string
    
  **/
  public function get_search_query(escaped:Bool = true):String;
  /**
    
     Displays the contents of the search query variable.
    
     The search query string is passed through esc_attr() to ensure that it is safe
     for placing in an html attribute.
    
     @since 2.1.0
    
  **/
  public function the_search_query():Void;
  /**
    
     Gets the language attributes for the html tag.
    
     Builds up a set of html attributes containing the text direction and language
     information for the page.
    
     @since 4.3.0
    
     @param string $doctype Optional. The type of html document. Accepts 'xhtml' or 'html'. Default 'html'.
    
  **/
  public function get_language_attributes(doctype:String = 'html'):Void;
  /**
    
     Displays the language attributes for the html tag.
    
     Builds up a set of html attributes containing the text direction and language
     information for the page.
    
     @since 2.1.0
     @since 4.3.0 Converted into a wrapper for get_language_attributes().
    
     @param string $doctype Optional. The type of html document. Accepts 'xhtml' or 'html'. Default 'html'.
    
  **/
  public function language_attributes(doctype:String = 'html'):Void;
  /**
    
     Retrieve paginated link for archive post pages.
    
     Technically, the function can be used to create paginated link list for any
     area. The 'base' argument is used to reference the url, which will be used to
     create the paginated links. The 'format' argument is then used for replacing
     the page number. It is however, most likely and by default, to be used on the
     archive post pages.
    
     The 'type' argument controls format of the returned value. The default is
     'plain', which is just a string with the links separated by a newline
     character. The other possible values are either 'array' or 'list'. The
     'array' value will return an array of the paginated link list to offer full
     control of display. The 'list' value will place all of the paginated links in
     an unordered HTML list.
    
     The 'total' argument is the total amount of pages and is an integer. The
     'current' argument is the current page number and is also an integer.
    
     An example of the 'base' argument is "http://example.com/all_posts.php%_%"
     and the '%_%' is required. The '%_%' will be replaced by the contents of in
     the 'format' argument. An example for the 'format' argument is "?page=%#%"
     and the '%#%' is also required. The '%#%' will be replaced with the page
     number.
    
     You can include the previous and next links in the list by setting the
     'prev_next' argument to true, which it is by default. You can set the
     previous text, by using the 'prev_text' argument. You can set the next text
     by setting the 'next_text' argument.
    
     If the 'show_all' argument is set to true, then it will show all of the pages
     instead of a short list of the pages near the current page. By default, the
     'show_all' is set to false and controlled by the 'end_size' and 'mid_size'
     arguments. The 'end_size' argument is how many numbers on either the start
     and the end list edges, by default is 1. The 'mid_size' argument is how many
     numbers to either side of current page, but not including current page.
    
     It is possible to add query vars to the link by using the 'add_args' argument
     and see add_query_arg() for more information.
    
     The 'before_page_number' and 'after_page_number' arguments allow users to
     augment the links themselves. Typically this might be to add context to the
     numbered links so that screen reader users understand what the links are for.
     The text strings are added before and after the page number - within the
     anchor tag.
    
     @since 2.1.0
     @since 4.9.0 Added the `aria_current` argument.
    
     @global WP_Query   $wp_query
     @global WP_Rewrite $wp_rewrite
    
     @param string|array $args {
         Optional. Array or string of arguments for generating paginated links for archives.
    
         @type string $base               Base of the paginated url. Default empty.
         @type string $format             Format for the pagination structure. Default empty.
         @type int    $total              The total amount of pages. Default is the value WP_Query's
                                          `max_num_pages` or 1.
         @type int    $current            The current page number. Default is 'paged' query var or 1.
         @type string $aria_current       The value for the aria-current attribute. Possible values are 'page',
                                          'step', 'location', 'date', 'time', 'true', 'false'. Default is 'page'.
         @type bool   $show_all           Whether to show all pages. Default false.
         @type int    $end_size           How many numbers on either the start and the end list edges.
                                          Default 1.
         @type int    $mid_size           How many numbers to either side of the current pages. Default 2.
         @type bool   $prev_next          Whether to include the previous and next links in the list. Default true.
         @type bool   $prev_text          The previous page text. Default '&laquo; Previous'.
         @type bool   $next_text          The next page text. Default 'Next &raquo;'.
         @type string $type               Controls format of the returned value. Possible values are 'plain',
                                          'array' and 'list'. Default is 'plain'.
         @type array  $add_args           An array of query args to add. Default false.
         @type string $add_fragment       A string to append to each link. Default empty.
         @type string $before_page_number A string to appear before the page number. Default empty.
         @type string $after_page_number  A string to append after the page number. Default empty.
     }
     @return string|array|void String of page links or array of page links.
    
  **/
  public function paginate_links(args:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>> = ''):haxe.extern.EitherType<String, php.NativeArray>;
  /**
    
     Registers an admin color scheme css file.
    
     Allows a plugin to register a new admin color scheme. For example:
    
         wp_admin_css_color( 'classic', __( 'Classic' ), admin_url( "css/colors-classic.css" ), array(
             '#07273E', '#14568A', '#D54E21', '#2683AE'
         ) );
    
     @since 2.5.0
    
     @global array $_wp_admin_css_colors
    
     @param string $key    The unique key for this theme.
     @param string $name   The name of the theme.
     @param string $url    The URL of the CSS file containing the color scheme.
     @param array  $colors Optional. An array of CSS color definition strings which are used
                           to give the user a feel for the theme.
     @param array  $icons {
         Optional. CSS color definitions used to color any SVG icons.
    
         @type string $base    SVG icon base color.
         @type string $focus   SVG icon color on focus.
         @type string $current SVG icon color of current admin menu link.
     }
    
  **/
  public function wp_admin_css_color(key:String, name:String, url:String, ?colors:php.NativeStructArray<Dynamic>, ?icons:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Registers the default admin color schemes.
    
     Registers the initial set of eight color schemes in the Profile section
     of the dashboard which allows for styling the admin menu and toolbar.
    
     @see wp_admin_css_color()
    
     @since 3.0.0
    
  **/
  public function register_admin_color_schemes():Void;
  /**
    
     Displays the URL of a WordPress admin CSS file.
    
     @see WP_Styles::_css_href and its {@see 'style_loader_src'} filter.
    
     @since 2.3.0
    
     @param string $file file relative to wp-admin/ without its ".css" extension.
     @return string
    
  **/
  public function wp_admin_css_uri(file:String = 'wp-admin'):String;
  /**
    
     Enqueues or directly prints a stylesheet link to the specified CSS file.
    
     "Intelligently" decides to enqueue or to print the CSS file. If the
     {@see 'wp_print_styles'} action has *not* yet been called, the CSS file will be
     enqueued. If the {@see 'wp_print_styles'} action has been called, the CSS link will
     be printed. Printing may be forced by passing true as the $force_echo
     (second) parameter.
    
     For backward compatibility with WordPress 2.3 calling method: If the $file
     (first) parameter does not correspond to a registered CSS file, we assume
     $file is a file relative to wp-admin/ without its ".css" extension. A
     stylesheet link to that generated URL is printed.
    
     @since 2.3.0
    
     @param string $file       Optional. Style handle name or file name (without ".css" extension) relative
                               to wp-admin/. Defaults to 'wp-admin'.
     @param bool   $force_echo Optional. Force the stylesheet link to be printed rather than enqueued.
    
  **/
  public function wp_admin_css(file:String = 'wp-admin', force_echo:Bool = false):Void;
  /**
    
     Enqueues the default ThickBox js and css.
    
     If any of the settings need to be changed, this can be done with another js
     file similar to media-upload.js. That file should
     require array('thickbox') to ensure it is loaded after.
    
     @since 2.5.0
    
  **/
  public function add_thickbox():Void;
  /**
    
     Displays the XHTML generator that is generated on the wp_head hook.
    
     See {@see 'wp_head'}.
    
     @since 2.5.0
    
  **/
  public function wp_generator():Void;
  /**
    
     Display the generator XML or Comment for RSS, ATOM, etc.
    
     Returns the correct generator type for the requested output format. Allows
     for a plugin to filter generators overall the {@see 'the_generator'} filter.
    
     @since 2.5.0
    
     @param string $type The type of generator to output - (html|xhtml|atom|rss2|rdf|comment|export).
    
  **/
  public function the_generator(type:String):Void;
  /**
    
     Creates the generator XML or Comment for RSS, ATOM, etc.
    
     Returns the correct generator type for the requested output format. Allows
     for a plugin to filter generators on an individual basis using the
     {@see 'get_the_generator_$type'} filter.
    
     @since 2.5.0
    
     @param string $type The type of generator to return - (html|xhtml|atom|rss2|rdf|comment|export).
     @return string|void The HTML content for the generator.
    
  **/
  public function get_the_generator(type:String = ''):String;
  /**
    
     Outputs the html checked attribute.
    
     Compares the first two arguments and if identical marks as checked
    
     @since 1.0.0
    
     @param mixed $checked One of the values to compare
     @param mixed $current (true) The other value to compare if not just true
     @param bool  $echo    Whether to echo or just return the string
     @return string html attribute or empty string
    
  **/
  public function checked(checked:Dynamic, current:Dynamic = true, echo:Bool = true):String;
  /**
    
     Outputs the html selected attribute.
    
     Compares the first two arguments and if identical marks as selected
    
     @since 1.0.0
    
     @param mixed $selected One of the values to compare
     @param mixed $current  (true) The other value to compare if not just true
     @param bool  $echo     Whether to echo or just return the string
     @return string html attribute or empty string
    
  **/
  public function selected(selected:Dynamic, current:Dynamic = true, echo:Bool = true):String;
  /**
    
     Outputs the html disabled attribute.
    
     Compares the first two arguments and if identical marks as disabled
    
     @since 3.0.0
    
     @param mixed $disabled One of the values to compare
     @param mixed $current  (true) The other value to compare if not just true
     @param bool  $echo     Whether to echo or just return the string
     @return string html attribute or empty string
    
  **/
  public function disabled(disabled:Dynamic, current:Dynamic = true, echo:Bool = true):String;
  /**
    
     Outputs the html readonly attribute.
    
     Compares the first two arguments and if identical marks as readonly
    
     @since 4.9.0
    
     @param mixed $readonly One of the values to compare
     @param mixed $current  (true) The other value to compare if not just true
     @param bool  $echo     Whether to echo or just return the string
     @return string html attribute or empty string
    
  **/
  public function readonly(readonly:Dynamic, current:Dynamic = true, echo:Bool = true):String;
  /**
    
     Private helper function for checked, selected, disabled and readonly.
    
     Compares the first two arguments and if identical marks as $type
    
     @since 2.8.0
     @access private
    
     @param mixed  $helper  One of the values to compare
     @param mixed  $current (true) The other value to compare if not just true
     @param bool   $echo    Whether to echo or just return the string
     @param string $type    The type of checked|selected|disabled|readonly we are doing
     @return string html attribute or empty string
    
  **/
  public function __checked_selected_helper(helper:Dynamic, current:Dynamic, echo:Bool, type:String):String;
  /**
    
     Default settings for heartbeat
    
     Outputs the nonce used in the heartbeat XHR
    
     @since 3.6.0
    
     @param array $settings
     @return array $settings
    
  **/
  public function wp_heartbeat_settings(settings:php.NativeStructArray<Dynamic>):php.NativeArray;
}
