.PHONY: build fmt clean all

all: clean fmt info build

build:
	NEW_MOON=1 moon build

fmt:
	NEW_MOON=1 moon fmt

clean:
	NEW_MOON=1 moon clean

info:
	NEW_MOON=1 moon info