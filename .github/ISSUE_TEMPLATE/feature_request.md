---
name: Feature request
about: Suggest an idea for this project
title: ''
labels: feature request
assignees: adoyle-h

---

<!-- You can describe it in English or Chinese -->

## Is your feature request related to a problem? Please describe.
<!-- A clear and concise description of what the problem is. Ex. I'm always frustrated when [...] -->

## Describe the solution you'd like
<!-- A clear and concise description of what you want to happen. -->

## Provide test cases
<!-- Refer to .bats files under test/modules/ folder. For Example -->

```
@test "l.str_len ''" {
  run l.str_len ''
	assert_success
	assert_output 0
}

@test "l.str_len hello" {
  run l.str_len "hello"
	assert_success
	assert_output 5
}

@test "l.str_len ' hello '" {
  run l.str_len " hello "
	assert_success
	assert_output 7
}
```

## Additional context
<!-- Add any other context or screenshots about the feature request here. -->

-----

<!-- 你可以用英文或者中文来描述。请尽量用英文，因为你的想法或许能帮助到国外的朋友 -->

## 你想要的新特性跟什么问题相关？请描述
<!-- 简洁地描述问题所在... -->

## 描述你期望的解决方案

## 提供测试案例
<!-- 参考 test/modules/ 下的 .bats 文件，例如 -->

```
@test "l.str_len ''" {
  run l.str_len ''
	assert_success
	assert_output 0
}

@test "l.str_len hello" {
  run l.str_len "hello"
	assert_success
	assert_output 5
}

@test "l.str_len ' hello '" {
  run l.str_len " hello "
	assert_success
	assert_output 7
}
```

## 附加信息
<!-- 在这里填写其他相关信息 -->
