# Contribution

## Any comments and suggestions are always welcome

**Before open an issue/discussion/PR, You should search related issues/discussions/PRs first** for avoiding to create duplicated links.

- For new feature request, open a [discussion][], describe your demand concisely and clearly.
- For new feature submit, open a [PR][], describe your demand and design concisely and clearly.
- For bug report, open an [issue][], describe the bug concisely and clearly.
- For bug fix, open a [PR][], concisely and clearly describe what you fixed.
- For question and suggestion, open a [discussion][].
- For anything not mentioned above, open a [discussion][].

Do not post duplicated and useless contents like `+1`, `LOL`. React to comments with emoji instead of.

你可以使用中文反馈意见。但希望你尽可能使用英文，不要中英文混杂，而是写下完整的英文语句。
因为我们处于国际社区，英文更通用，方便外国人阅读理解你的意见。
(Please communicate in English as much as possible)

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

[tags]: https://github.com/adoyle-h/lobash/tags
[issue]: https://github.com/adoyle-h/lobash/issues
[discussion]: https://github.com/adoyle-h/lobash/discussions
[PR]: https://github.com/adoyle-h/lobash/pulls
