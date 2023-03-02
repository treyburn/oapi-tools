# oapi-tools
A tiny repo for containerized OpenAPI tooling

## How to use
The makefile included in the repo provides all commands.

### Requirements
Your api spec must be placed in `./api/api.yaml`. Otherwise, you will need to update the makefile and dockerfile paths.

### Make Targets

* `make lint-oapi`: This commands runs the [vacuum](https://github.com/daveshanley/vacuum) openapi linter to check for errors within the OpenAPI spec and prints errors to the console.

* `make lint-oapi-report`: This command runs the [vacuum](https://github.com/daveshanley/vacuum) openapi linter and generates an html report within the repository root containing all suggestions, warnings, and errors for your spec.

* `make lint-oapi-debug`: This command gives you shell access to the container for debugging purposes.