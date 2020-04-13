all:
	cd gogc && cargo build --release --all && cbindgen > ../gogc.h
	find . -type f -name 'libgogc.a' | xargs -I {} cp -f {} . ; true
	go build ./...
.PHONY: all

clean:
	rm -f *.a
	rm -f *.h
	cd gogc && cargo clean
.PHONY: clean

run:
	go run main.go
.PHONY: run
