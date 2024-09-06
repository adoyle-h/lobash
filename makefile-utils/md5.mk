# Source Code: https://github.com/adoyle-h/makefile-utils

.PHONY: md5-check
# @desc Check md5sum in $DIST/*.md5 [$DIST defaults to ./dist]
md5-check:
	$(eval DIST ?= ./dist)
	@cd ${DIST} && md5sum -c ./*.md5

.PHONY: md5
# @desc Create .md5 files for each file in $DIST/ [$DIST defaults to ./dist]
md5:
	$(eval DIST ?= ./dist)
	@rm -f ${DIST}/*.md5
	@cd ${DIST} && for file in *; do [ -f "$$file" ] && md5sum -- "$$file" > "$$file.md5"; done
