# the firt line "source" conf is always the same:
source $1/exec.sh $(dirname $1)

SHORT=NAT
THISLEVEL=2
LEVEL2=$SHORT
N=1

# imposto la differenza di numerazone iniziale fra quella "vera" del PDF
# e quella mostata dalla prima pagina che voglio estrarre:

# TEMPO DI NATALE
DELTA=$((197-171))

extract 171-174 01 Ottava_di_Natale_29_Dicembre
extract 175-178 02 Ottava_di_Natale_30_Dicembre
extract 179-183 03 Ottava_di_Natale_31_Dicembre
extract 184-187 04 Tempo_di_Natale_2_Gennaio
extract 188-191 05 Tempo_di_Natale_3_Gennaio
extract 192-195 06 Tempo_di_Natale_4_Gennaio
extract 196-199 07 Tempo_di_Natale_5_Gennaio
extract 200-203 08 Tempo_di_Natale_6_Gennaio
extract 204-207 09 Tempo_di_Natale_7_Gennaio
extract 210-213 10 Ferie_dopo_Epifania_7_Gennaio
extract 214-217 11 Ferie_dopo_Epifania_8_Gennaio
extract 218-221 12 Ferie_dopo_Epifania_9_Gennaio
extract 222-225 13 Ferie_dopo_Epifania_10_Gennaio
extract 226-228 14 Ferie_dopo_Epifania_11_Gennaio
extract 229-232 15 Ferie_dopo_Epifania_12_Gennaio























