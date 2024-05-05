# sphinx-pre-commit
A [pre-commit](https://pre-commit.com/) hook for keeping the sphinx doc up-to-date.


## Configuration

Example configuration in pre-commit-config.yaml:
```yaml
-   repo: https://github.com/ElijahSey/sphinx-pre-commit
    rev: v1.0.0
    hooks:
    -   id: sphinx-apidoc
        args: [--force, --no-toc, -o, docs, src] # <-- Default Configuration
```

The default configuration works best when you already have your sphinx documentation created with sphinx-quickstart. The parameter `--force` is crucial for this hook to work, as it allows for overwriting existing .rst files. The parameter `--no-toc` tells sphinx to not touch the table of contents (modules.rst). This allows for customization of this file. The parameters `-o` (to specify the path to the .rst files) as well as the positional parameter at last (to specify the root path of the source code) are required.

When specifying arguments, insert a comma wherever there would be a space on the command line
The arguments are directly passed to the [sphinx-apidoc](https://www.sphinx-doc.org/en/master/man/sphinx-apidoc.html) command.

## How does it work?

First, the git status is checked and saved.
Then, the sphinx-apidoc command is executed.
Finally the git status is checked again and compared to the previously gathered status.
If there are any differences, which means that .rst files were modified, the hook will fail.
The effective changes stay in the working tree, so they only have to be staged before the commit can be triggered again.