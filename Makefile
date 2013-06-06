RESULT_FILE=./test.txt

ebin:  src/*.erl
	mkdir -p ebin/
	erlc -o ebin/ $?
	
ebin_native: src/*.erl
	mkdir -p ebin_native
	erlc +native -o ebin_native/ $?
	
test: ebin ebin_native
	echo "[simple]" > $(RESULT_FILE)
	./test.escript ebin >> $(RESULT_FILE)
	
	echo "[native]" >> $(RESULT_FILE)
	./test.escript ebin_native >> $(RESULT_FILE)
	        
.PHONY: ebin ebin_native test

