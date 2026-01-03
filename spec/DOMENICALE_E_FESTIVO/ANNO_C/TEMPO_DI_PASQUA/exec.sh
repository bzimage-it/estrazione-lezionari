# the firt line "source" conf is always the same:
source $1/exec.sh $(dirname $1)

SHORT=TP
THISLEVEL=3
LEVEL3=$SHORT
N=1

# imposto la differenza di numerazone iniziale fra quella "vera" del PDF
# e quella mostata dalla prima pagina che voglio estrarre:

# TEMPO DI PASQUA
DELTA=$((213-185))

extract 185-188 191-194 1 Domenica_di_Pasqua_messa_del_giorno

DELTA=$((225-193))
extract 193-196 199 2 II

DELTA=$((232-198))
extract 198-200 203-206 3 III

let DELTA+=2
extract 205-208 4 IV

let DELTA+=2
extract 209-212 5 V

let DELTA+=2
extract 213-217 6 VI

# no figure qui
extract 218-220 223-224 6A Ascensione_del_Signore

let DELTA+=2
extract 223-224 227-228 7 VII

DELTA=$((271-227))
extract 227-228 231-239 8 Domenica_di_Pentecoste_Vespertina_nella_Vigilia
DELTA=$((284-238))
extract 238-240 243-245 9 Domenica_di_Pentecoste















