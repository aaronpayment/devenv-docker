.PHONY : all alpha

all:
	docker build -t aaronpayment/devenv:latest .
alpha:
	docker build -t aaronpayment/devenv:alpha -t aaronpayment/devenv:latest .
