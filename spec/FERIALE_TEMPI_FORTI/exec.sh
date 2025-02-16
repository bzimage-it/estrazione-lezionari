
source $1/exec.sh $(dirname $1)

SHORT=FETF
THISLEVEL=1
LEVEL1=$SHORT

MASTER_PDF_URL="https://liturgico.chiesacattolica.it/wp-content/uploads/sites/8/2017/12/11/LEZIONARIO-FERIALE-TEMPI-FORTI-cprs.pdf"
MASTER_PDF_MD5=28fa7ce7bc1e72670a3bf7edaebb36da

download_master_pdf
