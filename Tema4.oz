% Seminar 4

% Problem 1

declare
fun {Concat L1 L2}
   case L1
   of nil then L2
   [] H|T then H | {Concat T L2}
   end
end


declare
fun {Filter L E}
   case L
   of nil then nil
   [] H|T then if H == E then
		  {Filter T E}
	       else
		  H | {Filter T E}
	       end
   end
end     

declare
fun {FreeVars X F}
   case X
   of nil then nil
   [] apply(E1 E2) then {Concat {FreeVars E1 F} {FreeVars E2 F}}
   [] lam(I E) then {Filter {FreeVars E F} I}
   [] let(I#E1 E2) then {Concat {Filter {FreeVars E1 F} I} {Filter {FreeVars E2 F} I}}
   [] I then I | F
   end
end

declare
fun {FreeSet Expr}
   {FreeVars Expr nil}
end

%{Browse {FreeSet apply(z let(x#y let(y#x x)))}}
%{Browse {FreeSet apply(x let(x#y x))}}
%{Browse {FreeSet apply(y apply(let(x#x x) y))}}
%{Browse {FreeSet nil}}
%{Browse {FreeSet x}}
%{Browse {FreeSet let(x#apply(x let(x#y x)) y)}}
%{Browse {FreeSet lam(y apply(let(y#x x) let(x#x x)))}}

		       
% Problem 2

