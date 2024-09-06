.PHONY: md-check-links
# @desc Check dead links in markdown files
md-check-links:
ifeq (, $(shell which lychee))
	$(error "Not found lychee in PATH. Please install it by yourself. See https://github.com/lycheeverse/lychee")
endif

ifdef GITHUB_TOKEN
	lychee --github-token ${GITHUB_TOKEN} .
else
	@lychee .
endif
