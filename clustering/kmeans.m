function [ I ] = kmeans( X, X2, U, alpha )
% Esta funci�n es igual que la anterior, solo que la funci�n de coste es
% distinta (tiene en cuenta la vecindad de los pixeles en la clasificaci�n)
% X son los atributos de los pixeles de la im�gen original, mientras que X2
% son los atributos de los p�xeles de la im�gen suavizada con el filtro de
% la media.

    % Establecemos un n�mero m�ximo de iteraciones.
    max_iters = 20;
    iter = 0;
    
    % Aplicamos el algoritmo K-means
    [n, m] = size(X);
    q = size(U,1);
     
    while iter <= max_iters
		% Clasificamos los ejemplos con los centroides iniciales.
		D = permute(sum(bsxfun(@minus, repmat(X, [1, 1, q]), permute(U, [3 2 1])).^2, 2) + ...
            alpha*sum(bsxfun(@minus, repmat(X2, [1, 1, q]), permute(U, [3 2 1])).^2, 2), [1 3 2]);

        [~, I] = min(D, [], 2);
		
		% Calculamos los nuevos centroides.
		A = bsxfun(@times, repmat(X+alpha*X2, [1 1 q]), bsxfun(@eq, repmat(permute(1:q, [1 3 2]), [n 1 1]), I));
		U = permute(sum(A,1) ./ ((1+alpha) * sum(A ~= 0,1)), [3 2 1]);
		
		iter = iter + 1;
	end

end

