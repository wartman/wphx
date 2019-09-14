package wp.extern;

extern class CompatApi implements wp.util.ApiFunctions {
  /**
    
     Returns whether PCRE/u (PCRE_UTF8 modifier) is available for use.
    
     @ignore
     @since 4.2.2
     @access private
    
     @staticvar string $utf8_pcre
    
     @param bool $set - Used for testing only
                 null   : default - get PCRE/u capability
                 false  : Used for testing - return false for future calls to this function
                 'reset': Used for testing - restore default behavior of this function
    
  **/
  public function _wp_can_use_pcre_u(set:Bool = null):Void;
  /**
    
     Compat function to mimic mb_substr().
    
     @ignore
     @since 3.2.0
    
     @see _mb_substr()
    
     @param string      $str      The string to extract the substring from.
     @param int         $start    Position to being extraction from in `$str`.
     @param int|null    $length   Optional. Maximum number of characters to extract from `$str`.
                                  Default null.
     @param string|null $encoding Optional. Character encoding to use. Default null.
     @return string Extracted substring.
    
  **/
  public function mb_substr(str:String, start:Int, length:Int = null, encoding:String = null):String;
  /**
    
     Internal compat function to mimic mb_substr().
    
     Only understands UTF-8 and 8bit.  All other character sets will be treated as 8bit.
     For $encoding === UTF-8, the $str input is expected to be a valid UTF-8 byte sequence.
     The behavior of this function for invalid inputs is undefined.
    
     @ignore
     @since 3.2.0
    
     @param string      $str      The string to extract the substring from.
     @param int         $start    Position to being extraction from in `$str`.
     @param int|null    $length   Optional. Maximum number of characters to extract from `$str`.
                                  Default null.
     @param string|null $encoding Optional. Character encoding to use. Default null.
     @return string Extracted substring.
    
  **/
  public function _mb_substr(str:String, start:Int, length:Int = null, encoding:String = null):String;
  /**
    
     Compat function to mimic mb_strlen().
    
     @ignore
     @since 4.2.0
    
     @see _mb_strlen()
    
     @param string      $str      The string to retrieve the character length from.
     @param string|null $encoding Optional. Character encoding to use. Default null.
     @return int String length of `$str`.
    
  **/
  public function mb_strlen(str:String, encoding:String = null):Int;
  /**
    
     Internal compat function to mimic mb_strlen().
    
     Only understands UTF-8 and 8bit.  All other character sets will be treated as 8bit.
     For $encoding === UTF-8, the `$str` input is expected to be a valid UTF-8 byte
     sequence. The behavior of this function for invalid inputs is undefined.
    
     @ignore
     @since 4.2.0
    
     @param string      $str      The string to retrieve the character length from.
     @param string|null $encoding Optional. Character encoding to use. Default null.
     @return int String length of `$str`.
    
  **/
  public function _mb_strlen(str:String, encoding:String = null):Int;
  /**
    
     Compat function to mimic hash_hmac().
    
     @ignore
     @since 3.2.0
    
     @see _hash_hmac()
    
     @param string $algo       Hash algorithm. Accepts 'md5' or 'sha1'.
     @param string $data       Data to be hashed.
     @param string $key        Secret key to use for generating the hash.
     @param bool   $raw_output Optional. Whether to output raw binary data (true),
                               or lowercase hexits (false). Default false.
     @return string|false The hash in output determined by `$raw_output`. False if `$algo`
                          is unknown or invalid.
    
  **/
  public function hash_hmac(algo:String, data:String, key:String, raw_output:Bool = false):haxe.extern.EitherType<String, Bool>;
  /**
    
     Internal compat function to mimic hash_hmac().
    
     @ignore
     @since 3.2.0
    
     @param string $algo       Hash algorithm. Accepts 'md5' or 'sha1'.
     @param string $data       Data to be hashed.
     @param string $key        Secret key to use for generating the hash.
     @param bool   $raw_output Optional. Whether to output raw binary data (true),
                               or lowercase hexits (false). Default false.
     @return string|false The hash in output determined by `$raw_output`. False if `$algo`
                          is unknown or invalid.
    
  **/
  public function _hash_hmac(algo:String, data:String, key:String, raw_output:Bool = false):haxe.extern.EitherType<String, Bool>;
  /**
    
     @global Services_JSON $wp_json
     @param string $string
     @param bool   $assoc_array
     @return object|array
    
  **/
  public function json_decode(string:String, assoc_array:Bool = false):haxe.extern.EitherType<Dynamic, php.NativeStructArray<Dynamic>>;
  /**
    
     @param object $data
     @return array
    
  **/
  public function _json_decode_object_helper(data:Dynamic):php.NativeArray;
  /**
    
     Timing attack safe string comparison
    
     Compares two strings using the same time whether they're equal or not.
    
     This function was added in PHP 5.6.
    
     Note: It can leak the length of a string when arguments of differing length are supplied.
    
     @since 3.9.2
    
     @param string $a Expected string.
     @param string $b Actual, user supplied, string.
     @return bool Whether strings are equal.
    
  **/
  public function hash_equals(a:String, b:String):Bool;
  /**
    
     Retrieves the error string of the last json_encode() or json_decode() call.
    
     @since 4.4.0
    
     @internal This is a compatibility function for PHP <5.5
    
     @return bool|string Returns the error message on success, "No Error" if no error has occurred,
                         or false on failure.
    
  **/
  public function json_last_error_msg():haxe.extern.EitherType<Bool, String>;
  /**
    
     PHP-agnostic version of {@link array_replace_recursive()}.
    
     The array_replace_recursive() function is a PHP 5.3 function. WordPress
     currently supports down to PHP 5.2, so this method is a workaround
     for PHP 5.2.
    
     Note: array_replace_recursive() supports infinite arguments, but for our use-
     case, we only need to support two arguments.
    
     Subject to removal once WordPress makes PHP 5.3.0 the minimum requirement.
    
     @since 4.5.3
    
     @see https://secure.php.net/manual/en/function.array-replace-recursive.php#109390
    
     @param  array $base         Array with keys needing to be replaced.
     @param  array $replacements Array with the replaced keys.
    
     @return array
    
  **/
  public function array_replace_recursive(?base:php.NativeStructArray<Dynamic>, ?replacements:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Polyfill for is_countable() function added in PHP 7.3.
    
     Verify that the content of a variable is an array or an object
     implementing the Countable interface.
    
     @since 4.9.6
    
     @param mixed $var The value to check.
    
     @return bool True if `$var` is countable, false otherwise.
    
  **/
  public function is_countable(var_:Dynamic):Bool;
  /**
    
     Polyfill for is_iterable() function added in PHP 7.1.
    
     Verify that the content of a variable is an array or an object
     implementing the Traversable interface.
    
     @since 4.9.6
    
     @param mixed $var The value to check.
    
     @return bool True if `$var` is iterable, false otherwise.
    
  **/
  public function is_iterable(var_:Dynamic):Bool;
}
