package wp.extern;

@:native("WP_Customize_Manager")
extern class CustomizeManager {
  /**
    
     Methods and properties dealing with managing widgets in the Customizer.
    
     @since 3.9.0
     @var WP_Customize_Widgets
    
  **/
  @:native("widgets") public var widgets:wp.extern.CustomizeWidgets;
  /**
    
     Methods and properties dealing with managing nav menus in the Customizer.
    
     @since 4.3.0
     @var WP_Customize_Nav_Menus
    
  **/
  @:native("nav_menus") public var navMenus:wp.extern.CustomizeNavMenus;
  /**
    
     Methods and properties dealing with selective refresh in the Customizer preview.
    
     @since 4.5.0
     @var WP_Customize_Selective_Refresh
    
  **/
  @:native("selective_refresh") public var selectiveRefresh:wp.extern.CustomizeSelectiveRefresh;
  /**
    
     Constructor.
    
     @since 3.4.0
     @since 4.7.0 Added `$args` parameter.
    
     @param array $args {
         Args.
    
         @type null|string|false $changeset_uuid     Changeset UUID, the `post_name` for the customize_changeset post containing the customized state.
                                                     Defaults to `null` resulting in a UUID to be immediately generated. If `false` is provided, then
                                                     then the changeset UUID will be determined during `after_setup_theme`: when the
                                                     `customize_changeset_branching` filter returns false, then the default UUID will be that
                                                     of the most recent `customize_changeset` post that has a status other than 'auto-draft',
                                                     'publish', or 'trash'. Otherwise, if changeset branching is enabled, then a random UUID will be used.
         @type string            $theme              Theme to be previewed (for theme switch). Defaults to customize_theme or theme query params.
         @type string            $messenger_channel  Messenger channel. Defaults to customize_messenger_channel query param.
         @type bool              $settings_previewed If settings should be previewed. Defaults to true.
         @type bool              $branching          If changeset branching is allowed; otherwise, changesets are linear. Defaults to true.
         @type bool              $autosaved          If data from a changeset's autosaved revision should be loaded if it exists. Defaults to false.
     }
    
  **/
  public function new(?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Return true if it's an Ajax request.
    
     @since 3.4.0
     @since 4.2.0 Added `$action` param.
    
     @param string|null $action Whether the supplied Ajax action is being run.
     @return bool True if it's an Ajax request, false otherwise.
    
  **/
  @:native("doing_ajax") public function doingAjax(action:String = null):Bool;
  /**
    
     Return the Ajax wp_die() handler if it's a customized request.
    
     @since 3.4.0
     @deprecated 4.7.0
    
     @return callable Die handler.
    
  **/
  @:native("wp_die_handler") public function wpDieHandler():Dynamic;
  /**
    
     Start preview and customize theme.
    
     Check if customize query variable exist. Init filters to filter the current theme.
    
     @since 3.4.0
    
     @global string $pagenow
    
  **/
  @:native("setup_theme") public function setupTheme():Void;
  /**
    
     Establish the loaded changeset.
    
     This method runs right at after_setup_theme and applies the 'customize_changeset_branching' filter to determine
     whether concurrent changesets are allowed. Then if the Customizer is not initialized with a `changeset_uuid` param,
     this method will determine which UUID should be used. If changeset branching is disabled, then the most saved
     changeset will be loaded by default. Otherwise, if there are no existing saved changesets or if changeset branching is
     enabled, then a new UUID will be generated.
    
     @since 4.9.0
     @global string $pagenow
    
  **/
  @:native("establish_loaded_changeset") public function establishLoadedChangeset():Void;
  /**
    
     Callback to validate a theme once it is loaded
    
     @since 3.4.0
    
  **/
  @:native("after_setup_theme") public function afterSetupTheme():Void;
  /**
    
     If the theme to be previewed isn't the active theme, add filter callbacks
     to swap it out at runtime.
    
     @since 3.4.0
    
  **/
  @:native("start_previewing_theme") public function startPreviewingTheme():Void;
  /**
    
     Stop previewing the selected theme.
    
     Removes filters to change the current theme.
    
     @since 3.4.0
    
  **/
  @:native("stop_previewing_theme") public function stopPreviewingTheme():Void;
  /**
    
     Gets whether settings are or will be previewed.
    
     @since 4.9.0
     @see WP_Customize_Setting::preview()
    
     @return bool
    
  **/
  @:native("settings_previewed") public function settingsPreviewed():Bool;
  /**
    
     Gets whether data from a changeset's autosaved revision should be loaded if it exists.
    
     @since 4.9.0
     @see WP_Customize_Manager::changeset_data()
    
     @return bool Is using autosaved changeset revision.
    
  **/
  @:native("autosaved") public function autosaved():Bool;
  /**
    
     Whether the changeset branching is allowed.
    
     @since 4.9.0
     @see WP_Customize_Manager::establish_loaded_changeset()
    
     @return bool Is changeset branching.
    
  **/
  @:native("branching") public function branching():Bool;
  /**
    
     Get the changeset UUID.
    
     @since 4.7.0
     @see WP_Customize_Manager::establish_loaded_changeset()
    
     @return string UUID.
    
  **/
  @:native("changeset_uuid") public function changesetUuid():String;
  /**
    
     Get the theme being customized.
    
     @since 3.4.0
    
     @return WP_Theme
    
  **/
  @:native("theme") public function theme():wp.extern.Theme;
  /**
    
     Get the registered settings.
    
     @since 3.4.0
    
     @return array
    
  **/
  @:native("settings") public function settings():php.NativeArray;
  /**
    
     Get the registered controls.
    
     @since 3.4.0
    
     @return array
    
  **/
  @:native("controls") public function controls():php.NativeArray;
  /**
    
     Get the registered containers.
    
     @since 4.0.0
    
     @return array
    
  **/
  @:native("containers") public function containers():php.NativeArray;
  /**
    
     Get the registered sections.
    
     @since 3.4.0
    
     @return array
    
  **/
  @:native("sections") public function sections():php.NativeArray;
  /**
    
     Get the registered panels.
    
     @since 4.0.0
    
     @return array Panels.
    
  **/
  @:native("panels") public function panels():php.NativeArray;
  /**
    
     Checks if the current theme is active.
    
     @since 3.4.0
    
     @return bool
    
  **/
  @:native("is_theme_active") public function isThemeActive():Bool;
  /**
    
     Register styles/scripts and initialize the preview of each setting
    
     @since 3.4.0
    
  **/
  @:native("wp_loaded") public function wpLoaded():Void;
  /**
    
     Prevents Ajax requests from following redirects when previewing a theme
     by issuing a 200 response instead of a 30x.
    
     Instead, the JS will sniff out the location header.
    
     @since 3.4.0
     @deprecated 4.7.0
    
     @param int $status Status.
     @return int
    
  **/
  @:native("wp_redirect_status") public function wpRedirectStatus(status:Int):Int;
  /**
    
     Find the changeset post ID for a given changeset UUID.
    
     @since 4.7.0
    
     @param string $uuid Changeset UUID.
     @return int|null Returns post ID on success and null on failure.
    
  **/
  @:native("find_changeset_post_id") public function findChangesetPostId(uuid:String):Int;
  /**
    
     Get the changeset post id for the loaded changeset.
    
     @since 4.7.0
    
     @return int|null Post ID on success or null if there is no post yet saved.
    
  **/
  @:native("changeset_post_id") public function changesetPostId():Int;
  /**
    
     Get changeset data.
    
     @since 4.7.0
     @since 4.9.0 This will return the changeset's data with a user's autosave revision merged on top, if one exists and $autosaved is true.
    
     @return array Changeset data.
    
  **/
  @:native("changeset_data") public function changesetData():php.NativeArray;
  /**
    
     Import theme starter content into the customized state.
    
     @since 4.7.0
    
     @param array $starter_content Starter content. Defaults to `get_theme_starter_content()`.
    
  **/
  @:native("import_theme_starter_content") public function importThemeStarterContent(?starter_content:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Save starter content changeset.
    
     @since 4.7.0
    
  **/
  @:native("_save_starter_content_changeset") public function _saveStarterContentChangeset():Void;
  /**
    
     Get dirty pre-sanitized setting values in the current customized state.
    
     The returned array consists of a merge of three sources:
     1. If the theme is not currently active, then the base array is any stashed
        theme mods that were modified previously but never published.
     2. The values from the current changeset, if it exists.
     3. If the user can customize, the values parsed from the incoming
        `$_POST['customized']` JSON data.
     4. Any programmatically-set post values via `WP_Customize_Manager::set_post_value()`.
    
     The name "unsanitized_post_values" is a carry-over from when the customized
     state was exclusively sourced from `$_POST['customized']`. Nevertheless,
     the value returned will come from the current changeset post and from the
     incoming post data.
    
     @since 4.1.1
     @since 4.7.0 Added `$args` parameter and merging with changeset values and stashed theme mods.
    
     @param array $args {
         Args.
    
         @type bool $exclude_changeset Whether the changeset values should also be excluded. Defaults to false.
         @type bool $exclude_post_data Whether the post input values should also be excluded. Defaults to false when lacking the customize capability.
     }
     @return array
    
  **/
  @:native("unsanitized_post_values") public function unsanitizedPostValues(?args:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Returns the sanitized value for a given setting from the current customized state.
    
     The name "post_value" is a carry-over from when the customized state was exclusively
     sourced from `$_POST['customized']`. Nevertheless, the value returned will come
     from the current changeset post and from the incoming post data.
    
     @since 3.4.0
     @since 4.1.1 Introduced the `$default` parameter.
     @since 4.6.0 `$default` is now returned early when the setting post value is invalid.
    
     @see WP_REST_Server::dispatch()
     @see WP_REST_Request::sanitize_params()
     @see WP_REST_Request::has_valid_params()
    
     @param WP_Customize_Setting $setting A WP_Customize_Setting derived object.
     @param mixed                $default Value returned $setting has no post value (added in 4.2.0)
                                          or the post value is invalid (added in 4.6.0).
     @return string|mixed $post_value Sanitized value or the $default provided.
    
  **/
  @:native("post_value") public function postValue(setting:wp.extern.CustomizeSetting, default:Dynamic = null):haxe.extern.EitherType<String, Dynamic>;
  /**
    
     Override a setting's value in the current customized state.
    
     The name "post_value" is a carry-over from when the customized state was
     exclusively sourced from `$_POST['customized']`.
    
     @since 4.2.0
    
     @param string $setting_id ID for the WP_Customize_Setting instance.
     @param mixed  $value      Post value.
    
  **/
  @:native("set_post_value") public function setPostValue(setting_id:String, value:Dynamic):Void;
  /**
    
     Print JavaScript settings.
    
     @since 3.4.0
    
  **/
  @:native("customize_preview_init") public function customizePreviewInit():Void;
  /**
    
     Filter the X-Frame-Options and Content-Security-Policy headers to ensure frontend can load in customizer.
    
     @since 4.7.0
    
     @param array $headers Headers.
     @return array Headers.
    
  **/
  @:native("filter_iframe_security_headers") public function filterIframeSecurityHeaders(headers:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Add customize state query params to a given URL if preview is allowed.
    
     @since 4.7.0
     @see wp_redirect()
     @see WP_Customize_Manager::get_allowed_url()
    
     @param string $url URL.
     @return string URL.
    
  **/
  @:native("add_state_query_params") public function addStateQueryParams(url:String):String;
  /**
    
     Prevent sending a 404 status when returning the response for the customize
     preview, since it causes the jQuery Ajax to fail. Send 200 instead.
    
     @since 4.0.0
     @deprecated 4.7.0
    
  **/
  @:native("customize_preview_override_404_status") public function customizePreviewOverride404Status():Void;
  /**
    
     Print base element for preview frame.
    
     @since 3.4.0
     @deprecated 4.7.0
    
  **/
  @:native("customize_preview_base") public function customizePreviewBase():Void;
  /**
    
     Print a workaround to handle HTML5 tags in IE < 9.
    
     @since 3.4.0
     @deprecated 4.7.0 Customizer no longer supports IE8, so all supported browsers recognize HTML5.
    
  **/
  @:native("customize_preview_html5") public function customizePreviewHtml5():Void;
  /**
    
     Print CSS for loading indicators for the Customizer preview.
    
     @since 4.2.0
    
  **/
  @:native("customize_preview_loading_style") public function customizePreviewLoadingStyle():Void;
  /**
    
     Remove customize_messenger_channel query parameter from the preview window when it is not in an iframe.
    
     This ensures that the admin bar will be shown. It also ensures that link navigation will
     work as expected since the parent frame is not being sent the URL to navigate to.
    
     @since 4.7.0
    
  **/
  @:native("remove_frameless_preview_messenger_channel") public function removeFramelessPreviewMessengerChannel():Void;
  /**
    
     Print JavaScript settings for preview frame.
    
     @since 3.4.0
    
  **/
  @:native("customize_preview_settings") public function customizePreviewSettings():Void;
  /**
    
     Prints a signature so we can ensure the Customizer was properly executed.
    
     @since 3.4.0
     @deprecated 4.7.0
    
  **/
  @:native("customize_preview_signature") public function customizePreviewSignature():Void;
  /**
    
     Removes the signature in case we experience a case where the Customizer was not properly executed.
    
     @since 3.4.0
     @deprecated 4.7.0
    
     @param mixed $return Value passed through for {@see 'wp_die_handler'} filter.
     @return mixed Value passed through for {@see 'wp_die_handler'} filter.
    
  **/
  @:native("remove_preview_signature") public function removePreviewSignature(return:Dynamic = null):Dynamic;
  /**
    
     Is it a theme preview?
    
     @since 3.4.0
    
     @return bool True if it's a preview, false if not.
    
  **/
  @:native("is_preview") public function isPreview():Bool;
  /**
    
     Retrieve the template name of the previewed theme.
    
     @since 3.4.0
    
     @return string Template name.
    
  **/
  @:native("get_template") public function getTemplate():String;
  /**
    
     Retrieve the stylesheet name of the previewed theme.
    
     @since 3.4.0
    
     @return string Stylesheet name.
    
  **/
  @:native("get_stylesheet") public function getStylesheet():String;
  /**
    
     Retrieve the template root of the previewed theme.
    
     @since 3.4.0
    
     @return string Theme root.
    
  **/
  @:native("get_template_root") public function getTemplateRoot():String;
  /**
    
     Retrieve the stylesheet root of the previewed theme.
    
     @since 3.4.0
    
     @return string Theme root.
    
  **/
  @:native("get_stylesheet_root") public function getStylesheetRoot():String;
  /**
    
     Filters the current theme and return the name of the previewed theme.
    
     @since 3.4.0
    
     @param $current_theme {@internal Parameter is not used}
     @return string Theme name.
    
  **/
  @:native("current_theme") public function currentTheme(current_theme:):String;
  /**
    
     Validates setting values.
    
     Validation is skipped for unregistered settings or for values that are
     already null since they will be skipped anyway. Sanitization is applied
     to values that pass validation, and values that become null or `WP_Error`
     after sanitizing are marked invalid.
    
     @since 4.6.0
    
     @see WP_REST_Request::has_valid_params()
     @see WP_Customize_Setting::validate()
    
     @param array $setting_values Mapping of setting IDs to values to validate and sanitize.
     @param array $options {
         Options.
    
         @type bool $validate_existence  Whether a setting's existence will be checked.
         @type bool $validate_capability Whether the setting capability will be checked.
     }
     @return array Mapping of setting IDs to return value of validate method calls, either `true` or `WP_Error`.
    
  **/
  @:native("validate_setting_values") public function validateSettingValues(setting_values:php.NativeStructArray<Dynamic>, ?options:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Prepares setting validity for exporting to the client (JS).
    
     Converts `WP_Error` instance into array suitable for passing into the
     `wp.customize.Notification` JS model.
    
     @since 4.6.0
    
     @param true|WP_Error $validity Setting validity.
     @return true|array If `$validity` was a WP_Error, the error codes will be array-mapped
                        to their respective `message` and `data` to pass into the
                        `wp.customize.Notification` JS model.
    
  **/
  @:native("prepare_setting_validity_for_js") public function prepareSettingValidityForJs(validity:haxe.extern.EitherType<Bool, wp.extern.Error>):haxe.extern.EitherType<Bool, php.NativeStructArray<Dynamic>>;
  /**
    
     Handle customize_save WP Ajax request to save/update a changeset.
    
     @since 3.4.0
     @since 4.7.0 The semantics of this method have changed to update a changeset, optionally to also change the status and other attributes.
    
  **/
  @:native("save") public function save():Void;
  /**
    
     Save the post for the loaded changeset.
    
     @since 4.7.0
    
     @param array $args {
         Args for changeset post.
    
         @type array  $data            Optional additional changeset data. Values will be merged on top of any existing post values.
         @type string $status          Post status. Optional. If supplied, the save will be transactional and a post revision will be allowed.
         @type string $title           Post title. Optional.
         @type string $date_gmt        Date in GMT. Optional.
         @type int    $user_id         ID for user who is saving the changeset. Optional, defaults to the current user ID.
         @type bool   $starter_content Whether the data is starter content. If false (default), then $starter_content will be cleared for any $data being saved.
         @type bool   $autosave        Whether this is a request to create an autosave revision.
     }
    
     @return array|WP_Error Returns array on success and WP_Error with array data on error.
    
  **/
  @:native("save_changeset_post") public function saveChangesetPost(?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.Error>;
  /**
    
     Trash or delete a changeset post.
    
     The following re-formulates the logic from `wp_trash_post()` as done in
     `wp_publish_post()`. The reason for bypassing `wp_trash_post()` is that it
     will mutate the the `post_content` and the `post_name` when they should be
     untouched.
    
     @since 4.9.0
     @global wpdb $wpdb WordPress database abstraction object.
     @see wp_trash_post()
    
     @param int|WP_Post $post The changeset post.
     @return mixed A WP_Post object for the trashed post or an empty value on failure.
    
  **/
  @:native("trash_changeset_post") public function trashChangesetPost(post:haxe.extern.EitherType<Int, wp.extern.Post>):Dynamic;
  /**
    
     Handle request to trash a changeset.
    
     @since 4.9.0
    
  **/
  @:native("handle_changeset_trash_request") public function handleChangesetTrashRequest():Void;
  /**
    
     Re-map 'edit_post' meta cap for a customize_changeset post to be the same as 'customize' maps.
    
     There is essentially a "meta meta" cap in play here, where 'edit_post' meta cap maps to
     the 'customize' meta cap which then maps to 'edit_theme_options'. This is currently
     required in core for `wp_create_post_autosave()` because it will call
     `_wp_translate_postdata()` which in turn will check if a user can 'edit_post', but the
     the caps for the customize_changeset post type are all mapping to the meta capability.
     This should be able to be removed once #40922 is addressed in core.
    
     @since 4.9.0
     @link https://core.trac.wordpress.org/ticket/40922
     @see WP_Customize_Manager::save_changeset_post()
     @see _wp_translate_postdata()
    
     @param string[] $caps    Array of the user's capabilities.
     @param string   $cap     Capability name.
     @param int      $user_id The user ID.
     @param array    $args    Adds the context to the cap. Typically the object ID.
     @return array   Capabilities.
    
  **/
  @:native("grant_edit_post_capability_for_changeset") public function grantEditPostCapabilityForChangeset(caps:php.NativeIndexedArray<String>, cap:String, user_id:Int, args:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Marks the changeset post as being currently edited by the current user.
    
     @since 4.9.0
    
     @param int  $changeset_post_id Changeset post id.
     @param bool $take_over Take over the changeset, default is false.
    
  **/
  @:native("set_changeset_lock") public function setChangesetLock(changeset_post_id:Int, take_over:Bool = false):Void;
  /**
    
     Refreshes changeset lock with the current time if current user edited the changeset before.
    
     @since 4.9.0
    
     @param int $changeset_post_id Changeset post id.
    
  **/
  @:native("refresh_changeset_lock") public function refreshChangesetLock(changeset_post_id:Int):Void;
  /**
    
     Filter heartbeat settings for the Customizer.
    
     @since 4.9.0
     @param array $settings Current settings to filter.
     @return array Heartbeat settings.
    
  **/
  @:native("add_customize_screen_to_heartbeat_settings") public function addCustomizeScreenToHeartbeatSettings(settings:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Check locked changeset with heartbeat API.
    
     @since 4.9.0
    
     @param array  $response  The Heartbeat response.
     @param array  $data      The $_POST data sent.
     @param string $screen_id The screen id.
     @return array The Heartbeat response.
    
  **/
  @:native("check_changeset_lock_with_heartbeat") public function checkChangesetLockWithHeartbeat(response:php.NativeStructArray<Dynamic>, data:php.NativeStructArray<Dynamic>, screen_id:String):php.NativeArray;
  /**
    
     Removes changeset lock when take over request is sent via Ajax.
    
     @since 4.9.0
    
  **/
  @:native("handle_override_changeset_lock_request") public function handleOverrideChangesetLockRequest():Void;
  /**
    
     Filters whether a changeset has changed to create a new revision.
    
     Note that this will not be called while a changeset post remains in auto-draft status.
    
     @since 4.7.0
    
     @param bool    $post_has_changed Whether the post has changed.
     @param WP_Post $last_revision    The last revision post object.
     @param WP_Post $post             The post object.
    
     @return bool Whether a revision should be made.
    
  **/
  @:native("_filter_revision_post_has_changed") public function _filterRevisionPostHasChanged(post_has_changed:Bool, last_revision:wp.extern.Post, post:wp.extern.Post):Bool;
  /**
    
     Publish changeset values.
    
     This will the values contained in a changeset, even changesets that do not
     correspond to current manager instance. This is called by
     `_wp_customize_publish_changeset()` when a customize_changeset post is
     transitioned to the `publish` status. As such, this method should not be
     called directly and instead `wp_publish_post()` should be used.
    
     Please note that if the settings in the changeset are for a non-activated
     theme, the theme must first be switched to (via `switch_theme()`) before
     invoking this method.
    
     @since 4.7.0
     @see _wp_customize_publish_changeset()
     @global wpdb $wpdb
    
     @param int $changeset_post_id ID for customize_changeset post. Defaults to the changeset for the current manager instance.
     @return true|WP_Error True or error info.
    
  **/
  @:native("_publish_changeset_values") public function _publishChangesetValues(changeset_post_id:Int):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Refresh nonces for the current preview.
    
     @since 4.2.0
    
  **/
  @:native("refresh_nonces") public function refreshNonces():Void;
  /**
    
     Delete a given auto-draft changeset or the autosave revision for a given changeset or delete changeset lock.
    
     @since 4.9.0
    
  **/
  @:native("handle_dismiss_autosave_or_lock_request") public function handleDismissAutosaveOrLockRequest():Void;
  /**
    
     Add a customize setting.
    
     @since 3.4.0
     @since 4.5.0 Return added WP_Customize_Setting instance.
    
     @param WP_Customize_Setting|string $id   Customize Setting object, or ID.
     @param array                       $args {
      Optional. Array of properties for the new WP_Customize_Setting. Default empty array.
    
      @type string       $type                  Type of the setting. Default 'theme_mod'.
      @type string       $capability            Capability required for the setting. Default 'edit_theme_options'
      @type string|array $theme_supports        Theme features required to support the panel. Default is none.
      @type string       $default               Default value for the setting. Default is empty string.
      @type string       $transport             Options for rendering the live preview of changes in Theme Customizer.
                                                Using 'refresh' makes the change visible by reloading the whole preview.
                                                Using 'postMessage' allows a custom JavaScript to handle live changes.
     @link https://developer.wordpress.org/themes/customize-api
                                                Default is 'refresh'
      @type callable     $validate_callback     Server-side validation callback for the setting's value.
      @type callable     $sanitize_callback     Callback to filter a Customize setting value in un-slashed form.
      @type callable     $sanitize_js_callback  Callback to convert a Customize PHP setting value to a value that is
                                                JSON serializable.
      @type bool         $dirty                 Whether or not the setting is initially dirty when created.
     }
     @return WP_Customize_Setting             The instance of the setting that was added.
    
  **/
  @:native("add_setting") public function addSetting(id:haxe.extern.EitherType<wp.extern.CustomizeSetting, String>, ?args:php.NativeStructArray<Dynamic>):wp.extern.CustomizeSetting;
  /**
    
     Register any dynamically-created settings, such as those from $_POST['customized']
     that have no corresponding setting created.
    
     This is a mechanism to "wake up" settings that have been dynamically created
     on the front end and have been sent to WordPress in `$_POST['customized']`. When WP
     loads, the dynamically-created settings then will get created and previewed
     even though they are not directly created statically with code.
    
     @since 4.2.0
    
     @param array $setting_ids The setting IDs to add.
     @return array The WP_Customize_Setting objects added.
    
  **/
  @:native("add_dynamic_settings") public function addDynamicSettings(setting_ids:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Retrieve a customize setting.
    
     @since 3.4.0
    
     @param string $id Customize Setting ID.
     @return WP_Customize_Setting|void The setting, if set.
    
  **/
  @:native("get_setting") public function getSetting(id:String):wp.extern.CustomizeSetting;
  /**
    
     Remove a customize setting.
    
     @since 3.4.0
    
     @param string $id Customize Setting ID.
    
  **/
  @:native("remove_setting") public function removeSetting(id:String):Void;
  /**
    
     Add a customize panel.
    
     @since 4.0.0
     @since 4.5.0 Return added WP_Customize_Panel instance.
    
     @param WP_Customize_Panel|string $id   Customize Panel object, or Panel ID.
     @param array                     $args {
      Optional. Array of properties for the new Panel object. Default empty array.
      @type int          $priority              Priority of the panel, defining the display order of panels and sections.
                                                Default 160.
      @type string       $capability            Capability required for the panel. Default `edit_theme_options`
      @type string|array $theme_supports        Theme features required to support the panel.
      @type string       $title                 Title of the panel to show in UI.
      @type string       $description           Description to show in the UI.
      @type string       $type                  Type of the panel.
      @type callable     $active_callback       Active callback.
     }
     @return WP_Customize_Panel             The instance of the panel that was added.
    
  **/
  @:native("add_panel") public function addPanel(id:haxe.extern.EitherType<wp.extern.CustomizePanel, String>, ?args:php.NativeStructArray<Dynamic>):wp.extern.CustomizePanel;
  /**
    
     Retrieve a customize panel.
    
     @since 4.0.0
    
     @param string $id Panel ID to get.
     @return WP_Customize_Panel|void Requested panel instance, if set.
    
  **/
  @:native("get_panel") public function getPanel(id:String):wp.extern.CustomizePanel;
  /**
    
     Remove a customize panel.
    
     @since 4.0.0
    
     @param string $id Panel ID to remove.
    
  **/
  @:native("remove_panel") public function removePanel(id:String):Void;
  /**
    
     Register a customize panel type.
    
     Registered types are eligible to be rendered via JS and created dynamically.
    
     @since 4.3.0
    
     @see WP_Customize_Panel
    
     @param string $panel Name of a custom panel which is a subclass of WP_Customize_Panel.
    
  **/
  @:native("register_panel_type") public function registerPanelType(panel:String):Void;
  /**
    
     Render JS templates for all registered panel types.
    
     @since 4.3.0
    
  **/
  @:native("render_panel_templates") public function renderPanelTemplates():Void;
  /**
    
     Add a customize section.
    
     @since 3.4.0
     @since 4.5.0 Return added WP_Customize_Section instance.
    
     @param WP_Customize_Section|string $id   Customize Section object, or Section ID.
     @param array                     $args {
      Optional. Array of properties for the new Section object. Default empty array.
      @type int          $priority              Priority of the section, defining the display order of panels and sections.
                                                Default 160.
      @type string       $panel                 The panel this section belongs to (if any). Default empty.
      @type string       $capability            Capability required for the section. Default 'edit_theme_options'
      @type string|array $theme_supports        Theme features required to support the section.
      @type string       $title                 Title of the section to show in UI.
      @type string       $description           Description to show in the UI.
      @type string       $type                  Type of the section.
      @type callable     $active_callback       Active callback.
      @type bool         $description_hidden    Hide the description behind a help icon, instead of inline above the first control. Default false.
     }
     @return WP_Customize_Section             The instance of the section that was added.
    
  **/
  @:native("add_section") public function addSection(id:haxe.extern.EitherType<wp.extern.CustomizeSection, String>, ?args:php.NativeStructArray<Dynamic>):wp.extern.CustomizeSection;
  /**
    
     Retrieve a customize section.
    
     @since 3.4.0
    
     @param string $id Section ID.
     @return WP_Customize_Section|void The section, if set.
    
  **/
  @:native("get_section") public function getSection(id:String):wp.extern.CustomizeSection;
  /**
    
     Remove a customize section.
    
     @since 3.4.0
    
     @param string $id Section ID.
    
  **/
  @:native("remove_section") public function removeSection(id:String):Void;
  /**
    
     Register a customize section type.
    
     Registered types are eligible to be rendered via JS and created dynamically.
    
     @since 4.3.0
    
     @see WP_Customize_Section
    
     @param string $section Name of a custom section which is a subclass of WP_Customize_Section.
    
  **/
  @:native("register_section_type") public function registerSectionType(section:String):Void;
  /**
    
     Render JS templates for all registered section types.
    
     @since 4.3.0
    
  **/
  @:native("render_section_templates") public function renderSectionTemplates():Void;
  /**
    
     Add a customize control.
    
     @since 3.4.0
     @since 4.5.0 Return added WP_Customize_Control instance.
    
     @param WP_Customize_Control|string $id   Customize Control object, or ID.
     @param array                       $args {
      Optional. Array of properties for the new Control object. Default empty array.
    
      @type array        $settings              All settings tied to the control. If undefined, defaults to `$setting`.
                                                IDs in the array correspond to the ID of a registered `WP_Customize_Setting`.
      @type string       $setting               The primary setting for the control (if there is one). Default is 'default'.
      @type string       $capability            Capability required to use this control. Normally derived from `$settings`.
      @type int          $priority              Order priority to load the control. Default 10.
      @type string       $section               The section this control belongs to. Default empty.
      @type string       $label                 Label for the control. Default empty.
      @type string       $description           Description for the control. Default empty.
      @type array        $choices               List of choices for 'radio' or 'select' type controls, where values
                                                are the keys, and labels are the values. Default empty array.
      @type array        $input_attrs           List of custom input attributes for control output, where attribute
                                                names are the keys and values are the values. Default empty array.
      @type bool         $allow_addition        Show UI for adding new content, currently only used for the
                                                dropdown-pages control. Default false.
      @type string       $type                  The type of the control. Default 'text'.
      @type callback     $active_callback       Active callback.
     }
     @return WP_Customize_Control             The instance of the control that was added.
    
  **/
  @:native("add_control") public function addControl(id:haxe.extern.EitherType<wp.extern.CustomizeControl, String>, ?args:php.NativeStructArray<Dynamic>):wp.extern.CustomizeControl;
  /**
    
     Retrieve a customize control.
    
     @since 3.4.0
    
     @param string $id ID of the control.
     @return WP_Customize_Control|void The control object, if set.
    
  **/
  @:native("get_control") public function getControl(id:String):wp.extern.CustomizeControl;
  /**
    
     Remove a customize control.
    
     @since 3.4.0
    
     @param string $id ID of the control.
    
  **/
  @:native("remove_control") public function removeControl(id:String):Void;
  /**
    
     Register a customize control type.
    
     Registered types are eligible to be rendered via JS and created dynamically.
    
     @since 4.1.0
    
     @param string $control Name of a custom control which is a subclass of
                            WP_Customize_Control.
    
  **/
  @:native("register_control_type") public function registerControlType(control:String):Void;
  /**
    
     Render JS templates for all registered control types.
    
     @since 4.1.0
    
  **/
  @:native("render_control_templates") public function renderControlTemplates():Void;
  /**
    
     Prepare panels, sections, and controls.
    
     For each, check if required related components exist,
     whether the user has the necessary capabilities,
     and sort by priority.
    
     @since 3.4.0
    
  **/
  @:native("prepare_controls") public function prepareControls():Void;
  /**
    
     Enqueue scripts for customize controls.
    
     @since 3.4.0
    
  **/
  @:native("enqueue_control_scripts") public function enqueueControlScripts():Void;
  /**
    
     Determine whether the user agent is iOS.
    
     @since 4.4.0
    
     @return bool Whether the user agent is iOS.
    
  **/
  @:native("is_ios") public function isIos():Bool;
  /**
    
     Get the template string for the Customizer pane document title.
    
     @since 4.4.0
    
     @return string The template string for the document title.
    
  **/
  @:native("get_document_title_template") public function getDocumentTitleTemplate():String;
  /**
    
     Set the initial URL to be previewed.
    
     URL is validated.
    
     @since 4.4.0
    
     @param string $preview_url URL to be previewed.
    
  **/
  @:native("set_preview_url") public function setPreviewUrl(preview_url:String):Void;
  /**
    
     Get the initial URL to be previewed.
    
     @since 4.4.0
    
     @return string URL being previewed.
    
  **/
  @:native("get_preview_url") public function getPreviewUrl():String;
  /**
    
     Determines whether the admin and the frontend are on different domains.
    
     @since 4.7.0
    
     @return bool Whether cross-domain.
    
  **/
  @:native("is_cross_domain") public function isCrossDomain():Bool;
  /**
    
     Get URLs allowed to be previewed.
    
     If the front end and the admin are served from the same domain, load the
     preview over ssl if the Customizer is being loaded over ssl. This avoids
     insecure content warnings. This is not attempted if the admin and front end
     are on different domains to avoid the case where the front end doesn't have
     ssl certs. Domain mapping plugins can allow other urls in these conditions
     using the customize_allowed_urls filter.
    
     @since 4.7.0
    
     @returns array Allowed URLs.
    
  **/
  @:native("get_allowed_urls") public function getAllowedUrls():s;
  /**
    
     Get messenger channel.
    
     @since 4.7.0
    
     @return string Messenger channel.
    
  **/
  @:native("get_messenger_channel") public function getMessengerChannel():String;
  /**
    
     Set URL to link the user to when closing the Customizer.
    
     URL is validated.
    
     @since 4.4.0
    
     @param string $return_url URL for return link.
    
  **/
  @:native("set_return_url") public function setReturnUrl(return_url:String):Void;
  /**
    
     Get URL to link the user to when closing the Customizer.
    
     @since 4.4.0
    
     @return string URL for link to close Customizer.
    
  **/
  @:native("get_return_url") public function getReturnUrl():String;
  /**
    
     Set the autofocused constructs.
    
     @since 4.4.0
    
     @param array $autofocus {
         Mapping of 'panel', 'section', 'control' to the ID which should be autofocused.
    
         @type string [$control]  ID for control to be autofocused.
         @type string [$section]  ID for section to be autofocused.
         @type string [$panel]    ID for panel to be autofocused.
     }
    
  **/
  @:native("set_autofocus") public function setAutofocus(autofocus:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Get the autofocused constructs.
    
     @since 4.4.0
    
     @return array {
         Mapping of 'panel', 'section', 'control' to the ID which should be autofocused.
    
         @type string [$control]  ID for control to be autofocused.
         @type string [$section]  ID for section to be autofocused.
         @type string [$panel]    ID for panel to be autofocused.
     }
    
  **/
  @:native("get_autofocus") public function getAutofocus():php.NativeArray;
  /**
    
     Get nonces for the Customizer.
    
     @since 4.5.0
    
     @return array Nonces.
    
  **/
  @:native("get_nonces") public function getNonces():php.NativeArray;
  /**
    
     Print JavaScript settings for parent window.
    
     @since 4.4.0
    
  **/
  @:native("customize_pane_settings") public function customizePaneSettings():Void;
  /**
    
     Returns a list of devices to allow previewing.
    
     @since 4.5.0
    
     @return array List of devices with labels and default setting.
    
  **/
  @:native("get_previewable_devices") public function getPreviewableDevices():php.NativeArray;
  /**
    
     Register some default controls.
    
     @since 3.4.0
    
  **/
  @:native("register_controls") public function registerControls():Void;
  /**
    
     Return whether there are published pages.
    
     Used as active callback for static front page section and controls.
    
     @since 4.7.0
    
     @returns bool Whether there are published (or to be published) pages.
    
  **/
  @:native("has_published_pages") public function hasPublishedPages():s;
  /**
    
     Add settings from the POST data that were not added with code, e.g. dynamically-created settings for Widgets
    
     @since 4.2.0
    
     @see add_dynamic_settings()
    
  **/
  @:native("register_dynamic_settings") public function registerDynamicSettings():Void;
  /**
    
     Load themes into the theme browsing/installation UI.
    
     @since 4.9.0
    
  **/
  @:native("handle_load_themes_request") public function handleLoadThemesRequest():Void;
  /**
    
     Callback for validating the header_textcolor value.
    
     Accepts 'blank', and otherwise uses sanitize_hex_color_no_hash().
     Returns default text color if hex color is empty.
    
     @since 3.4.0
    
     @param string $color
     @return mixed
    
  **/
  @:native("_sanitize_header_textcolor") public function _sanitizeHeaderTextcolor(color:String):Dynamic;
  /**
    
     Callback for validating a background setting value.
    
     @since 4.7.0
    
     @param string $value Repeat value.
     @param WP_Customize_Setting $setting Setting.
     @return string|WP_Error Background value or validation error.
    
  **/
  @:native("_sanitize_background_setting") public function _sanitizeBackgroundSetting(value:String, setting:wp.extern.CustomizeSetting):haxe.extern.EitherType<String, wp.extern.Error>;
  /**
    
     Export header video settings to facilitate selective refresh.
    
     @since 4.7.0
    
     @param array $response Response.
     @param WP_Customize_Selective_Refresh $selective_refresh Selective refresh component.
     @param array $partials Array of partials.
     @return array
    
  **/
  @:native("export_header_video_settings") public function exportHeaderVideoSettings(response:php.NativeStructArray<Dynamic>, selective_refresh:wp.extern.CustomizeSelectiveRefresh, partials:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Callback for validating the header_video value.
    
     Ensures that the selected video is less than 8MB and provides an error message.
    
     @since 4.7.0
    
     @param WP_Error $validity
     @param mixed $value
     @return mixed
    
  **/
  @:native("_validate_header_video") public function _validateHeaderVideo(validity:wp.extern.Error, value:Dynamic):Dynamic;
  /**
    
     Callback for validating the external_header_video value.
    
     Ensures that the provided URL is supported.
    
     @since 4.7.0
    
     @param WP_Error $validity
     @param mixed $value
     @return mixed
    
  **/
  @:native("_validate_external_header_video") public function _validateExternalHeaderVideo(validity:wp.extern.Error, value:Dynamic):Dynamic;
  /**
    
     Callback for sanitizing the external_header_video value.
    
     @since 4.7.1
    
     @param string $value URL.
     @return string Sanitized URL.
    
  **/
  @:native("_sanitize_external_header_video") public function _sanitizeExternalHeaderVideo(value:String):String;
  /**
    
     Callback for rendering the custom logo, used in the custom_logo partial.
    
     This method exists because the partial object and context data are passed
     into a partial's render_callback so we cannot use get_custom_logo() as
     the render_callback directly since it expects a blog ID as the first
     argument. When WP no longer supports PHP 5.3, this method can be removed
     in favor of an anonymous function.
    
     @see WP_Customize_Manager::register_controls()
    
     @since 4.5.0
    
     @return string Custom logo.
    
  **/
  @:native("_render_custom_logo_partial") public function _renderCustomLogoPartial():String;
}
