# Development Configuration and Tools

This repository holds development environments, build descriptions and scripts that I use whil programming. 

## Vim Setup

I use vim and tmux together to create a lightweight IDE-like environment to accomplish various 
programming tasks. Some plugins have been added as well as some settings via the `.vimrc` file. 
These changes are performed by the nix build to distribute a modified vim. The current workflows 
it attempts to serve are

1. **LaTeX Document Creation**. I followed the philosophy laid out by 
[Gilles Castel](https://castel.dev/post/lecture-notes-1/) to create a LaTeX development 
environment. Any environment created using the modded vim must also have the PDF editor 
[zathura](https://pwmt.org/projects/zathura/). After writing a file,  zathura will automatically 
launch with a PDF build.

2. **Nix Package Development**. The vim editor supports the nix language syntax. Further, this 
configuration manager is based on nix itself. It provides tools like a repl and shell for 
common development tasks. 

3. **(TODO) Kind2 SMT Solver Verification**. The editor supports syntax highlighting of the lustre
synchronous data flow language. Further, there exists a SMT solver (Kind2) package that can verify
properties/contracts written in the lustre comments. 

Further plugins/setting:

1. `fugitive` - git functionality.

2. `airline` - superior status bar.

3. `youcompleteme` - code completion.

5. `ultisnips` - macros for common code snippets. This is useful for LaTeX. For example 
typing "eq" and then hitting `<tab>` will create an equation block with the cursor positioned to
write math.

5. Spell Checking. Hit `<C-l>` to correct the last recognized mistake. 
