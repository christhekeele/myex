MyEx
====

Provides a globally available `Mix.Project`.

Synopsis
--------

A lot of people ask if they can install a package system wide to play around
with it in `iex`. Elixir (mercifully) doesn't handle dependencies this way–
you have to have an actual project to host the packages, and run `iex` in that
context.

Fortunately it's easy to simulate this behaviour by stashing a `Mixfile` in a
globally accessible place and making a globally available shell script that
executes `iex -S mix` inside that directory.

This project does that for you.

Installation
------------

Setup a new Mixfile at `~/.myex/mix.exs`:

```
mix archive.install https://github.com/christhekeele/myex/raw/master/myex.ez
mix myex.install
```

Install the CLI:

```
mix escript.install https://github.com/christhekeele/myex/raw/master/myex
```

Usage
-----

Add packages to `~/.myex/mix.exs` like normal. Start an `IEx` session with them
loaded by running `myex`. Run any command in context of the project by passing
it to `myex`. For example:

```sh
$ myex mix deps.get
$ myex
Running MyEx: iex -S mix...
Eshell V8.2  (abort with ^G)
```

Contributing
------------

[Pull requests](https://github.com/christhekeele/myex/pulls) and [bug reports](https://github.com/christhekeele/myex/issues) welcome!

Useful commands:

- `mix archive.build -o myex.ez`: build the archive
- `mix archive.install myex.ez`: install the archive
- `mix myex.install`: test the archive
- `mix escript.build`: build the escript
- `mix escript.install`: install the escript
- `myex ls -la`: test the escript