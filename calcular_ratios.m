% Esta función calcula los ratios de compresión local para cada región de la imágen para
% que de forma aproximada, el ratio de compresión global de la imágen se ajuste al indicado.
% Toma como parámetro el ratio de compresión global que se quiere obtener al comprimir la imágen,
% los niveles de compresión (L) de cada región de la imágen (en el rango [0, 1) ), y el nº de pixeles
% de cada región (S).
% Devuelve los ratios de compresión locales de cada región.
% Se calculan de la siguiente forma:
% l1, l2, ..., ln son los niveles de compresión en el rango [0, 1)
% s1, s2, ..., sn es el nº de pixeles de cada región.
% Se quiere calcular r1, r2, ..., rn que serán los ratios locales.
% Se crea un sistema lineal no determinado con las siguientes premisas:
% 				l1/l2 = r1/r2, l1/l3 = r1/r3, l1/l4 = r1/r4, ..., l1/ln = r1/rn
% 							    l2/l3 = r2/r3, l2/l4 = r2/r4 ..., l2/ln = r2/rn
% ...
% y también debe cumplirse que:

% cr = (s1+s2+...+sn) / (s1/r1 + s2/r2 + ...+ sn/rn)

function [LCR] = calcular_ratios(cr, L, S)
	nr = length(L);
	C = combnk(1:nr, 2);
	
	% Creamos el sistema lineal no determinado.
	T = zeros(nr+1, nr);
	
	for i=1:nr
		a = C(i,1); b = C(i,2);
		T(i,:) = [repmat(0, [1 a-1]), 1, repmat(0, [1 b-a-1]), -L(a)/L(b), repmat(0, [1 nr-b])];
	end;
	T(nr+1,:) = S;
	d = [zeros(nr,1); sum(S)/cr];
	LCR = lsqnonneg(T, d);
end;
