# Contributing

## 提建议，修 Bug，做贡献

欢迎提供任何建议或者意见。

**在创建新的 Issue/Discussion/PR 之前，你必须先搜索相关 [Issue][]/[Discussion][]/[PR][]**，避免创建重复的链接。

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

对于非英语母语的人，请尽可能使用英语交流。
推荐使用 [DeepL Translator](https://www.deepl.com/translator)。

你也可以使用中文反馈意见。不过希望你尽可能使用英文。
因为我们处于国际社区，英文更通用，方便外国人阅读理解你的意见。
注意不要中英文混杂（专业词汇除外），请写完整的英文或中文语句。

## 创建 Pull Request 之前

在做贡献之前，请阅读一下链接。

- [Developer Certificate of Origin](./dco.md)
- [Code Styles](./code-styles.md)
- [Git Message Style](./git-message.md)
- [How to write functions](./how-to-write-functions.md)
- [How to write modules](./how-to-write-modules.md)
- [Module Metadata](./module-metadata.md)
- [Pipeline Module](./pipeline-module.md)
- [Internal Modules](./internal-modules.md)
- [Test](./test.md)

## 创建 Pull Request

所有 PR 必须遵守以下条件。

- [ ] Git message 必须[有效](./git-message.md)。
- [ ] 代码风格检查通过。
- [ ] 测试案例全部通过，无 error。
- [ ] 每个 PR 只有一个 Git commit。
- [ ] 所有 git commit 都已签署 [DCO](./dco.md)。
- [ ] 一个模块一个公共函数。
- [ ] 运行 `./tool/gen` 生成文档。
<!-- - [ ] 运行 `./tools/check_module <path-to-your-module>` 无措。 (当前这个脚本无效) -->


<!-- Links -->

[issue]: https://github.com/adoyle-h/lobash/issues
[discussion]: https://github.com/adoyle-h/lobash/discussions
[PR]: https://github.com/adoyle-h/lobash/pulls
[github-reaction]: https://github.blog/2016-03-10-add-reactions-to-pull-requests-issues-and-comments/
