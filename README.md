# Direct Sparse Odometry - Server

Il codice è un adattamento di [CNN DSO](https://github.com/muskie82/CNN-DSO) finalizzato a generare una pointcloud avendo già a disposizione anche le mappe depth.

## Build

Dopo aver scaricato/clonato il progetto è sufficiente posizionarsi all'interno di esso e lanciare il seguente comando:
```
bash build_complete.sh
```
L'esecuzione potrebbe richiedere molto tempo, anche più di un'ora.

Solo nel caso in cui ad un certo punto il comando precedente si blocchi, lanciare il seguente comando:
```
bash build_dso.sh
```

## Usage

Esempio di esecuzione:
```
bin/dso_dataset files=/path/to/images depths=/path/to/depthMaps calib=/path/to/calibFile/calib.txt preset=0 mode=1 max=5 depthScale=256 sampleoutput=1
```

IMPORTANTE: 
Il nome delle immagini rgb dev'essere nel formato xxxxxx.png (i.e. 000000.png)
Il nome delle mappe depth dev'essere nel formato xxxxxx\_depth.png (i.e. 000000\_depth.png)

### depths

Serve ad indicare al sistema il percorso delle mappe depth

### depthScale

Serve ad indicare al sistema il fattore di scala presente nelle mappe depth

### max

Serve ad indicare al sistema quanto attenedere (secondi) al massimo prima di terminare l'esecuzione nel caso in cui non vengano fornite ulteriori immagini e mappe depth

### sampleoutput

Se uguale ad 1, in aggiunta al comportamento originario, il sistema esporta la pointcloud. (Non completamente funzionante)

## DSO

Per gli altri argomenti si rimanda a [DSO](https://github.com/JakobEngel/dso)



