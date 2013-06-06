-module(perf_test).

-export([test_avg/4,
		 test_once/3]).

-export([test/2]).

test_once(M, F, A) ->
	{Time, Res} = timer:tc(M, F, A),
	io:format("~p:~p(~p) -> ~p~n", [M, F, A, Time]),
	Res.

test_avg(M, F, A, N) when N > 0 ->
	L = test_loop(M, F, A, N, []),
	Length = length(L),
	Min = lists:min(L),
	Max = lists:max(L),
	Med = lists:nth(round((Length / 2)), lists:sort(L)),
	Avg = round(lists:foldl(fun(X, Sum) -> X + Sum end, 0, L) / Length),
	io:format(
	  "\tRange: ~b - ~b mics~n"
	  "\tMedian: ~b mics~n"
	  "\tAverage: ~b mics~n",
	  [Min, Max, Med, Avg]),
	Med.

test_loop(_M, _F, _A, 0, List) ->
	List;
test_loop(M, F, A, N, List) ->
	{T, _Result} = timer:tc(M, F, A),
	test_loop(M, F, A, N - 1, [T | List]).


test(CharLen, Times) ->
	FunctionNames =
		[
		 comprehension,
		 comprehension2,
		 conversion,
		 conversion2
		],
	TestData = [<< <<($a+random:uniform($z-$a))>> || _ <- lists:seq(1, CharLen) >>],
	TestFun =
		fun(Fun) ->
				io:format("~n\tTest: fun ~p/1~n",[Fun]),
				{Fun, test_avg(bin_to_upper, Fun, TestData, Times)}
		end,
	[ TestFun(Fun) || Fun <- FunctionNames].
