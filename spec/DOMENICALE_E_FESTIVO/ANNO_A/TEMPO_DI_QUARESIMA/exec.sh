# the firt line "source" conf is always the same:
source $1/exec.sh $(dirname $1)

SHORT=TQ
THISLEVEL=3
LEVEL3=$SHORT
N=1

# imposto la differenza di numerazone iniziale fra quella "vera" del PDF
# e quella mostata dalla prima pagina che voglio estrarre:

# TEMPO DI QUARESIMA:
DELTA=$((142-133))

extract 133-138 1 I

extract 139-140 142-143 2 II

DELTA=$(($DELTA+1))
extract 143-148 150-151 3 III

DELTA=$(($DELTA+1))
extract 151-156 158-159 4 IV
DELTA=$(($DELTA+1))
extract 159-164 166-167 5 V

DELTA=$(($DELTA+1))
extract 167-168 170-185 6 Domenica_delle_Palme_Passione_del_Signore 
DELTA=$(($DELTA+1))
extract 185-189 7 Giovedi_della_Settimana_Santa_Messa_del_Crisma















