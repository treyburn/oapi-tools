SHELL := /bin/bash

CWD := $(shell pwd)
TARGET := /usr/src/oapi-tools

build-oapi-lint-container:
	docker build -t oapi-lint:latest -f ./docker/Dockerfile-oapi-lint $(CWD)

# Openapi lint commands
.PHONY: lint-oapi
lint-oapi: build-oapi-lint-container
	docker run --rm -v$(CWD):$(TARGET) oapi-lint:latest

.PHONY: lint-oapi-report
lint-oapi-report: build-oapi-lint-container
	docker run -t --rm -v$(CWD):$(TARGET) oapi-lint:latest bash -c "vacuum html-report -q ./api/api.yaml ./openapi-lint-report.html"

.PHONY: lint-oapi-debug
lint-oapi-debug: build-oapi-lint-container
	docker run -ti --rm -v$(CWD):$(TARGET) oapi-lint:latest bash