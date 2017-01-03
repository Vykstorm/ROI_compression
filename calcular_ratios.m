% Esta función calcula los ratios de compresión local para cada región de la imágen para
% que de forma aproximada, el ratio de compresión global de la imágen se ajuste al indicado.
% Toma como parámetro el ratio de compresión global que se quiere obtener al comprimir la imágen,
% los niveles de compresión (L) de cada región de la imágen (en el rango [0, 1) ), y el nº de pixeles
% de cada región (S).
% Devuelve los ratios de compresión locales de cada región..

function [LCR] = calcular_ratios(cr, L, S)
	nr = length(L);
	
	%% Solucionamos un problema de optimización.
	% r1, r2, ..., rn son los ratios de compresión local a calcular.
	% l1, l2, ..., ln son los niveles de compresión de cada región.
	% s1, s2, ...., sn es el nº pixeles por cada región.
	% cr es el ratio global
	% Resolvemos un algoritmo de optimización. 
	% Partimos del punto inicial de que los ratios 
	% r1, r2, ..., rn = 1 / (1 - l1), 1 / (1 - l2), ..., 1 / (1 - ln)
	% esta es la situación ideal, pero queremos que..
	% suma i=1...n, si / ri  se aproxime a  (sumai=1..n si) / rc 
	% con la condición de que  r1 <= 1 / (1 - l1), r2 <= 1 / (1 - l2), ...
	% Calculamos los coeficientes k1, k2, ..., kn tal que se minimize
	% el siguinte error:
	% 1/2 ([suma i=1...n(si / (1 - (1 - li/ki)))] - [(sumai=1..n si) / rc]) ^ 2


	% Comenzamos la búsqueda indicando el punto inicial R0
	K0 = ones(nr,1);
	
	% Valor mínimo de K que queremos encontrar
	lb = ones(nr,1);

	% Función F que devuelve un conjunto de valores F1, F2, ..., FN
	% Al final minimizaremos la suma de los cuadrados de estos valores ->
	% minimizar F1^2 + F2^2 + ... + Fm^2
	
	alpha = 20;
	F = @(K) alpha * abs((sum(S ./ (1 ./ (1 - (L ./ K)))) - (sum(S) / cr))) / sum(S-1);


	opts = optimset('Algorithm', 'trust-region-reflective', 'MaxIter', 1000);
	K = lsqnonlin(F, K0, lb, [], opts);

	LCR = 1 ./ (1 - (L ./ K));
	
	% Reajustamos los ratios (por si algunos ratios no son válidos)
	LCR = bsxfun(@min, bsxfun(@max, LCR, 1), S);
end;

