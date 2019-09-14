package wp.parser;

typedef Info = {
  name:String,
  doc:String,
  kind:InfoKind
};

enum abstract InfoAccess(String) to String {
  var Public = 'public';
  var Private = 'private';
  var Static = 'static';
}

enum InfoKind {
  ClassInfo(methods:Array<Info>);
  ApiInfo(methods:Array<Info>);
  VarInfo(
    type:InfoType,
    ?access:Array<InfoAccess>
  );
  FuncInfo(
    args:Array<InfoArgument>,
    ret:InfoType,
    ?access:Array<InfoAccess>
  );
}

typedef InfoArgument = {
  name:String,
  isOptional:Bool,
  defaultValue:String,
  type:InfoType
}

enum InfoType {
  TypeBasic(id:String);
  TypeArray(id:String);
  TypeMixed(a:InfoType, b:InfoType);
}
