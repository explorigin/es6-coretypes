#if macro

import haxe.macro.Compiler;
import haxe.macro.Context;
import sys.FileSystem;

class JSApplicator {
    public static function apply() {
        if (Context.defined('js')) {
            for (cp in Context.getClassPath()) {
                var path = FileSystem.absolutePath(cp);
                var index = path.indexOf('es6-coretypes');
                if (index != -1) {
                    Compiler.addClassPath(path.substr(0, index) + 'es6-coretypes/src');
                    break;
                }
            }
        }
    }
}

#end
