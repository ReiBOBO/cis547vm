TARGETS=test0 test1 test2 test3 test4 test5 test6 test7 test8 test9


all: ${TARGETS}
test8: test8.c
	clang -Wall -g $< -o $@
test4: test4.c
	clang -Wall -g $< -o $@


clean:
	rm -rf results ${TARGETS} output.db submission submission.zip afl_output
