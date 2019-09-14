package wp.extern;

@:native("WP_HTTP_Proxy")
extern class HTTPProxy {
  /**
    
     Whether proxy connection should be used.
    
     @since 2.8.0
    
     @use WP_PROXY_HOST
     @use WP_PROXY_PORT
    
     @return bool
    
  **/
  @:native("is_enabled") public function isEnabled():Bool;
  /**
    
     Whether authentication should be used.
    
     @since 2.8.0
    
     @use WP_PROXY_USERNAME
     @use WP_PROXY_PASSWORD
    
     @return bool
    
  **/
  @:native("use_authentication") public function useAuthentication():Bool;
  /**
    
     Retrieve the host for the proxy server.
    
     @since 2.8.0
    
     @return string
    
  **/
  @:native("host") public function host():String;
  /**
    
     Retrieve the port for the proxy server.
    
     @since 2.8.0
    
     @return string
    
  **/
  @:native("port") public function port():String;
  /**
    
     Retrieve the username for proxy authentication.
    
     @since 2.8.0
    
     @return string
    
  **/
  @:native("username") public function username():String;
  /**
    
     Retrieve the password for proxy authentication.
    
     @since 2.8.0
    
     @return string
    
  **/
  @:native("password") public function password():String;
  /**
    
     Retrieve authentication string for proxy authentication.
    
     @since 2.8.0
    
     @return string
    
  **/
  @:native("authentication") public function authentication():String;
  /**
    
     Retrieve header string for proxy authentication.
    
     @since 2.8.0
    
     @return string
    
  **/
  @:native("authentication_header") public function authenticationHeader():String;
  /**
    
     Whether URL should be sent through the proxy server.
    
     We want to keep localhost and the site URL from being sent through the proxy server, because
     some proxies can not handle this. We also have the constant available for defining other
     hosts that won't be sent through the proxy.
    
     @since 2.8.0
    
     @staticvar array|null $bypass_hosts
     @staticvar array      $wildcard_regex
    
     @param string $uri URI to check.
     @return bool True, to send through the proxy and false if, the proxy should not be used.
    
  **/
  @:native("send_through_proxy") public function sendThroughProxy(uri:String):Bool;
}
