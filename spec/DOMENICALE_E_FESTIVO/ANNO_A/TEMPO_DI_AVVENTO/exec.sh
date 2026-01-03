# the firt line "source" conf is always the same:
source $1/exec.sh $(dirname $1)

SHORT=AVV
THISLEVEL=3
LEVEL3=$SHORT
N=1

# imposto la differenza di numerazone iniziale fra quella "vera" del PDF
# e quella mostata dalla prima pagina che voglio estrarre:

# TEMPO DI AVVENTO
DELTA=$((63-61))

extract 61-65 01 I
extract 66-68 70-72 02 II
DELTA=$((75-72))
extract 72-76 03 III
extract 77-80 04 IV


# cifre arabe sono per mantenere l'ordine lessicografico,
# quelle romane per consistenza con il lezionario:
# extract 265-268 02 II
# extract 269-275 03 III

# la precedente estrazione conteneva una pagina di figure non numerata,
# aggiugiamo quindi 1 e riallineando così il delta per le prossime estrazioni:
# DELTA=$(($DELTA+1))





















