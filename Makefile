SHELL := /bin/bash

STACK ?= $(shell which stack)
STACK_GHCJS := $(STACK) --stack-yaml stack-ghcjs.yaml
STACK_GHC := $(STACK) --stack-yaml stack-ghc.yaml

all:
	@$(STACK_GHCJS) setup
	@$(STACK_GHC) setup
	@PATH="$(PATH):$(shell $(STACK_GHC) path --compiler-bin)" $(STACK_GHCJS) build
	@$(STACK_GHC) build

clean:
	@$(STACK_GHCJS) clean
	@$(STACK_GHC) clean
