# Source Code: https://github.com/adoyle-h/makefile-utils

# It's inspired from https://gist.github.com/prwhite/8168133?permalink_comment_id=2278355#gistcomment-2278355

# @desc Print all Makefile targets and usages
help:
	$(eval GREEN  := \033[32m)
	$(eval YELLOW := \033[33m)
	$(eval WHITE  := \033[37m)
	$(eval RESET  := \033[0m)
	$(eval TARGET_MAX_CHAR_NUM := 25)

	@printf 'Usage: make %b<target>%b\n\n' '${GREEN}' '${RESET}'

	@echo 'Target:'
	@# https://www.gnu.org/software/make/manual/html_node/Special-Targets.html
	@awk '/[-_/.a-zA-Z0-9]+:.+=/ { next } \
		/^.(PHONY|SUFFIXES|DEFAULT|PRECIOUS|INTERMEDIATE|NOTINTERMEDIATE|SECONDARY|SECONDEXPANSION|DELETE_ON_ERROR|IGNORE|LOW_RESOLUTION_TIME|SILENT|EXPORT_ALL_VARIABLES|NOTPARALLEL|ONESHELL|POSIX|NOEXPORT|MAKE):/ { next } \
		/^[-_/.a-zA-Z0-9]+:/ { \
		is_hide = match(lastLine, /^# .*@hide/); \
		if (is_hide) next; \
		target = substr($$1, 0, index($$1, ":")-1); \
		desc = match(lastLine, /^# @desc +(.*)/); \
		if (desc) { \
			desc = substr(lastLine, RSTART + 8, RLENGTH); \
			printf "  $(GREEN)%-$(TARGET_MAX_CHAR_NUM)s $(YELLOW)%s$(RESET)\n", target, desc; \
		} else { \
			printf "  $(GREEN)%-$(TARGET_MAX_CHAR_NUM)s$(RESET)\n", target; \
		} \
	} { lastLine = $$0 }' $(MAKEFILE_LIST)

	@# Show @target
	@grep -h -E '^# @target [-_/.a-zA-Z0-9]+' $(MAKEFILE_LIST) |\
		sed -E 's|^# @target ([-_/.a-zA-Z0-9]+) *(.*)?|\1␤\2|' |\
		awk -F '␤' '{ printf "  $(GREEN)%-$(TARGET_MAX_CHAR_NUM)s $(YELLOW)%s$(RESET)\n",$$1,$$2 }'
