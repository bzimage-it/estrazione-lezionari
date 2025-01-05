


tmp=$(mktemp)
find -name final -printf "%h\n" > $tmp

echo "find for 'final' tags:"
cat $tmp
echo "+++++++++++++++++++++ PROCESS ++++++++++++++++++++++++"
cat $tmp | xargs -I % bash run.sh % BOTH


