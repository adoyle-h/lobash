# FAQ

## Why not support other shells?

Bash and Zsh are the most prevalent shells in the world. Their shell script syntaxes are similar.
It is too complex to compatible with other shells, and benefit limited.

## Why ./bin/lobash mod not always work?

Many Lobash modules are dependent on variables in current shell environment which are not shareable in sub-shell environments.
And the `nameref` feature not work as command arguments.

It creates new sub-shell when invoke `./bin/lobash`. So many Lobash modules will not work.

## Why source script, not execute command?

Read [this answer](https://superuser.com/q/176783) to know the difference between executing and sourcing of scripts.
