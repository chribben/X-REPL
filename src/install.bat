call npm install
call .\node_modules\.bin\electron-rebuild.cmd
cd .\ScriptEngine\
call dnu restore
call dnu build
call dnu publish
cd ..
FOR /r %%x IN (*.dll) DO copy %%x . /Y
