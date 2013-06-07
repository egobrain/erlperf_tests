-module(bin_to_upper).

-export([
		 comprehension/1,
		 comprehension2/1,

		 conversion/1,
		 conversion2/1,

		 recursion/1,
		 recursion2/1
		]).

char_to_upper(Ch) when Ch >= $a, Ch =< $z ->
	Ch + ($A-$a);
char_to_upper(Ch) ->
	Ch.

char_to_upper2($a) -> $A;
char_to_upper2($b) -> $B;
char_to_upper2($c) -> $C;
char_to_upper2($d) -> $D;
char_to_upper2($e) -> $E;
char_to_upper2($f) -> $F;
char_to_upper2($g) -> $G;
char_to_upper2($h) -> $H;
char_to_upper2($i) -> $I;
char_to_upper2($j) -> $J;
char_to_upper2($k) -> $K;
char_to_upper2($l) -> $L;
char_to_upper2($m) -> $M;
char_to_upper2($n) -> $N;
char_to_upper2($o) -> $O;
char_to_upper2($p) -> $P;
char_to_upper2($q) -> $Q;
char_to_upper2($r) -> $R;
char_to_upper2($s) -> $S;
char_to_upper2($t) -> $T;
char_to_upper2($u) -> $U;
char_to_upper2($v) -> $V;
char_to_upper2($w) -> $W;
char_to_upper2($x) -> $X;
char_to_upper2($y) -> $Y;
char_to_upper2($z) -> $Z;
char_to_upper2(Ch) -> Ch.

comprehension(Bin) ->
	<< << (char_to_upper(Ch)) >> || << Ch >> <= Bin >>.

comprehension2(Bin) ->
	<< << (char_to_upper2(Ch)) >> || << Ch >> <= Bin >>.


conversion(Bin) ->
	list_to_binary([ char_to_upper(Ch) ||
					   Ch <- binary_to_list(Bin)]).

conversion2(Bin) ->
	list_to_binary([ char_to_upper2(Ch) ||
					   Ch <- binary_to_list(Bin)]).

%% middle_case(Bin) ->
%% 	<< << (char_to_upper2(Ch)) >> || Ch <- binary_to_list(Bin) >>.

%% middle2_case(Bin) ->
%% 	list_to_binary([ char_to_upper2(Ch) || <<Ch>> <= Bin ]).
%% 	<< << (char_to_upper2(Ch)) >> || Ch <- binary_to_list(Bin) >>.

recursion(Bin) ->
	recursion(Bin, <<>>).
recursion(<<X,Rest/binary>>, Acc) ->
	recursion(Rest,<<Acc/binary,(char_to_upper(X))>>);
recursion(<<>>, Acc) -> Acc.

recursion2(Bin) ->
	recursion2(Bin, <<>>).
recursion2(<<X,Rest/binary>>, Acc) ->
	recursion2(Rest,<<Acc/binary,(char_to_upper2(X))>>);
recursion2(<<>>, Acc) -> Acc.
