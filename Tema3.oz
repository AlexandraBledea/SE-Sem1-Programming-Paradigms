% Seminar 3

% Problem 1

declare
fun {IsMember L E}
   case L
   of nil then false
   [] H|T then if H == E then
		  true
	       else
		  {IsMember T E}
	       end
   end
end

%{Browse {IsMember [a b c] b}}
%{Browse {IsMember [a b c] d}}


%Problem 2

declare
fun {Take L N}
   if N == 0 then
      nil
   else
      case L
      of nil then nil
      [] H|T then H|{Take T N-1}
      end
   end
end

%{Browse {Take [1 4 3 6 2] 3}}
%{Browse {Take [1 2 3] 4}}

declare
fun {Drop L N}
   case L
   of nil then nil
   [] H|T then if N > 0 then
		  {Drop T N - 1}
	       else
		  H| {Drop T N}
	       end
   end
end

%{Browse {Drop [1 4 3 6 2] 3}}
%{Browse {Drop [1 2] 4}}


% Problem 3

declare
A = [a b c]
B = [1 2 3]
X = A#B

%{Browse X.1}
%{Browse X}

declare
fun {Zip X}
   case X
   of nil#nil then nil
   [] (H1|T1)#(H2|T2) then H1#H2 | {Zip T1#T2}
   end
end

%{Browse { Zip X}}


declare
A = [a#1 b#2 c#3]
{Browse A}

declare
fun {UnZip X}
   case X
   of nil then nil#nil
   [] (H1#H2)|T then
      T1#T2 = {UnZip T} in
      (H1|T1)#(H2|T2)
   end
end


% {Browse {UnZip A}}


% Problem 4

declare
fun {Pos1 L E Pos}
   case L
   of nil then Pos
   [] H|T then
      if H == E then
	 Pos
      else
	 {Pos1 T E Pos + 1}
      end
   end
end


{Browse {Pos1 [a b c] c 1}}

declare
fun {Pos2 L E Pos}
   case L
   of nil then 0
   [] H|T then
      if H == E then
	 Pos
      else
	 {Pos2 T E Pos + 1}
      end
   end
end


{Browse {Pos2 [a b d] c 0}}

declare
fun {Pos3 L E}
   case L
   of nil then 0
   [] H|T then
      if H == E then
	 1
      else
	 1 + {Pos3 T E}
      end
   end
end

{Browse {Pos3 [a b c] c}}



%5

declare
X = add(int(1) mul(int(3) int(4)))

{Browse X}

declare
fun {Eval X}
   case X
   of int(E) then E
   [] add(X Y) then {Eval X} + {Eval Y}
   [] mul(X Y) then {Eval X} * {Eval Y}
   end
end


{Browse {Eval X}}
      
      
      