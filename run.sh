#!/bin/bash

PEGASO_START_SCRIPT_PWD=$(pwd)

# this is a code snipped:
# from http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
# to understand what directory it's stored in bash script itself

PEGASO_SOURCE="${BASH_SOURCE[0]}"
while [ -h "$PEGASO_SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  PEGASO_DIR="$( cd -P "$( dirname "$PEGASO_SOURCE" )" && pwd )"
  PEGASO_SOURCE="$(readlink "$PEGASO_SOURCE")"
  [[ $PEGASO_SOURCE != /* ]] && PEGASO_SOURCE="$PEGASO_DIR/$PEGASO_SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
PEGASO_SCRIPT_DIR="$( cd -P "$( dirname "$PEGASO_SOURCE" )" && pwd )"
PEGASO_SCRIPT_FILE=$(basename "$PEGASO_SOURCE")
# end of snipped

cd "$PEGASO_SCRIPT_DIR"

OUTROOT=output

set -u
abort() {
    local n="$1"
    shift
    echo "$@" 
    echo "$@" >&2
    exit "$n"
}
get_conf() {
    local var="$1"
    local dir="$2"
    source "$dir/conf" || abort 3 "not a dir: $dir"    
}
get_master_name() {
    echo $MASTER_PDF_MD5.pdf
}

md5_is_ok() {
    local file="$1"
    local md5="$2"
    local cs=
    cs="$(md5sum "$file" | cut -f 1 -d ' ')" || return 2
    if [ "$cs" == "$md5" ]; then
	echo "MD5 ok: $file , $md5"
	return 0
    else
	echo "MD5 ERROR file $file not ok | expected: '$md5' , found: '$cs'" 
	return 1
    fi    
}

download_master_pdf() {
    local base="$(basename "$MASTER_PDF_URL")"
    local wname=$MASTER_PDF_MD5.pdf
    echo "dowloading as $wname : $MASTER_PDF_URL"
    md5_is_ok $wname $MASTER_PDF_MD5
    if [ $? != 0 ]; then
	curl $MASTER_PDF_URL --output $base
	cp -av $base $wname	
	# check md5 again:
	md5_is_ok $wname $MASTER_PDF_MD5 || abort 4 "MD5 mismatch"
    fi
}


pdftk_cmd() {
    local odir="$1"
    local prefix=
    local ofile="$3"
    
    # Usa sed per sostituire due o più trattini con uno solo: (fix caller)
    prefix=$(echo "$2" | sed -r 's/-{2,}/-/g')
    
    local oo="${odir}/${prefix}${ofile}.pdf"
    mkdir -p $odir
    if [ -f "$oo" ]; then
	echo "exists, skipped: $oo"
    else
	cmd="pdftk $(get_master_name) cat $newspec output $oo"
	echo $cmd 1>&2
	$cmd || abort "aborted command pdftk"
	echo generated: $oo
    fi
}

extract() {
    local spec=
    while [[ $# > 1 ]]; do
	spec+="$1 "
	shift
    done
    export DELTA
    local newspec=$(echo "$spec" | perl -ne 's/([\d]+)/$1+$ENV{DELTA}/eog; s/_/ /og; print;')
    local ofile="$1"
    local n=
    local str=
    for n in $(seq 1 $THISLEVEL); do
	str+="\$LEVEL$n/"
    done
    local str2=$(eval echo "$str")
    
    # npad currently not used any more:
    local npad=
    printf -v npad "%03d" "$N"
    
    let N+=1
    local odir="$OUTROOT/${str2}"
    [[ $PREFIXMODE == PREFIX || $PREFIXMODE == BOTH ]] && pdftk_cmd "$odir" "${str2//\//-}-" "$ofile"
    [[ $PREFIXMODE == NOPREFIX || $PREFIXMODE == BOTH ]] && pdftk_cmd "$odir" ""  "$ofile"
}

DIR="$1"
PREFIXMODE="$2"

case "$PREFIXMODE" in
    PREFIX|NOPREFIX|BOTH)
    ;;
    *)
	abort 4 "invalid param 2: PREFIX or NOPREFIX"
	;;
esac

[[ ! -d $DIR ]] && echo "not a directory: $DIR" && exit 1

echo ======================================
echo $DIR
echo ======================================
echo "check commands:"
which curl || abort 1 "curl command not available; install"
which pdftk || abort 1 "curl command not available; install"
echo "ok"

source $DIR/exec.sh "$(dirname "$DIR")" || exit 3
