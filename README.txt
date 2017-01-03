
Autor: Víctor Ruiz Gómez
Descripción: 
Este algoritmo realiza la compresión de una imágen por regiones. 
Las regiones "más importantes" de la imágen se comprimen con un ratio de compresión
inferior que el resto.

El algoritmo realiza varias etapas:

- Identificación de los objetos de la imágen: Separar los objetos y el fondo de la
imágen, categorizar los píxeles con un algoritmo de clasificación no supervisado.
Actualmente se usa el algoritmo k-means para esto.

- Una vez identificadas los objetos, se subdivide la imágen en regiones cuadradas 
usando un algoritmo de descomposición cuadrático (se subdivide el espacio en 4 regiones
cuadradas de forma recursiva).
Esta descomposición debe resultar en que los píxeles que haya en cada región pertenezcan
al mismo objeto de la imágen o al fondo (o una gran proporción de estos).

- Se cuantifica el nivel de compresión de cada región obtenida en base a dos criterios:
	- Proporción de píxeles en la región que pertenecen a algún objeto de la imágen.
	- Medida de contraste total de los píxeles de la región.

- A continuación, los niveles de compresión se ajustan de forma que el ratio de compresión
global de la imágen sea el que queremos o se aproxime al menos (usando un algoritmo de  
optimización)

- Por último, se comprime cada zona usando la transformada del coseno.





=====> DEPENDENCIAS <======

El algoritmo usa una serie de funciones predefinidas de Matlab/Octave, que no
se encuentran en el Núcleo, si no en otros paquetes:

- paquete "image"

imread, imshow  - Mostrar y cargar imágenes
imfilter 		- Filtrado espacial de imágenes.
qtdecomp		- Descomposición cuaternaria de imagenes.
blockproc 		- Procesamiento de imágen por bloques.

- paquete "signal"

dct2, idct2  	- Transformada del coseno

- paquete "optim"

lsqlin			- Encontrar solución a un problema de optimización, con restricciones lógicas


En octave, puede cargar todos los paquetes de la siguiente forma:
pkg load image
pkg load signal
pkg load optim


Por último, se debe ejecutar el script "startup.m" antes de poder
ejecutar el algoritmo.
Este script añade a la ruta donde Matlab/Octave busca las funciones,
todos los subdirectorios que contienen algún fichero en donde hay implementado
algún método auxiliar que se usa en el algoritmo.

