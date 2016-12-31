
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

