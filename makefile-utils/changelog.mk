# Source Code: https://github.com/adoyle-h/makefile-utils
# vi: ft=make

# @hide
makefile-utils/chglog:
	@mkdir -p '$@'

makefile-utils/chglog/CHANGELOG.tpl.md: CHGLOG_TPL ?= https://gist.githubusercontent.com/adoyle-h/9d466c80bf419ceba278316198eb5690/raw/ffc2de47fb9774bfef232c7a57948af6f1cbe524/CHANGELOG.tpl.md
# @hide
makefile-utils/chglog/CHANGELOG.tpl.md:
	curl -#Lo '$@' '$(CHGLOG_TPL)'

makefile-utils/chglog/config.yml: CHGLOG_CONFIG ?= https://gist.githubusercontent.com/adoyle-h/9d466c80bf419ceba278316198eb5690/raw/ffc2de47fb9774bfef232c7a57948af6f1cbe524/config.yml
# @hide
makefile-utils/chglog/config.yml:
ifeq (,$(shell git config --get remote.origin.url | sed -E 's|.+github.com:(.+).git|\1|'))
	$(error "Not found remote repo from git")
endif
	curl -#Lo '$@' '$(CHGLOG_CONFIG)'
	@repo=$$(git config --get remote.origin.url | sed -E 's|.+github.com:(.+).git|\1|');\
		sed -i.bak "s|adoyle-h/makefile-utils|$${repo}|" '$@';\
		rm '$@'.bak

.PHONY: git-chglog
# @hide
git-chglog:
ifeq (, $(shell which git-chglog))
	$(error "Not found git-chglog in PATH. Please install it by yourself. See https://github.com/git-chglog/git-chglog")
endif
	@:

.PHONY: CHANGELOG
CHANGELOG: OUTPUT ?= CHANGELOG.md
CHANGELOG: TEMPLATE ?= https://gist.githubusercontent.com/adoyle-h/9d466c80bf419ceba278316198eb5690/raw/ffc2de47fb9774bfef232c7a57948af6f1cbe524/CHANGELOG.md

# @desc Generate and update the CHANGELOG file ("make CHANGELOG NEXT_VERSION=0.1.0")
CHANGELOG: git-chglog makefile-utils/chglog makefile-utils/chglog/CHANGELOG.tpl.md makefile-utils/chglog/config.yml
ifeq (, $(NEXT_VERSION))
	$(error "The parameter NEXT_VERSION is required.")
endif

	@if [ -f "$(OUTPUT)" ]; then \
		line_num=$$(grep -nE '^## \[Unreleased\]' "$(OUTPUT)" | sed -E 's/^([0-9]+):.+/\1/');\
		sed -i.bak "$${line_num},$$((line_num+2)) d" "$(OUTPUT)";\
		git-chglog --config makefile-utils/chglog/config.yml --template makefile-utils/chglog/CHANGELOG.tpl.md \
			--next-tag "v$(NEXT_VERSION)" "v$(NEXT_VERSION)" | sed -i.bak "$$((line_num-1)) r /dev/stdin" "$(OUTPUT)";\
		echo "Updated the ChangeLog: $(OUTPUT)";\
		rm "$(OUTPUT).bak";\
	else \
		echo "curl -sSLo '$(OUTPUT)' '$(TEMPLATE)'";\
		curl -sSLo '$(OUTPUT)' '$(TEMPLATE)';\
		line_num=$$(grep -nE '^## \[Unreleased\]' "$(OUTPUT)" | sed -E 's/^([0-9]+):.+/\1/');\
		sed -i.bak "$${line_num},$$((line_num+2)) d" "$(OUTPUT)";\
		git-chglog --config makefile-utils/chglog/config.yml --template makefile-utils/chglog/CHANGELOG.tpl.md \
			--next-tag "v$(NEXT_VERSION)" | sed -i.bak "$$((line_num-1)) r /dev/stdin" "$(OUTPUT)";\
		echo "Created the ChangeLog: $(OUTPUT)";\
		rm "$(OUTPUT).bak";\
	fi
