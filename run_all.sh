


tmp=$(mktemp)

MODE="$1"
test -z "$MODE" && MODE=PREFIX 

find spec -name final -printf "%h\n" > $tmp

echo "find for 'final' tags:"
cat $tmp
echo "+++++++++++++++++++++ PROCESS ++++++++++++++++++++++++"
cat $tmp | xargs -I % bash run.sh % "$MODE"
rm -f $tmp

