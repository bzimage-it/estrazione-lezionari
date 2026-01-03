


tmp=$(mktemp)

MODE="$1"
test -z "$MODE" && MODE=PREFIX 

# cerca tutte le directory che sono "finali"
find spec -name final -printf "%h\n" > $tmp

# eseguil il comando run solo per ciascuna di esse, escludendo quelle non finali:
echo "find for 'final' tags:"
cat $tmp
echo "+++++++++++++++++++++ PROCESS ++++++++++++++++++++++++"
cat $tmp | xargs -I % bash run.sh % "$MODE"
rm -f $tmp

