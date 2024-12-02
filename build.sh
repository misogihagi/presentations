entries=`find * -maxdepth 0 -type d`
for directory in $entries; do
    cd $directory
    pnpm install
    npx slidev build --base /presentaions/$directory
    cd ..
done
