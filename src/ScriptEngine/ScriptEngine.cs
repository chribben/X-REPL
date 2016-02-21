using System;
using Microsoft.CodeAnalysis.Scripting;
using Microsoft.CodeAnalysis.CSharp.Scripting;
using System.Threading.Tasks;

public class ScriptEngine
{
    private static Task<ScriptState<object>> scriptState = null;
    public async Task<object> Execute(string code)
    {
        scriptState = scriptState == null ? CSharpScript.RunAsync(code) : scriptState.Result.ContinueWithAsync(code);
        return (await scriptState).ReturnValue;
    }
}
