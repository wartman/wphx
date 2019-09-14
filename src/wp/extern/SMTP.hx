package wp.extern;

@:native("SMTP")
extern class SMTP {
  /**
    
     The PHPMailer SMTP Version number.
     @var string
     @deprecated Use the `VERSION` constant instead
     @see SMTP::VERSION
    
  **/
  @:native("Version") public var Version:String;
  /**
    
     SMTP server port number.
     @var integer
     @deprecated This is only ever used as a default value, so use the `DEFAULT_SMTP_PORT` constant instead
     @see SMTP::DEFAULT_SMTP_PORT
    
  **/
  @:native("SMTP_PORT") public var SMTPPORT:Int;
  /**
    
     SMTP reply line ending.
     @var string
     @deprecated Use the `CRLF` constant instead
     @see SMTP::CRLF
    
  **/
  @:native("CRLF") public var CRLF:String;
  /**
    
     Debug output level.
     Options:
     * self::DEBUG_OFF (`0`) No debug output, default
     * self::DEBUG_CLIENT (`1`) Client commands
     * self::DEBUG_SERVER (`2`) Client commands and server responses
     * self::DEBUG_CONNECTION (`3`) As DEBUG_SERVER plus connection status
     * self::DEBUG_LOWLEVEL (`4`) Low-level data output, all messages
     @var integer
    
  **/
  @:native("do_debug") public var doDebug:Int;
  /**
    
     How to handle debug output.
     Options:
     * `echo` Output plain-text as-is, appropriate for CLI
     * `html` Output escaped, line breaks converted to `<br>`, appropriate for browser output
     * `error_log` Output to error log as configured in php.ini
    
     Alternatively, you can provide a callable expecting two params: a message string and the debug level:
     <code>
     $smtp->Debugoutput = function($str, $level) {echo "debug level $level; message: $str";};
     </code>
     @var string|callable
    
  **/
  @:native("Debugoutput") public var Debugoutput:haxe.extern.EitherType<String, Dynamic>;
  /**
    
     Whether to use VERP.
     @link http://en.wikipedia.org/wiki/Variable_envelope_return_path
     @link http://www.postfix.org/VERP_README.html Info on VERP
     @var boolean
    
  **/
  @:native("do_verp") public var doVerp:Bool;
  /**
    
     The timeout value for connection, in seconds.
     Default of 5 minutes (300sec) is from RFC2821 section 4.5.3.2
     This needs to be quite high to function correctly with hosts using greetdelay as an anti-spam measure.
     @link http://tools.ietf.org/html/rfc2821#section-4.5.3.2
     @var integer
    
  **/
  @:native("Timeout") public var Timeout:Int;
  /**
    
     How long to wait for commands to complete, in seconds.
     Default of 5 minutes (300sec) is from RFC2821 section 4.5.3.2
     @var integer
    
  **/
  @:native("Timelimit") public var Timelimit:Int;
  /**
    
     Connect to an SMTP server.
     @param string $host SMTP server IP or host name
     @param integer $port The port number to connect to
     @param integer $timeout How long to wait for the connection to open
     @param array $options An array of options for stream_context_create()
     @access public
     @return boolean
    
  **/
  @:native("connect") public function connect(host:String, port:Int = null, timeout:Int = 30, ?options:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Initiate a TLS (encrypted) session.
     @access public
     @return boolean
    
  **/
  @:native("startTLS") public function startTLS():Bool;
  /**
    
     Perform SMTP authentication.
     Must be run after hello().
     @see hello()
     @param string $username The user name
     @param string $password The password
     @param string $authtype The auth type (PLAIN, LOGIN, CRAM-MD5)
     @param string $realm The auth realm for NTLM
     @param string $workstation The auth workstation for NTLM
     @param null|OAuth $OAuth An optional OAuth instance (@see PHPMailerOAuth)
     @return bool True if successfully authenticated.* @access public
    
  **/
  @:native("authenticate") public function authenticate(username:String, password:String, authtype:String = null, realm:String = '', workstation:String = '', OAuth:OAuth = null):Bool;
  /**
    
     Check connection state.
     @access public
     @return boolean True if connected.
    
  **/
  @:native("connected") public function connected():Bool;
  /**
    
     Close the socket and clean up the state of the class.
     Don't use this function without first trying to use QUIT.
     @see quit()
     @access public
     @return void
    
  **/
  @:native("close") public function close():Void;
  /**
    
     Send an SMTP DATA command.
     Issues a data command and sends the msg_data to the server,
     finializing the mail transaction. $msg_data is the message
     that is to be send with the headers. Each header needs to be
     on a single line followed by a <CRLF> with the message headers
     and the message body being separated by and additional <CRLF>.
     Implements rfc 821: DATA <CRLF>
     @param string $msg_data Message data to send
     @access public
     @return boolean
    
  **/
  @:native("data") public function data(msg_data:String):Bool;
  /**
    
     Send an SMTP HELO or EHLO command.
     Used to identify the sending server to the receiving server.
     This makes sure that client and server are in a known state.
     Implements RFC 821: HELO <SP> <domain> <CRLF>
     and RFC 2821 EHLO.
     @param string $host The host name or IP to connect to
     @access public
     @return boolean
    
  **/
  @:native("hello") public function hello(host:String = ''):Bool;
  /**
    
     Send an SMTP MAIL command.
     Starts a mail transaction from the email address specified in
     $from. Returns true if successful or false otherwise. If True
     the mail transaction is started and then one or more recipient
     commands may be called followed by a data command.
     Implements rfc 821: MAIL <SP> FROM:<reverse-path> <CRLF>
     @param string $from Source address of this message
     @access public
     @return boolean
    
  **/
  @:native("mail") public function mail(from:String):Bool;
  /**
    
     Send an SMTP QUIT command.
     Closes the socket if there is no error or the $close_on_error argument is true.
     Implements from rfc 821: QUIT <CRLF>
     @param boolean $close_on_error Should the connection close if an error occurs?
     @access public
     @return boolean
    
  **/
  @:native("quit") public function quit(close_on_error:Bool = true):Bool;
  /**
    
     Send an SMTP RCPT command.
     Sets the TO argument to $toaddr.
     Returns true if the recipient was accepted false if it was rejected.
     Implements from rfc 821: RCPT <SP> TO:<forward-path> <CRLF>
     @param string $address The address the message is being sent to
     @access public
     @return boolean
    
  **/
  @:native("recipient") public function recipient(address:String):Bool;
  /**
    
     Send an SMTP RSET command.
     Abort any transaction that is currently in progress.
     Implements rfc 821: RSET <CRLF>
     @access public
     @return boolean True on success.
    
  **/
  @:native("reset") public function reset():Bool;
  /**
    
     Send an SMTP SAML command.
     Starts a mail transaction from the email address specified in $from.
     Returns true if successful or false otherwise. If True
     the mail transaction is started and then one or more recipient
     commands may be called followed by a data command. This command
     will send the message to the users terminal if they are logged
     in and send them an email.
     Implements rfc 821: SAML <SP> FROM:<reverse-path> <CRLF>
     @param string $from The address the message is from
     @access public
     @return boolean
    
  **/
  @:native("sendAndMail") public function sendAndMail(from:String):Bool;
  /**
    
     Send an SMTP VRFY command.
     @param string $name The name to verify
     @access public
     @return boolean
    
  **/
  @:native("verify") public function verify(name:String):Bool;
  /**
    
     Send an SMTP NOOP command.
     Used to keep keep-alives alive, doesn't actually do anything
     @access public
     @return boolean
    
  **/
  @:native("noop") public function noop():Bool;
  /**
    
     Send an SMTP TURN command.
     This is an optional command for SMTP that this class does not support.
     This method is here to make the RFC821 Definition complete for this class
     and _may_ be implemented in future
     Implements from rfc 821: TURN <CRLF>
     @access public
     @return boolean
    
  **/
  @:native("turn") public function turn():Bool;
  /**
    
     Send raw data to the server.
     @param string $data The data to send
     @access public
     @return integer|boolean The number of bytes sent to the server or false on error
    
  **/
  @:native("client_send") public function clientSend(data:String):haxe.extern.EitherType<Int, Bool>;
  /**
    
     Get the latest error.
     @access public
     @return array
    
  **/
  @:native("getError") public function getError():php.NativeArray;
  /**
    
     Get SMTP extensions available on the server
     @access public
     @return array|null
    
  **/
  @:native("getServerExtList") public function getServerExtList():php.NativeArray;
  /**
    
     A multipurpose method
     The method works in three ways, dependent on argument value and current state
       1. HELO/EHLO was not sent - returns null and set up $this->error
       2. HELO was sent
         $name = 'HELO': returns server name
         $name = 'EHLO': returns boolean false
         $name = any string: returns null and set up $this->error
       3. EHLO was sent
         $name = 'HELO'|'EHLO': returns server name
         $name = any string: if extension $name exists, returns boolean True
           or its options. Otherwise returns boolean False
     In other words, one can use this method to detect 3 conditions:
      - null returned: handshake was not or we don't know about ext (refer to $this->error)
      - false returned: the requested feature exactly not exists
      - positive value returned: the requested feature exists
     @param string $name Name of SMTP extension or 'HELO'|'EHLO'
     @return mixed
    
  **/
  @:native("getServerExt") public function getServerExt(name:String):Dynamic;
  /**
    
     Get the last reply from the server.
     @access public
     @return string
    
  **/
  @:native("getLastReply") public function getLastReply():String;
  /**
    
     Enable or disable VERP address generation.
     @param boolean $enabled
    
  **/
  @:native("setVerp") public function setVerp(enabled:Bool = false):Void;
  /**
    
     Get VERP address generation mode.
     @return boolean
    
  **/
  @:native("getVerp") public function getVerp():Bool;
  /**
    
     Set debug output method.
     @param string|callable $method The name of the mechanism to use for debugging output, or a callable to handle it.
    
  **/
  @:native("setDebugOutput") public function setDebugOutput(method:haxe.extern.EitherType<String, Dynamic> = 'echo'):Void;
  /**
    
     Get debug output method.
     @return string
    
  **/
  @:native("getDebugOutput") public function getDebugOutput():String;
  /**
    
     Set debug output level.
     @param integer $level
    
  **/
  @:native("setDebugLevel") public function setDebugLevel(level:Int = 0):Void;
  /**
    
     Get debug output level.
     @return integer
    
  **/
  @:native("getDebugLevel") public function getDebugLevel():Int;
  /**
    
     Set SMTP timeout.
     @param integer $timeout
    
  **/
  @:native("setTimeout") public function setTimeout(timeout:Int = 0):Void;
  /**
    
     Get SMTP timeout.
     @return integer
    
  **/
  @:native("getTimeout") public function getTimeout():Int;
  /**
    
     Will return the ID of the last smtp transaction based on a list of patterns provided
     in SMTP::$smtp_transaction_id_patterns.
     If no reply has been received yet, it will return null.
     If no pattern has been matched, it will return false.
     @return bool|null|string
    
  **/
  @:native("getLastTransactionID") public function getLastTransactionID():haxe.extern.EitherType<Bool, String>;
}
