include ./makefile-utils/*.mk
.DEFAULT_GOAL := help

.PHONY: check-links
check-links:
	# https://github.com/tcort/markdown-link-check
	ag --md -l --ignore-dir tests | xargs -n1 markdown-link-check

.PHONY: check-style
check-style:
	editorconfig-checker

.PHONY: test
test:
	./test

.PHONY: build
build:
	./build -y ./dist/lobash.bash

.PHONY: gen
gen:
	./tools/gen

# @target bump-major  bump major version (x)
# @target bump-minor  bump minor version (y)
# @target bump-patch  bump patch version (z)
BUMP_TARGETS := $(addprefix bump-,major minor patch)
.PHONY: $(BUMP_TARGETS)
$(BUMP_TARGETS):
	@$(MAKE) $(subst bump-,semver-,$@) > VERSION

.PHONY: changelog
# @desc Generate and update the CHANGELOG file
changelog:
	$(MAKE) CHANGELOG NEXT_VERSION=$(shell cat VERSION)

# @target release-major  release major version (x)
# @target release-minor  release minor version (y)
# @target release-patch  release patch version (z)
RELEASE_TARGETS := $(addprefix release-,major minor patch)
.PHONY: $(RELEASE_TARGETS)
$(RELEASE_TARGETS):
	./tools/release $(subst release-,,$@)
