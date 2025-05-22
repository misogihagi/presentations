entries=`find * -maxdepth 0 -type d`
for directory in $entries; do
    cd $directory
    pnpm install
    pnpm build --base /presentations/$directory
    cd ..
done
