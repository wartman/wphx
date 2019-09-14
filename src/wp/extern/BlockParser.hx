package wp.extern;

@:native("WP_Block_Parser")
extern class BlockParser {
  /**
    
     Input document being parsed
    
     @example "Pre-text\n<!-- wp:paragraph -->This is inside a block!<!-- /wp:paragraph -->"
    
     @since 3.8.0
     @var string
    
  **/
  @:native("document") public var document:String;
  /**
    
     Tracks parsing progress through document
    
     @since 3.8.0
     @var int
    
  **/
  @:native("offset") public var offset:Int;
  /**
    
     List of parsed blocks
    
     @since 3.8.0
     @var WP_Block_Parser_Block[]
    
  **/
  @:native("output") public var output:php.NativeIndexedArray<wp.extern.BlockParserBlock>;
  /**
    
     Stack of partially-parsed structures in memory during parse
    
     @since 3.8.0
     @var WP_Block_Parser_Frame[]
    
  **/
  @:native("stack") public var stack:php.NativeIndexedArray<wp.extern.BlockParserFrame>;
  /**
    
     Empty associative array, here due to PHP quirks
    
     @since 4.4.0
     @var array empty associative array
    
  **/
  @:native("empty_attrs") public var emptyAttrs:php.NativeStructArray<Dynamic>;
  /**
    
     Parses a document and returns a list of block structures
    
     When encountering an invalid parse will return a best-effort
     parse. In contrast to the specification parser this does not
     return an error on invalid inputs.
    
     @since 3.8.0
    
     @param string $document Input document being parsed.
     @return WP_Block_Parser_Block[]
    
  **/
  @:native("parse") public function parse(document:String):php.NativeIndexedArray<wp.extern.BlockParserBlock>;
  /**
    
     Processes the next token from the input document
     and returns whether to proceed eating more tokens
    
     This is the "next step" function that essentially
     takes a token as its input and decides what to do
     with that token before descending deeper into a
     nested block tree or continuing along the document
     or breaking out of a level of nesting.
    
     @internal
     @since 3.8.0
     @return bool
    
  **/
  @:native("proceed") public function proceed():Bool;
  /**
    
     Scans the document from where we last left off
     and finds the next valid token to parse if it exists
    
     Returns the type of the find: kind of find, block information, attributes
    
     @internal
     @since 3.8.0
     @since 4.6.1 fixed a bug in attribute parsing which caused catastrophic backtracking on invalid block comments
     @return array
    
  **/
  @:native("next_token") public function nextToken():php.NativeArray;
  /**
    
     Returns a new block object for freeform HTML
    
     @internal
     @since 3.9.0
    
     @param string $innerHTML HTML content of block.
     @return WP_Block_Parser_Block freeform block object.
    
  **/
  @:native("freeform") public function freeform(innerHTML:String):wp.extern.BlockParserBlock;
  /**
    
     Pushes a length of text from the input document
     to the output list as a freeform block.
    
     @internal
     @since 3.8.0
     @param null $length how many bytes of document text to output.
    
  **/
  @:native("add_freeform") public function addFreeform(length:Dynamic = null):Void;
  /**
    
     Given a block structure from memory pushes
     a new block to the output list.
    
     @internal
     @since 3.8.0
     @param WP_Block_Parser_Block $block        The block to add to the output.
     @param int                   $token_start  Byte offset into the document where the first token for the block starts.
     @param int                   $token_length Byte length of entire block from start of opening token to end of closing token.
     @param int|null              $last_offset  Last byte offset into document if continuing form earlier output.
    
  **/
  @:native("add_inner_block") public function addInnerBlock(block:wp.extern.BlockParserBlock, token_start:Int, token_length:Int, last_offset:Int):Void;
  /**
    
     Pushes the top block from the parsing stack to the output list.
    
     @internal
     @since 3.8.0
     @param int|null $end_offset byte offset into document for where we should stop sending text output as HTML.
    
  **/
  @:native("add_block_from_stack") public function addBlockFromStack(end_offset:Int = null):Void;
}
