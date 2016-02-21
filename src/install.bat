npm install
node-gyp configure --msvs_version=2013
.\node_modules\.bin\electron-rebuild.cmd
dnu .\ScriptEngine\ build
dnu .\ScriptEngine\ publish
for /r %x in (*.dll) do copy "%x" . /Y