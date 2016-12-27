function [ contraste ] = CLp( V )
%% Devuelve el contraste de un píxel sabiendo información sobre las intesidades
% de los pixeles de su vecindario. 
% Usa la función de contraste local CLp
	
    if max(max(V)) == min(min(V)) % Todos los pixeles son iguales
        contraste = 0;
    % Hay al menos dos pixeles distintos.
    elseif prod(prod((V == 0) + (V == 1))) % La imágen es binaria 
        contraste = 1;
    else 
        % La imágen no es binaria y las intensidades de los pixeles no
        % coinciden
        contraste = sum(sum(V .* (1-V))) / prod(size(V));
    end;
end

