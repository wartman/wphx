package wp.extern;

@:native("PasswordHash")
extern class PasswordHash {
  /**
    
     PHP5 constructor.
    
  **/
  public function new(iteration_count_log2:Dynamic, portable_hashes:Dynamic):Void;
  /**
    
     PHP4 constructor.
    
  **/
  @:native("PasswordHash") public function PasswordHash(iteration_count_log2:Dynamic, portable_hashes:Dynamic):Void;
}
