# repository estratti lezionari

Nell'ambito della liturgia cattolica sono presenti online diversi PDF per i lezionari usati nelle proclamazioni luturgiche. 
Questo progetto mira a:

- individuare un o più versioni utili di questi lezionari, disponibili online pubblicamente
- estrarre da ciascuno di essi le letture di ciascuna liturgia in modo mirato
- razionalizzare in una struttura appropriata di directory i file da rendere disponibili singolarmente secondo i critieri di partizionamento tipici della liturgia (tipo di lezionari, ciclo annuale, tempo liturgico ...)

# cosa NON pubblichiamo

Probabilmente non verrebbe violato il copyright se questo progetto pubblicasse i singoli PDF così segnmentati. Tuttavia per ragioni di opportunità e semplicità ed evitare eventuali contestazioni, e in attesa di una maggiore chiarezza, in questo repository *non* verranno pubblicati i PDF, né quelli originari né quelli 'segmentati', ma solo le procedure per generarli.

# cosa si può fare con questo programma

- scaricare i file PDF direttamente dagli URL pubblici
- definire quali pagine estrarre esattamente oppure seguire le specifiche già fornine nel repository
- lanciare il programma di partizionamento generando i file PDF singoli per ogni elemento della directory di specifica oppure dalla proprie spefifiche

# requisiti

- distribuzione linux recente
- comandi:
  * bash
  * curl
  * pdftk

# struttura della directory di specifica 'spec'

nella directory ```spec``` è indicaa un'alberatura di directory che riproduce fedelmente la gerarchia dei lezionari.
a ogni livello è presente uno script ```exec.sh``` che viene automaticamente eseguito mediante comando ```source``` di bash quando si indica la rispettiva directory.
ciasuno di questi file include a sua volta (sempre tramite source) anche il file ```exec.sh``` di livello superiore (directory padre) e così via fino alla directory immediatamente sottostante ```spec```.
in questo modo ciascun livello inferiore eseguirà automaticamente i livelli superiori per prima cosa.

# directory 'finali'

la prsenza di un file vuoto di nome 'final' delle directory di specifica segnala che la directory è appunto consideraa come finale in modo che possa essere eseguita dallo script ```run_all.sh``` il quale invocherà il comando ```run.sh``` per tutte queste directory, di livello 'più profondo'.

# come generare gli estratti

mediante il comando ```run.sh``` può essere 'eseguita' una qualunque directory in spec, ad esempio:

```bash run.sh spec/DOMENICALE_E_FESTIVO/ANNO_A/TEMPO_DI_NATALE/ BOTH 2> /dev/null```

eseguirà lo script ```exec.sh``` dentro ```spec/DOMENICALE_E_FESTIVO/ANNO_A/TEMPO_DI_NATALE/```

per eseguire tutte i livello finali dare semplicemente il comando:

```bash run_all.sh```

gli output sono generati nella cartella ```output```. Questa non fa parte del repository e rimane a disposizione dell'utente.

# comando run
i comandi vanno sempre dati dalla directory base dove run.sh è contenuto.

sintassi del comando run:

```bash run.sh <spec-dir> <prefix-mode>```

* ```<spec-dir>``` è la directory di specifica, può essere a qualunque livello della directory spec. il path è cons
* ```<prefix-mode>``` può valere una di queste stringhe
* * ```PREFIX``` : indica di anteporre un prefisso di categoria sintentica al nome del file generato
  * ```NOPREFIX``` : indica di non antepore alcun prefisso di categoria sintetica al nome del file generato
  * ```BOTH``` : indica di generare entrambi i file, con e senza prefisso sintetico.

il prefisso sintentico contiene la medesima informazione della directory di output ovvero la forma "breve" delle alberature, definita dentro gli script ```exec.sh```

## output

Lo script produce in ```stdout``` i messaggi principali e in ```stderr``` quelli di dettaglio maggiormente verbosi. 
Per diminuire la verbosità dei messaggi semplicemente redirezionare ```stderr``` su ```/dev/null```.

In caso di ```abort()``` il messaggio di errore viene stampato sia su ```stdin``` che ```stdout```.

# requisiti dei file exec.sh

*PRECISAZIONE:* in questo contesto per _directory corrente_ si intende quella dove il file stesso è localizzato, non quella da cui è eseguito lo script ```run.sh```

## priorità al livello superiore

La prima istruzione deve essere:

```source $1/exec.sh $(dirname $1)```

questo fa si che possa essere eseguito prima quello della directory superiore. Fa eccezione il file ```spec/exec.sh``` che è al livello più alto (0) e non ha questa istruzione.

## variabili di ambiente

possono essere definite le seguenti variabili d'ambiente

* *SHORT*
  nome "breve" della directory corrente, tipicamente poche lettere in maiuscolo
* *THISLEVEL*
  numero intero contenente il numero di livello della directory corrente
* *LEVEL<N>*
  possono essere definte diversi nomi LEVEL1 , LEVEL2 .... che è lo stesso valore precedentemente impostato con SHORT
  ogni file ```exec.sh``` definisce quello del proprio livello di directory
* *MASTER_PDF_URL*
  contiene la url completa del documento master da scaricare da internet 
* *MASTER_PDF_MD5* 
  contiene l'MD5SUM (si veda comando md5sum) di 32 caratteri esadecimali per autenticare la correttezza del file stesso.
* *DELTA* , numero intero. Contiene la differenza di numerazione fra il PDF e la numerazione interna del documento. impostando questa variabile è possibile specificare in estrazione dei numeri più sensati e coerenti con la numerazione interna. Questa variabile viene tipicamente impostata più volte: quando sono presenti delle figure (che non sono numerate nei lezionari) è necessario incrementarla del numero di queste pagine presenti nell'estratto per riallineare la numerazione.
* *N* , numero intero. Contiene il valore iniziale della numerazione automatica nei documenti generati (inizio del nome del file). il valore viene 'paddato' a 2 (printf "%02d").

possono essere invocate le seguenti funzioni ```bash``` rese disponibili da ```run.sh```:

* ```download_master_pdf```
  (nessun parametro). se in precedenza sono state definite entrambe MASTER_PDF_URL e MASTER_PDF_MD5 provvede a garantire che il file master sia disponbile e sia coerente con la firma del MD5SUM dichiarata in MASTER_PDF_MD5.
* ```extract <spec1> [ <spec2> ... ] <name>```
  effettua l'estrazione delle pagine date in specifica e assegna il nome indicto in <name>: questo andrà a costituire la parte finale nel nome del file generato. Le specifiche sono le stesse del comando ```cat``` di ```pdftk```. 

# un esempio

focalizziamo l'attenzione sul lezionario 'Domenicale e Festivo' , volume dell' Anno A, Tempo di Natale.
la directory di spec si chiamerà:

```spec/DOMENICALE_E_FESTIVO/ANNO_A/TEMPO_DI_NATALE/```

e gli script ```exec.sh``` interessati sono:

## spec/DOMENICALE_E_FESTIVO/exec.sh
contiene semplicemente il nome breve di questo livello DF che sta appunto per 'Domenica e Festivo' e il LIVELLO1 pari a questo valore:
```
source $1/exec.sh $(dirname $1)
SHORT=DF
THISLEVEL=1
LEVEL1=$SHORT
```
## spec/DOMENICALE_E_FESTIVO/ANNO_A/exec.sh
a questo livello definiamo il nome breve "A" per "ANNO A" e le informazioni sul file master da scaricare, poi invochiamo lo scariamento con ```download_master_pdf```:

```
source $1/exec.sh $(dirname $1)

SHORT=A
THISLEVEL=2
LEVEL2=$SHORT

MASTER_PDF_URL="https://liturgico.chiesacattolica.it/wp-content/uploads/sites/8/2018/05/17/Lezionario_Do_Fest_Anno_A_light.pdf"
MASTER_PDF_MD5=a3926bb6eaa492440da1cecf7bdaee39

download_master_pdf
```

## spec/DOMENICALE_E_FESTIVO/ANNO_A/TEMPO_DI_NATALE/exec.sh

definiamo il livello 3 e diamo il nome breve "NAT" che sta per "Tempo di Natale". Impostiamo il valore iniziale N=1 (verrà poi incrementato automaticamente). Imposto il valore ```DELTA=4 ``` in quanto osservo che questo PDF ha una diffenza inziale di 4 numeri.

Poi invoco le prime estrazioni: le pagine di riferimento indicate con ```extract``` non sono quelle del PDF, ma quelle mostrate nella pagine interne. Quando una pagina contiene disallineamenti (esempio figure non numerate) bisogna incrementare DELTA del valore corrispettivo in modo da poter ricominciare con il comando ```extract``` successivo la numerazione allineata.

```
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
.....
```


  


