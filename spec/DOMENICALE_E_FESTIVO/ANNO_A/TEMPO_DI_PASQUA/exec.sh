# the firt line "source" conf is always the same:
source $1/exec.sh $(dirname $1)

SHORT=TP
THISLEVEL=3
LEVEL3=$SHORT
N=1

# imposto la differenza di numerazone iniziale fra quella "vera" del PDF
# e quella mostata dalla prima pagina che voglio estrarre:

# TEMPO DI PASQUA
DELTA=$((260-243))

extract 243-244 246-249 251-252 1 Domenica_di_Pasqua_messa_del_giorno

DELTA=$(($DELTA+2))
extract 193-196 199 2 II

DELTA=$(($DELTA+1))
extract 251-252 254-256 3 III

DELTA=$((283-262))
extract 262-264 266-267 4 IV

let DELTA+=1
extract 267-271 5 V
extract 272-275 6 VI

# no figure qui
DELTA=$((298-276))
extract 276 278-281 6A Ascensione_del_Signore

let DELTA+=1
extract 281-284 7 VII

DELTA=$((310-285))
extract 285-295 8 Domenica_di_Pentecoste_Vespertina_nella_Vigilia
extract 296 297-302 9 Domenica_di_Pentecoste















