.PHONY:
check-links:
	# https://github.com/tcort/markdown-link-check
	ag --md -l --ignore-dir tests | xargs -n1 markdown-link-check

.PHONY: test
test:
	./test

.PHONY: bump-major bump-minor bump-patch

bump-major:
	./tools/bump major

bump-minor:
	./tools/bump minor

bump-patch:
	./tools/bump patch
