# Contributing

中文文档 [./CONTRIBUTING.zh.md](./CONTRIBUTING.zh.md)

## Any comments and suggestions are always welcome

**Before opening new Issue/Discussion/PR, you should search related [Issues][issue]/[Discussions][discussion]/[PRs][PR] first** for avoiding to create duplicated links.

- For new feature request, open a [discussion][], describe your demand concisely and clearly.
- For new feature submit, open a [PR][], describe your demand and design concisely and clearly.
- For bug report, open an [issue][], describe the bug concisely and clearly.
- For bug fix, open a [PR][], concisely and clearly describe what you fixed.
- For question and suggestion, open a [discussion][].
- For anything not mentioned above, open a [discussion][].

### No +1

Do not post duplicated and useless comments like `+1`, `LOL`, `Me too`, `I too would like to see this issue fixed.`, `When is this issue going to be fixed?`.
Such comments do not help fix issues. Please don't be offended if project admins delete such comments.
Please [react to comments with emoji][github-reaction] instead of.

### Use English AMAP

Please communicate in English as much as possible.

## Before making a Pull Request

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
- [ ] Test cases all passed without errors.
- [ ] Run `./tool/gen` to generate documents.
- [ ] Squash one Git commit per PR.
- [ ] Git message is [valid](./git-message.md).
<!-- - [ ] Run `./tools/check_module <path-to-your-module>` without error. (Currently this script not work) -->


<!-- Links -->

[tags]: https://github.com/adoyle-h/lobash/tags
[issue]: https://github.com/adoyle-h/lobash/issues
[discussion]: https://github.com/adoyle-h/lobash/discussions
[PR]: https://github.com/adoyle-h/lobash/pulls
[github-reaction]: https://github.blog/2016-03-10-add-reactions-to-pull-requests-issues-and-comments/
