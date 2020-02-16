package wp.extern;

extern class RestApi implements wp.util.ApiFunctions {
  /**
    
     Registers a REST API route.
    
     Note: Do not use before the {@see 'rest_api_init'} hook.
    
     @since 4.4.0
     @since 5.1.0 Added a _doing_it_wrong() notice when not called on or after the rest_api_init hook.
    
     @param string $namespace The first URL segment after core prefix. Should be unique to your package/plugin.
     @param string $route     The base URL for route you are adding.
     @param array  $args      Optional. Either an array of options for the endpoint, or an array of arrays for
                              multiple methods. Default empty array.
     @param bool   $override  Optional. If the route already exists, should we override it? True overrides,
                              false merges (with newer overriding if duplicate keys exist). Default false.
     @return bool True on success, false on error.
    
  **/
  public function register_rest_route(namespace:String, route:String, ?args:php.NativeStructArray<Dynamic>, override_:Bool = false):Bool;
  /**
    
     Registers a new field on an existing WordPress object type.
    
     @since 4.7.0
    
     @global array $wp_rest_additional_fields Holds registered fields, organized
                                              by object type.
    
     @param string|array $object_type Object(s) the field is being registered
                                      to, "post"|"term"|"comment" etc.
     @param string $attribute         The attribute name.
     @param array  $args {
         Optional. An array of arguments used to handle the registered field.
    
         @type string|array|null $get_callback    Optional. The callback function used to retrieve the field
                                                  value. Default is 'null', the field will not be returned in
                                                  the response.
         @type string|array|null $update_callback Optional. The callback function used to set and update the
                                                  field value. Default is 'null', the value cannot be set or
                                                  updated.
         @type string|array|null $schema          Optional. The callback function used to create the schema for
                                                  this field. Default is 'null', no schema entry will be returned.
     }
    
  **/
  public function register_rest_field(object_type:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, attribute:String, ?args:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Registers rewrite rules for the API.
    
     @since 4.4.0
    
     @see rest_api_register_rewrites()
     @global WP $wp Current WordPress environment instance.
    
  **/
  public function rest_api_init():Void;
  /**
    
     Adds REST rewrite rules.
    
     @since 4.4.0
    
     @see add_rewrite_rule()
     @global WP_Rewrite $wp_rewrite
    
  **/
  public function rest_api_register_rewrites():Void;
  /**
    
     Registers the default REST API filters.
    
     Attached to the {@see 'rest_api_init'} action
     to make testing and disabling these filters easier.
    
     @since 4.4.0
    
  **/
  public function rest_api_default_filters():Void;
  /**
    
     Registers default REST API routes.
    
     @since 4.7.0
    
  **/
  public function create_initial_rest_routes():Void;
  /**
    
     Loads the REST API.
    
     @since 4.4.0
    
     @global WP             $wp             Current WordPress environment instance.
    
  **/
  public function rest_api_loaded():Void;
  /**
    
     Retrieves the URL prefix for any API resource.
    
     @since 4.4.0
    
     @return string Prefix.
    
  **/
  public function rest_get_url_prefix():String;
  /**
    
     Retrieves the URL to a REST endpoint on a site.
    
     Note: The returned URL is NOT escaped.
    
     @since 4.4.0
    
     @todo Check if this is even necessary
     @global WP_Rewrite $wp_rewrite
    
     @param int    $blog_id Optional. Blog ID. Default of null returns URL for current blog.
     @param string $path    Optional. REST route. Default '/'.
     @param string $scheme  Optional. Sanitization scheme. Default 'rest'.
     @return string Full URL to the endpoint.
    
  **/
  public function get_rest_url(blog_id:Int = null, path:String = '/', scheme:String = 'rest'):String;
  /**
    
     Retrieves the URL to a REST endpoint.
    
     Note: The returned URL is NOT escaped.
    
     @since 4.4.0
    
     @param string $path   Optional. REST route. Default empty.
     @param string $scheme Optional. Sanitization scheme. Default 'json'.
     @return string Full URL to the endpoint.
    
  **/
  public function rest_url(path:String = '', scheme:String = 'json'):String;
  /**
    
     Do a REST request.
    
     Used primarily to route internal requests through WP_REST_Server.
    
     @since 4.4.0
    
     @param WP_REST_Request|string $request Request.
     @return WP_REST_Response REST response.
    
  **/
//   public function rest_do_request(request:haxe.extern.EitherType<wp.extern.RESTRequest, String>):wp.extern.RESTResponse;
  /**
    
     Retrieves the current REST server instance.
    
     Instantiates a new instance if none exists already.
    
     @since 4.5.0
    
     @global WP_REST_Server $wp_rest_server REST server instance.
    
     @return WP_REST_Server REST server instance.
    
  **/
//   public function rest_get_server():wp.extern.RESTServer;
  /**
    
     Ensures request arguments are a request object (for consistency).
    
     @since 4.4.0
    
     @param array|WP_REST_Request $request Request to check.
     @return WP_REST_Request REST request instance.
    
  **/
//   public function rest_ensure_request(request:haxe.extern.EitherType<php.NativeStructArray<Dynamic>, wp.extern.RESTRequest>):wp.extern.RESTRequest;
  /**
    
     Ensures a REST response is a response object (for consistency).
    
     This implements WP_HTTP_Response, allowing usage of `set_status`/`header`/etc
     without needing to double-check the object. Will also allow WP_Error to indicate error
     responses, so users should immediately check for this value.
    
     @since 4.4.0
    
     @param WP_Error|WP_HTTP_Response|mixed $response Response to check.
     @return WP_REST_Response|mixed If response generated an error, WP_Error, if response
                                    is already an instance, WP_HTTP_Response, otherwise
                                    returns a new WP_REST_Response instance.
    
  **/
//   public function rest_ensure_response(response:haxe.extern.EitherType<wp.extern.Error, haxe.extern.EitherType<wp.extern.HTTPResponse, Dynamic>>):haxe.extern.EitherType<wp.extern.RESTResponse, Dynamic>;
  /**
    
     Handles _deprecated_function() errors.
    
     @since 4.4.0
    
     @param string $function    The function that was called.
     @param string $replacement The function that should have been called.
     @param string $version     Version.
    
  **/
  public function rest_handle_deprecated_function(function_:String, replacement:String, version:String):Void;
  /**
    
     Handles _deprecated_argument() errors.
    
     @since 4.4.0
    
     @param string $function    The function that was called.
     @param string $message     A message regarding the change.
     @param string $version     Version.
    
  **/
  public function rest_handle_deprecated_argument(function_:String, message:String, version:String):Void;
  /**
    
     Sends Cross-Origin Resource Sharing headers with API requests.
    
     @since 4.4.0
    
     @param mixed $value Response data.
     @return mixed Response data.
    
  **/
  public function rest_send_cors_headers(value:Dynamic):Dynamic;
  /**
    
     Handles OPTIONS requests for the server.
    
     This is handled outside of the server code, as it doesn't obey normal route
     mapping.
    
     @since 4.4.0
    
     @param mixed           $response Current response, either response or `null` to indicate pass-through.
     @param WP_REST_Server  $handler  ResponseHandler instance (usually WP_REST_Server).
     @param WP_REST_Request $request  The request that was used to make current response.
     @return WP_REST_Response Modified response, either response or `null` to indicate pass-through.
    
  **/
//   public function rest_handle_options_request(response:Dynamic, handler:wp.extern.RESTServer, request:wp.extern.RESTRequest):wp.extern.RESTResponse;
  /**
    
     Sends the "Allow" header to state all methods that can be sent to the current route.
    
     @since 4.4.0
    
     @param WP_REST_Response $response Current response being served.
     @param WP_REST_Server   $server   ResponseHandler instance (usually WP_REST_Server).
     @param WP_REST_Request  $request  The request that was used to make current response.
     @return WP_REST_Response Response to be served, with "Allow" header if route has allowed methods.
    
  **/
//   public function rest_send_allow_header(response:wp.extern.RESTResponse, server:wp.extern.RESTServer, request:wp.extern.RESTRequest):wp.extern.RESTResponse;
  /**
    
     Filter the API response to include only a white-listed set of response object fields.
    
     @since 4.8.0
    
     @param WP_REST_Response $response Current response being served.
     @param WP_REST_Server   $server   ResponseHandler instance (usually WP_REST_Server).
     @param WP_REST_Request  $request  The request that was used to make current response.
    
     @return WP_REST_Response Response to be served, trimmed down to contain a subset of fields.
    
  **/
//   public function rest_filter_response_fields(response:wp.extern.RESTResponse, server:wp.extern.RESTServer, request:wp.extern.RESTRequest):wp.extern.RESTResponse;
  /**
    
     Adds the REST API URL to the WP RSD endpoint.
    
     @since 4.4.0
    
     @see get_rest_url()
    
  **/
  public function rest_output_rsd():Void;
  /**
    
     Outputs the REST API link tag into page header.
    
     @since 4.4.0
    
     @see get_rest_url()
    
  **/
  public function rest_output_link_wp_head():Void;
  /**
    
     Sends a Link header for the REST API.
    
     @since 4.4.0
    
  **/
  public function rest_output_link_header():Void;
  /**
    
     Checks for errors when using cookie-based authentication.
    
     WordPress' built-in cookie authentication is always active
     for logged in users. However, the API has to check nonces
     for each request to ensure users are not vulnerable to CSRF.
    
     @since 4.4.0
    
     @global mixed          $wp_rest_auth_cookie
    
     @param WP_Error|mixed $result Error from another authentication handler,
                                   null if we should handle it, or another value
                                   if not.
     @return WP_Error|mixed|bool WP_Error if the cookie is invalid, the $result, otherwise true.
    
  **/
  public function rest_cookie_check_errors(result:haxe.extern.EitherType<wp.extern.Error, Dynamic>):haxe.extern.EitherType<wp.extern.Error, haxe.extern.EitherType<Dynamic, Bool>>;
  /**
    
     Collects cookie authentication status.
    
     Collects errors from wp_validate_auth_cookie for use by rest_cookie_check_errors.
    
     @since 4.4.0
    
     @see current_action()
     @global mixed $wp_rest_auth_cookie
    
  **/
  public function rest_cookie_collect_status():Void;
  /**
    
     Parses an RFC3339 time into a Unix timestamp.
    
     @since 4.4.0
    
     @param string $date      RFC3339 timestamp.
     @param bool   $force_utc Optional. Whether to force UTC timezone instead of using
                              the timestamp's timezone. Default false.
     @return int Unix timestamp.
    
  **/
  public function rest_parse_date(date:String, force_utc:Bool = false):Int;
  /**
    
     Parses a date into both its local and UTC equivalent, in MySQL datetime format.
    
     @since 4.4.0
    
     @see rest_parse_date()
    
     @param string $date   RFC3339 timestamp.
     @param bool   $is_utc Whether the provided date should be interpreted as UTC. Default false.
     @return array|null Local and UTC datetime strings, in MySQL datetime format (Y-m-d H:i:s),
                        null on failure.
    
  **/
  public function rest_get_date_with_gmt(date:String, is_utc:Bool = false):php.NativeArray;
  /**
    
     Returns a contextual HTTP error code for authorization failure.
    
     @since 4.7.0
    
     @return integer 401 if the user is not logged in, 403 if the user is logged in.
    
  **/
  public function rest_authorization_required_code():Int;
  /**
    
     Validate a request argument based on details registered to the route.
    
     @since 4.7.0
    
     @param  mixed            $value
     @param  WP_REST_Request  $request
     @param  string           $param
     @return WP_Error|boolean
    
  **/
//   public function rest_validate_request_arg(value:Dynamic, request:wp.extern.RESTRequest, param:String):haxe.extern.EitherType<wp.extern.Error, Bool>;
  /**
    
     Sanitize a request argument based on details registered to the route.
    
     @since 4.7.0
    
     @param  mixed            $value
     @param  WP_REST_Request  $request
     @param  string           $param
     @return mixed
    
  **/
//   public function rest_sanitize_request_arg(value:Dynamic, request:wp.extern.RESTRequest, param:String):Dynamic;
  /**
    
     Parse a request argument based on details registered to the route.
    
     Runs a validation check and sanitizes the value, primarily to be used via
     the `sanitize_callback` arguments in the endpoint args registration.
    
     @since 4.7.0
    
     @param  mixed            $value
     @param  WP_REST_Request  $request
     @param  string           $param
     @return mixed
    
  **/
//   public function rest_parse_request_arg(value:Dynamic, request:wp.extern.RESTRequest, param:String):Dynamic;
  /**
    
     Determines if an IP address is valid.
    
     Handles both IPv4 and IPv6 addresses.
    
     @since 4.7.0
    
     @param  string $ip IP address.
     @return string|false The valid IP address, otherwise false.
    
  **/
  public function rest_is_ip_address(ip:String):haxe.extern.EitherType<String, Bool>;
  /**
    
     Changes a boolean-like value into the proper boolean value.
    
     @since 4.7.0
    
     @param bool|string|int $value The value being evaluated.
     @return boolean Returns the proper associated boolean value.
    
  **/
  public function rest_sanitize_boolean(value:haxe.extern.EitherType<Bool, haxe.extern.EitherType<String, Int>>):Bool;
  /**
    
     Determines if a given value is boolean-like.
    
     @since 4.7.0
    
     @param bool|string $maybe_bool The value being evaluated.
     @return boolean True if a boolean, otherwise false.
    
  **/
  public function rest_is_boolean(maybe_bool:haxe.extern.EitherType<Bool, String>):Bool;
  /**
    
     Retrieves the avatar urls in various sizes based on a given email address.
    
     @since 4.7.0
    
     @see get_avatar_url()
    
     @param string $email Email address.
     @return array $urls Gravatar url for each size.
    
  **/
  public function rest_get_avatar_urls(email:String):php.NativeArray;
  /**
    
     Retrieves the pixel sizes for avatars.
    
     @since 4.7.0
    
     @return array List of pixel sizes for avatars. Default `[ 24, 48, 96 ]`.
    
  **/
  public function rest_get_avatar_sizes():php.NativeArray;
  /**
    
     Validate a value based on a schema.
    
     @since 4.7.0
    
     @param mixed  $value The value to validate.
     @param array  $args  Schema array to use for validation.
     @param string $param The parameter name, used in error messages.
     @return true|WP_Error
    
  **/
  public function rest_validate_value_from_schema(value:Dynamic, args:php.NativeStructArray<Dynamic>, param:String = ''):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Sanitize a value based on a schema.
    
     @since 4.7.0
    
     @param mixed $value The value to sanitize.
     @param array $args  Schema array to use for sanitization.
     @return true|WP_Error
    
  **/
  public function rest_sanitize_value_from_schema(value:Dynamic, args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, wp.extern.Error>;
  /**
    
     Append result of internal request to REST API for purpose of preloading data to be attached to a page.
     Expected to be called in the context of `array_reduce`.
    
     @since 5.0.0
    
     @param  array  $memo Reduce accumulator.
     @param  string $path REST API path to preload.
     @return array        Modified reduce accumulator.
    
  **/
  public function rest_preload_api_request(memo:php.NativeStructArray<Dynamic>, path:String):php.NativeArray;
}
