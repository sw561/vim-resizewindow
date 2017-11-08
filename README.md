More intuitive way to resize windows in Vim
===========================================

[![Build Status](https://travis-ci.org/sw561/vim-resizewindow.svg?branch=master)](https://travis-ci.org/sw561/vim-resizewindow)

This plugin provides direction based resizing of windows.

Using `<C-W>+`, `<C-W>-`, `<C-W><`, and `<C-W>>` to resize windows can be
disorienting since `<C-W><` and `<C-W>>` look like they should always be moving
the window divider left and right, respectively, but they don't if you're in the
right most window.

Customization
=============

Use the `<Plug>ResizeWindow[DIR]` mappings to set your preferred key bindings.
E.g.
```
nmap <M-K> <Plug>ResizeWindowUp
nmap <M-J> <Plug>ResizeWindowDown
nmap <M-H> <Plug>ResizeWindowLeft
nmap <M-L> <Plug>ResizeWindowRight
```
Note that since `<Plug>ResizeWindow[DIR]` are themselves mappings, `noremap` will
not work.
