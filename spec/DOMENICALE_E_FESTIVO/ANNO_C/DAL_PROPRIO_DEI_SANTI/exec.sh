# the firt line "source" conf is always the same:
source $1/exec.sh $(dirname $1)

SHORT=DPDS
THISLEVEL=3
LEVEL3=$SHORT
N=1

# imposto la differenza di numerazone iniziale fra quella "vera" del PDF
# e quella mostata dalla prima pagina che voglio estrarre:

# DAL PROPRIO DEI SANTI:
DELTA=60

# cifre arabe iniziali sono ridondanti ma
# per mantenere l'ordine lessicografico,
# quelle romane se presenti per consistenza con il lezionario:
extract 431-436 0202 2_FEB_PRESENTAZIONE_DEL_SIGNORE

extract 437-446 0624 24_GIU_NATIVITA_DI_SAN_GIOVANNI_BATTISTA
extract 437-441 0624a 24_GIU_NATIVITA_DI_SAN_GIOVANNI_BATTISTA_Alla_messa_vespertina_nella_vigilia
extract 442-446 0624b 24_GIU_NATIVITA_DI_SAN_GIOVANNI_BATTISTA_Alla_messa_del_giorno

extract 447-457 0629 29_GIU_SANTI_PIETRO_E_PAOLO_APOSTOLI
extract 447-451 0629a 29_GIU_SANTI_PIETRO_E_PAOLO_APOSTOLI_Alla_messa_vespertina_nella_vigilia
extract 452-457 0629b 29_GIU_SANTI_PIETRO_E_PAOLO_APOSTOLI_Alla_messa_del_giorno

extract 458-461 0806 6_AGO_TRASFIGURAZIONE_DEL_SIGNORE








# la precedente estrazione conteneva una pagina di figure non numerata,
# aggiugiamo quindi 1 e riallineando così il delta per le prossime estrazioni:
DELTA=$(($DELTA+1))

# extract 99-105 NATALE_DEL_SIGNORE_Alla_Messa_del_giorno
# extract 106-110 SANTA_FAMIGLIEA_DI_GESU_MARIA_E_GIUSEPPE
# extract 111-112 114-115 SOLENNITA_DI_MARIA_SANTISSIMA_MADRE_DI_DIO
















