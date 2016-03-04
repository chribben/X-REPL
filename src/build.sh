npm install
sudo npm install node-gyp -g
electron_version=$(npm ll -p --depth=0 electron-prebuilt | grep -o "@.*:" | sed 's/.$//; s/^.//')
cd ./node_modules/edge
HOME=~/.electron-gyp node-gyp rebuild --target=$electron_version --arch=x64 --dist-url=https://atom.io/download/atom-shell
cd ..
cd ..
cd ./ScriptEngine
dnu restore 
dnu build
dnu publish
cd ..
find . -name "*.dll" -type f -exec cp {} . \;
