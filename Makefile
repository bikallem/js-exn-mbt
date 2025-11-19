.PHONY: build fmt

build:
	NEW_MOON=1 moon build --target js

fmt:
	NEW_MOON=1 moon fmt
