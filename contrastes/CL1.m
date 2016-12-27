function [ contraste ] = CL1( V )
%% Devuelve el contraste de un píxel sabiendo información sobre las intesidades
% de los pixeles de su vecindario. 
% Usa la función de contraste local CLi
	contraste = max(max(V)) - min(min(V));
end
	
