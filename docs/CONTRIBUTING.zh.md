# Contributing

## 欢迎提供任何建议或者意见

**在创建新的 Issue/Discussion/PR 之前，你必须先搜索相关内容，避免重复。**

- 请求新功能。请开一个 [discussion][]，简短且清晰地描述你的需求。
- 提交新功能。请开一个 [PR][]，简短且清晰地描述你的需求和设计。
- 报告 BUG。请开一个 [issue][]，简短且清晰地描述你发现的问题。
- 修复 BUG。请开一个 [PR][]，简短且清晰地描述你修了什么。
- 提问和建议。请开一个 [discussion][]。
- 其他上面未提到的内容，请开一个 [discussion][] 来讨论。

### 禁止 +1

不要发重复或无用的内容，比如 `+1`，`哈哈`，`附议`，`我希望这问题能够得到修复`，`这问题啥时候修好？`。

这样的评论无助于问题的解决。如果项目管理员删除了此类评论，请别生气。

请[贴 emoji 标签反馈到评论上](https://github.blog/2016-03-10-add-reactions-to-pull-requests-issues-and-comments/)。

### 尽量用英文

我们希望所有的通信交流以及代码都用英文。

对于非英语母语的用户，推荐使用 [DeepL Translator](https://www.deepl.com/translator)。

因为我们处于国际社区，英文更通用，方便外国人阅读理解你的意见。

如果你非常着急解决棘手的问题，也可以使用中文反馈意见。
注意不要中英文混杂（专业词汇除外），请写完整的英文或中文语句。

## 编码之前，请先学习规则

- [Git Commit Message 风格][git-style]
- [Code Styles](./code-styles.md)
- [How to write functions](./how-to-write-functions.md)
- [How to write modules](./how-to-write-modules.md)
- [Module Metadata](./module-metadata.md)
- [Pipeline Module](./pipeline-module.md)
- [Internal Modules](./internal-modules.md)
- [Test](./test.md)

## Pull Request 检查表
<!-- 填入 [x] 表示已检查。-->

- 代码风格
  - [ ] 代码和文档中没有拼写错误。
  - [ ] 我的代码遵循本项目的风格指南。并通过了代码风格的 lint（如果它存在的话）。
  - [ ] 没有新增的代码风格警告。
- Git风格
  - [ ] 我的提交信息遵循本项目的 [Git Commit Message 风格][git-style]。
  - [ ] 将 Git Commit 压缩 (squash) 成一个。
  - [ ] 提交时签署了 [DCO][]。
- 测试
  - [ ] 我已经添加了测试，证明我的修复是有效的，或者新功能可以工作。
  - [ ] 所有测试案例都在本地通过，没有错误。
  - [ ] 新的和现有的单元测试在我的修改下在本地通过。
- 文档
  - [ ] 我给代码写了注释，特别是在难以理解的地方。
  - [ ] 我对文档做了相应的修改。
- 依赖
  - [ ] 任何依赖的修改都已经在下游模块中合并和发布。
- 其他
  - [ ] 一个模块一个公共函数。
  - [ ] 运行 `./tool/gen` 生成文档。
  <!-- - [ ] 运行 `./tools/check_module <path-to-your-module>` 无措。 (当前这个脚本无效) -->


<!-- Links -->

[issue]: https://github.com/adoyle-h/lobash/issues
[discussion]: https://github.com/adoyle-h/lobash/discussions
[PR]: https://github.com/adoyle-h/lobash/pulls
[github-reaction]: https://github.blog/2016-03-10-add-reactions-to-pull-requests-issues-and-comments/
[DCO]: https://gcg.adoyle.me/doc/dco/
[git-style]: https://gcg.adoyle.me/doc/git-style.zh/
