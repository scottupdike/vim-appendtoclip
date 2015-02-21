# vim-appendtoclip
vim plugin for appending to the default register

## Intro

The **AppendToClip** plugin lets you append to the default register, and the
clipboard, and primary registers if the *clipboard* option contains 'unnamed'
or 'unnamedplus'.

## Functionality

```vim
<Space>yy
```
Append line(s) to the default register, '"'. Also append to the clipboard,
'\*', and primary, '+', registers if the *clipboard* option contains 'unnamed'
and 'unnamedplus', respectively.

```vim
<Space>dd
```
Delete and append line(s) to the default register, '"'. Also append to the
clipboard, '\*', and primary, '+', registers if the *clipboard* option contains
'unnamed' and 'unnamedplus', respectively.

## Options

```vim
g:appendtoclip_leader
```
The key used as the leader to the mappings. The default is `<Space>`.

## License
The AppendToClip plugin is released under Vim's license.

