% Seminar 1

%Problem 1 - Absolute Value - only for integers
declare
fun {AbsValue E}
   if E < 0 then
      ~E
   else
      E
   end
end

%{Browse {AbsValue 10}}
%{Browse {AbsValue ~10}}


% This works for both integers and floats
declare
fun {Minus E}
   ~E
end

declare
fun {Maximum X Y}
   if X > Y then
      X
   else
      Y
   end
end

declare
fun {AbsValue2 X}
   {Maximum X {Minus X}}
end

{Browse {AbsValue2 ~2.3}}

%Problem 2 - n^m

declare
fun {Pow N M}
   if M == 0 then
      1
   else
      N*{Pow N M-1}
   end
end

%{Browse {Pow 2 3}}
%{Browse {Pow 10 2}}
%{Browse {Pow 10 0}}

%Problem 3 - Maximum recursively

declare
fun {Max N M}
   if N == 0 then
      M
   elseif M == 0 then
      N
   else
      1 + {Max N-1 M-1}
   end
end

{Browse {Max 10 20}}
{Browse {Max 3 1}}