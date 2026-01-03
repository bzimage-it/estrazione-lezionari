# the firt line "source" conf is always the same:
source $1/exec.sh $(dirname $1)

SHORT=TQ
THISLEVEL=2
LEVEL2=$SHORT
# already defined uplevel:
# N=261

# imposto la differenza di numerazone iniziale fra quella "vera" del PDF
# e quella mostata dalla prima pagina che voglio estrarre:
# DELTA=0

# echo "N===$N  DELTA===$DELTA"

N=1
DELTA=$((261-235))

extract 235-240 01 Mercoledi_delle_Ceneri
extract 241-243 02 Giovedi_dopo_le_Ceneri
extract 244-247 03 Venerdi_dopo_le_Ceneri
extract 248-251 04 Sabato_dopo_le_Ceneri
# da completare ....


# 1ma settimana:
extract 252-256 11 I_Settimana_Lunedi
extract 257-260 12 I_Settimana_Martedi
# salto 2 pagina di figure
DELTA=$((289-261))
extract 261-265 13 I_Settimana_Mercoledi
extract 266-268 14 I_Settimana_Giovedi
# salto 2 pagina di figure
DELTA=$((299-269))
extract 269-273 15 I_Settimana_Venerdi
extract 274-276 16 I_Settimana_Sabato

# 2nda settimana:
extract 277-279 21 II_Settimana_Lunedi
extract 280-283 22 II_Settimana_Martedi
extract 284 287-289 23 II_Settimana_Mercoledi
let DELTA+=2
extract 288-292 24 II_Settimana_Giovedi
extract 293-294 297-299 25 II_Settimana_Venerdi
let DELTA+=2
extract 298-301 26 II_Settimana_Sabato

# 3a settimana:
DELTA=$((236-302))
extract 302-306 30 III_Settimana_Messa_ad_Libitum
extract 307-308 311-313 31 III_Settimana_Lunedi
let DELTA+=2
extract 312-316 32 III_Settimana_Martedi
extract 317-319 33 III_Settimana_Mercoledi
extract 320-322 34 III_Settimana_Giovedi
extract 323-324 327-329 35 III_Settimana_Venerdi
let DELTA+=2
extract 328-331         36 III_Settimana_Sabato

# 4a settimana:
DELTA=$((370-332))
extract 332-336 40 IV_Settimana_Messa_ad_Libitum
extract 337-340 41 IV_Settimana_Lunedi
extract 341-342 345-347 42 IV_Settimana_Martedi
let DELTA+=2
extract 346-350 43 IV_Settimana_Mercoledi
extract 351-355 44 IV_Settimana_Giovedi
extract 356-359 45 IV_Settimana_Venerdi
extract 360 362-365 46 IV_Settimana_Sabato

# 5a settimana:
DELTA=$((406-364))
extract 364-368 50 V_Settimana_Messa_ad_Libitum
extract 369-372 375-380 51 V_Settimana_Lunedi
let DELTA+=2
extract 379-382 52 V_Settimana_Martedi
extract 383-384 387-388 53 V_Settimana_Mercoledi
let DELTA+=2
extract 387-390 54 V_Settimana_Giovedi
extract 391-393 396 55 V_Settimana_Venerdi
let DELTA+=2
extract 395-398 56 V_Settimana_Sabato

# 5a settimana:
DELTA=$((447-399))
extract 399-402 71 Settimana_Santa_Lunedi
extract 403-407 72 Settimana_Santa_Martedi
extract 408-412 73 Settimana_Santa_Mercoledi

















