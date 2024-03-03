%Seminar 2

% 1. a) Combinari de N luate cate K metoda 1

declare
fun {Numerator N K}
   if K == 0 then
      1
   else
      N * {Numerator N - 1 K -1}
   end
end

%{Browse {Numerator 3 2}}
%{Browse {Numerator 6 2}}
%{Browse {Numerator 7 5}}

declare
fun {Denominator K}
   if K == 0 then
      1
   else
      K * {Denominator K - 1}
   end
end

%{Browse {Denominator 6}}


declare
fun {Comb N K}
   {Numerator N K} div {Denominator K}
end


%{Browse {Comb 6 2}}
%{Browse {Comb 10 5}}
%{Browse {Comb 5 4}}


% 1. b) Combinari de n luate cate k metoda 2

declare
fun {Comb2 N K}
   if K == 0 then
      1
   else
      {FloatToInt {IntToFloat N - K + 1} / {IntToFloat K} * {IntToFloat {Comb2 N K - 1}}}
   end
end

%{Browse {Comb2 6 2}}
%{Browse {Comb2 10 5}}
%{Browse {Comb2 5 4}}
%{Browse {Comb2 5 0}}


% 2.  Reverse list with an accumulator

declare
fun {Reverse L R}
   case L
   of nil then R
   [] H|T then {Reverse T H|R}
   end
end

%{Browse {Reverse [1 2 3] nil}}
%{Browse {Reverse ['I' 'WANT' 'ICECREAM' twice] nil}}



% 3. Lazy execution N prime numbers
declare
fun lazy {FilterSieve L H}
   case L of
      nil then nil
      [] A|As then
      if A mod H == 0 then
  {FilterSieve As H}
      else
  A|{FilterSieve As H}
      end
   end
end

declare
fun lazy {Sieve L}
   case L of
      nil then nil
      [] H|T then H|{Sieve {FilterSieve T H}}
   end
end



declare
fun lazy {Gen N}
   N|{Gen N+1}
end

declare
fun lazy {Prime}
   {Sieve {Gen 2}}
end



declare
fun {Check N L}
   case L of
      H|T then
      if H > N then H
      else
  {Check N T}
      end
   end
end

declare
fun {GetAfter N}
   {Check N {Prime}}
end



%{Browse {GetAfter 1}}
%{Browse {GetAfter 2}}
%{Browse {GetAfter 30}}
%{Browse {GetAfter 100}}


% Problem 4



declare
fun {Insert T N}
   if T == nil then bst(node: N right: nil left:nil)
   elseif T.node < N then bst(node: T.node left: T.left right: {Insert T.right N})
   else bst(node: T.node left: {Insert T.left N} right: T.right)
   end
end



declare
Y = nil
E1 = 5
E2 = 10
E3 = 60
E4 = 25
X = bst(node:10 left: bst(node:3 left: nil right:nil) right: bst(node: 30 left: nil right: nil))
%{Browse {Insert {Insert {Insert {Insert X E1 } E2 } E3 } E4 }}


declare
fun {Smallest T}
   if T.left == nil then T.node
   else {Smallest T.left}
   end
end


declare
X2 = bst(node: 10 left: bst(node: 9 left: bst(node: 3 left: nil right: nil) right: bst(node: 40 left: nil right: nil)) right: 50)
{Browse {Smallest X2}}

declare
fun {Biggest T}
   if T.right == nil then T.node
   else {Biggest T.right}
   end
end

declare
X3 = bst(node: 10 left: 5 right: bst(node: 20 left: nil right: bst(node: 100 left: nil right: nil)))

%{Browse {Biggest X3}}




declare
fun {IsSorted T}
   if T == nil then true
   elseif {And T.left == nil T.right == nil} then true
   elseif {And T.left == nil T.node < T.right.node} then {IsSorted T.right}
   elseif {And T.left == nil T.node > T.right.node} then false
   elseif {And T.right == nil T.node >= T.left.node} then {IsSorted T.left}
   elseif {And T.right == nil T.node < T.left.node} then false
   elseif {And T.node >= T.left.node T.node < T.right.node} then {And {IsSorted T.left} {IsSorted T.right}}
   else false
   end
end

declare
X4 = bst(node: 20 left: bst(node: 10 left: nil right: nil) right: bst(node: 15 left: 23 right: bst(node: 30 left: nil right: bst(node: 40 left: nil right: nil))))
X5 = bst(node: 20 left: bst(node: 10 left: nil right: nil) right: bst(node: 30 left: nil right: nil))
X6 = bst(node: 20 left: bst(node: 10 left: nil right: nil) right: bst(node: 25 left: bst(node:23 left: nil right: nil) right: bst(node: 30 left: nil right: bst(node: 21 left: nil right: nil))))
%{Browse {IsSorted X5}}

	   
	   