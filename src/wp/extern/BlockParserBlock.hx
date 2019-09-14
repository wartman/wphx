package wp.extern;

@:native("WP_Block_Parser_Block")
extern class BlockParserBlock {
  /**
    
     Name of block
    
     @example "core/paragraph"
    
     @since 3.8.0
     @var string
    
  **/
  @:native("blockName") public var blockName:String;
  /**
    
     Optional set of attributes from block comment delimiters
    
     @example null
     @example array( 'columns' => 3 )
    
     @since 3.8.0
     @var array|null
    
  **/
  @:native("attrs") public var attrs:php.NativeArray;
  /**
    
     List of inner blocks (of this same class)
    
     @since 3.8.0
     @var WP_Block_Parser_Block[]
    
  **/
  @:native("innerBlocks") public var innerBlocks:php.NativeIndexedArray<wp.extern.BlockParserBlock>;
  /**
    
     Resultant HTML from inside block comment delimiters
     after removing inner blocks
    
     @example "...Just <!-- wp:test /--> testing..." -> "Just testing..."
    
     @since 3.8.0
     @var string
    
  **/
  @:native("innerHTML") public var innerHTML:String;
  /**
    
     List of string fragments and null markers where inner blocks were found
    
     @example array(
       'innerHTML'    => 'BeforeInnerAfter',
       'innerBlocks'  => array( block, block ),
       'innerContent' => array( 'Before', null, 'Inner', null, 'After' ),
     )
    
     @since 4.2.0
     @var array
    
  **/
  @:native("innerContent") public var innerContent:php.NativeStructArray<Dynamic>;
  /**
    
     Constructor.
    
     Will populate object properties from the provided arguments.
    
     @since 3.8.0
    
     @param string $name         Name of block.
     @param array  $attrs        Optional set of attributes from block comment delimiters.
     @param array  $innerBlocks  List of inner blocks (of this same class).
     @param string $innerHTML    Resultant HTML from inside block comment delimiters after removing inner blocks.
     @param array  $innerContent List of string fragments and null markers where inner blocks were found.
    
  **/
  public function new(name:String, attrs:php.NativeStructArray<Dynamic>, innerBlocks:php.NativeStructArray<Dynamic>, innerHTML:String, innerContent:php.NativeStructArray<Dynamic>):Void;
}
