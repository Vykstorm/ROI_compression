
% Este método aplica la transformada del coseno sobre un bloque de píxeles M,
% trunca paarte de los píxeles (después de haber aplicado la transformada), en base
% al ratio de compresión indicado.
% Posteriormente, se descomprime la imágen (aplicando la inversa de la transformada)
% el nº píxeles truncados es s-floor(s/r) donde r es el ratio de compresión, s es el
% n total de píxeles.
function [M2] = comprimir(M, r)
	M2 = M;
end
