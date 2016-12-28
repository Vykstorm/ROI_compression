
% Este método toma como parámetro una matriz (que será una región de la
% imágen que se está descomponiendo). El método debe devolver un 1 en caso
% de que la región deba subdivirse más o un 0 en caso contrario.
function [S] = dividir(X)
	l = size(X,1);
	
	% Obtenemos las frecuencias de aparición (histograma) 
	[Y, H] = frequencies(X);
	
	
	% Este parámetro es un umbral. Si una proporción de píxeles de la 
	% región que pertencen al mismo clúster es mayor o igual que este umbral,
	% no se sigue subdiviendo (la mayoría de los píxeles pertenecen a
	% un mismo clúster)
	threshold = 1;

	S = max(H) < threshold;
end
