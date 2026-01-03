# the firt line "source" conf is always the same:
source $1/exec.sh $(dirname $1)

SHORT=NAT
THISLEVEL=3
LEVEL3=$SHORT
N=1

# imposto la differenza di numerazone iniziale fra quella "vera" del PDF
# e quella mostata dalla prima pagina che voglio estrarre:
DELTA=$((87-83))

extract 83-89 01a NATALE_DEL_SIGNORE_Alla_Messa_vespertina_della_vigilia
extract 90-94 01b NATALE_DEL_SIGNORE_Alla_Messa_della_notte
extract 95-96 98-99 01c NATALE_DEL_SIGNORE_Alla_Messa_dell_aurora
# extract 83-99 01 NATALE_DEL_SIGNORE

# la precedente estrazione conteneva una pagina di figure non numerata,
# aggiugiamo quindi 1 e riallineando così il delta per le prossime estrazioni:
DELTA=$(($DELTA+1))

extract 99-105 01d NATALE_DEL_SIGNORE_Alla_Messa_del_giorno
extract 106-110 02 SANTA_FAMIGLIEA_DI_GESU_MARIA_E_GIUSEPPE
extract 111-112 114-115 03 SOLENNITA_DI_MARIA_SANTISSIMA_MADRE_DI_DIO

DELTA=$((121-115))

extract 115-121 04 II_Domenica_dopo_il_Natale
extract 122-124 126-127 05 Epifania_del_Signore

DELTA=$((134-127))
extract 127-128 130-132 06 Battesimo_del_Signore




















