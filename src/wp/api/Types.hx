package wp.api;

import haxe.extern.EitherType;
import wp.WpError;
import wp.Post;

typedef PostOrId = EitherType<Post, Int>;
typedef StringOrInt = EitherType<String, Int>;
typedef StringOrBool = EitherType<String, Bool>;
typedef MaybeError<T> = EitherType<T, WpError>;
