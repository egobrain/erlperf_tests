#!/usr/bin/escript

main([CodePath]) ->
	code:add_patha(CodePath),
	Result = perf_test:test(10000, 1000),
	io:format("~n\tResult : ~p~n~n", [Result]).
