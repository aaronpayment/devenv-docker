.PHONY : all clean

all:
	docker build -t aaronpayment/devenv:latest .
