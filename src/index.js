var edge = require('edge')
var toScriptEngine = edge.func({
    assemblyFile: 'ScriptEngine.dll',
    typeName: 'ScriptEngine',
    methodName: 'Execute' // This must be Func<object,Task<object>>
});

var ta = document.getElementById('ta');
ta.onkeydown = function (event) {
    if (event.defaultPrevented) {
        return;
    }
    var handled = false;
    if (event.key !== undefined) {
        if (event.key === 'Enter' && event.altKey) {
            toScriptEngine(getSelectedText(), function (error, result) { console.log(result); });
        }
    } else if (event.keyIdentifier !== undefined) {
        if (event.keyIdentifier === "Enter" && event.altKey) {
            toScriptEngine(getSelectedText(), function (error, result) { console.log(result); });        }

    } else if (event.keyCode !== undefined) {
        if (event.keyCode === 13 && event.altKey) {
            toScriptEngine(getSelectedText(), function (error, result) { console.log(result); });
        }
    }
    if (handled) {
        event.preventDefault();
    };
 };
        
function getSelectedText() {
    var ta = document.getElementById('ta');
    var selectedText;
    // IE version
    if (document.selection != undefined) {
        ta.focus();
        var sel = document.selection.createRange();
        selectedText = sel.text;
    }
    // Mozilla version
    else if (ta.selectionStart != undefined) {
        var startPos = ta.selectionStart;
        var endPos = ta.selectionEnd;
        selectedText = ta.value.substring(startPos, endPos)
    }
    return selectedText;

}
