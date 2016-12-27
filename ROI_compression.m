%
% Autor: Víctor Ruiz Gómez
% Descripción: Este método toma como entrada una imágen, y devueve una
% imágen obtenido como resultado de haber realizado la compresión de la imágen
% original y posteriormente descomprimirla.

function [ M2 ] = ROI_compression ( M )
	[n,m] = size(M);

	% Identificar regiones de la imágen.
	
	% Usamos un algoritmo de aprendizaje no supervisado para clasificar
	% los pixeles en clusteres. 
	
	
	% Usamos el algoritmo quadtree para encerrar los pixeles en regiones cuadradas,
	% de forma que se optimize el nº pixeles que pertenecen al mismo cluster en cada
	% región
	
	% Nº máximo de divisiones
	maxDivisions = 3; 
	% Tamaño mínimo de cada región.
	minRegionSize = n / 2^maxDivisions;
	% Criterio de descomposición de una división.
	%f = @(X) (size(X,1) > minRegionSize) &&
	
	
	%R = regiones(K, M, f);
	%M2 = R;
	%visualizar_regiones (M, R);
	% Cuantificar el nivel de calidad de la imágen en cada una de las regiones,
	% y establecer el ratio de compresión a utilizar en estas individualmente.

	% Comprimir cada una de las regiones.
	
	% Descomprimir cada una de las regiones y construir una imágen (teniendo información
	% sobre la descomposición realiza en el paso número 1 del algoritmo)
	
end
