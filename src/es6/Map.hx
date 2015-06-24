package es6;

@:native("Map")
extern class Map<K, V> {
    public var size(default, null):Int;

    public function new();

    public function set(key:K, value:V):V;
    public function get(key:K):V;
    public function has(key:K):Bool;
    public function delete(key:K):Bool;
    public function keys():es6.Iterator<K>;
    public function values():es6.Iterator<V>;
    public function clear():Void;
}