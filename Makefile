.DEFAULT_GOAL := help

.ONESHELL:
SHELLFLAGS := -eu -o pipefail -c
SHELL := /bin/bash

BUILD = build
OUTPUT = make-cheatsheet.pdf

.PHONY: help check-prereqs install-fonts build clean lint release

help: ## Show help
	@awk 'BEGIN {FS = ":.*##"} \
	/^[a-zA-Z_-]+:.*?##/ { \
	  printf "  \033[36m%-15s\033[0m %s\n", \
	  $$1, $$2 \
	}' $(MAKEFILE_LIST)

check-prereqs: ## Verify pandoc and xelatex are available
	@command -v pandoc >/dev/null \
	|| (echo "pandoc required. Install: brew install pandoc" && exit 1)
	@command -v xelatex >/dev/null \
	|| (echo "xelatex required. Install TeX Live: brew install texlive" && exit 1)

install-fonts: ## Verify required fonts; install Merriweather if missing
	python3 scripts/install-fonts.py

build: check-prereqs ## Generate PDF
	mkdir -p $(BUILD)
	pandoc --listings cheatsheet.md \
	  -o $(BUILD)/$(OUTPUT) \
	  --template=template.latex \
	  --pdf-engine=xelatex

clean: ## Remove build artifacts
	rm -rf $(BUILD)

lint: ## Lint markdown with pymarkdownlnt
	pymarkdownlnt scan cheatsheet.md

release: clean build ## Clean build for release
