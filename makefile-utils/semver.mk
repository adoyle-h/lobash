# Source Code: https://github.com/adoyle-h/makefile-utils

SEMVER_BIN ?= makefile-utils/semver

# @hide @target makefile-utils/semver  Download semver tool
${SEMVER_BIN}:
	@mkdir -p $$(dirname '$@')
	@echo '[makefile-utils] To download semver-tool'
	@curl -Lo '$@' https://raw.githubusercontent.com/fsaintjacques/semver-tool/master/src/semver
	@chmod +x '$@'

.PHONY: GIT_VERSION
# @desc Print current version (Most recent "v*.*.*" in git tag list)
GIT_VERSION:
	@VERSION="$$(git describe --tags --abbrev=0 --match 'v*.*.*' 2>/dev/null)";\
	echo "$${VERSION:-v0.0.0}"

# @target semver-major  Print next major version (x) based on current git tag
# @target semver-minor  Print next minor version (y) based on current git tag
# @target semver-patch  Print next patch version (z) based on current git tag
.PHONY: $(addprefix semver-,major minor patch)
$(addprefix semver-,major minor patch): ${SEMVER_BIN}
	@${SEMVER_BIN} bump $(subst semver-,,$@) "$(shell $(MAKE) -s GIT_VERSION)"
