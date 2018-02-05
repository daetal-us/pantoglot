# Pantoglot

Analyze source code language, LOC and SLOC breakdown for a given filetree or file.

Given a path to a file or directory, excluding `.git` and its contents, symlinks, and any non-text files, attempt to identify the language and calculate the LOC/SLOC using [Linguist](//github.com/github/linguist) and output results in JSON.

## Usage

The simplest method of utilization is via docker either building and running the docker image locally or using the public image:

```
$ docker run -v local/path/to/repo:/repo -it polyglot /repo
```

Or, install the gem locally. (Note that the dependency on Linguist inherits added dependency complexities requiring [environment-specific resolution](https://github.com/github/linguist#dependencies).)

```
$ gem install pantoglot
```

##

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
