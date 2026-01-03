# the firt line "source" conf is always the same:
source $1/exec.sh $(dirname $1)

SHORT=TRI
THISLEVEL=3
LEVEL3=$SHORT
N=1

# imposto la differenza di numerazone iniziale fra quella "vera" del PDF
# e quella mostata dalla prima pagina che voglio estrarre:

# TRIDUO PASQUALE:
DELTA=$((155-135))

extract 135-136 139-141 1 Giovedi_Santo_Vespertina_Cena_del_Signore

DELTA=$((164-140))
extract 140-144 147-153 2 Venerdi_Santo_Passione_del_Signore

DELTA=$((178-152))
extract 152-180 183 3 Domenica_Di_Pasqua_Veglia_della_Notte
















