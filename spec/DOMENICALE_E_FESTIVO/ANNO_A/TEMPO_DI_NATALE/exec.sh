# the firt line "source" conf is always the same:
source $1/exec.sh $(dirname $1)

SHORT=NAT
THISLEVEL=3
LEVEL3=$SHORT
N=1

# imposto la differenza di numerazone iniziale fra quella "vera" del PDF
# e quella mostata dalla prima pagina che voglio estrarre:
DELTA=4

extract 83-89 NATALE_DEL_SIGNORE_Alla_Messa_vespertina_della_vigilia
extract 90-94 NATALE_DEL_SIGNORE_Alla_Messa_della_notte
extract 95-96 98-99 NATALE_DEL_SIGNORE_Alla_Messa_dell_aurora

# la precedente estrazione conteneva una pagina di figure non numerata,
# aggiugiamo quindi 1 e riallineando così il delta per le prossime estrazioni:
DELTA=$(($DELTA+1))

extract 99-105 NATALE_DEL_SIGNORE_Alla_Messa_del_giorno
extract 106-110 SANTA_FAMIGLIEA_DI_GESU_MARIA_E_GIUSEPPE
extract 111-112 114-115 SOLENNITA_DI_MARIA_SANTISSIMA_MADRE_DI_DIO
















