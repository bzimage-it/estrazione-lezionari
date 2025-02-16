# the firt line "source" conf is always the same:
source $1/exec.sh $(dirname $1)

SHORT=CEN
THISLEVEL=3
LEVEL3=$SHORT
# already defined uplevel:
# N=261

# imposto la differenza di numerazone iniziale fra quella "vera" del PDF
# e quella mostata dalla prima pagina che voglio estrarre:
# DELTA=0

# echo "N===$N  DELTA===$DELTA"

extract 235-240 1 Mercoledi_delle_Ceneri
extract 241-243 2 Giovedi_dopo_le_Ceneri
extract 244-247 3 Venerdi_dopo_le_Ceneri
extract 248-251 4 Sabato_dopo_le_Ceneri
# da completare ....


# la precedente estrazione conteneva una pagina di figure non numerata,
# aggiugiamo quindi 1 e riallineando così il delta per le prossime estrazioni:
DELTA=$(($DELTA+1))

















