# Pantoglot

Analyze source code language, LOC and SLOC breakdown for a given file-tree or file.

Given a path to a file or directory, excluding `.git` and its contents, symlinks, and any non-text files, attempt to identify the language and calculate the LOC/SLOC using [Linguist](//github.com/github/linguist) and output results in JSON.

## Usage

The simplest method of utilization is via docker using the public image and provided bash wrapper in `./bin`:

```
$ bin/docker-pantoglot /path/to/input >> output.json
```

Alternatively, install the gem locally. (Note that the dependency on Linguist inherits added dependency complexities requiring [environment-specific resolution](https://github.com/github/linguist#dependencies).)

```
$ gem install pantoglot
```
