# the firt line "source" conf is always the same:
source $1/exec.sh $(dirname $1)

SHORT=TO
THISLEVEL=3
LEVEL3=$SHORT
N=1

# imposto la differenza di numerazone iniziale fra quella "vera" del PDF
# e quella mostata dalla prima pagina che voglio estrarre:

# TEMPO ORDINARIO:
DELTA=$((317-265))

# cifre arabe sono per mantenere l'ordine lessicografico,
# quelle romane per consistenza con il lezionario:
extract 265-268 02 II
extract 269-275 03 III
extract 276-281 04 IV
extract 282-286 05 V
extract 287-291 06 VI
extract 292-296 07 VII
extract 297-300 08 VIII
extract 301-304 09 IX
extract 305-309 10 X
extract 310-315 11 XI
extract 316-319 12 XII
extract 320-324 13 XIII
extract 325-330 14 XIV
extract 331-335 15 XV
extract 336-339 16 XVI
extract 340-344 17 XVII
extract 345-349 18 XVIII

# la precedente estrazione conteneva una pagina di figure non numerata,
# aggiugiamo quindi 1 e riallineando così il delta per le prossime estrazioni:
DELTA=$(($DELTA+1))

# extract 99-105 NATALE_DEL_SIGNORE_Alla_Messa_del_giorno
# extract 106-110 SANTA_FAMIGLIEA_DI_GESU_MARIA_E_GIUSEPPE
# extract 111-112 114-115 SOLENNITA_DI_MARIA_SANTISSIMA_MADRE_DI_DIO

DELTA=$((402-350))

extract 350-356 19 XIX
extract 357-360 20 XX
extract 361-364 21 XXI
extract 365-368 22 XXII

# 1 figura:
extract 369-372 375 23 XXIII

DELTA=$((428-374))

extract 374-380 24 XXIV
extract 381-386 25 XXV
extract 387-391 26 XXVI
extract 392-395 27 XXVII
extract 396-400 28 XXVIII
extract 401-404 29 XXIX
extract 405-409 30 XXX
extract 410-412 415 31 XXXI

DELTA=$((470-414))

extract 414-418 32 XXXI
extract 419-420 423-425 33 XXXIII

DELTA=$((482-424))

extract 424-428 34 XXXIV_Solennita_di_NSG_Re_dell_Universo





















