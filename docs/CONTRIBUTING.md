# Contributing

中文文档 [./CONTRIBUTING.zh.md](./CONTRIBUTING.zh.md)

## Any comments and suggestions are always welcome

**Before opening new Issue/Discussion/PR, you should search the existing to avoid duplicates.**

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

### Use English

We prefer all communications and codes to be in English.

For non-native English speakers, it is recommended to use [DeepL Translator](https://www.deepl.com/translator).

## Learning rules before coding

- [Git Commit Message Style][git-style]
- [Code Styles][code-style]
- [How to write functions](./how-to-write-functions.md)
- [How to write modules](./how-to-write-modules.md)
- [Module Metadata](./module-metadata.md)
- [Pipeline Module](./pipeline-module.md)
- [Internal Modules](./internal-modules.md)
- [Test](./test.md)

## Checklist for Pull Request
<!-- Fill [x] means checked. -->

- Code Style
  - [ ] No misspellings in code and documentations.
  - [ ] My code follows the style guidelines of this project. And code style lint passed if it exists.
  - [ ] No new code style warnings.
- Git Style
  - [ ] My commit message follow the [git commit message style][git-style] of this project.
  - [ ] Squashed git commits into one.
  - [ ] Commits signed the [DCO][].
- Test
  - [ ] I have added tests that prove my fix is effective or that my feature works.
  - [ ] All test cases passed locally without errors.
  - [ ] New and existing unit tests pass locally with my changes.
- Documentation
  - [ ] I have commented my code, particularly in hard-to-understand areas.
  - [ ] I have made corresponding changes to the documentation.
- Dependency
  - [ ] Any dependent changes have been merged and published in downstream modules.
- Other
  - [ ] One module one public function.
  - [ ] Run `./tool/gen` to generate documents.
  <!-- - [ ] Run `./tools/check_module <path-to-your-module>` without error. (Currently this script not work) -->


<!-- Links -->

[issue]: https://github.com/adoyle-h/lobash/issues
[discussion]: https://github.com/adoyle-h/lobash/discussions
[PR]: https://github.com/adoyle-h/lobash/pulls
[github-reaction]: https://github.blog/2016-03-10-add-reactions-to-pull-requests-issues-and-comments/
[DCO]: https://gcg.adoyle.me/doc/dco/
[git-style]: https://gcg.adoyle.me/doc/git-style/
[code-style]: https://gcg.adoyle.me/doc/code-style/bash/
