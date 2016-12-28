
%%
% Returns a data grid mapout identical to the input data grid, 
% except that each element of Z with a value contained in the vector oldcode 
% is replaced by the corresponding element of the vector newcode.
% oldcode is 0 (scalar) by default, in which case newcode must be scalar. 
% Otherwise, newcode and oldcode must be the same size.
function B  = changem(A,newval,oldval)
	B = A;
	[valid,id] = max(bsxfun(@eq,A(:),oldval(:).'),[],2);
	B(valid) = newval(id(valid));
end;
