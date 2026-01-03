# the firt line "source" conf is always the same:
source $1/exec.sh $(dirname $1)

SHORT=TO
THISLEVEL=3
LEVEL3=$SHORT
N=1

# imposto la differenza di numerazone iniziale fra quella "vera" del PDF
# e quella mostata dalla prima pagina che voglio estrarre:

# TEMPO ORDINARIO:
DELTA=$((350-323))

# cifre arabe sono per mantenere l'ordine lessicografico,
# quelle romane per consistenza con il lezionario:
extract 323-326 02 II
extract 327-331 03 III
extract 332-335 04 IV
extract 336-339 05 V
extract 340-346 06 VI
extract 347-351 07 VII
extract 352-356 08 VIII
extract 357-361 09 IX
extract 362-365 10 X
extract 366-369 11 XI
extract 370-374 12 XII
extract 375-379 13 XIII
extract 380-383 14 XIV
extract 384-390 15 XV
extract 391-396 16 XVI
extract 397-401 17 XVII
extract 402-404 406 18 XVIII
DELTA=$((434-406))
extract 406-409 19 IX
extract 410-413 20 XX
extract 414-417 21 XXI
extract 418-421 22 XXII
extract 422-425 23 XXIII
extract 426-430 24 XXIV
extract 431-435 25 XXV
extract 436-441 26 XXVI
extract 442-447 27 XXVII
extract 448-453 28 XXVIII
extract 454-457 29 XXIX
extract 458-460 462 30 XXX
DELTA+=1
extract 462-465 31 XXXI
extract 466-470 32 XXXII
extract 471-476 33 XXXIII
extract 477-480 482 34 XXXIV_Solennita_di_NSG_Re_dell_Universo

