.PHONY: build fmt clean all info

all: clean fmt info build

build: build-js build-wasm-gc

build-js:
	moon build --target js

build-wasm-gc:
	moon build --target wasm-gc

fmt:
	moon fmt

clean:
	moon clean

info:
	moon info