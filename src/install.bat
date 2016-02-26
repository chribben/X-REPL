call npm install
cd node_modules\edge-atom-shell
call node-gyp configure --msvs_version=2013
cd ..\..
call .\node_modules\.bin\electron-rebuild.cmd
cd .\ScriptEngine\
call dnu restore
call dnu build
call dnu publish
cd ..
FOR /r %%x IN (*.dll) DO copy %%x . /Y