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

DELTA=$((522-462))

extract 462-470  0815  15_AGO_Assunzione_della_BVM
extract 462-465  0815a 15_AGO_Assunzione_della_BVM_Alla_messa_vespertina_nella_vigilia
extract 466-470  0815b 15_AGO_Assunzione_della_BVM_Alla_messa_del_giorno


extract 471-474  0914 14_SET_Esaltazione_della_Santa_Croce
extract 475-478  1101 1_NOV_Tutti_i_Santi
extract 479-492  1102 2_NOV_Commemorazione_di_Tutti_i_fedeli_defunti
extract 493-496  1109 9_NOV_Dedicazione_della_Basilica_Lateranense
extract 497-501     1208 8_DIC_Immacolata_Concezione_della_BVM

















# la precedente estrazione conteneva una pagina di figure non numerata,
# aggiugiamo quindi 1 e riallineando così il delta per le prossime estrazioni:
DELTA=$(($DELTA+1))

# extract 99-105 NATALE_DEL_SIGNORE_Alla_Messa_del_giorno
# extract 106-110 SANTA_FAMIGLIEA_DI_GESU_MARIA_E_GIUSEPPE
# extract 111-112 114-115 SOLENNITA_DI_MARIA_SANTISSIMA_MADRE_DI_DIO
















