#!/bin/bash

DIR="$1"
DESCR="$2"

if [[ -z $DESCR ]]; then
    sintax: $0 "<DIR> <DESCRIPTION>"
    exit 2
fi

function wav2mp3() {
    wav="$1"
    mp3="$2"
    ffmpeg -i "$wav" "$mp3"
}


if [ ! -d "$DIR" ]; then
	echo "not a dir $DIR"
	exit 1
fi

cd $DIR || exit 2

if [[ ! ${DIR} =~ ^[0-9]{8}$ ]]; then
    echo "not a date as DIR $DIR"
    exit 3
fi

YYYY=${DIR:0:4}
MM=${DIR:4:2}
DD=${DIR:6:2}

for F in  *.wav; do 
	M="$(basename $F .wav)" 
	echo -n $M ;
	
	what=
	if [[ ${M^^} =~ "SAL" ]]; then
	    what="Salmo"
	    tn=2
	fi
	if [[ ${M^^} =~ "SEC" ]]; then
	    what="2nda-Lettura"
	    tn=3
	fi
	if [[ ${M^^} =~ "PRI" ]]; then
	    what="1ma-Lettura"
	    tn=1
	fi
	if [[ ${M^^} =~ "VAN" ]]; then
	    what="Vangelo"
	    tn=4
	fi
	if [[ ${M^^} =~ "MED" ]]; then
	    what="Meditazione"
	    tn=5
	fi
	if [[ -z $what ]]; then
	    echo "unrecognized name: $F"
	    exit 2
	fi
	MP3="$YYYY$MM$DD-$tn-$what.mp3"
	rm -f "$MP3"
	wav2mp3 "$F" "$MP3"
	id3 -a "(c) <fabrizio@bzimage.it>" \
	    -A "BibbiatsApp|$YYYY-$MM-$DD" \
	    -t "$DESCR|$what" \
	    -T "$tn" \
	    -y "$YYYY" \
	    -c "(c) CC BY-NC-ND 4.0" \
	    "$MP3"
	id3 -l "$MP3"
	
done	
