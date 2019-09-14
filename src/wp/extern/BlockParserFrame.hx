package wp.extern;

@:native("WP_Block_Parser_Frame")
extern class BlockParserFrame {
  /**
    
     Full or partial block
    
     @since 3.8.0
     @var WP_Block_Parser_Block
    
  **/
  @:native("block") public var block:wp.extern.BlockParserBlock;
  /**
    
     Byte offset into document for start of parse token
    
     @since 3.8.0
     @var int
    
  **/
  @:native("token_start") public var tokenStart:Int;
  /**
    
     Byte length of entire parse token string
    
     @since 3.8.0
     @var int
    
  **/
  @:native("token_length") public var tokenLength:Int;
  /**
    
     Byte offset into document for after parse token ends
     (used during reconstruction of stack into parse production)
    
     @since 3.8.0
     @var int
    
  **/
  @:native("prev_offset") public var prevOffset:Int;
  /**
    
     Byte offset into document where leading HTML before token starts
    
     @since 3.8.0
     @var int
    
  **/
  @:native("leading_html_start") public var leadingHtmlStart:Int;
  /**
    
     Constructor
    
     Will populate object properties from the provided arguments.
    
     @since 3.8.0
    
     @param WP_Block_Parser_Block $block              Full or partial block.
     @param int                   $token_start        Byte offset into document for start of parse token.
     @param int                   $token_length       Byte length of entire parse token string.
     @param int                   $prev_offset        Byte offset into document for after parse token ends.
     @param int                   $leading_html_start Byte offset into document where leading HTML before token starts.
    
  **/
  public function new(block:wp.extern.BlockParserBlock, token_start:Int, token_length:Int, prev_offset:Int = null, leading_html_start:Int = null):Void;
}
