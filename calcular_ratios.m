% Esta función calcula los ratios de compresión local para cada región de la imágen para
% que de forma aproximada, el ratio de compresión global de la imágen se ajuste al indicado.
% Toma como parámetro el ratio de compresión global que se quiere obtener al comprimir la imágen,
% los niveles de compresión (L) de cada región de la imágen (en el rango [0, 1) ), y el nº de pixeles
% de cada región (S).
% Devuelve los ratios de compresión locales de cada región..

function [LCR] = calcular_ratios(cr, L, S)
	nr = length(L);

	lb = 1 ./ S;
	ub = ones(nr,1);
	
	Aeq = ones(1,nr);
	beq = sum(S) / cr;
	
	C = eye(nr);
	d = 1 ./ L;
	
	%LCR = 1./lsqnonneg(T, d);
	LCR = (1./lsqlin(C, d, [], [], Aeq, beq, [], [])) .* S;

	% Reajustamos los ratios (por si algunos ratios no son válidos)
	LCR = bsxfun(@min, bsxfun(@max, LCR, 1), S);
end;

