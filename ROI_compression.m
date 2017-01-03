%
% Autor: Víctor Ruiz Gómez
% Descripción: Este método toma como entrada una imágen, y devueve una
% imágen obtenido como resultado de haber realizado la compresión de la imágen
% original y posteriormente descomprimirla.
% Devuelve también, un valor I expresado en bits, como la cantidad de información
% en bruto que es necesitaría transmitir a parte de la imágen comprimida, para
% reconstruir la imágen (meta-información)
% También debe indicarse como parámetro, el ratio de compresión global de la imágen
% que se desea obtener neto. Los ratios de compresión locales de las distintas regiones
% se intentarán ajustar para aproximar el ratio de compresión global al indicado.
% Se devolverá además, el ratio de compresión obtenido.

function [ M2, I, cr2 ] = ROI_compression ( M, cr )
	[n,m,p] = size(M);

	%% Identificar regiones de la imágen.
	
	%% Usamos un algoritmo de aprendizaje no supervisado para clasificar
	% los pixeles. (cuales pertencen al fondo y cuales a los objetos)
	
	% Nº objetos de la imágen
	o = 1;
	
	C = clasificar(M, o);
	%visualizar_objetos(C);

	%% Usamos el algoritmo quadtree para encerrar los pixeles en regiones cuadradas,
	% de forma que se optimize el nº pixeles que pertenecen al mismo cluster en cada
	% región
	
	% Nº máximo de divisiones
	maxDivisions = 4; 
	
	% Tamaño mínimo de cada región.
	minRegionSize = max(n / 2^maxDivisions, 1);
	
	% Criterio de descomposición de una región.
	f = @(X) (size(X,1) > minRegionSize) && dividir(X);
	
	R = regiones(C > 0, M, f);
	nr = size(R,1);
	
	%visualizar_regiones(C*255/q, R);
	%visualizar_regiones(M, R);
	%figure;
	%imshow(uint8(unir_regiones(R, [256, 256, 3])));
	
	%% Cuantificar la cantidad de información necesaria que debe transmitirse,
	% a parte de la imágen comprimida, para poder reconstruir la imágen original.
	I = sum(cellfun(@(X) (log2(n)-log2(size(X,1)))*2, R(:,2)));
	
	%% Cuantificar el nivel de compresión de cada región, teniendo en cuenta por cada una de
	% estas, la proporción de pixeles que pertenezcan al fondo o a algún
	% objeto, y una medida de contraste total sobre los píxeles de esta.
	L = nivel_compresion(R(:,2:3));
	%visualizar_niveles(M, [R(:,1:2) mat2cell(L, ones(1,nr), 1)]);
	
	%% Calcular los ratios de compresión locales para cada región, para conseguir el ratio de compresión
	% global indicado.
	S = cellfun(@(X) size(X,1)*size(X,2), R(:,2));
	LCR = calcular_ratios(cr, L, S);
	%visualizar_niveles(M, [R(:,1:2) mat2cell(1 - 1 ./ LCR, ones(1,nr), 1)]);
	
	%% Comprimimos cada una de las regiones individualmente.
	[R2, cr2] = comprimir_regiones(R(:,1:2), LCR);
	
	%% Recomponemos la imágen original.
	M2 = unir_regiones(R2, size(M));
	%figure;
	%imshow(uint8(M2));
end
