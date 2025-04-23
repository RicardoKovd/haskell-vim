Syntax Highlighting Haskell
=========================================================

I was unhappy with the Haskell scripts that are
shipped with vim, therefore I decided to make my
own based on [idris-vim][].

I hope you find this useful.

![Screenshot](http://raichoo.github.io/images/haskell-vim.png)

## Features

* Covers a broader spectrum of keywords
* Highlighting for new features like type families, pattern synonyms, arrow syntax, recursive do, role annotations, QuasiQuotation
* More contextual highlighting (e.g. highlight 'as' or 'family' only in appropriate places)
* Smarter indentation
* [UnicodeSyntax](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/unicode_syntax.html#extension-UnicodeSyntax) extension support
* [HexFloatLiterals](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/hex_float_literals.html#extension-HexFloatLiterals) extension support
* Special highlight Boolean Ordering syntax
* Highlight `return`, `pure`
* Highlight `(`,`)`,`[`,`]`,`{`,`}` with Type, 
* Fix #132

## Installation

Any package manager you like

## Configuration

### Features

To enable the features you would like to use, just add the according line to your `.vimrc`.

```viml
let g:haskell_enable_quantification = 1    " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1       " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1       " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1  " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1         " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1   " to enable highlighting of `static`
let g:haskell_backpack = 1                 " to enable highlighting of backpack keywords
let g:haskell_enable_boolean = 1           " to enable highlighting of `True` and `False`
let g:haskell_enable_ordering = 1          " to enable highlighting of  `LT` and `EQ` and `GT`
let g:haskell_enable_monad_return = 1      " to enable highlighting of `return`
let g:haskell_enable_applicative_pure = 1  " to enable highlighting of `pure`
let g:haskell_enable_delimiter_is_type = 1 " to enable highlighting of `(` and `)` and `[` and `]` and `{` and `}`
```
or neovim
```lua
vim.g.haskell_enable_quantification = 1    -- to enable highlighting of `forall`
vim.g.haskell_enable_recursivedo = 1       -- to enable highlighting of `mdo` and `rec`
vim.g.haskell_enable_arrowsyntax = 1       -- to enable highlighting of `proc`
vim.g.haskell_enable_pattern_synonyms = 1  -- to enable highlighting of `pattern`
vim.g.haskell_enable_typeroles = 1         -- to enable highlighting of type roles
vim.g.haskell_enable_static_pointers = 1   -- to enable highlighting of `static`
vim.g.haskell_backpack = 1                 -- to enable highlighting of backpack keywords
vim.g.haskell_enable_boolean = 1           -- to enable highlighting of `True` and `False`
vim.g.haskell_enable_ordering = 1          -- to enable highlighting of  `LT` and `EQ` and `GT`
vim.g.haskell_enable_monad_return = 1      -- to enable highlighting of `return`
vim.g.haskell_enable_applicative_pure = 1  -- to enable highlighting of `pure`
vim.g.haskell_enable_delimiter_is_type = 1 -- to enable highlighting of `(` and `)` and `[` and `]` and `{` and `}`
```

