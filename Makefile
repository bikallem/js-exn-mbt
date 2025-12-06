.PHONY: build fmt clean all info

all: clean fmt info build

build:
	moon build

fmt:
	moon fmt

clean:
	moon clean

info:
	moon info