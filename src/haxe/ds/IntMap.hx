package haxe.ds;

#if js

import js.tools.IteratorAdapter;

@:coreApi
@:native("Map")
extern class IntMap<T> implements haxe.Constraints.IMap<Int, T> {
    public function new();

    public function set(key:Int, value:T):Void;

    @:arrayAccess public inline function get(key:Int):Null<T> return (untyped this).get(key);

    public inline function remove( key : Int ) : Bool return (untyped this).delete(key);

    public inline function exists( key : Int ) : Bool return (untyped this).has(key);

    public inline function keys(): Iterator<Int> {
        return new IteratorAdapter<Int>((untyped this).keys());
    }

    public inline function iterator() : Iterator<T> {
        return new IteratorAdapter<T>((untyped this).values());
    }

    public inline function toString() : String {
        return "{" + [for (key in keys()) '$key => ${get(key)}'].join(', ') + "}";
    }
}

#end
