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

.PHONY: bump-major bump-minor bump-patch
bump-major:
	./tools/release major

bump-minor:
	./tools/release minor

bump-patch:
	./tools/release patch
