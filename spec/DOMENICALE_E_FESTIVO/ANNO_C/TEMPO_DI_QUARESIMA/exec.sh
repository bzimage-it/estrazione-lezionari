# the firt line "source" conf is always the same:
source $1/exec.sh $(dirname $1)

SHORT=TQ
THISLEVEL=3
LEVEL3=$SHORT
N=1

# imposto la differenza di numerazone iniziale fra quella "vera" del PDF
# e quella mostata dalla prima pagina che voglio estrarre:

# TEMPO DI QUARESIMA:
DELTA=$((97-83))

extract 83-84 87-88 1 I

DELTA=$(($DELTA+2))
extract 87-88 91-93 2 II

DELTA=$(($DELTA+2))
extract 92 95-99 3 III

DELTA=$(($DELTA+2))
extract 98-103 4 IV
extract 104-108 5 V

DELTA=$(($DELTA+2))
extract 109-126 6 Domenica_delle_Palme_Passione_del_Signore 
extract 127-131 7 Giovedi_della_Settimana_Santa_Messa_del_Crisma















