package haxe.ds;

#if js

import js.tools.IteratorAdapter;

@:coreApi
@:native("Map")
extern class ObjectMap<K: {}, V> implements haxe.Constraints.IMap<K, V> {
    public function new();

    public function set(key:K, value:V):Void;

    @:arrayAccess public inline function get(key:K):Null<V> return (untyped this).get(key);

    public inline function remove( key : K ) : Bool return (untyped this).delete(key);

    public inline function exists( key : K ) : Bool return (untyped this).has(key);

    public inline function keys(): Iterator<K> {
        return new IteratorAdapter<K>((untyped this).keys());
    }

    public inline function iterator() : Iterator<V> {
        return new IteratorAdapter<V>((untyped this).values());
    }

    public inline function toString() : String {
        return "{" + [for (key in keys()) '$key => ${get(key)}'].join(', ') + "}";
    }
}

#end
