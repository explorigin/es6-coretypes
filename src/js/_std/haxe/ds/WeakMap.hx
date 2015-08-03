package haxe.ds;

#if js

@:coreApi
@:native("WeakMap")
extern class WeakMap<K: {}, V> implements haxe.Constraints.IMap<K, V> {
    public function new();

    public function set(key:K, value:V):Void;

    @:arrayAccess public inline function get(key:K):Null<V> return (untyped this).get(key);

    public inline function remove( key : K ) : Bool return (untyped this).delete(key);

    public inline function exists( key : K ) : Bool return (untyped this).has(key);

    // NOTE: ES6 does not support iteration over a WeakMap because it introduces non-determinism.
    public function keys() : Iterator<K> {
        throw "Not implemented for this platform";
    }

    public inline function iterator() : Iterator<V> {
        throw "Not implemented for this platform";
    }

    public function toString() : String {
        return "WeakMap()";
    }
}

#end
