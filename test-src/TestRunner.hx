class TestRunner {
    static function runTests() {
        #if js
        js.Browser.document.querySelector('#notice').style.display = "None";
        #end

        var r = new haxe.unit.TestRunner();

        r.add(new es6_tests.TestMap());
        #if js
        r.add(new es6_tests.TestWeakMap());
        #end
        r.run();
    }

    static function main(){
        #if js
        // Some tests require the DOM so we have to wait.
        js.Browser.document.addEventListener('DOMContentLoaded', runTests, false);
        #else
        runTests();
        #end
    }
}
