import haxe.ds.StringMap;
import haxe.ds.IntMap;
import haxe.ds.ObjectMap;
import haxe.ds.EnumValueMap;
import haxe.Constraints.IMap;

#if js
import js.tools.IteratorAdapter;

@:native("Map")
@:multiType(K)
extern class Map<K, V> implements IMap<K, V> {
    public var size(default, null):Int;

    public function new();

    public function set(key:K, value:V):Void;
    public function clear():Void;

    @:arrayAccess public inline function get(key:K):V return (untyped this).get(key);

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

    @:arrayAccess @:noCompletion public inline function arrayWrite(k:K, v:V):V {
        set(k, v);
        return v;
    }

    @:to static inline function toStringMap<K:String,V>(t:IMap<K,V>):StringMap<V> {
        return new StringMap<V>();
    }

    @:to static inline function toIntMap<K:Int,V>(t:IMap<K,V>):IntMap<V> {
        return new IntMap<V>();
    }

    @:to static inline function toEnumValueMapMap<K:EnumValue,V>(t:IMap<K,V>):EnumValueMap<K,V> {
        return new EnumValueMap<K, V>();
    }

    @:to static inline function toObjectMap<K:{ },V>(t:IMap<K,V>):ObjectMap<K,V> {
        return new ObjectMap<K, V>();
    }

    @:from static inline function fromStringMap<V>(map:StringMap<V>):Map< String, V > {
        return cast map;
    }

    @:from static inline function fromIntMap<V>(map:IntMap<V>):Map< Int, V > {
        return cast map;
    }

    @:from static inline function fromObjectMap<K:{ }, V>(map:ObjectMap<K,V>):Map<K,V> {
        return cast map;
    }
}

#end