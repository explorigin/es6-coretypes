package haxe.ds;

#if js

import js.tools.IteratorAdapter;

@:coreApi
@:native("Map")
extern class StringMap<T> implements haxe.Constraints.IMap<String, T> {
    public function new();

    public function set(key:String, value:T):Void;

    @:arrayAccess public inline function get(key:String):Null<T> return (untyped this).get(key);

    public inline function remove( key : String ) : Bool return (untyped this).delete(key);

    public inline function exists( key : String ) : Bool return (untyped this).has(key);

    public inline function keys(): Iterator<String> {
        return new IteratorAdapter<String>((untyped this).keys());
    }

    public inline function iterator() : Iterator<T> {
        return new IteratorAdapter<T>((untyped this).values());
    }

    public inline function toString() : String {
        return "{" + [for (key in keys()) '$key => ${get(key)}'].join(', ') + "}";
    }
}

#end
