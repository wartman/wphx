package wp.extern;

@:native("WP_Role")
extern class Role {
  /**
    
     Role name.
    
     @since 2.0.0
     @var string
    
  **/
  @:native("name") public var name:String;
  /**
    
     List of capabilities the role contains.
    
     @since 2.0.0
     @var array
    
  **/
  @:native("capabilities") public var capabilities:php.NativeStructArray<Dynamic>;
  /**
    
     Constructor - Set up object properties.
    
     The list of capabilities, must have the key as the name of the capability
     and the value a boolean of whether it is granted to the role.
    
     @since 2.0.0
    
     @param string $role Role name.
     @param array $capabilities List of capabilities.
    
  **/
  public function new(role:String, capabilities:php.NativeStructArray<Dynamic>):Void;
  /**
    
     Assign role a capability.
    
     @since 2.0.0
    
     @param string $cap Capability name.
     @param bool $grant Whether role has capability privilege.
    
  **/
  @:native("add_cap") public function addCap(cap:String, grant:Bool = true):Void;
  /**
    
     Removes a capability from a role.
    
     This is a container for WP_Roles::remove_cap() to remove the
     capability from the role. That is to say, that WP_Roles::remove_cap()
     implements the functionality, but it also makes sense to use this class,
     because you don't need to enter the role name.
    
     @since 2.0.0
    
     @param string $cap Capability name.
    
  **/
  @:native("remove_cap") public function removeCap(cap:String):Void;
  /**
    
     Determines whether the role has the given capability.
    
     The capabilities is passed through the {@see 'role_has_cap'} filter.
     The first parameter for the hook is the list of capabilities the class
     has assigned. The second parameter is the capability name to look for.
     The third and final parameter for the hook is the role name.
    
     @since 2.0.0
    
     @param string $cap Capability name.
     @return bool True if the role has the given capability. False otherwise.
    
  **/
  @:native("has_cap") public function hasCap(cap:String):Bool;
}
