
% Comprime cada una de las regiones de la imágen individualmente usando la
% transformada del coseno. Debe indicarse información de las regiones R:
% Un array de celdas nrx2 donde nr es el número de regiones. La primera columna
% contiene celdas con vectores de la forma [x,y] que indican la posición de la región
% relativa a la imágen.
% Por otro lado, la segunda columna, cada celda almacena una matriz con los píxeles de
% cada región.
% Devuelve otro array de celdas como el que se indica como parámetro, pero los píxeles 
% ahora serán el resultado de aplicar la transformada, truncar una cantidad específica de estos
% (en base al ratio de compresión), y aplicar la inversa de la transformada.
% (esto se hace por cada componente de color R-G-B)
function [R2,cr] = comprimir_regiones(R, LCR)
	% Comprimos las regiones de forma individual.
	nr = size(R,1);
	R2 = [R(:,1) cellfun(@(M, lcr) comprimir(M, lcr,size(M,1)), R(:,2), mat2cell(LCR, ones(1,nr), 1), 'UniformOutput', false)];
	
	% Calculamos el ratio de compresión global de la imágen alcanzado..
	% Lo calculamos como el cociente entre el nº pixels de la imágen original y
	% el nº de pixeles de la imágen transformada.
	S = cellfun(@(X) size(X,1)*size(X,2), R(:,2));
	cr = sum(S) / sum(S - floor(sqrt((S - S ./ LCR))).^2);
end
	
