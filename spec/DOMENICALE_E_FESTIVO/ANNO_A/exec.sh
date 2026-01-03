
source $1/exec.sh $(dirname $1)

SHORT=A
THISLEVEL=2
LEVEL2=$SHORT

MASTER_PDF_URL="https://liturgico.chiesacattolica.it/wp-content/uploads/sites/8/2018/05/17/Lezionario_Do_Fest_Anno_A_light.pdf"
MASTER_PDF_MD5=a3926bb6eaa492440da1cecf7bdaee39

download_master_pdf
N=1

DELTA=2
extract 15-58 OLM ORDINAMENTO_DELLE_LETTURE_DELLA_MESSA

