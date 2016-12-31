
% Este método aplica la transformada del coseno sobre un bloque de píxeles M,
% trunca paarte de los píxeles (después de haber aplicado la transformada), en base
% al ratio de compresión indicado.
% Posteriormente, se descomprime la imágen (aplicando la inversa de la transformada)
% el nº píxeles truncados total es floor(sqrt((s - s / r) / (n/k)^2))^2 * (n/k)^2  donde r es el ratio de compresión, s es el
% n total de píxeles, y k es el tamaño de bloque (se divide el conjunto de pixeles en bloques y se aplica
% la transformada por cada bloque de forma individual)
function [M2] = comprimir(M, r, k)
	M2 = zeros(size(M));
	d = size(M,3);
	n = size(M,1);
	s = prod(size(M))/d;

	% Aplicar la transformada por cada componente de color..
	for j=1:d
		C = M(:,:,j);
		
		% Aplicar la transformada por cada bloque
		C = blockproc(C, [k,k], @dct2);
	
		% Truncar píxeles con menos información en base al ratio de compresión por cada bloque
		C = blockproc(C, [k,k], @(X) truncate(X, repmat(floor(sqrt((s-s/r)/(n/k)^2)), 1, 2), 0));
		
		% Aplicar la inversa de la transformada por cada bloque
		M2(:,:,j) = blockproc(C, [k,k], @idct2);
	end;
end
