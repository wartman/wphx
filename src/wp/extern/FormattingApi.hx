package wp.extern;

extern class FormattingApi implements wp.util.ApiFunctions {
  /**
    
     Replaces common plain text characters into formatted entities
    
     As an example,
    
         'cause today's effort makes it worth tomorrow's "holiday" ...
    
     Becomes:
    
         &#8217;cause today&#8217;s effort makes it worth tomorrow&#8217;s &#8220;holiday&#8221; &#8230;
    
     Code within certain html blocks are skipped.
    
     Do not use this function before the {@see 'init'} action hook; everything will break.
    
     @since 0.71
    
     @global array $wp_cockneyreplace Array of formatted entities for certain common phrases
     @global array $shortcode_tags
     @staticvar array  $static_characters
     @staticvar array  $static_replacements
     @staticvar array  $dynamic_characters
     @staticvar array  $dynamic_replacements
     @staticvar array  $default_no_texturize_tags
     @staticvar array  $default_no_texturize_shortcodes
     @staticvar bool   $run_texturize
     @staticvar string $apos
     @staticvar string $prime
     @staticvar string $double_prime
     @staticvar string $opening_quote
     @staticvar string $closing_quote
     @staticvar string $opening_single_quote
     @staticvar string $closing_single_quote
     @staticvar string $open_q_flag
     @staticvar string $open_sq_flag
     @staticvar string $apos_flag
    
     @param string $text The text to be formatted
     @param bool   $reset Set to true for unit testing. Translated patterns will reset.
     @return string The string replaced with html entities
    
  **/
  public function wptexturize(text:String, reset:Bool = false):String;
  /**
    
     Implements a logic tree to determine whether or not "7'." represents seven feet,
     then converts the special char into either a prime char or a closing quote char.
    
     @since 4.3.0
    
     @param string $haystack    The plain text to be searched.
     @param string $needle      The character to search for such as ' or ".
     @param string $prime       The prime char to use for replacement.
     @param string $open_quote  The opening quote char. Opening quote replacement must be
                                accomplished already.
     @param string $close_quote The closing quote char to use for replacement.
     @return string The $haystack value after primes and quotes replacements.
    
  **/
  public function wptexturize_primes(haystack:String, needle:String, prime:String, open_quote:String, close_quote:String):String;
  /**
    
     Search for disabled element tags. Push element to stack on tag open and pop
     on tag close.
    
     Assumes first char of $text is tag opening and last char is tag closing.
     Assumes second char of $text is optionally '/' to indicate closing as in </html>.
    
     @since 2.9.0
     @access private
    
     @param string $text Text to check. Must be a tag like `<html>` or `[shortcode]`.
     @param array  $stack List of open tag elements.
     @param array  $disabled_elements The tag names to match against. Spaces are not allowed in tag names.
    
  **/
  public function _wptexturize_pushpop_element(text:String, stack:php.NativeStructArray<Dynamic>, disabled_elements:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Replaces double line-breaks with paragraph elements.
    
     A group of regex replaces used to identify text formatted with newlines and
     replace double line-breaks with HTML paragraph tags. The remaining line-breaks
     after conversion become <<br />> tags, unless $br is set to '0' or 'false'.
    
     @since 0.71
    
     @param string $pee The text which has to be formatted.
     @param bool   $br  Optional. If set, this will convert all remaining line-breaks
                        after paragraphing. Default true.
     @return string Text which has been converted into correct paragraph tags.
    
  **/
  public function wpautop(pee:String, br:Bool = true):String;
  /**
    
     Separate HTML elements and comments from the text.
    
     @since 4.2.4
    
     @param string $input The text which has to be formatted.
     @return array The formatted text.
    
  **/
  public function wp_html_split(input:String):php.NativeArray;
  /**
    
     Retrieve the regular expression for an HTML element.
    
     @since 4.4.0
    
     @staticvar string $regex
    
     @return string The regular expression
    
  **/
  public function get_html_split_regex():String;
  /**
    
     Retrieve the combined regular expression for HTML and shortcodes.
    
     @access private
     @ignore
     @internal This function will be removed in 4.5.0 per Shortcode API Roadmap.
     @since 4.4.0
    
     @staticvar string $html_regex
    
     @param string $shortcode_regex The result from _get_wptexturize_shortcode_regex().  Optional.
     @return string The regular expression
    
  **/
  public function _get_wptexturize_split_regex(shortcode_regex:String = ''):String;
  /**
    
     Retrieve the regular expression for shortcodes.
    
     @access private
     @ignore
     @internal This function will be removed in 4.5.0 per Shortcode API Roadmap.
     @since 4.4.0
    
     @param array $tagnames List of shortcodes to find.
     @return string The regular expression
    
  **/
  public function _get_wptexturize_shortcode_regex(tagnames:php.NativeStructArray<Dynamic>):String;
  /**
    
     Replace characters or phrases within HTML elements only.
    
     @since 4.2.3
    
     @param string $haystack The text which has to be formatted.
     @param array $replace_pairs In the form array('from' => 'to', ...).
     @return string The formatted text.
    
  **/
  public function wp_replace_in_html_tags(haystack:String, replace_pairs:php.NativeStructArray<Dynamic>):String;
  /**
    
     Newline preservation help function for wpautop
    
     @since 3.1.0
     @access private
    
     @param array $matches preg_replace_callback matches array
     @return string
    
  **/
  public function _autop_newline_preservation_helper(matches:php.NativeStructArray<Dynamic>):String;
  /**
    
     Don't auto-p wrap shortcodes that stand alone
    
     Ensures that shortcodes are not wrapped in `<p>...</p>`.
    
     @since 2.9.0
    
     @global array $shortcode_tags
    
     @param string $pee The content.
     @return string The filtered content.
    
  **/
  public function shortcode_unautop(pee:String):String;
  /**
    
     Checks to see if a string is utf8 encoded.
    
     NOTE: This function checks for 5-Byte sequences, UTF8
           has Bytes Sequences with a maximum length of 4.
    
     @author bmorel at ssi dot fr (modified)
     @since 1.2.1
    
     @param string $str The string to be checked
     @return bool True if $str fits a UTF-8 model, false otherwise.
    
  **/
  public function seems_utf8(str:String):Bool;
  /**
    
     Converts a number of special characters into their HTML entities.
    
     Specifically deals with: &, <, >, ", and '.
    
     $quote_style can be set to ENT_COMPAT to encode " to
     &quot;, or ENT_QUOTES to do both. Default is ENT_NOQUOTES where no quotes are encoded.
    
     @since 1.2.2
     @access private
    
     @staticvar string $_charset
    
     @param string     $string         The text which is to be encoded.
     @param int|string $quote_style    Optional. Converts double quotes if set to ENT_COMPAT,
                                       both single and double if set to ENT_QUOTES or none if set to ENT_NOQUOTES.
                                       Also compatible with old values; converting single quotes if set to 'single',
                                       double if set to 'double' or both if otherwise set.
                                       Default is ENT_NOQUOTES.
     @param string     $charset        Optional. The character encoding of the string. Default is false.
     @param bool       $double_encode  Optional. Whether to encode existing html entities. Default is false.
     @return string The encoded text with HTML entities.
    
  **/
  public function _wp_specialchars(string:String, ?quote_style:haxe.extern.EitherType<Int, String>, charset:String = false, double_encode:Bool = false):String;
  /**
    
     Converts a number of HTML entities into their special characters.
    
     Specifically deals with: &, <, >, ", and '.
    
     $quote_style can be set to ENT_COMPAT to decode " entities,
     or ENT_QUOTES to do both " and '. Default is ENT_NOQUOTES where no quotes are decoded.
    
     @since 2.8.0
    
     @param string     $string The text which is to be decoded.
     @param string|int $quote_style Optional. Converts double quotes if set to ENT_COMPAT,
                                    both single and double if set to ENT_QUOTES or
                                    none if set to ENT_NOQUOTES.
                                    Also compatible with old _wp_specialchars() values;
                                    converting single quotes if set to 'single',
                                    double if set to 'double' or both if otherwise set.
                                    Default is ENT_NOQUOTES.
     @return string The decoded text without HTML entities.
    
  **/
  public function wp_specialchars_decode(string:String, ?quote_style:haxe.extern.EitherType<String, Int>):String;
  /**
    
     Checks for invalid UTF8 in a string.
    
     @since 2.8.0
    
     @staticvar bool $is_utf8
     @staticvar bool $utf8_pcre
    
     @param string  $string The text which is to be checked.
     @param bool    $strip Optional. Whether to attempt to strip out invalid UTF8. Default is false.
     @return string The checked text.
    
  **/
  public function wp_check_invalid_utf8(string:String, strip:Bool = false):String;
  /**
    
     Encode the Unicode values to be used in the URI.
    
     @since 1.5.0
    
     @param string $utf8_string
     @param int    $length Max  length of the string
     @return string String with Unicode encoded for URI.
    
  **/
  public function utf8_uri_encode(utf8_string:String, length:Int = 0):String;
  /**
    
     Converts all accent characters to ASCII characters.
    
     If there are no accent characters, then the string given is just returned.
    
     **Accent characters converted:**
    
     Currency signs:
    
     |   Code   | Glyph | Replacement |     Description     |
     | -------- | ----- | ----------- | ------------------- |
     | U+00A3   | £     | (empty)     | British Pound sign  |
     | U+20AC   | €     | E           | Euro sign           |
    
     Decompositions for Latin-1 Supplement:
    
     |  Code   | Glyph | Replacement |               Description              |
     | ------- | ----- | ----------- | -------------------------------------- |
     | U+00AA  | ª     | a           | Feminine ordinal indicator             |
     | U+00BA  | º     | o           | Masculine ordinal indicator            |
     | U+00C0  | À     | A           | Latin capital letter A with grave      |
     | U+00C1  | Á     | A           | Latin capital letter A with acute      |
     | U+00C2  | Â     | A           | Latin capital letter A with circumflex |
     | U+00C3  | Ã     | A           | Latin capital letter A with tilde      |
     | U+00C4  | Ä     | A           | Latin capital letter A with diaeresis  |
     | U+00C5  | Å     | A           | Latin capital letter A with ring above |
     | U+00C6  | Æ     | AE          | Latin capital letter AE                |
     | U+00C7  | Ç     | C           | Latin capital letter C with cedilla    |
     | U+00C8  | È     | E           | Latin capital letter E with grave      |
     | U+00C9  | É     | E           | Latin capital letter E with acute      |
     | U+00CA  | Ê     | E           | Latin capital letter E with circumflex |
     | U+00CB  | Ë     | E           | Latin capital letter E with diaeresis  |
     | U+00CC  | Ì     | I           | Latin capital letter I with grave      |
     | U+00CD  | Í     | I           | Latin capital letter I with acute      |
     | U+00CE  | Î     | I           | Latin capital letter I with circumflex |
     | U+00CF  | Ï     | I           | Latin capital letter I with diaeresis  |
     | U+00D0  | Ð     | D           | Latin capital letter Eth               |
     | U+00D1  | Ñ     | N           | Latin capital letter N with tilde      |
     | U+00D2  | Ò     | O           | Latin capital letter O with grave      |
     | U+00D3  | Ó     | O           | Latin capital letter O with acute      |
     | U+00D4  | Ô     | O           | Latin capital letter O with circumflex |
     | U+00D5  | Õ     | O           | Latin capital letter O with tilde      |
     | U+00D6  | Ö     | O           | Latin capital letter O with diaeresis  |
     | U+00D8  | Ø     | O           | Latin capital letter O with stroke     |
     | U+00D9  | Ù     | U           | Latin capital letter U with grave      |
     | U+00DA  | Ú     | U           | Latin capital letter U with acute      |
     | U+00DB  | Û     | U           | Latin capital letter U with circumflex |
     | U+00DC  | Ü     | U           | Latin capital letter U with diaeresis  |
     | U+00DD  | Ý     | Y           | Latin capital letter Y with acute      |
     | U+00DE  | Þ     | TH          | Latin capital letter Thorn             |
     | U+00DF  | ß     | s           | Latin small letter sharp s             |
     | U+00E0  | à     | a           | Latin small letter a with grave        |
     | U+00E1  | á     | a           | Latin small letter a with acute        |
     | U+00E2  | â     | a           | Latin small letter a with circumflex   |
     | U+00E3  | ã     | a           | Latin small letter a with tilde        |
     | U+00E4  | ä     | a           | Latin small letter a with diaeresis    |
     | U+00E5  | å     | a           | Latin small letter a with ring above   |
     | U+00E6  | æ     | ae          | Latin small letter ae                  |
     | U+00E7  | ç     | c           | Latin small letter c with cedilla      |
     | U+00E8  | è     | e           | Latin small letter e with grave        |
     | U+00E9  | é     | e           | Latin small letter e with acute        |
     | U+00EA  | ê     | e           | Latin small letter e with circumflex   |
     | U+00EB  | ë     | e           | Latin small letter e with diaeresis    |
     | U+00EC  | ì     | i           | Latin small letter i with grave        |
     | U+00ED  | í     | i           | Latin small letter i with acute        |
     | U+00EE  | î     | i           | Latin small letter i with circumflex   |
     | U+00EF  | ï     | i           | Latin small letter i with diaeresis    |
     | U+00F0  | ð     | d           | Latin small letter Eth                 |
     | U+00F1  | ñ     | n           | Latin small letter n with tilde        |
     | U+00F2  | ò     | o           | Latin small letter o with grave        |
     | U+00F3  | ó     | o           | Latin small letter o with acute        |
     | U+00F4  | ô     | o           | Latin small letter o with circumflex   |
     | U+00F5  | õ     | o           | Latin small letter o with tilde        |
     | U+00F6  | ö     | o           | Latin small letter o with diaeresis    |
     | U+00F8  | ø     | o           | Latin small letter o with stroke       |
     | U+00F9  | ù     | u           | Latin small letter u with grave        |
     | U+00FA  | ú     | u           | Latin small letter u with acute        |
     | U+00FB  | û     | u           | Latin small letter u with circumflex   |
     | U+00FC  | ü     | u           | Latin small letter u with diaeresis    |
     | U+00FD  | ý     | y           | Latin small letter y with acute        |
     | U+00FE  | þ     | th          | Latin small letter Thorn               |
     | U+00FF  | ÿ     | y           | Latin small letter y with diaeresis    |
    
     Decompositions for Latin Extended-A:
    
     |  Code   | Glyph | Replacement |                    Description                    |
     | ------- | ----- | ----------- | ------------------------------------------------- |
     | U+0100  | Ā     | A           | Latin capital letter A with macron                |
     | U+0101  | ā     | a           | Latin small letter a with macron                  |
     | U+0102  | Ă     | A           | Latin capital letter A with breve                 |
     | U+0103  | ă     | a           | Latin small letter a with breve                   |
     | U+0104  | Ą     | A           | Latin capital letter A with ogonek                |
     | U+0105  | ą     | a           | Latin small letter a with ogonek                  |
     | U+01006 | Ć     | C           | Latin capital letter C with acute                 |
     | U+0107  | ć     | c           | Latin small letter c with acute                   |
     | U+0108  | Ĉ     | C           | Latin capital letter C with circumflex            |
     | U+0109  | ĉ     | c           | Latin small letter c with circumflex              |
     | U+010A  | Ċ     | C           | Latin capital letter C with dot above             |
     | U+010B  | ċ     | c           | Latin small letter c with dot above               |
     | U+010C  | Č     | C           | Latin capital letter C with caron                 |
     | U+010D  | č     | c           | Latin small letter c with caron                   |
     | U+010E  | Ď     | D           | Latin capital letter D with caron                 |
     | U+010F  | ď     | d           | Latin small letter d with caron                   |
     | U+0110  | Đ     | D           | Latin capital letter D with stroke                |
     | U+0111  | đ     | d           | Latin small letter d with stroke                  |
     | U+0112  | Ē     | E           | Latin capital letter E with macron                |
     | U+0113  | ē     | e           | Latin small letter e with macron                  |
     | U+0114  | Ĕ     | E           | Latin capital letter E with breve                 |
     | U+0115  | ĕ     | e           | Latin small letter e with breve                   |
     | U+0116  | Ė     | E           | Latin capital letter E with dot above             |
     | U+0117  | ė     | e           | Latin small letter e with dot above               |
     | U+0118  | Ę     | E           | Latin capital letter E with ogonek                |
     | U+0119  | ę     | e           | Latin small letter e with ogonek                  |
     | U+011A  | Ě     | E           | Latin capital letter E with caron                 |
     | U+011B  | ě     | e           | Latin small letter e with caron                   |
     | U+011C  | Ĝ     | G           | Latin capital letter G with circumflex            |
     | U+011D  | ĝ     | g           | Latin small letter g with circumflex              |
     | U+011E  | Ğ     | G           | Latin capital letter G with breve                 |
     | U+011F  | ğ     | g           | Latin small letter g with breve                   |
     | U+0120  | Ġ     | G           | Latin capital letter G with dot above             |
     | U+0121  | ġ     | g           | Latin small letter g with dot above               |
     | U+0122  | Ģ     | G           | Latin capital letter G with cedilla               |
     | U+0123  | ģ     | g           | Latin small letter g with cedilla                 |
     | U+0124  | Ĥ     | H           | Latin capital letter H with circumflex            |
     | U+0125  | ĥ     | h           | Latin small letter h with circumflex              |
     | U+0126  | Ħ     | H           | Latin capital letter H with stroke                |
     | U+0127  | ħ     | h           | Latin small letter h with stroke                  |
     | U+0128  | Ĩ     | I           | Latin capital letter I with tilde                 |
     | U+0129  | ĩ     | i           | Latin small letter i with tilde                   |
     | U+012A  | Ī     | I           | Latin capital letter I with macron                |
     | U+012B  | ī     | i           | Latin small letter i with macron                  |
     | U+012C  | Ĭ     | I           | Latin capital letter I with breve                 |
     | U+012D  | ĭ     | i           | Latin small letter i with breve                   |
     | U+012E  | Į     | I           | Latin capital letter I with ogonek                |
     | U+012F  | į     | i           | Latin small letter i with ogonek                  |
     | U+0130  | İ     | I           | Latin capital letter I with dot above             |
     | U+0131  | ı     | i           | Latin small letter dotless i                      |
     | U+0132  | Ĳ     | IJ          | Latin capital ligature IJ                         |
     | U+0133  | ĳ     | ij          | Latin small ligature ij                           |
     | U+0134  | Ĵ     | J           | Latin capital letter J with circumflex            |
     | U+0135  | ĵ     | j           | Latin small letter j with circumflex              |
     | U+0136  | Ķ     | K           | Latin capital letter K with cedilla               |
     | U+0137  | ķ     | k           | Latin small letter k with cedilla                 |
     | U+0138  | ĸ     | k           | Latin small letter Kra                            |
     | U+0139  | Ĺ     | L           | Latin capital letter L with acute                 |
     | U+013A  | ĺ     | l           | Latin small letter l with acute                   |
     | U+013B  | Ļ     | L           | Latin capital letter L with cedilla               |
     | U+013C  | ļ     | l           | Latin small letter l with cedilla                 |
     | U+013D  | Ľ     | L           | Latin capital letter L with caron                 |
     | U+013E  | ľ     | l           | Latin small letter l with caron                   |
     | U+013F  | Ŀ     | L           | Latin capital letter L with middle dot            |
     | U+0140  | ŀ     | l           | Latin small letter l with middle dot              |
     | U+0141  | Ł     | L           | Latin capital letter L with stroke                |
     | U+0142  | ł     | l           | Latin small letter l with stroke                  |
     | U+0143  | Ń     | N           | Latin capital letter N with acute                 |
     | U+0144  | ń     | n           | Latin small letter N with acute                   |
     | U+0145  | Ņ     | N           | Latin capital letter N with cedilla               |
     | U+0146  | ņ     | n           | Latin small letter n with cedilla                 |
     | U+0147  | Ň     | N           | Latin capital letter N with caron                 |
     | U+0148  | ň     | n           | Latin small letter n with caron                   |
     | U+0149  | ŉ     | n           | Latin small letter n preceded by apostrophe       |
     | U+014A  | Ŋ     | N           | Latin capital letter Eng                          |
     | U+014B  | ŋ     | n           | Latin small letter Eng                            |
     | U+014C  | Ō     | O           | Latin capital letter O with macron                |
     | U+014D  | ō     | o           | Latin small letter o with macron                  |
     | U+014E  | Ŏ     | O           | Latin capital letter O with breve                 |
     | U+014F  | ŏ     | o           | Latin small letter o with breve                   |
     | U+0150  | Ő     | O           | Latin capital letter O with double acute          |
     | U+0151  | ő     | o           | Latin small letter o with double acute            |
     | U+0152  | Œ     | OE          | Latin capital ligature OE                         |
     | U+0153  | œ     | oe          | Latin small ligature oe                           |
     | U+0154  | Ŕ     | R           | Latin capital letter R with acute                 |
     | U+0155  | ŕ     | r           | Latin small letter r with acute                   |
     | U+0156  | Ŗ     | R           | Latin capital letter R with cedilla               |
     | U+0157  | ŗ     | r           | Latin small letter r with cedilla                 |
     | U+0158  | Ř     | R           | Latin capital letter R with caron                 |
     | U+0159  | ř     | r           | Latin small letter r with caron                   |
     | U+015A  | Ś     | S           | Latin capital letter S with acute                 |
     | U+015B  | ś     | s           | Latin small letter s with acute                   |
     | U+015C  | Ŝ     | S           | Latin capital letter S with circumflex            |
     | U+015D  | ŝ     | s           | Latin small letter s with circumflex              |
     | U+015E  | Ş     | S           | Latin capital letter S with cedilla               |
     | U+015F  | ş     | s           | Latin small letter s with cedilla                 |
     | U+0160  | Š     | S           | Latin capital letter S with caron                 |
     | U+0161  | š     | s           | Latin small letter s with caron                   |
     | U+0162  | Ţ     | T           | Latin capital letter T with cedilla               |
     | U+0163  | ţ     | t           | Latin small letter t with cedilla                 |
     | U+0164  | Ť     | T           | Latin capital letter T with caron                 |
     | U+0165  | ť     | t           | Latin small letter t with caron                   |
     | U+0166  | Ŧ     | T           | Latin capital letter T with stroke                |
     | U+0167  | ŧ     | t           | Latin small letter t with stroke                  |
     | U+0168  | Ũ     | U           | Latin capital letter U with tilde                 |
     | U+0169  | ũ     | u           | Latin small letter u with tilde                   |
     | U+016A  | Ū     | U           | Latin capital letter U with macron                |
     | U+016B  | ū     | u           | Latin small letter u with macron                  |
     | U+016C  | Ŭ     | U           | Latin capital letter U with breve                 |
     | U+016D  | ŭ     | u           | Latin small letter u with breve                   |
     | U+016E  | Ů     | U           | Latin capital letter U with ring above            |
     | U+016F  | ů     | u           | Latin small letter u with ring above              |
     | U+0170  | Ű     | U           | Latin capital letter U with double acute          |
     | U+0171  | ű     | u           | Latin small letter u with double acute            |
     | U+0172  | Ų     | U           | Latin capital letter U with ogonek                |
     | U+0173  | ų     | u           | Latin small letter u with ogonek                  |
     | U+0174  | Ŵ     | W           | Latin capital letter W with circumflex            |
     | U+0175  | ŵ     | w           | Latin small letter w with circumflex              |
     | U+0176  | Ŷ     | Y           | Latin capital letter Y with circumflex            |
     | U+0177  | ŷ     | y           | Latin small letter y with circumflex              |
     | U+0178  | Ÿ     | Y           | Latin capital letter Y with diaeresis             |
     | U+0179  | Ź     | Z           | Latin capital letter Z with acute                 |
     | U+017A  | ź     | z           | Latin small letter z with acute                   |
     | U+017B  | Ż     | Z           | Latin capital letter Z with dot above             |
     | U+017C  | ż     | z           | Latin small letter z with dot above               |
     | U+017D  | Ž     | Z           | Latin capital letter Z with caron                 |
     | U+017E  | ž     | z           | Latin small letter z with caron                   |
     | U+017F  | ſ     | s           | Latin small letter long s                         |
     | U+01A0  | Ơ     | O           | Latin capital letter O with horn                  |
     | U+01A1  | ơ     | o           | Latin small letter o with horn                    |
     | U+01AF  | Ư     | U           | Latin capital letter U with horn                  |
     | U+01B0  | ư     | u           | Latin small letter u with horn                    |
     | U+01CD  | Ǎ     | A           | Latin capital letter A with caron                 |
     | U+01CE  | ǎ     | a           | Latin small letter a with caron                   |
     | U+01CF  | Ǐ     | I           | Latin capital letter I with caron                 |
     | U+01D0  | ǐ     | i           | Latin small letter i with caron                   |
     | U+01D1  | Ǒ     | O           | Latin capital letter O with caron                 |
     | U+01D2  | ǒ     | o           | Latin small letter o with caron                   |
     | U+01D3  | Ǔ     | U           | Latin capital letter U with caron                 |
     | U+01D4  | ǔ     | u           | Latin small letter u with caron                   |
     | U+01D5  | Ǖ     | U           | Latin capital letter U with diaeresis and macron  |
     | U+01D6  | ǖ     | u           | Latin small letter u with diaeresis and macron    |
     | U+01D7  | Ǘ     | U           | Latin capital letter U with diaeresis and acute   |
     | U+01D8  | ǘ     | u           | Latin small letter u with diaeresis and acute     |
     | U+01D9  | Ǚ     | U           | Latin capital letter U with diaeresis and caron   |
     | U+01DA  | ǚ     | u           | Latin small letter u with diaeresis and caron     |
     | U+01DB  | Ǜ     | U           | Latin capital letter U with diaeresis and grave   |
     | U+01DC  | ǜ     | u           | Latin small letter u with diaeresis and grave     |
    
     Decompositions for Latin Extended-B:
    
     |   Code   | Glyph | Replacement |                Description                |
     | -------- | ----- | ----------- | ----------------------------------------- |
     | U+0218   | Ș     | S           | Latin capital letter S with comma below   |
     | U+0219   | ș     | s           | Latin small letter s with comma below     |
     | U+021A   | Ț     | T           | Latin capital letter T with comma below   |
     | U+021B   | ț     | t           | Latin small letter t with comma below     |
    
     Vowels with diacritic (Chinese, Hanyu Pinyin):
    
     |   Code   | Glyph | Replacement |                      Description                      |
     | -------- | ----- | ----------- | ----------------------------------------------------- |
     | U+0251   | ɑ     | a           | Latin small letter alpha                              |
     | U+1EA0   | Ạ     | A           | Latin capital letter A with dot below                 |
     | U+1EA1   | ạ     | a           | Latin small letter a with dot below                   |
     | U+1EA2   | Ả     | A           | Latin capital letter A with hook above                |
     | U+1EA3   | ả     | a           | Latin small letter a with hook above                  |
     | U+1EA4   | Ấ     | A           | Latin capital letter A with circumflex and acute      |
     | U+1EA5   | ấ     | a           | Latin small letter a with circumflex and acute        |
     | U+1EA6   | Ầ     | A           | Latin capital letter A with circumflex and grave      |
     | U+1EA7   | ầ     | a           | Latin small letter a with circumflex and grave        |
     | U+1EA8   | Ẩ     | A           | Latin capital letter A with circumflex and hook above |
     | U+1EA9   | ẩ     | a           | Latin small letter a with circumflex and hook above   |
     | U+1EAA   | Ẫ     | A           | Latin capital letter A with circumflex and tilde      |
     | U+1EAB   | ẫ     | a           | Latin small letter a with circumflex and tilde        |
     | U+1EA6   | Ậ     | A           | Latin capital letter A with circumflex and dot below  |
     | U+1EAD   | ậ     | a           | Latin small letter a with circumflex and dot below    |
     | U+1EAE   | Ắ     | A           | Latin capital letter A with breve and acute           |
     | U+1EAF   | ắ     | a           | Latin small letter a with breve and acute             |
     | U+1EB0   | Ằ     | A           | Latin capital letter A with breve and grave           |
     | U+1EB1   | ằ     | a           | Latin small letter a with breve and grave             |
     | U+1EB2   | Ẳ     | A           | Latin capital letter A with breve and hook above      |
     | U+1EB3   | ẳ     | a           | Latin small letter a with breve and hook above        |
     | U+1EB4   | Ẵ     | A           | Latin capital letter A with breve and tilde           |
     | U+1EB5   | ẵ     | a           | Latin small letter a with breve and tilde             |
     | U+1EB6   | Ặ     | A           | Latin capital letter A with breve and dot below       |
     | U+1EB7   | ặ     | a           | Latin small letter a with breve and dot below         |
     | U+1EB8   | Ẹ     | E           | Latin capital letter E with dot below                 |
     | U+1EB9   | ẹ     | e           | Latin small letter e with dot below                   |
     | U+1EBA   | Ẻ     | E           | Latin capital letter E with hook above                |
     | U+1EBB   | ẻ     | e           | Latin small letter e with hook above                  |
     | U+1EBC   | Ẽ     | E           | Latin capital letter E with tilde                     |
     | U+1EBD   | ẽ     | e           | Latin small letter e with tilde                       |
     | U+1EBE   | Ế     | E           | Latin capital letter E with circumflex and acute      |
     | U+1EBF   | ế     | e           | Latin small letter e with circumflex and acute        |
     | U+1EC0   | Ề     | E           | Latin capital letter E with circumflex and grave      |
     | U+1EC1   | ề     | e           | Latin small letter e with circumflex and grave        |
     | U+1EC2   | Ể     | E           | Latin capital letter E with circumflex and hook above |
     | U+1EC3   | ể     | e           | Latin small letter e with circumflex and hook above   |
     | U+1EC4   | Ễ     | E           | Latin capital letter E with circumflex and tilde      |
     | U+1EC5   | ễ     | e           | Latin small letter e with circumflex and tilde        |
     | U+1EC6   | Ệ     | E           | Latin capital letter E with circumflex and dot below  |
     | U+1EC7   | ệ     | e           | Latin small letter e with circumflex and dot below    |
     | U+1EC8   | Ỉ     | I           | Latin capital letter I with hook above                |
     | U+1EC9   | ỉ     | i           | Latin small letter i with hook above                  |
     | U+1ECA   | Ị     | I           | Latin capital letter I with dot below                 |
     | U+1ECB   | ị     | i           | Latin small letter i with dot below                   |
     | U+1ECC   | Ọ     | O           | Latin capital letter O with dot below                 |
     | U+1ECD   | ọ     | o           | Latin small letter o with dot below                   |
     | U+1ECE   | Ỏ     | O           | Latin capital letter O with hook above                |
     | U+1ECF   | ỏ     | o           | Latin small letter o with hook above                  |
     | U+1ED0   | Ố     | O           | Latin capital letter O with circumflex and acute      |
     | U+1ED1   | ố     | o           | Latin small letter o with circumflex and acute        |
     | U+1ED2   | Ồ     | O           | Latin capital letter O with circumflex and grave      |
     | U+1ED3   | ồ     | o           | Latin small letter o with circumflex and grave        |
     | U+1ED4   | Ổ     | O           | Latin capital letter O with circumflex and hook above |
     | U+1ED5   | ổ     | o           | Latin small letter o with circumflex and hook above   |
     | U+1ED6   | Ỗ     | O           | Latin capital letter O with circumflex and tilde      |
     | U+1ED7   | ỗ     | o           | Latin small letter o with circumflex and tilde        |
     | U+1ED8   | Ộ     | O           | Latin capital letter O with circumflex and dot below  |
     | U+1ED9   | ộ     | o           | Latin small letter o with circumflex and dot below    |
     | U+1EDA   | Ớ     | O           | Latin capital letter O with horn and acute            |
     | U+1EDB   | ớ     | o           | Latin small letter o with horn and acute              |
     | U+1EDC   | Ờ     | O           | Latin capital letter O with horn and grave            |
     | U+1EDD   | ờ     | o           | Latin small letter o with horn and grave              |
     | U+1EDE   | Ở     | O           | Latin capital letter O with horn and hook above       |
     | U+1EDF   | ở     | o           | Latin small letter o with horn and hook above         |
     | U+1EE0   | Ỡ     | O           | Latin capital letter O with horn and tilde            |
     | U+1EE1   | ỡ     | o           | Latin small letter o with horn and tilde              |
     | U+1EE2   | Ợ     | O           | Latin capital letter O with horn and dot below        |
     | U+1EE3   | ợ     | o           | Latin small letter o with horn and dot below          |
     | U+1EE4   | Ụ     | U           | Latin capital letter U with dot below                 |
     | U+1EE5   | ụ     | u           | Latin small letter u with dot below                   |
     | U+1EE6   | Ủ     | U           | Latin capital letter U with hook above                |
     | U+1EE7   | ủ     | u           | Latin small letter u with hook above                  |
     | U+1EE8   | Ứ     | U           | Latin capital letter U with horn and acute            |
     | U+1EE9   | ứ     | u           | Latin small letter u with horn and acute              |
     | U+1EEA   | Ừ     | U           | Latin capital letter U with horn and grave            |
     | U+1EEB   | ừ     | u           | Latin small letter u with horn and grave              |
     | U+1EEC   | Ử     | U           | Latin capital letter U with horn and hook above       |
     | U+1EED   | ử     | u           | Latin small letter u with horn and hook above         |
     | U+1EEE   | Ữ     | U           | Latin capital letter U with horn and tilde            |
     | U+1EEF   | ữ     | u           | Latin small letter u with horn and tilde              |
     | U+1EF0   | Ự     | U           | Latin capital letter U with horn and dot below        |
     | U+1EF1   | ự     | u           | Latin small letter u with horn and dot below          |
     | U+1EF2   | Ỳ     | Y           | Latin capital letter Y with grave                     |
     | U+1EF3   | ỳ     | y           | Latin small letter y with grave                       |
     | U+1EF4   | Ỵ     | Y           | Latin capital letter Y with dot below                 |
     | U+1EF5   | ỵ     | y           | Latin small letter y with dot below                   |
     | U+1EF6   | Ỷ     | Y           | Latin capital letter Y with hook above                |
     | U+1EF7   | ỷ     | y           | Latin small letter y with hook above                  |
     | U+1EF8   | Ỹ     | Y           | Latin capital letter Y with tilde                     |
     | U+1EF9   | ỹ     | y           | Latin small letter y with tilde                       |
    
     German (`de_DE`), German formal (`de_DE_formal`), German (Switzerland) formal (`de_CH`),
     and German (Switzerland) informal (`de_CH_informal`) locales:
    
     |   Code   | Glyph | Replacement |               Description               |
     | -------- | ----- | ----------- | --------------------------------------- |
     | U+00C4   | Ä     | Ae          | Latin capital letter A with diaeresis   |
     | U+00E4   | ä     | ae          | Latin small letter a with diaeresis     |
     | U+00D6   | Ö     | Oe          | Latin capital letter O with diaeresis   |
     | U+00F6   | ö     | oe          | Latin small letter o with diaeresis     |
     | U+00DC   | Ü     | Ue          | Latin capital letter U with diaeresis   |
     | U+00FC   | ü     | ue          | Latin small letter u with diaeresis     |
     | U+00DF   | ß     | ss          | Latin small letter sharp s              |
    
     Danish (`da_DK`) locale:
    
     |   Code   | Glyph | Replacement |               Description               |
     | -------- | ----- | ----------- | --------------------------------------- |
     | U+00C6   | Æ     | Ae          | Latin capital letter AE                 |
     | U+00E6   | æ     | ae          | Latin small letter ae                   |
     | U+00D8   | Ø     | Oe          | Latin capital letter O with stroke      |
     | U+00F8   | ø     | oe          | Latin small letter o with stroke        |
     | U+00C5   | Å     | Aa          | Latin capital letter A with ring above  |
     | U+00E5   | å     | aa          | Latin small letter a with ring above    |
    
     Catalan (`ca`) locale:
    
     |   Code   | Glyph | Replacement |               Description               |
     | -------- | ----- | ----------- | --------------------------------------- |
     | U+00B7   | l·l   | ll          | Flown dot (between two Ls)              |
    
     Serbian (`sr_RS`) and Bosnian (`bs_BA`) locales:
    
     |   Code   | Glyph | Replacement |               Description               |
     | -------- | ----- | ----------- | --------------------------------------- |
     | U+0110   | Đ     | DJ          | Latin capital letter D with stroke      |
     | U+0111   | đ     | dj          | Latin small letter d with stroke        |
    
     @since 1.2.1
     @since 4.6.0 Added locale support for `de_CH`, `de_CH_informal`, and `ca`.
     @since 4.7.0 Added locale support for `sr_RS`.
     @since 4.8.0 Added locale support for `bs_BA`.
    
     @param string $string Text that might have accent characters
     @return string Filtered string with replaced "nice" characters.
    
  **/
  public function remove_accents(string:String):String;
  /**
    
     Sanitizes a filename, replacing whitespace with dashes.
    
     Removes special characters that are illegal in filenames on certain
     operating systems and special characters requiring special escaping
     to manipulate at the command line. Replaces spaces and consecutive
     dashes with a single dash. Trims period, dash and underscore from beginning
     and end of filename. It is not guaranteed that this function will return a
     filename that is allowed to be uploaded.
    
     @since 2.1.0
    
     @param string $filename The filename to be sanitized
     @return string The sanitized filename
    
  **/
  public function sanitize_file_name(filename:String):String;
  /**
    
     Sanitizes a username, stripping out unsafe characters.
    
     Removes tags, octets, entities, and if strict is enabled, will only keep
     alphanumeric, _, space, ., -, @. After sanitizing, it passes the username,
     raw username (the username in the parameter), and the value of $strict as
     parameters for the {@see 'sanitize_user'} filter.
    
     @since 2.0.0
    
     @param string $username The username to be sanitized.
     @param bool   $strict   If set limits $username to specific characters. Default false.
     @return string The sanitized username, after passing through filters.
    
  **/
  public function sanitize_user(username:String, strict:Bool = false):String;
  /**
    
     Sanitizes a string key.
    
     Keys are used as internal identifiers. Lowercase alphanumeric characters, dashes and underscores are allowed.
    
     @since 3.0.0
    
     @param string $key String key
     @return string Sanitized key
    
  **/
  public function sanitize_key(key:String):String;
  /**
    
     Sanitizes a title, or returns a fallback title.
    
     Specifically, HTML and PHP tags are stripped. Further actions can be added
     via the plugin API. If $title is empty and $fallback_title is set, the latter
     will be used.
    
     @since 1.0.0
    
     @param string $title          The string to be sanitized.
     @param string $fallback_title Optional. A title to use if $title is empty.
     @param string $context        Optional. The operation for which the string is sanitized
     @return string The sanitized string.
    
  **/
  public function sanitize_title(title:String, fallback_title:String = '', context:String = 'save'):String;
  /**
    
     Sanitizes a title with the 'query' context.
    
     Used for querying the database for a value from URL.
    
     @since 3.1.0
    
     @param string $title The string to be sanitized.
     @return string The sanitized string.
    
  **/
  public function sanitize_title_for_query(title:String):String;
  /**
    
     Sanitizes a title, replacing whitespace and a few other characters with dashes.
    
     Limits the output to alphanumeric characters, underscore (_) and dash (-).
     Whitespace becomes a dash.
    
     @since 1.2.0
    
     @param string $title     The title to be sanitized.
     @param string $raw_title Optional. Not used.
     @param string $context   Optional. The operation for which the string is sanitized.
     @return string The sanitized title.
    
  **/
  public function sanitize_title_with_dashes(title:String, raw_title:String = '', context:String = 'display'):String;
  /**
    
     Ensures a string is a valid SQL 'order by' clause.
    
     Accepts one or more columns, with or without a sort order (ASC / DESC).
     e.g. 'column_1', 'column_1, column_2', 'column_1 ASC, column_2 DESC' etc.
    
     Also accepts 'RAND()'.
    
     @since 2.5.1
    
     @param string $orderby Order by clause to be validated.
     @return string|false Returns $orderby if valid, false otherwise.
    
  **/
  public function sanitize_sql_orderby(orderby:String):haxe.extern.EitherType<String, Bool>;
  /**
    
     Sanitizes an HTML classname to ensure it only contains valid characters.
    
     Strips the string down to A-Z,a-z,0-9,_,-. If this results in an empty
     string then it will return the alternative value supplied.
    
     @todo Expand to support the full range of CDATA that a class attribute can contain.
    
     @since 2.8.0
    
     @param string $class    The classname to be sanitized
     @param string $fallback Optional. The value to return if the sanitization ends up as an empty string.
      Defaults to an empty string.
     @return string The sanitized value
    
  **/
  public function sanitize_html_class(class_:String, fallback:String = ''):String;
  /**
    
     Converts lone & characters into `&#038;` (a.k.a. `&amp;`)
    
     @since 0.71
    
     @param string $content    String of characters to be converted.
     @param string $deprecated Not used.
     @return string Converted string.
    
  **/
  public function convert_chars(content:String, deprecated:String = ''):String;
  /**
    
     Converts invalid Unicode references range to valid range.
    
     @since 4.3.0
    
     @param string $content String with entities that need converting.
     @return string Converted string.
    
  **/
  public function convert_invalid_entities(content:String):String;
  /**
    
     Balances tags if forced to, or if the 'use_balanceTags' option is set to true.
    
     @since 0.71
    
     @param string $text  Text to be balanced
     @param bool   $force If true, forces balancing, ignoring the value of the option. Default false.
     @return string Balanced text
    
  **/
  public function balanceTags(text:String, force:Bool = false):String;
  /**
    
     Balances tags of string using a modified stack.
    
     @since 2.0.4
    
     @author Leonard Lin <leonard@acm.org>
     @license GPL
     @copyright November 4, 2001
     @version 1.1
     @todo Make better - change loop condition to $text in 1.2
     @internal Modified by Scott Reilly (coffee2code) 02 Aug 2004
          1.1  Fixed handling of append/stack pop order of end text
               Added Cleaning Hooks
          1.0  First Version
    
     @param string $text Text to be balanced.
     @return string Balanced text.
    
  **/
  public function force_balance_tags(text:String):String;
  /**
    
     Acts on text which is about to be edited.
    
     The $content is run through esc_textarea(), which uses htmlspecialchars()
     to convert special characters to HTML entities. If `$richedit` is set to true,
     it is simply a holder for the {@see 'format_to_edit'} filter.
    
     @since 0.71
     @since 4.4.0 The `$richedit` parameter was renamed to `$rich_text` for clarity.
    
     @param string $content   The text about to be edited.
     @param bool   $rich_text Optional. Whether `$content` should be considered rich text,
                              in which case it would not be passed through esc_textarea().
                              Default false.
     @return string The text after the filter (and possibly htmlspecialchars()) has been run.
    
  **/
  public function format_to_edit(content:String, rich_text:Bool = false):String;
  /**
    
     Add leading zeros when necessary.
    
     If you set the threshold to '4' and the number is '10', then you will get
     back '0010'. If you set the threshold to '4' and the number is '5000', then you
     will get back '5000'.
    
     Uses sprintf to append the amount of zeros based on the $threshold parameter
     and the size of the number. If the number is large enough, then no zeros will
     be appended.
    
     @since 0.71
    
     @param int $number     Number to append zeros to if not greater than threshold.
     @param int $threshold  Digit places number needs to be to not have zeros added.
     @return string Adds leading zeros to number if needed.
    
  **/
  public function zeroise(number:Int, threshold:Int):String;
  /**
    
     Adds backslashes before letters and before a number at the start of a string.
    
     @since 0.71
    
     @param string $string Value to which backslashes will be added.
     @return string String with backslashes inserted.
    
  **/
  public function backslashit(string:String):String;
  /**
    
     Appends a trailing slash.
    
     Will remove trailing forward and backslashes if it exists already before adding
     a trailing forward slash. This prevents double slashing a string or path.
    
     The primary use of this is for paths and thus should be used for paths. It is
     not restricted to paths and offers no specific path support.
    
     @since 1.2.0
    
     @param string $string What to add the trailing slash to.
     @return string String with trailing slash added.
    
  **/
  public function trailingslashit(string:String):String;
  /**
    
     Removes trailing forward slashes and backslashes if they exist.
    
     The primary use of this is for paths and thus should be used for paths. It is
     not restricted to paths and offers no specific path support.
    
     @since 2.2.0
    
     @param string $string What to remove the trailing slashes from.
     @return string String without the trailing slashes.
    
  **/
  public function untrailingslashit(string:String):String;
  /**
    
     Adds slashes to escape strings.
    
     Slashes will first be removed if magic_quotes_gpc is set, see {@link
     https://secure.php.net/magic_quotes} for more details.
    
     @since 0.71
    
     @param string $gpc The string returned from HTTP request data.
     @return string Returns a string escaped with slashes.
    
  **/
  public function addslashes_gpc(gpc:String):String;
  /**
    
     Navigates through an array, object, or scalar, and removes slashes from the values.
    
     @since 2.0.0
    
     @param mixed $value The value to be stripped.
     @return mixed Stripped value.
    
  **/
  public function stripslashes_deep(value:Dynamic):Dynamic;
  /**
    
     Callback function for `stripslashes_deep()` which strips slashes from strings.
    
     @since 4.4.0
    
     @param mixed $value The array or string to be stripped.
     @return mixed $value The stripped value.
    
  **/
  public function stripslashes_from_strings_only(value:Dynamic):Dynamic;
  /**
    
     Navigates through an array, object, or scalar, and encodes the values to be used in a URL.
    
     @since 2.2.0
    
     @param mixed $value The array or string to be encoded.
     @return mixed $value The encoded value.
    
  **/
  public function urlencode_deep(value:Dynamic):Dynamic;
  /**
    
     Navigates through an array, object, or scalar, and raw-encodes the values to be used in a URL.
    
     @since 3.4.0
    
     @param mixed $value The array or string to be encoded.
     @return mixed $value The encoded value.
    
  **/
  public function rawurlencode_deep(value:Dynamic):Dynamic;
  /**
    
     Navigates through an array, object, or scalar, and decodes URL-encoded values
    
     @since 4.4.0
    
     @param mixed $value The array or string to be decoded.
     @return mixed $value The decoded value.
    
  **/
  public function urldecode_deep(value:Dynamic):Dynamic;
  /**
    
     Converts email addresses characters to HTML entities to block spam bots.
    
     @since 0.71
    
     @param string $email_address Email address.
     @param int    $hex_encoding  Optional. Set to 1 to enable hex encoding.
     @return string Converted email address.
    
  **/
  public function antispambot(email_address:String, hex_encoding:Int = 0):String;
  /**
    
     Callback to convert URI match to HTML A element.
    
     This function was backported from 2.5.0 to 2.3.2. Regex callback for make_clickable().
    
     @since 2.3.2
     @access private
    
     @param array $matches Single Regex Match.
     @return string HTML A element with URI address.
    
  **/
  public function _make_url_clickable_cb(matches:php.NativeStructArray<Dynamic>):String;
  /**
    
     Callback to convert URL match to HTML A element.
    
     This function was backported from 2.5.0 to 2.3.2. Regex callback for make_clickable().
    
     @since 2.3.2
     @access private
    
     @param array $matches Single Regex Match.
     @return string HTML A element with URL address.
    
  **/
  public function _make_web_ftp_clickable_cb(matches:php.NativeStructArray<Dynamic>):String;
  /**
    
     Callback to convert email address match to HTML A element.
    
     This function was backported from 2.5.0 to 2.3.2. Regex callback for make_clickable().
    
     @since 2.3.2
     @access private
    
     @param array $matches Single Regex Match.
     @return string HTML A element with email address.
    
  **/
  public function _make_email_clickable_cb(matches:php.NativeStructArray<Dynamic>):String;
  /**
    
     Convert plaintext URI to HTML links.
    
     Converts URI, www and ftp, and email addresses. Finishes by fixing links
     within links.
    
     @since 0.71
    
     @param string $text Content to convert URIs.
     @return string Content with converted URIs.
    
  **/
  public function make_clickable(text:String):String;
  /**
    
     Breaks a string into chunks by splitting at whitespace characters.
     The length of each returned chunk is as close to the specified length goal as possible,
     with the caveat that each chunk includes its trailing delimiter.
     Chunks longer than the goal are guaranteed to not have any inner whitespace.
    
     Joining the returned chunks with empty delimiters reconstructs the input string losslessly.
    
     Input string must have no null characters (or eventual transformations on output chunks must not care about null characters)
    
         _split_str_by_whitespace( "1234 67890 1234 67890a cd 1234   890 123456789 1234567890a    45678   1 3 5 7 90 ", 10 ) ==
         array (
             0 => '1234 67890 ',  // 11 characters: Perfect split
             1 => '1234 ',        //  5 characters: '1234 67890a' was too long
             2 => '67890a cd ',   // 10 characters: '67890a cd 1234' was too long
             3 => '1234   890 ',  // 11 characters: Perfect split
             4 => '123456789 ',   // 10 characters: '123456789 1234567890a' was too long
             5 => '1234567890a ', // 12 characters: Too long, but no inner whitespace on which to split
             6 => '   45678   ',  // 11 characters: Perfect split
             7 => '1 3 5 7 90 ',  // 11 characters: End of $string
         );
    
     @since 3.4.0
     @access private
    
     @param string $string The string to split.
     @param int    $goal   The desired chunk length.
     @return array Numeric array of chunks.
    
  **/
  public function _split_str_by_whitespace(string:String, goal:Int):php.NativeArray;
  /**
    
     Adds rel nofollow string to all HTML A elements in content.
    
     @since 1.5.0
    
     @param string $text Content that may contain HTML A elements.
     @return string Converted content.
    
  **/
  public function wp_rel_nofollow(text:String):String;
  /**
    
     Callback to add rel=nofollow string to HTML A element.
    
     Will remove already existing rel="nofollow" and rel='nofollow' from the
     string to prevent from invalidating (X)HTML.
    
     @since 2.3.0
    
     @param array $matches Single Match
     @return string HTML A Element with rel nofollow.
    
  **/
  public function wp_rel_nofollow_callback(matches:php.NativeStructArray<Dynamic>):String;
  /**
    
     Adds rel noreferrer and noopener to all HTML A elements that have a target.
    
     @param string $text Content that may contain HTML A elements.
     @return string Converted content.
    
  **/
  public function wp_targeted_link_rel(text:String):String;
  /**
    
     Callback to add rel="noreferrer noopener" string to HTML A element.
    
     Will not duplicate existing noreferrer and noopener values
     to prevent from invalidating the HTML.
    
     @param array $matches Single Match
     @return string HTML A Element with rel noreferrer noopener in addition to any existing values
    
  **/
  public function wp_targeted_link_rel_callback(matches:php.NativeStructArray<Dynamic>):String;
  /**
    
     Adds all filters modifying the rel attribute of targeted links.
    
     @since 5.1.0
    
  **/
  public function wp_init_targeted_link_rel_filters():Void;
  /**
    
     Removes all filters modifying the rel attribute of targeted links.
    
     @since 5.1.0
    
  **/
  public function wp_remove_targeted_link_rel_filters():Void;
  /**
    
     Convert one smiley code to the icon graphic file equivalent.
    
     Callback handler for convert_smilies().
    
     Looks up one smiley code in the $wpsmiliestrans global array and returns an
     `<img>` string for that smiley.
    
     @since 2.8.0
    
     @global array $wpsmiliestrans
    
     @param array $matches Single match. Smiley code to convert to image.
     @return string Image string for smiley.
    
  **/
  public function translate_smiley(matches:php.NativeStructArray<Dynamic>):String;
  /**
    
     Convert text equivalent of smilies to images.
    
     Will only convert smilies if the option 'use_smilies' is true and the global
     used in the function isn't empty.
    
     @since 0.71
    
     @global string|array $wp_smiliessearch
    
     @param string $text Content to convert smilies from text.
     @return string Converted content with text smilies replaced with images.
    
  **/
  public function convert_smilies(text:String):String;
  /**
    
     Verifies that an email is valid.
    
     Does not grok i18n domains. Not RFC compliant.
    
     @since 0.71
    
     @param string $email      Email address to verify.
     @param bool   $deprecated Deprecated.
     @return string|bool Either false or the valid email address.
    
  **/
  public function is_email(email:String, deprecated:Bool = false):haxe.extern.EitherType<String, Bool>;
  /**
    
     Convert to ASCII from email subjects.
    
     @since 1.2.0
    
     @param string $string Subject line
     @return string Converted string to ASCII
    
  **/
  public function wp_iso_descrambler(string:String):String;
  /**
    
     Helper function to convert hex encoded chars to ASCII
    
     @since 3.1.0
     @access private
    
     @param array $match The preg_replace_callback matches array
     @return string Converted chars
    
  **/
  public function _wp_iso_convert(match:php.NativeStructArray<Dynamic>):String;
  /**
    
     Returns a date in the GMT equivalent.
    
     Requires and returns a date in the Y-m-d H:i:s format. If there is a
     timezone_string available, the date is assumed to be in that timezone,
     otherwise it simply subtracts the value of the 'gmt_offset' option. Return
     format can be overridden using the $format parameter.
    
     @since 1.2.0
    
     @param string $string The date to be converted.
     @param string $format The format string for the returned date (default is Y-m-d H:i:s)
     @return string GMT version of the date provided.
    
  **/
  public function get_gmt_from_date(string:String, ?format:String):String;
  /**
    
     Converts a GMT date into the correct format for the blog.
    
     Requires and returns a date in the Y-m-d H:i:s format. If there is a
     timezone_string available, the returned date is in that timezone, otherwise
     it simply adds the value of gmt_offset. Return format can be overridden
     using the $format parameter
    
     @since 1.2.0
    
     @param string $string The date to be converted.
     @param string $format The format string for the returned date (default is Y-m-d H:i:s)
     @return string Formatted date relative to the timezone / GMT offset.
    
  **/
  public function get_date_from_gmt(string:String, ?format:String):String;
  /**
    
     Computes an offset in seconds from an iso8601 timezone.
    
     @since 1.5.0
    
     @param string $timezone Either 'Z' for 0 offset or '±hhmm'.
     @return int|float The offset in seconds.
    
  **/
  public function iso8601_timezone_to_offset(timezone:String):haxe.extern.EitherType<Int, Int>;
  /**
    
     Converts an iso8601 date to MySQL DateTime format used by post_date[_gmt].
    
     @since 1.5.0
    
     @param string $date_string Date and time in ISO 8601 format {@link https://en.wikipedia.org/wiki/ISO_8601}.
     @param string $timezone    Optional. If set to GMT returns the time minus gmt_offset. Default is 'user'.
     @return string The date and time in MySQL DateTime format - Y-m-d H:i:s.
    
  **/
  public function iso8601_to_datetime(date_string:String, timezone:String = 'user'):String;
  /**
    
     Strips out all characters that are not allowable in an email.
    
     @since 1.5.0
    
     @param string $email Email address to filter.
     @return string Filtered email address.
    
  **/
  public function sanitize_email(email:String):String;
  /**
    
     Determines the difference between two timestamps.
    
     The difference is returned in a human readable format such as "1 hour",
     "5 mins", "2 days".
    
     @since 1.5.0
    
     @param int $from Unix timestamp from which the difference begins.
     @param int $to   Optional. Unix timestamp to end the time difference. Default becomes time() if not set.
     @return string Human readable time difference.
    
  **/
  public function human_time_diff(from:Int, to:Int = ''):String;
  /**
    
     Generates an excerpt from the content, if needed.
    
     The excerpt word amount will be 55 words and if the amount is greater than
     that, then the string ' [&hellip;]' will be appended to the excerpt. If the string
     is less than 55 words, then the content will be returned as is.
    
     The 55 word limit can be modified by plugins/themes using the {@see 'excerpt_length'} filter
     The ' [&hellip;]' string can be modified by plugins/themes using the {@see 'excerpt_more'} filter
    
     @since 1.5.0
    
     @param string $text Optional. The excerpt. If set to empty, an excerpt is generated.
     @return string The excerpt.
    
  **/
  public function wp_trim_excerpt(text:String = ''):String;
  /**
    
     Trims text to a certain number of words.
    
     This function is localized. For languages that count 'words' by the individual
     character (such as East Asian languages), the $num_words argument will apply
     to the number of individual characters.
    
     @since 3.3.0
    
     @param string $text      Text to trim.
     @param int    $num_words Number of words. Default 55.
     @param string $more      Optional. What to append if $text needs to be trimmed. Default '&hellip;'.
     @return string Trimmed text.
    
  **/
  public function wp_trim_words(text:String, num_words:Int = 55, more:String = null):String;
  /**
    
     Converts named entities into numbered entities.
    
     @since 1.5.1
    
     @param string $text The text within which entities will be converted.
     @return string Text with converted entities.
    
  **/
  public function ent2ncr(text:String):String;
  /**
    
     Formats text for the editor.
    
     Generally the browsers treat everything inside a textarea as text, but
     it is still a good idea to HTML entity encode `<`, `>` and `&` in the content.
    
     The filter {@see 'format_for_editor'} is applied here. If `$text` is empty the
     filter will be applied to an empty string.
    
     @since 4.3.0
    
     @see _WP_Editors::editor()
    
     @param string $text           The text to be formatted.
     @param string $default_editor The default editor for the current user.
                                   It is usually either 'html' or 'tinymce'.
     @return string The formatted text after filter is applied.
    
  **/
  public function format_for_editor(text:String, default_editor:String = null):String;
  /**
    
     Perform a deep string replace operation to ensure the values in $search are no longer present
    
     Repeats the replacement operation until it no longer replaces anything so as to remove "nested" values
     e.g. $subject = '%0%0%0DDD', $search ='%0D', $result ='' rather than the '%0%0DD' that
     str_replace would return
    
     @since 2.8.1
     @access private
    
     @param string|array $search  The value being searched for, otherwise known as the needle.
                                  An array may be used to designate multiple needles.
     @param string       $subject The string being searched and replaced on, otherwise known as the haystack.
     @return string The string with the replaced values.
    
  **/
  public function _deep_replace(search:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>, subject:String):String;
  /**
    
     Escapes data for use in a MySQL query.
    
     Usually you should prepare queries using wpdb::prepare().
     Sometimes, spot-escaping is required or useful. One example
     is preparing an array for use in an IN clause.
    
     NOTE: Since 4.8.3, '%' characters will be replaced with a placeholder string,
     this prevents certain SQLi attacks from taking place. This change in behaviour
     may cause issues for code that expects the return value of esc_sql() to be useable
     for other purposes.
    
     @since 2.8.0
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string|array $data Unescaped data
     @return string|array Escaped data
    
  **/
  public function esc_sql(data:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>;
  /**
    
     Checks and cleans a URL.
    
     A number of characters are removed from the URL. If the URL is for displaying
     (the default behaviour) ampersands are also replaced. The {@see 'clean_url'} filter
     is applied to the returned cleaned URL.
    
     @since 2.8.0
    
     @param string $url       The URL to be cleaned.
     @param array  $protocols Optional. An array of acceptable protocols.
                              Defaults to return value of wp_allowed_protocols()
     @param string $_context  Private. Use esc_url_raw() for database usage.
     @return string The cleaned $url after the {@see 'clean_url'} filter is applied.
    
  **/
  public function esc_url(url:String, protocols:php.NativeStructArray<Dynamic> = null, _context:String = 'display'):String;
  /**
    
     Performs esc_url() for database usage.
    
     @since 2.8.0
    
     @param string $url       The URL to be cleaned.
     @param array  $protocols An array of acceptable protocols.
     @return string The cleaned URL.
    
  **/
  public function esc_url_raw(url:String, protocols:php.NativeStructArray<Dynamic> = null):String;
  /**
    
     Convert entities, while preserving already-encoded entities.
    
     @link https://secure.php.net/htmlentities Borrowed from the PHP Manual user notes.
    
     @since 1.2.2
    
     @param string $myHTML The text to be converted.
     @return string Converted text.
    
  **/
  public function htmlentities2(myHTML:String):String;
  /**
    
     Escape single quotes, htmlspecialchar " < > &, and fix line endings.
    
     Escapes text strings for echoing in JS. It is intended to be used for inline JS
     (in a tag attribute, for example onclick="..."). Note that the strings have to
     be in single quotes. The {@see 'js_escape'} filter is also applied here.
    
     @since 2.8.0
    
     @param string $text The text to be escaped.
     @return string Escaped text.
    
  **/
  public function esc_js(text:String):String;
  /**
    
     Escaping for HTML blocks.
    
     @since 2.8.0
    
     @param string $text
     @return string
    
  **/
  public function esc_html(text:String):String;
  /**
    
     Escaping for HTML attributes.
    
     @since 2.8.0
    
     @param string $text
     @return string
    
  **/
  public function esc_attr(text:String):String;
  /**
    
     Escaping for textarea values.
    
     @since 3.1.0
    
     @param string $text
     @return string
    
  **/
  public function esc_textarea(text:String):String;
  /**
    
     Escape an HTML tag name.
    
     @since 2.5.0
    
     @param string $tag_name
     @return string
    
  **/
  public function tag_escape(tag_name:String):String;
  /**
    
     Convert full URL paths to absolute paths.
    
     Removes the http or https protocols and the domain. Keeps the path '/' at the
     beginning, so it isn't a true relative link, but from the web root base.
    
     @since 2.1.0
     @since 4.1.0 Support was added for relative URLs.
    
     @param string $link Full URL path.
     @return string Absolute path.
    
  **/
  public function wp_make_link_relative(link:String):String;
  /**
    
     Sanitises various option values based on the nature of the option.
    
     This is basically a switch statement which will pass $value through a number
     of functions depending on the $option.
    
     @since 2.0.5
    
     @global wpdb $wpdb WordPress database abstraction object.
    
     @param string $option The name of the option.
     @param string $value  The unsanitised value.
     @return string Sanitized value.
    
  **/
  public function sanitize_option(option:String, value:String):String;
  /**
    
     Maps a function to all non-iterable elements of an array or an object.
    
     This is similar to `array_walk_recursive()` but acts upon objects too.
    
     @since 4.4.0
    
     @param mixed    $value    The array, object, or scalar.
     @param callable $callback The function to map onto $value.
     @return mixed The value with the callback applied to all non-arrays and non-objects inside it.
    
  **/
  public function map_deep(value:Dynamic, callback:Dynamic):Dynamic;
  /**
    
     Parses a string into variables to be stored in an array.
    
     Uses {@link https://secure.php.net/parse_str parse_str()} and stripslashes if
     {@link https://secure.php.net/magic_quotes magic_quotes_gpc} is on.
    
     @since 2.2.1
    
     @param string $string The string to be parsed.
     @param array  $array  Variables will be stored in this array.
    
  **/
  public function wp_parse_str(string:String, array:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Convert lone less than signs.
    
     KSES already converts lone greater than signs.
    
     @since 2.3.0
    
     @param string $text Text to be converted.
     @return string Converted text.
    
  **/
  public function wp_pre_kses_less_than(text:String):String;
  /**
    
     Callback function used by preg_replace.
    
     @since 2.3.0
    
     @param array $matches Populated by matches to preg_replace.
     @return string The text returned after esc_html if needed.
    
  **/
  public function wp_pre_kses_less_than_callback(matches:php.NativeStructArray<Dynamic>):String;
  /**
    
     WordPress implementation of PHP sprintf() with filters.
    
     @since 2.5.0
     @link https://secure.php.net/sprintf
    
     @param string $pattern   The string which formatted args are inserted.
     @param mixed  $args ,... Arguments to be formatted into the $pattern string.
     @return string The formatted string.
    
  **/
  public function wp_sprintf(pattern:String, args:Dynamic):String;
  /**
    
     Localize list items before the rest of the content.
    
     The '%l' must be at the first characters can then contain the rest of the
     content. The list items will have ', ', ', and', and ' and ' added depending
     on the amount of list items in the $args parameter.
    
     @since 2.5.0
    
     @param string $pattern Content containing '%l' at the beginning.
     @param array  $args    List items to prepend to the content and replace '%l'.
     @return string Localized list items and rest of the content.
    
  **/
  public function wp_sprintf_l(pattern:String, args:php.NativeStructArray<Dynamic>):String;
  /**
    
     Safely extracts not more than the first $count characters from html string.
    
     UTF-8, tags and entities safe prefix extraction. Entities inside will *NOT*
     be counted as one character. For example &amp; will be counted as 4, &lt; as
     3, etc.
    
     @since 2.5.0
    
     @param string $str   String to get the excerpt from.
     @param int    $count Maximum number of characters to take.
     @param string $more  Optional. What to append if $str needs to be trimmed. Defaults to empty string.
     @return string The excerpt.
    
  **/
  public function wp_html_excerpt(str:String, count:Int, more:String = null):String;
  /**
    
     Add a Base url to relative links in passed content.
    
     By default it supports the 'src' and 'href' attributes. However this can be
     changed via the 3rd param.
    
     @since 2.7.0
    
     @global string $_links_add_base
    
     @param string $content String to search for links in.
     @param string $base    The base URL to prefix to links.
     @param array  $attrs   The attributes which should be processed.
     @return string The processed content.
    
  **/
  public function links_add_base_url(content:String, base:String, ?attrs:php.NativeStructArray<Dynamic>):String;
  /**
    
     Callback to add a base url to relative links in passed content.
    
     @since 2.7.0
     @access private
    
     @global string $_links_add_base
    
     @param string $m The matched link.
     @return string The processed link.
    
  **/
  public function _links_add_base(m:String):String;
  /**
    
     Adds a Target attribute to all links in passed content.
    
     This function by default only applies to `<a>` tags, however this can be
     modified by the 3rd param.
    
     *NOTE:* Any current target attributed will be stripped and replaced.
    
     @since 2.7.0
    
     @global string $_links_add_target
    
     @param string $content String to search for links in.
     @param string $target  The Target to add to the links.
     @param array  $tags    An array of tags to apply to.
     @return string The processed content.
    
  **/
  public function links_add_target(content:String, target:String = '_blank', ?tags:php.NativeStructArray<Dynamic>):String;
  /**
    
     Callback to add a target attribute to all links in passed content.
    
     @since 2.7.0
     @access private
    
     @global string $_links_add_target
    
     @param string $m The matched link.
     @return string The processed link.
    
  **/
  public function _links_add_target(m:String):String;
  /**
    
     Normalize EOL characters and strip duplicate whitespace.
    
     @since 2.7.0
    
     @param string $str The string to normalize.
     @return string The normalized string.
    
  **/
  public function normalize_whitespace(str:String):String;
  /**
    
     Properly strip all HTML tags including script and style
    
     This differs from strip_tags() because it removes the contents of
     the `<script>` and `<style>` tags. E.g. `strip_tags( '<script>something</script>' )`
     will return 'something'. wp_strip_all_tags will return ''
    
     @since 2.9.0
    
     @param string $string        String containing HTML tags
     @param bool   $remove_breaks Optional. Whether to remove left over line breaks and white space chars
     @return string The processed string.
    
  **/
  public function wp_strip_all_tags(string:String, remove_breaks:Bool = false):String;
  /**
    
     Sanitizes a string from user input or from the database.
    
     - Checks for invalid UTF-8,
     - Converts single `<` characters to entities
     - Strips all tags
     - Removes line breaks, tabs, and extra whitespace
     - Strips octets
    
     @since 2.9.0
    
     @see sanitize_textarea_field()
     @see wp_check_invalid_utf8()
     @see wp_strip_all_tags()
    
     @param string $str String to sanitize.
     @return string Sanitized string.
    
  **/
  public function sanitize_text_field(str:String):String;
  /**
    
     Sanitizes a multiline string from user input or from the database.
    
     The function is like sanitize_text_field(), but preserves
     new lines (\n) and other whitespace, which are legitimate
     input in textarea elements.
    
     @see sanitize_text_field()
    
     @since 4.7.0
    
     @param string $str String to sanitize.
     @return string Sanitized string.
    
  **/
  public function sanitize_textarea_field(str:String):String;
  /**
    
     Internal helper function to sanitize a string from user input or from the db
    
     @since 4.7.0
     @access private
    
     @param string $str String to sanitize.
     @param bool $keep_newlines optional Whether to keep newlines. Default: false.
     @return string Sanitized string.
    
  **/
  public function _sanitize_text_fields(str:String, keep_newlines:Bool = false):String;
  /**
    
     i18n friendly version of basename()
    
     @since 3.1.0
    
     @param string $path   A path.
     @param string $suffix If the filename ends in suffix this will also be cut off.
     @return string
    
  **/
  public function wp_basename(path:String, suffix:String = ''):String;
  /**
    
     Forever eliminate "Wordpress" from the planet (or at least the little bit we can influence).
    
     Violating our coding standards for a good function name.
    
     @since 3.0.0
    
     @staticvar string|false $dblq
    
     @param string $text The text to be modified.
     @return string The modified text.
    
  **/
  public function capital_P_dangit(text:String):String;
  /**
    
     Sanitize a mime type
    
     @since 3.1.3
    
     @param string $mime_type Mime type
     @return string Sanitized mime type
    
  **/
  public function sanitize_mime_type(mime_type:String):String;
  /**
    
     Sanitize space or carriage return separated URLs that are used to send trackbacks.
    
     @since 3.4.0
    
     @param string $to_ping Space or carriage return separated URLs
     @return string URLs starting with the http or https protocol, separated by a carriage return.
    
  **/
  public function sanitize_trackback_urls(to_ping:String):String;
  /**
    
     Add slashes to a string or array of strings.
    
     This should be used when preparing data for core API that expects slashed data.
     This should not be used to escape data going directly into an SQL query.
    
     @since 3.6.0
    
     @param string|array $value String or array of strings to slash.
     @return string|array Slashed $value
    
  **/
  public function wp_slash(value:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>;
  /**
    
     Remove slashes from a string or array of strings.
    
     This should be used to remove slashes from data passed to core API that
     expects data to be unslashed.
    
     @since 3.6.0
    
     @param string|array $value String or array of strings to unslash.
     @return string|array Unslashed $value
    
  **/
  public function wp_unslash(value:haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>):haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>;
  /**
    
     Extract and return the first URL from passed content.
    
     @since 3.6.0
    
     @param string $content A string which might contain a URL.
     @return string|false The found URL.
    
  **/
  public function get_url_in_content(content:String):haxe.extern.EitherType<String, Bool>;
  /**
    
     Returns the regexp for common whitespace characters.
    
     By default, spaces include new lines, tabs, nbsp entities, and the UTF-8 nbsp.
     This is designed to replace the PCRE \s sequence.  In ticket #22692, that
     sequence was found to be unreliable due to random inclusion of the A0 byte.
    
     @since 4.0.0
    
     @staticvar string $spaces
    
     @return string The spaces regexp.
    
  **/
  public function wp_spaces_regexp():String;
  /**
    
     Print the important emoji-related styles.
    
     @since 4.2.0
    
     @staticvar bool $printed
    
  **/
  public function print_emoji_styles():Void;
  /**
    
     Print the inline Emoji detection script if it is not already printed.
    
     @since 4.2.0
     @staticvar bool $printed
    
  **/
  public function print_emoji_detection_script():Void;
  /**
    
     Prints inline Emoji dection script
    
     @ignore
     @since 4.6.0
     @access private
    
  **/
  public function _print_emoji_detection_script():Void;
  /**
    
     Convert emoji characters to their equivalent HTML entity.
    
     This allows us to store emoji in a DB using the utf8 character set.
    
     @since 4.2.0
    
     @param string $content The content to encode.
     @return string The encoded content.
    
  **/
  public function wp_encode_emoji(content:String):String;
  /**
    
     Convert emoji to a static img element.
    
     @since 4.2.0
    
     @param string $text The content to encode.
     @return string The encoded content.
    
  **/
  public function wp_staticize_emoji(text:String):String;
  /**
    
     Convert emoji in emails into static images.
    
     @since 4.2.0
    
     @param array $mail The email data array.
     @return array The email data array, with emoji in the message staticized.
    
  **/
  public function wp_staticize_emoji_for_email(mail:php.NativeStructArray<Dynamic>):php.NativeArray;
  /**
    
     Returns arrays of emoji data.
    
     These arrays are automatically built from the regex in twemoji.js - if they need to be updated,
     you should update the regex there, then run the `grunt precommit:emoji` job.
    
     @since 4.9.0
     @access private
    
     @param string $type Optional. Which array type to return. Accepts 'partials' or 'entities', default 'entities'.
     @return array An array to match all emoji that WordPress recognises.
    
  **/
  public function _wp_emoji_list(type:String = 'entities'):php.NativeArray;
  /**
    
     Shorten a URL, to be used as link text.
    
     @since 1.2.0
     @since 4.4.0 Moved to wp-includes/formatting.php from wp-admin/includes/misc.php and added $length param.
    
     @param string $url    URL to shorten.
     @param int    $length Optional. Maximum length of the shortened URL. Default 35 characters.
     @return string Shortened URL.
    
  **/
  public function url_shorten(url:String, length:Int = 35):String;
  /**
    
     Sanitizes a hex color.
    
     Returns either '', a 3 or 6 digit hex color (with #), or nothing.
     For sanitizing values without a #, see sanitize_hex_color_no_hash().
    
     @since 3.4.0
    
     @param string $color
     @return string|void
    
  **/
  public function sanitize_hex_color(color:String):String;
  /**
    
     Sanitizes a hex color without a hash. Use sanitize_hex_color() when possible.
    
     Saving hex colors without a hash puts the burden of adding the hash on the
     UI, which makes it difficult to use or upgrade to other color types such as
     rgba, hsl, rgb, and html color names.
    
     Returns either '', a 3 or 6 digit hex color (without a #), or null.
    
     @since 3.4.0
    
     @param string $color
     @return string|null
    
  **/
  public function sanitize_hex_color_no_hash(color:String):String;
  /**
    
     Ensures that any hex color is properly hashed.
     Otherwise, returns value untouched.
    
     This method should only be necessary if using sanitize_hex_color_no_hash().
    
     @since 3.4.0
    
     @param string $color
     @return string
    
  **/
  public function maybe_hash_hex_color(color:String):String;
}
