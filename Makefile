.PHONY: build fmt clean

build:
	NEW_MOON=1 moon build --target js

fmt:
	NEW_MOON=1 moon fmt

clean:
	NEW_MOON=1 moon clean
