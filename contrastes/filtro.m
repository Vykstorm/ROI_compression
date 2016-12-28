function [ img2 ] = filtro( img, vecindad, f )
    %% Esta función aplica un filtro espacial sobre una imágen, pero en vez 
    % de usar un kernel, el valor de cada pixel de la imágen filtrada se
    % obtiene en función del vaolor devuelto por la función pasada como
    % parámetro, a la que se pasa la vecindad del pixel.
    % También hay que indicar el tamaño de al vecindad a tomar para cada
    % píxel.

    [m, n] = size(img);
    p = vecindad(1); q = vecindad(2);
    
    % AÃ±adimos filas y columnas a la imÃ¡gen para poder aplicar el filtro
    % sobre los pÃ­xeles en los bordes de la imÃ¡gen. 
    img = padarray(img, [(p-1)/2, (q-1)/2], 'replicate');
    
    % Aplico el filtro sobre cada pixel de la imÃ¡gen.
    img2 = zeros(m,n);
    for i=1:m
        for j=1:n
            V = img(i:i+(p-1), j:j+(q-1));
            img2(i,j) = f(V);
        end;
    end;
    
    %img2 = imfilter(img, kernel);
end

