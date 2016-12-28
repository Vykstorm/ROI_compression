function [ img2 ] = filtro( img, vecindad, f )
    %% Esta funci�n aplica un filtro espacial sobre una im�gen, pero en vez 
    % de usar un kernel, el valor de cada pixel de la im�gen filtrada se
    % obtiene en funci�n del vaolor devuelto por la funci�n pasada como
    % par�metro, a la que se pasa la vecindad del pixel.
    % Tambi�n hay que indicar el tama�o de al vecindad a tomar para cada
    % p�xel.

    [m, n] = size(img);
    p = vecindad(1); q = vecindad(2);
    
    % Añadimos filas y columnas a la imágen para poder aplicar el filtro
    % sobre los píxeles en los bordes de la imágen. 
    img = padarray(img, [(p-1)/2, (q-1)/2], 'replicate');
    
    % Aplico el filtro sobre cada pixel de la imágen.
    img2 = zeros(m,n);
    for i=1:m
        for j=1:n
            V = img(i:i+(p-1), j:j+(q-1));
            img2(i,j) = f(V);
        end;
    end;
    
    %img2 = imfilter(img, kernel);
end

