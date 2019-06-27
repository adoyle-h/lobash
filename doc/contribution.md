# Contribution

## Toc

<!-- MarkdownTOC GFM -->

- [First Read](#first-read)
- [Make a Pull Request](#make-a-pull-request)

<!-- /MarkdownTOC -->

## First Read

Read below links before making any contributions.

- [Developer Certificate of Origin](./dco.md)
- [Code Styles](./code-styles.md)
- [Git Message](./git-message.md)
- [How to write functions](./how-to-write-functions.md)
- [How to write modules](./how-to-write-modules.md)
- [Module Metadata](./module-metadata.md)
- [Pipeline Module](./pipeline-module.md)
- [Internal Modules](./internal-modules.md)
- [Test](./test.md)

## Make a Pull Request

All PRs should follow below conditions.

-[ ] One module one public function.
-[ ] Code style lint pass.
-[ ] Test cases without errors and skips.
-[ ] Squash one Git commit per PR.
-[ ] Git message is [valid](./git-message.md).
-[ ] Run `./bin/check_module <path-to-your-module>` without error.
