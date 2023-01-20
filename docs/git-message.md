# Git Commit Message Style

Generally follows the [Conventional Commits v1.0.0](https://www.conventionalcommits.org/en/v1.0.0/).

## Commit Message Format

```
<type>[(scope)][!]: <description>

[optional body]

[optional footer]
```

`[(scope)]` is optional.

## Type

Must be one of the following:

- **build**: Changes that affect the build system or external dependencies
- **ci**: Changes to our CI configuration files and scripts
- **docs**: Documentation only changes
- **feat**: A new feature
- **fix**: A bug fix
- **perf**: A code change that improves performance
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- **test**: Adding missing tests or correcting existing tests
- **chore**: Other changes that don't modify src or test files


## Breaking Change

Commit message with optional `!` to draw attention to breaking change.

```
chore!: drop Node 6 from testing matrix

BREAKING CHANGE: dropping Node 6 which hits end of life in April
```

A commit that has the text `BREAKING CHANGE:` at the beginning of its optional body or footer section
introduces a breaking API change (correlating with MAJOR in semantic versioning).
A BREAKING CHANGE can be part of commits of any type.

## Sign the DCO for PR

Please sign our Developer Certificate of Origin (DCO) before sending pull requests. For any code changes to be accepted, the DCO must be signed. It's very simple. See [this document](./dco.md).

## Squash git commits for PR

Each Pull Request should do one thing in only one commit.

You can use `git rebase -i` to squash some commits into one.
