package openfl.text;

#if !flash
#if !openfljs
/**
	The TextFieldType class is an enumeration of constant values used in
	setting the `type` property of the TextField class.
**/
#if (haxe_ver >= 4.0) enum #else @:enum #end abstract TextFieldType(Null<Int>)

{
	/**
		Used to specify a `dynamic` TextField.
	**/
	public var DYNAMIC = 0;

	/**
		Used to specify an `input` TextField.

		@see [Capturing text input](https://books.openfl.org/openfl-developers-guide/using-the-textfield-class/capturing-text-input.html)
	**/
	public var INPUT = 1;

	@:from private static function fromString(value:String):TextFieldType
	{
		return switch (value)
		{
			case "dynamic": DYNAMIC;
			case "input": INPUT;
			default: null;
		}
	}

	@:to private function toString():String
	{
		return switch (cast this : TextFieldType)
		{
			case TextFieldType.DYNAMIC: "dynamic";
			case TextFieldType.INPUT: "input";
			default: null;
		}
	}
}
#else
@SuppressWarnings("checkstyle:FieldDocComment")
#if (haxe_ver >= 4.0) enum #else @:enum #end abstract TextFieldType(String) from String to String

{
	public var DYNAMIC = "dynamic";
	public var INPUT = "input";
}
#end
#else
typedef TextFieldType = flash.text.TextFieldType;
#end
