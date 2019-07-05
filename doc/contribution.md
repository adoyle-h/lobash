# Contribution

## Toc

<!-- MarkdownTOC GFM -->

- [Any suggestions are always welcome](#any-suggestions-are-always-welcome)
- [Before make a Pull Request](#before-make-a-pull-request)
- [Make a Pull Request](#make-a-pull-request)

<!-- /MarkdownTOC -->

## Any suggestions are always welcome

Any suggestions and contributions are always welcome. Please open an [issue][] to talk with me.

## Before make a Pull Request

Read below links before making any contributions.

- [Developer Certificate of Origin](./dco.md)
- [Code Styles](./code-styles.md)
- [Git Message Style](./git-message.md)
- [How to write functions](./how-to-write-functions.md)
- [How to write modules](./how-to-write-modules.md)
- [Module Metadata](./module-metadata.md)
- [Pipeline Module](./pipeline-module.md)
- [Internal Modules](./internal-modules.md)
- [Test](./test.md)

## Make a Pull Request

All PRs should follow below conditions.

- [ ] One module one public function.
- [ ] Code style lint pass.
- [ ] Test cases without errors and skips.
- [ ] Run `./tool/gen` to generate documents.
- [ ] Squash one Git commit per PR.
- [ ] Git message is [valid](./git-message.md).
- [ ] Run `./tools/check_module <path-to-your-module>` without error. (Currently this script not work)


<!-- Links -->

[issue]: https://github.com/adoyle-h/dotfiles/issues
