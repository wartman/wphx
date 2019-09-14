package wp.extern;

@:native("PHPMailer")
extern class PHPMailer {
  /**
    
     The PHPMailer Version number.
     @var string
    
  **/
  @:native("Version") public var Version:String;
  /**
    
     Email priority.
     Options: null (default), 1 = High, 3 = Normal, 5 = low.
     When null, the header is not set at all.
     @var integer
    
  **/
  @:native("Priority") public var Priority:Int;
  /**
    
     The character set of the message.
     @var string
    
  **/
  @:native("CharSet") public var CharSet:String;
  /**
    
     The MIME Content-type of the message.
     @var string
    
  **/
  @:native("ContentType") public var ContentType:String;
  /**
    
     The message encoding.
     Options: "8bit", "7bit", "binary", "base64", and "quoted-printable".
     @var string
    
  **/
  @:native("Encoding") public var Encoding:String;
  /**
    
     Holds the most recent mailer error message.
     @var string
    
  **/
  @:native("ErrorInfo") public var ErrorInfo:String;
  /**
    
     The From email address for the message.
     @var string
    
  **/
  @:native("From") public var From:String;
  /**
    
     The From name of the message.
     @var string
    
  **/
  @:native("FromName") public var FromName:String;
  /**
    
     The Sender email (Return-Path) of the message.
     If not empty, will be sent via -f to sendmail or as 'MAIL FROM' in smtp mode.
     @var string
    
  **/
  @:native("Sender") public var Sender:String;
  /**
    
     The Return-Path of the message.
     If empty, it will be set to either From or Sender.
     @var string
     @deprecated Email senders should never set a return-path header;
     it's the receiver's job (RFC5321 section 4.4), so this no longer does anything.
     @link https://tools.ietf.org/html/rfc5321#section-4.4 RFC5321 reference
    
  **/
  @:native("ReturnPath") public var ReturnPath:String;
  /**
    
     The Subject of the message.
     @var string
    
  **/
  @:native("Subject") public var Subject:String;
  /**
    
     An HTML or plain text message body.
     If HTML then call isHTML(true).
     @var string
    
  **/
  @:native("Body") public var Body:String;
  /**
    
     The plain-text message body.
     This body can be read by mail clients that do not have HTML email
     capability such as mutt & Eudora.
     Clients that can read HTML will view the normal Body.
     @var string
    
  **/
  @:native("AltBody") public var AltBody:String;
  /**
    
     An iCal message part body.
     Only supported in simple alt or alt_inline message types
     To generate iCal events, use the bundled extras/EasyPeasyICS.php class or iCalcreator
     @link http://sprain.ch/blog/downloads/php-class-easypeasyics-create-ical-files-with-php/
     @link http://kigkonsult.se/iCalcreator/
     @var string
    
  **/
  @:native("Ical") public var Ical:String;
  /**
    
     Word-wrap the message body to this number of chars.
     Set to 0 to not wrap. A useful value here is 78, for RFC2822 section 2.1.1 compliance.
     @var integer
    
  **/
  @:native("WordWrap") public var WordWrap:Int;
  /**
    
     Which method to use to send mail.
     Options: "mail", "sendmail", or "smtp".
     @var string
    
  **/
  @:native("Mailer") public var Mailer:String;
  /**
    
     The path to the sendmail program.
     @var string
    
  **/
  @:native("Sendmail") public var Sendmail:String;
  /**
    
     Whether mail() uses a fully sendmail-compatible MTA.
     One which supports sendmail's "-oi -f" options.
     @var boolean
    
  **/
  @:native("UseSendmailOptions") public var UseSendmailOptions:Bool;
  /**
    
     Path to PHPMailer plugins.
     Useful if the SMTP class is not in the PHP include path.
     @var string
     @deprecated Should not be needed now there is an autoloader.
    
  **/
  @:native("PluginDir") public var PluginDir:String;
  /**
    
     The email address that a reading confirmation should be sent to, also known as read receipt.
     @var string
    
  **/
  @:native("ConfirmReadingTo") public var ConfirmReadingTo:String;
  /**
    
     The hostname to use in the Message-ID header and as default HELO string.
     If empty, PHPMailer attempts to find one with, in order,
     $_SERVER['SERVER_NAME'], gethostname(), php_uname('n'), or the value
     'localhost.localdomain'.
     @var string
    
  **/
  @:native("Hostname") public var Hostname:String;
  /**
    
     An ID to be used in the Message-ID header.
     If empty, a unique id will be generated.
     You can set your own, but it must be in the format "<id@domain>",
     as defined in RFC5322 section 3.6.4 or it will be ignored.
     @see https://tools.ietf.org/html/rfc5322#section-3.6.4
     @var string
    
  **/
  @:native("MessageID") public var MessageID:String;
  /**
    
     The message Date to be used in the Date header.
     If empty, the current date will be added.
     @var string
    
  **/
  @:native("MessageDate") public var MessageDate:String;
  /**
    
     SMTP hosts.
     Either a single hostname or multiple semicolon-delimited hostnames.
     You can also specify a different port
     for each host by using this format: [hostname:port]
     (e.g. "smtp1.example.com:25;smtp2.example.com").
     You can also specify encryption type, for example:
     (e.g. "tls://smtp1.example.com:587;ssl://smtp2.example.com:465").
     Hosts will be tried in order.
     @var string
    
  **/
  @:native("Host") public var Host:String;
  /**
    
     The default SMTP server port.
     @var integer
     @TODO Why is this needed when the SMTP class takes care of it?
    
  **/
  @:native("Port") public var Port:Int;
  /**
    
     The SMTP HELO of the message.
     Default is $Hostname. If $Hostname is empty, PHPMailer attempts to find
     one with the same method described above for $Hostname.
     @var string
     @see PHPMailer::$Hostname
    
  **/
  @:native("Helo") public var Helo:String;
  /**
    
     What kind of encryption to use on the SMTP connection.
     Options: '', 'ssl' or 'tls'
     @var string
    
  **/
  @:native("SMTPSecure") public var SMTPSecure:String;
  /**
    
     Whether to enable TLS encryption automatically if a server supports it,
     even if `SMTPSecure` is not set to 'tls'.
     Be aware that in PHP >= 5.6 this requires that the server's certificates are valid.
     @var boolean
    
  **/
  @:native("SMTPAutoTLS") public var SMTPAutoTLS:Bool;
  /**
    
     Whether to use SMTP authentication.
     Uses the Username and Password properties.
     @var boolean
     @see PHPMailer::$Username
     @see PHPMailer::$Password
    
  **/
  @:native("SMTPAuth") public var SMTPAuth:Bool;
  /**
    
     Options array passed to stream_context_create when connecting via SMTP.
     @var array
    
  **/
  @:native("SMTPOptions") public var SMTPOptions:php.NativeStructArray<Dynamic>;
  /**
    
     SMTP username.
     @var string
    
  **/
  @:native("Username") public var Username:String;
  /**
    
     SMTP password.
     @var string
    
  **/
  @:native("Password") public var Password:String;
  /**
    
     SMTP auth type.
     Options are CRAM-MD5, LOGIN, PLAIN, attempted in that order if not specified
     @var string
    
  **/
  @:native("AuthType") public var AuthType:String;
  /**
    
     SMTP realm.
     Used for NTLM auth
     @var string
    
  **/
  @:native("Realm") public var Realm:String;
  /**
    
     SMTP workstation.
     Used for NTLM auth
     @var string
    
  **/
  @:native("Workstation") public var Workstation:String;
  /**
    
     The SMTP server timeout in seconds.
     Default of 5 minutes (300sec) is from RFC2821 section 4.5.3.2
     @var integer
    
  **/
  @:native("Timeout") public var Timeout:Int;
  /**
    
     SMTP class debug output mode.
     Debug output level.
     Options:
     * `0` No output
     * `1` Commands
     * `2` Data and commands
     * `3` As 2 plus connection status
     * `4` Low-level data output
     @var integer
     @see SMTP::$do_debug
    
  **/
  @:native("SMTPDebug") public var SMTPDebug:Int;
  /**
    
     How to handle debug output.
     Options:
     * `echo` Output plain-text as-is, appropriate for CLI
     * `html` Output escaped, line breaks converted to `<br>`, appropriate for browser output
     * `error_log` Output to error log as configured in php.ini
    
     Alternatively, you can provide a callable expecting two params: a message string and the debug level:
     <code>
     $mail->Debugoutput = function($str, $level) {echo "debug level $level; message: $str";};
     </code>
     @var string|callable
     @see SMTP::$Debugoutput
    
  **/
  @:native("Debugoutput") public var Debugoutput:haxe.extern.EitherType<String, Dynamic>;
  /**
    
     Whether to keep SMTP connection open after each message.
     If this is set to true then to close the connection
     requires an explicit call to smtpClose().
     @var boolean
    
  **/
  @:native("SMTPKeepAlive") public var SMTPKeepAlive:Bool;
  /**
    
     Whether to split multiple to addresses into multiple messages
     or send them all in one message.
     Only supported in `mail` and `sendmail` transports, not in SMTP.
     @var boolean
    
  **/
  @:native("SingleTo") public var SingleTo:Bool;
  /**
    
     Storage for addresses when SingleTo is enabled.
     @var array
     @TODO This should really not be public
    
  **/
  @:native("SingleToArray") public var SingleToArray:php.NativeStructArray<Dynamic>;
  /**
    
     Whether to generate VERP addresses on send.
     Only applicable when sending via SMTP.
     @link https://en.wikipedia.org/wiki/Variable_envelope_return_path
     @link http://www.postfix.org/VERP_README.html Postfix VERP info
     @var boolean
    
  **/
  @:native("do_verp") public var doVerp:Bool;
  /**
    
     Whether to allow sending messages with an empty body.
     @var boolean
    
  **/
  @:native("AllowEmpty") public var AllowEmpty:Bool;
  /**
    
     The default line ending.
     @note The default remains "\n". We force CRLF where we know
            it must be used via self::CRLF.
     @var string
    
  **/
  @:native("LE") public var LE:String;
  /**
    
     DKIM selector.
     @var string
    
  **/
  @:native("DKIM_selector") public var DKIMSelector:String;
  /**
    
     DKIM Identity.
     Usually the email address used as the source of the email.
     @var string
    
  **/
  @:native("DKIM_identity") public var DKIMIdentity:String;
  /**
    
     DKIM passphrase.
     Used if your key is encrypted.
     @var string
    
  **/
  @:native("DKIM_passphrase") public var DKIMPassphrase:String;
  /**
    
     DKIM signing domain name.
     @example 'example.com'
     @var string
    
  **/
  @:native("DKIM_domain") public var DKIMDomain:String;
  /**
    
     DKIM private key file path.
     @var string
    
  **/
  @:native("DKIM_private") public var DKIMPrivate:String;
  /**
    
     DKIM private key string.
     If set, takes precedence over `$DKIM_private`.
     @var string
    
  **/
  @:native("DKIM_private_string") public var DKIMPrivateString:String;
  /**
    
     Callback Action function name.
    
     The function that handles the result of the send email action.
     It is called out by send() for each email sent.
    
     Value can be any php callable: http://www.php.net/is_callable
    
     Parameters:
       boolean $result        result of the send action
       string  $to            email address of the recipient
       string  $cc            cc email addresses
       string  $bcc           bcc email addresses
       string  $subject       the subject
       string  $body          the email body
       string  $from          email address of sender
     @var string
    
  **/
  @:native("action_function") public var actionFunction:String;
  /**
    
     What to put in the X-Mailer header.
     Options: An empty string for PHPMailer default, whitespace for none, or a string to use
     @var string
    
  **/
  @:native("XMailer") public var XMailer:String;
  /**
    
     Which validator to use by default when validating email addresses.
     May be a callable to inject your own validator, but there are several built-in validators.
     @see PHPMailer::validateAddress()
     @var string|callable
     @static
    
  **/
  @:native("validator") public static var validator:haxe.extern.EitherType<String, Dynamic>;
  /**
    
     Constructor.
     @param boolean $exceptions Should we throw external exceptions?
    
  **/
  public function new(exceptions:Bool = null):Void;
  /**
    
     Destructor.
    
  **/
  @:native("__destruct") public function __destruct():Void;
  /**
    
     Sets message type to HTML or plain.
     @param boolean $isHtml True for HTML mode.
     @return void
    
  **/
  @:native("isHTML") public function isHTML(isHtml:Bool = true):Void;
  /**
    
     Send messages using SMTP.
     @return void
    
  **/
  @:native("isSMTP") public function isSMTP():Void;
  /**
    
     Send messages using PHP's mail() function.
     @return void
    
  **/
  @:native("isMail") public function isMail():Void;
  /**
    
     Send messages using $Sendmail.
     @return void
    
  **/
  @:native("isSendmail") public function isSendmail():Void;
  /**
    
     Send messages using qmail.
     @return void
    
  **/
  @:native("isQmail") public function isQmail():Void;
  /**
    
     Add a "To" address.
     @param string $address The email address to send to
     @param string $name
     @return boolean true on success, false if address already used or invalid in some way
    
  **/
  @:native("addAddress") public function addAddress(address:String, name:String = ''):Bool;
  /**
    
     Add a "CC" address.
     @note: This function works with the SMTP mailer on win32, not with the "mail" mailer.
     @param string $address The email address to send to
     @param string $name
     @return boolean true on success, false if address already used or invalid in some way
    
  **/
  @:native("addCC") public function addCC(address:String, name:String = ''):Bool;
  /**
    
     Add a "BCC" address.
     @note: This function works with the SMTP mailer on win32, not with the "mail" mailer.
     @param string $address The email address to send to
     @param string $name
     @return boolean true on success, false if address already used or invalid in some way
    
  **/
  @:native("addBCC") public function addBCC(address:String, name:String = ''):Bool;
  /**
    
     Add a "Reply-To" address.
     @param string $address The email address to reply to
     @param string $name
     @return boolean true on success, false if address already used or invalid in some way
    
  **/
  @:native("addReplyTo") public function addReplyTo(address:String, name:String = ''):Bool;
  /**
    
     Parse and validate a string containing one or more RFC822-style comma-separated email addresses
     of the form "display name <address>" into an array of name/address pairs.
     Uses the imap_rfc822_parse_adrlist function if the IMAP extension is available.
     Note that quotes in the name part are removed.
     @param string $addrstr The address list string
     @param bool $useimap Whether to use the IMAP extension to parse the list
     @return array
     @link http://www.andrew.cmu.edu/user/agreen1/testing/mrbs/web/Mail/RFC822.php A more careful implementation
    
  **/
  @:native("parseAddresses") public function parseAddresses(addrstr:String, useimap:Bool = true):php.NativeArray;
  /**
    
     Set the From and FromName properties.
     @param string $address
     @param string $name
     @param boolean $auto Whether to also set the Sender address, defaults to true
     @throws phpmailerException
     @return boolean
    
  **/
  @:native("setFrom") public function setFrom(address:String, name:String = '', auto:Bool = true):Bool;
  /**
    
     Return the Message-ID header of the last email.
     Technically this is the value from the last time the headers were created,
     but it's also the message ID of the last sent message except in
     pathological cases.
     @return string
    
  **/
  @:native("getLastMessageID") public function getLastMessageID():String;
  /**
    
     Check that a string looks like an email address.
     @param string $address The email address to check
     @param string|callable $patternselect A selector for the validation pattern to use :
     * `auto` Pick best pattern automatically;
     * `pcre8` Use the squiloople.com pattern, requires PCRE > 8.0, PHP >= 5.3.2, 5.2.14;
     * `pcre` Use old PCRE implementation;
     * `php` Use PHP built-in FILTER_VALIDATE_EMAIL;
     * `html5` Use the pattern given by the HTML5 spec for 'email' type form input elements.
     * `noregex` Don't use a regex: super fast, really dumb.
     Alternatively you may pass in a callable to inject your own validator, for example:
     PHPMailer::validateAddress('user@example.com', function($address) {
         return (strpos($address, '@') !== false);
     });
     You can also set the PHPMailer::$validator static to a callable, allowing built-in methods to use your validator.
     @return boolean
     @static
     @access public
    
  **/
  @:native("validateAddress") public static function validateAddress(address:String, patternselect:haxe.extern.EitherType<String, Dynamic> = null):Bool;
  /**
    
     Tells whether IDNs (Internationalized Domain Names) are supported or not. This requires the
     "intl" and "mbstring" PHP extensions.
     @return bool "true" if required functions for IDN support are present
    
  **/
  @:native("idnSupported") public function idnSupported():Bool;
  /**
    
     Converts IDN in given email address to its ASCII form, also known as punycode, if possible.
     Important: Address must be passed in same encoding as currently set in PHPMailer::$CharSet.
     This function silently returns unmodified address if:
     - No conversion is necessary (i.e. domain name is not an IDN, or is already in ASCII form)
     - Conversion to punycode is impossible (e.g. required PHP functions are not available)
       or fails for any reason (e.g. domain has characters not allowed in an IDN)
     @see PHPMailer::$CharSet
     @param string $address The email address to convert
     @return string The encoded address in ASCII form
    
  **/
  @:native("punyencodeAddress") public function punyencodeAddress(address:String):String;
  /**
    
     Create a message and send it.
     Uses the sending method specified by $Mailer.
     @throws phpmailerException
     @return boolean false on error - See the ErrorInfo property for details of the error.
    
  **/
  @:native("send") public function send():Bool;
  /**
    
     Prepare a message for sending.
     @throws phpmailerException
     @return boolean
    
  **/
  @:native("preSend") public function preSend():Bool;
  /**
    
     Actually send a message.
     Send the email via the selected mechanism
     @throws phpmailerException
     @return boolean
    
  **/
  @:native("postSend") public function postSend():Bool;
  /**
    
     Get an instance to use for SMTP operations.
     Override this function to load your own SMTP implementation
     @return SMTP
    
  **/
  @:native("getSMTPInstance") public function getSMTPInstance():SMTP;
  /**
    
     Initiate a connection to an SMTP server.
     Returns false if the operation failed.
     @param array $options An array of options compatible with stream_context_create()
     @uses SMTP
     @access public
     @throws phpmailerException
     @return boolean
    
  **/
  @:native("smtpConnect") public function smtpConnect(options:php.NativeStructArray<Dynamic> = null):Bool;
  /**
    
     Close the active SMTP session if one exists.
     @return void
    
  **/
  @:native("smtpClose") public function smtpClose():Void;
  /**
    
     Set the language for error messages.
     Returns false if it cannot load the language file.
     The default language is English.
     @param string $langcode ISO 639-1 2-character language code (e.g. French is "fr")
     @param string $lang_path Path to the language file directory, with trailing separator (slash)
     @return boolean
     @access public
    
  **/
  @:native("setLanguage") public function setLanguage(langcode:String = 'en', lang_path:String = ''):Bool;
  /**
    
     Get the array of strings for the current language.
     @return array
    
  **/
  @:native("getTranslations") public function getTranslations():php.NativeArray;
  /**
    
     Create recipient headers.
     @access public
     @param string $type
     @param array $addr An array of recipient,
     where each recipient is a 2-element indexed array with element 0 containing an address
     and element 1 containing a name, like:
     array(array('joe@example.com', 'Joe User'), array('zoe@example.com', 'Zoe User'))
     @return string
    
  **/
  @:native("addrAppend") public function addrAppend(type:String, addr:php.NativeStructArray<Dynamic>):String;
  /**
    
     Format an address for use in a message header.
     @access public
     @param array $addr A 2-element indexed array, element 0 containing an address, element 1 containing a name
          like array('joe@example.com', 'Joe User')
     @return string
    
  **/
  @:native("addrFormat") public function addrFormat(addr:php.NativeStructArray<Dynamic>):String;
  /**
    
     Word-wrap message.
     For use with mailers that do not automatically perform wrapping
     and for quoted-printable encoded messages.
     Original written by philippe.
     @param string $message The message to wrap
     @param integer $length The line length to wrap to
     @param boolean $qp_mode Whether to run in Quoted-Printable mode
     @access public
     @return string
    
  **/
  @:native("wrapText") public function wrapText(message:String, length:Int, qp_mode:Bool = false):String;
  /**
    
     Find the last character boundary prior to $maxLength in a utf-8
     quoted-printable encoded string.
     Original written by Colin Brown.
     @access public
     @param string $encodedText utf-8 QP text
     @param integer $maxLength Find the last character boundary prior to this length
     @return integer
    
  **/
  @:native("utf8CharBoundary") public function utf8CharBoundary(encodedText:String, maxLength:Int):Int;
  /**
    
     Apply word wrapping to the message body.
     Wraps the message body to the number of chars set in the WordWrap property.
     You should only do this to plain-text bodies as wrapping HTML tags may break them.
     This is called automatically by createBody(), so you don't need to call it yourself.
     @access public
     @return void
    
  **/
  @:native("setWordWrap") public function setWordWrap():Void;
  /**
    
     Assemble message headers.
     @access public
     @return string The assembled headers
    
  **/
  @:native("createHeader") public function createHeader():String;
  /**
    
     Get the message MIME type headers.
     @access public
     @return string
    
  **/
  @:native("getMailMIME") public function getMailMIME():String;
  /**
    
     Returns the whole MIME message.
     Includes complete headers and body.
     Only valid post preSend().
     @see PHPMailer::preSend()
     @access public
     @return string
    
  **/
  @:native("getSentMIMEMessage") public function getSentMIMEMessage():String;
  /**
    
     Assemble the message body.
     Returns an empty string on failure.
     @access public
     @throws phpmailerException
     @return string The assembled message body
    
  **/
  @:native("createBody") public function createBody():String;
  /**
    
     Format a header line.
     @access public
     @param string $name
     @param string $value
     @return string
    
  **/
  @:native("headerLine") public function headerLine(name:String, value:String):String;
  /**
    
     Return a formatted mail line.
     @access public
     @param string $value
     @return string
    
  **/
  @:native("textLine") public function textLine(value:String):String;
  /**
    
     Add an attachment from a path on the filesystem.
     Never use a user-supplied path to a file!
     Returns false if the file could not be found or read.
     @param string $path Path to the attachment.
     @param string $name Overrides the attachment name.
     @param string $encoding File encoding (see $Encoding).
     @param string $type File extension (MIME) type.
     @param string $disposition Disposition to use
     @throws phpmailerException
     @return boolean
    
  **/
  @:native("addAttachment") public function addAttachment(path:String, name:String = '', encoding:String = 'base64', type:String = '', disposition:String = 'attachment'):Bool;
  /**
    
     Return the array of attachments.
     @return array
    
  **/
  @:native("getAttachments") public function getAttachments():php.NativeArray;
  /**
    
     Encode a string in requested format.
     Returns an empty string on failure.
     @param string $str The text to encode
     @param string $encoding The encoding to use; one of 'base64', '7bit', '8bit', 'binary', 'quoted-printable'
     @access public
     @return string
    
  **/
  @:native("encodeString") public function encodeString(str:String, encoding:String = 'base64'):String;
  /**
    
     Encode a header string optimally.
     Picks shortest of Q, B, quoted-printable or none.
     @access public
     @param string $str
     @param string $position
     @return string
    
  **/
  @:native("encodeHeader") public function encodeHeader(str:String, position:String = 'text'):String;
  /**
    
     Check if a string contains multi-byte characters.
     @access public
     @param string $str multi-byte text to wrap encode
     @return boolean
    
  **/
  @:native("hasMultiBytes") public function hasMultiBytes(str:String):Bool;
  /**
    
     Does a string contain any 8-bit chars (in any charset)?
     @param string $text
     @return boolean
    
  **/
  @:native("has8bitChars") public function has8bitChars(text:String):Bool;
  /**
    
     Encode and wrap long multibyte strings for mail headers
     without breaking lines within a character.
     Adapted from a function by paravoid
     @link http://www.php.net/manual/en/function.mb-encode-mimeheader.php#60283
     @access public
     @param string $str multi-byte text to wrap encode
     @param string $linebreak string to use as linefeed/end-of-line
     @return string
    
  **/
  @:native("base64EncodeWrapMB") public function base64EncodeWrapMB(str:String, linebreak:String = null):String;
  /**
    
     Encode a string in quoted-printable format.
     According to RFC2045 section 6.7.
     @access public
     @param string $string The text to encode
     @param integer $line_max Number of chars allowed on a line before wrapping
     @return string
     @link http://www.php.net/manual/en/function.quoted-printable-decode.php#89417 Adapted from this comment
    
  **/
  @:native("encodeQP") public function encodeQP(string:String, line_max:Int = 76):String;
  /**
    
     Backward compatibility wrapper for an old QP encoding function that was removed.
     @see PHPMailer::encodeQP()
     @access public
     @param string $string
     @param integer $line_max
     @param boolean $space_conv
     @return string
     @deprecated Use encodeQP instead.
    
  **/
  @:native("encodeQPphp") public function encodeQPphp(string:String, line_max:Int = 76, space_conv:Bool):String;
  /**
    
     Encode a string using Q encoding.
     @link http://tools.ietf.org/html/rfc2047
     @param string $str the text to encode
     @param string $position Where the text is going to be used, see the RFC for what that means
     @access public
     @return string
    
  **/
  @:native("encodeQ") public function encodeQ(str:String, position:String = 'text'):String;
  /**
    
     Add a string or binary attachment (non-filesystem).
     This method can be used to attach ascii or binary data,
     such as a BLOB record from a database.
     @param string $string String attachment data.
     @param string $filename Name of the attachment.
     @param string $encoding File encoding (see $Encoding).
     @param string $type File extension (MIME) type.
     @param string $disposition Disposition to use
     @return void
    
  **/
  @:native("addStringAttachment") public function addStringAttachment(string:String, filename:String, encoding:String = 'base64', type:String = '', disposition:String = 'attachment'):Void;
  /**
    
     Add an embedded (inline) attachment from a file.
     This can include images, sounds, and just about any other document type.
     These differ from 'regular' attachments in that they are intended to be
     displayed inline with the message, not just attached for download.
     This is used in HTML messages that embed the images
     the HTML refers to using the $cid value.
     Never use a user-supplied path to a file!
     @param string $path Path to the attachment.
     @param string $cid Content ID of the attachment; Use this to reference
            the content when using an embedded image in HTML.
     @param string $name Overrides the attachment name.
     @param string $encoding File encoding (see $Encoding).
     @param string $type File MIME type.
     @param string $disposition Disposition to use
     @return boolean True on successfully adding an attachment
    
  **/
  @:native("addEmbeddedImage") public function addEmbeddedImage(path:String, cid:String, name:String = '', encoding:String = 'base64', type:String = '', disposition:String = 'inline'):Bool;
  /**
    
     Add an embedded stringified attachment.
     This can include images, sounds, and just about any other document type.
     Be sure to set the $type to an image type for images:
     JPEG images use 'image/jpeg', GIF uses 'image/gif', PNG uses 'image/png'.
     @param string $string The attachment binary data.
     @param string $cid Content ID of the attachment; Use this to reference
            the content when using an embedded image in HTML.
     @param string $name
     @param string $encoding File encoding (see $Encoding).
     @param string $type MIME type.
     @param string $disposition Disposition to use
     @return boolean True on successfully adding an attachment
    
  **/
  @:native("addStringEmbeddedImage") public function addStringEmbeddedImage(string:String, cid:String, name:String = '', encoding:String = 'base64', type:String = '', disposition:String = 'inline'):Bool;
  /**
    
     Check if an inline attachment is present.
     @access public
     @return boolean
    
  **/
  @:native("inlineImageExists") public function inlineImageExists():Bool;
  /**
    
     Check if an attachment (non-inline) is present.
     @return boolean
    
  **/
  @:native("attachmentExists") public function attachmentExists():Bool;
  /**
    
     Check if this message has an alternative body set.
     @return boolean
    
  **/
  @:native("alternativeExists") public function alternativeExists():Bool;
  /**
    
     Clear queued addresses of given kind.
     @access protected
     @param string $kind 'to', 'cc', or 'bcc'
     @return void
    
  **/
  @:native("clearQueuedAddresses") public function clearQueuedAddresses(kind:String):Void;
  /**
    
     Clear all To recipients.
     @return void
    
  **/
  @:native("clearAddresses") public function clearAddresses():Void;
  /**
    
     Clear all CC recipients.
     @return void
    
  **/
  @:native("clearCCs") public function clearCCs():Void;
  /**
    
     Clear all BCC recipients.
     @return void
    
  **/
  @:native("clearBCCs") public function clearBCCs():Void;
  /**
    
     Clear all ReplyTo recipients.
     @return void
    
  **/
  @:native("clearReplyTos") public function clearReplyTos():Void;
  /**
    
     Clear all recipient types.
     @return void
    
  **/
  @:native("clearAllRecipients") public function clearAllRecipients():Void;
  /**
    
     Clear all filesystem, string, and binary attachments.
     @return void
    
  **/
  @:native("clearAttachments") public function clearAttachments():Void;
  /**
    
     Clear all custom headers.
     @return void
    
  **/
  @:native("clearCustomHeaders") public function clearCustomHeaders():Void;
  /**
    
     Return an RFC 822 formatted date.
     @access public
     @return string
     @static
    
  **/
  @:native("rfcDate") public static function rfcDate():String;
  /**
    
     Check if an error occurred.
     @access public
     @return boolean True if an error did occur.
    
  **/
  @:native("isError") public function isError():Bool;
  /**
    
     Ensure consistent line endings in a string.
     Changes every end of line from CRLF, CR or LF to $this->LE.
     @access public
     @param string $str String to fixEOL
     @return string
    
  **/
  @:native("fixEOL") public function fixEOL(str:String):String;
  /**
    
     Add a custom header.
     $name value can be overloaded to contain
     both header name and value (name:value)
     @access public
     @param string $name Custom header name
     @param string $value Header value
     @return void
    
  **/
  @:native("addCustomHeader") public function addCustomHeader(name:String, value:String = null):Void;
  /**
    
     Returns all custom headers.
     @return array
    
  **/
  @:native("getCustomHeaders") public function getCustomHeaders():php.NativeArray;
  /**
    
     Create a message body from an HTML string.
     Automatically inlines images and creates a plain-text version by converting the HTML,
     overwriting any existing values in Body and AltBody.
     Do not source $message content from user input!
     $basedir is prepended when handling relative URLs, e.g. <img src="/images/a.png"> and must not be empty
     will look for an image file in $basedir/images/a.png and convert it to inline.
     If you don't provide a $basedir, relative paths will be left untouched (and thus probably break in email)
     If you don't want to apply these transformations to your HTML, just set Body and AltBody directly.
     @access public
     @param string $message HTML message string
     @param string $basedir Absolute path to a base directory to prepend to relative paths to images
     @param boolean|callable $advanced Whether to use the internal HTML to text converter
        or your own custom converter @see PHPMailer::html2text()
     @return string $message The transformed message Body
    
  **/
  @:native("msgHTML") public function msgHTML(message:String, basedir:String = '', advanced:haxe.extern.EitherType<Bool, Dynamic> = false):String;
  /**
    
     Convert an HTML string into plain text.
     This is used by msgHTML().
     Note - older versions of this function used a bundled advanced converter
     which was been removed for license reasons in #232.
     Example usage:
     <code>
     // Use default conversion
     $plain = $mail->html2text($html);
     // Use your own custom converter
     $plain = $mail->html2text($html, function($html) {
         $converter = new MyHtml2text($html);
         return $converter->get_text();
     });
     </code>
     @param string $html The HTML text to convert
     @param boolean|callable $advanced Any boolean value to use the internal converter,
       or provide your own callable for custom conversion.
     @return string
    
  **/
  @:native("html2text") public function html2text(html:String, advanced:haxe.extern.EitherType<Bool, Dynamic> = false):String;
  /**
    
     Get the MIME type for a file extension.
     @param string $ext File extension
     @access public
     @return string MIME type of file.
     @static
    
  **/
  @:native("_mime_types") public static function _mimeTypes(ext:String = ''):String;
  /**
    
     Map a file name to a MIME type.
     Defaults to 'application/octet-stream', i.e.. arbitrary binary data.
     @param string $filename A file name or full path, does not need to exist as a file
     @return string
     @static
    
  **/
  @:native("filenameToType") public static function filenameToType(filename:String):String;
  /**
    
     Multi-byte-safe pathinfo replacement.
     Drop-in replacement for pathinfo(), but multibyte-safe, cross-platform-safe, old-version-safe.
     Works similarly to the one in PHP >= 5.2.0
     @link http://www.php.net/manual/en/function.pathinfo.php#107461
     @param string $path A filename or path, does not need to exist as a file
     @param integer|string $options Either a PATHINFO_* constant,
          or a string name to return only the specified piece, allows 'filename' to work on PHP < 5.2
     @return string|array
     @static
    
  **/
  @:native("mb_pathinfo") public static function mbPathinfo(path:String, options:haxe.extern.EitherType<Int, String> = null):haxe.extern.EitherType<String, php.NativeStructArray<Dynamic>>;
  /**
    
     Set or reset instance properties.
     You should avoid this function - it's more verbose, less efficient, more error-prone and
     harder to debug than setting properties directly.
     Usage Example:
     `$mail->set('SMTPSecure', 'tls');`
       is the same as:
     `$mail->SMTPSecure = 'tls';`
     @access public
     @param string $name The property name to set
     @param mixed $value The value to set the property to
     @return boolean
     @TODO Should this not be using the __set() magic function?
    
  **/
  @:native("set") public function set(name:String, value:Dynamic = ''):Bool;
  /**
    
     Strip newlines to prevent header injection.
     @access public
     @param string $str
     @return string
    
  **/
  @:native("secureHeader") public function secureHeader(str:String):String;
  /**
    
     Normalize line breaks in a string.
     Converts UNIX LF, Mac CR and Windows CRLF line breaks into a single line break format.
     Defaults to CRLF (for message bodies) and preserves consecutive breaks.
     @param string $text
     @param string $breaktype What kind of line break to use, defaults to CRLF
     @return string
     @access public
     @static
    
  **/
  @:native("normalizeBreaks") public static function normalizeBreaks(text:String, breaktype:String = "\r\n"):String;
  /**
    
     Set the public and private key files and password for S/MIME signing.
     @access public
     @param string $cert_filename
     @param string $key_filename
     @param string $key_pass Password for private key
     @param string $extracerts_filename Optional path to chain certificate
    
  **/
  @:native("sign") public function sign(cert_filename:String, key_filename:String, key_pass:String, extracerts_filename:String = ''):Void;
  /**
    
     Quoted-Printable-encode a DKIM header.
     @access public
     @param string $txt
     @return string
    
  **/
  @:native("DKIM_QP") public function DKIMQP(txt:String):String;
  /**
    
     Generate a DKIM signature.
     @access public
     @param string $signHeader
     @throws phpmailerException
     @return string The DKIM signature value
    
  **/
  @:native("DKIM_Sign") public function DKIMSign(signHeader:String):String;
  /**
    
     Generate a DKIM canonicalization header.
     @access public
     @param string $signHeader Header
     @return string
    
  **/
  @:native("DKIM_HeaderC") public function DKIMHeaderC(signHeader:String):String;
  /**
    
     Generate a DKIM canonicalization body.
     @access public
     @param string $body Message Body
     @return string
    
  **/
  @:native("DKIM_BodyC") public function DKIMBodyC(body:String):String;
  /**
    
     Create the DKIM header and body in a new message header.
     @access public
     @param string $headers_line Header lines
     @param string $subject Subject
     @param string $body Body
     @return string
    
  **/
  @:native("DKIM_Add") public function DKIMAdd(headers_line:String, subject:String, body:String):String;
  /**
    
     Detect if a string contains a line longer than the maximum line length allowed.
     @param string $str
     @return boolean
     @static
    
  **/
  @:native("hasLineLongerThanMax") public static function hasLineLongerThanMax(str:String):Bool;
  /**
    
     Allows for public read access to 'to' property.
     @note: Before the send() call, queued addresses (i.e. with IDN) are not yet included.
     @access public
     @return array
    
  **/
  @:native("getToAddresses") public function getToAddresses():php.NativeArray;
  /**
    
     Allows for public read access to 'cc' property.
     @note: Before the send() call, queued addresses (i.e. with IDN) are not yet included.
     @access public
     @return array
    
  **/
  @:native("getCcAddresses") public function getCcAddresses():php.NativeArray;
  /**
    
     Allows for public read access to 'bcc' property.
     @note: Before the send() call, queued addresses (i.e. with IDN) are not yet included.
     @access public
     @return array
    
  **/
  @:native("getBccAddresses") public function getBccAddresses():php.NativeArray;
  /**
    
     Allows for public read access to 'ReplyTo' property.
     @note: Before the send() call, queued addresses (i.e. with IDN) are not yet included.
     @access public
     @return array
    
  **/
  @:native("getReplyToAddresses") public function getReplyToAddresses():php.NativeArray;
  /**
    
     Allows for public read access to 'all_recipients' property.
     @note: Before the send() call, queued addresses (i.e. with IDN) are not yet included.
     @access public
     @return array
    
  **/
  @:native("getAllRecipientAddresses") public function getAllRecipientAddresses():php.NativeArray;
}
