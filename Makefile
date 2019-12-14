
progs := $(wildcard progs/*.rkt)
execs := $(patsubst %.rkt,%.run,$(wildcard progs/*.rkt))

progs-io := $(wildcard progs-io/*.rkt)
execs-io := $(patsubst %.rkt,%.run,$(wildcard progs-io/*.rkt))
dir-io   := $(wildcard input/*)

%.run: %.rkt
	make -C .. fp-test/$@

compile: $(execs)

compile-io: $(execs-io)

run-io: $(execs-io)
	@for d in `ls input`; do for f in input/$$d/*txt; do cat $$f | /usr/bin/time -f "$$f: %e" progs-io/$$d.run; done; done > run-io

racket-io: $(execs-io)
	@for d in `ls input`; do for f in input/$$d/*txt; do cat $$f | racket progs-io/$$d.rkt; done; done > racket-io

test: compile-io
	for d in `ls input`; do for f in input/$$d/*txt; do echo $$f progs-io/$$d.run;  cat $$f | progs-io/$$d.run > /dev/null; done; done

testall: racket-io
	@/usr/bin/time -p make run-io > compiled-out.txt
	diff run-io racket-io

clean:
	-rm -f run-io
	-rm -f racket-io
	-rm -f progs/*.run
	-rm -f progs-io/*.run
	-rm -f progs-io/*.o
	-rm -f progs-io/*.s
