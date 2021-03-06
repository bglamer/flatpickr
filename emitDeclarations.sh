#!/bin/sh
./node_modules/typescript/bin/tsc -p tsconfig.declarations.json
os=`uname`
if [ "$os" = "Darwin" ]; then
    cp -R types/ dist
else
    cp -RT types dist
fi
cp src/typings.d.ts dist/typings.d.ts
rm -rf types

# https://github.com/Microsoft/TypeScript/issues/26439
find dist/l10n -name '*d.ts' -exec sed -i -e 's/"types/"..\/types/g' {} \;
