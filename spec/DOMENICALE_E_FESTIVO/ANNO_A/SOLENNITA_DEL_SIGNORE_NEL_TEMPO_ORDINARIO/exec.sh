# the firt line "source" conf is always the same:
source $1/exec.sh $(dirname $1)

SHORT=SDSTO
THISLEVEL=3
LEVEL3=$SHORT
N=1

# imposto la differenza di numerazone iniziale fra quella "vera" del PDF
# e quella mostata dalla prima pagina che voglio estrarre:

# SOLENNITA DEL SIGNORE NEL T.O.
DELTA=$((331-305))

extract 305-308 1 Solennita_della_SS_Trinita
extract 309-312 314-316 2 Solennita_del_SS_Corpo_e_Sangue_di_Cristo

DELTA=$((343-316))
extract 316-319 3 Sacratissimo_Cuore_di_Gesu

















