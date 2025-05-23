" syntax highlighting for haskell
"
" Heavily modified version of the haskell syntax
" highlighter to support haskell.
"
" author: raichoo (raichoo@googlemail.com)

if version < 600
	syn clear
elseif exists("b:current_syntax")
	finish
endif

syn spell notoplevel
syn match haskellRecordField contained containedin=haskellBlock
	\ "[_a-z][a-zA-Z0-9_']*\(,\s*[_a-z][a-zA-Z0-9_']*\)*\_s\+\(::\|∷\)\_s"
	\ contains=
	\ haskellIdentifier,
	\ haskellOperators,
	\ haskellSeparator,
	\ haskellParens
syn match haskellTypeSig
	\ "^\s*\(where\s\+\|let\s\+\|default\s\+\)\?[_a-z][a-zA-Z0-9_']*#\?\(,\s*[_a-z][a-zA-Z0-9_']*#\?\)*\_s\+\(::\|∷\)\_s"
	\ contains=
	\ haskellWhere,
	\ haskellLet,
	\ haskellDefault,
	\ haskellIdentifier,
	\ haskellOperators,
	\ haskellSeparator,
	\ haskellParens
syn keyword haskellWhere where
syn keyword haskellLet let
syn keyword haskellDeriveKeyword deriving anyclass instance newtype stock via contained
syn match haskellDerive "deriving\(\s\+instance\)\?\(\s\+anyclass\|\s\+newtype\|\s\+stock\|\s\+.\{-}\_s\+via\)\?"
	\ contains=
	\ haskellDeriveKeyword,
	\ haskellParens,
	\ haskellType
syn keyword haskellDeclKeyword module class instance newtype in
syn match haskellDecl "\<\(type\|data\)\>\s\+\(\<family\>\)\?"
syn keyword haskellDefault default
syn keyword haskellImportKeywords import qualified safe as hiding contained
syn keyword haskellForeignKeywords foreign export import ccall safe unsafe interruptible capi prim contained
syn region haskellForeignImport start="\<foreign\>" end="\_s\+\(::\|∷\)\s" keepend
	\ contains=
	\ haskellString,
	\ haskellOperators,
	\ haskellForeignKeywords,
	\ haskellIdentifier
syn match haskellImport "^\s*\<import\>\s\+\(\<safe\>\s\+\)\?\(\<qualified\>\s\+\)\?.\+\(\s\+\<as\>\s\+.\+\)\?\(\s\+\<hiding\>\)\?"
	\ contains=
	\ haskellParens,
	\ haskellOperators,
	\ haskellImportKeywords,
	\ haskellType,
	\ haskellLineComment,
	\ haskellBlockComment,
	\ haskellString,
	\ haskellPragma
syn keyword haskellKeyword do case of

if get(g:, 'haskell_enable_static_pointers', 0)
	syn keyword haskellStatic static
endif

syn keyword haskellConditional if then else
syn match haskellNumber "\<[0-9]\+\>\|\<[0-9_]\+\>\|\<0[xX][0-9a-fA-F_]\+\>\|\<0[oO][0-7_]\+\>\|\<0[bB][10_]\+\>"
syn match haskellFloat "\v<[0-9]%(_*[0-9])*\.[0-9]%(_*[0-9])*%(_*[eE][-+]?[0-9]%(_*[0-9])*)?>|<[0-9]%(_*[0-9])*_*[eE][-+]?[0-9]%(_*[0-9])*>|<0[xX]_*[0-9a-fA-F]%(_*[0-9a-fA-F])*\.[0-9a-fA-F]%(_*[0-9a-fA-F])*%(_*[pP][-+]?[0-9]%(_*[0-9])*)?>|<0[xX]_*[0-9a-fA-F]%(_*[0-9a-fA-F])*_*[pP][-+]?[0-9]%(_*[0-9])*>"
syn match haskellSeparator "[,;]"

if get(g:, 'haskell_enable_delimiter_is_type', 0)
	syn region haskellParens matchgroup=haskellType start="(" end=")" contains=TOP,haskellTypeSig,@Spell
	syn region haskellBrackets matchgroup=haskellType start="\[" end="]" contains=TOP,haskellTypeSig,@Spell
	syn region haskellBlock matchgroup=haskellType start="{" end="}" contains=TOP,haskellBlockComment,@Spell
else
	syn region haskellParens matchgroup=haskellDelimiter start="(" end=")" contains=TOP,haskellTypeSig,@Spell
	syn region haskellBrackets matchgroup=haskellDelimiter start="\[" end="]" contains=TOP,haskellTypeSig,@Spell
	syn region haskellBlock matchgroup=haskellDelimiter start="{" end="}" contains=TOP,@Spell
endif

syn keyword haskellInfix infix infixl infixr
syn keyword haskellBottom undefined error
syn match haskellOperators "[-!#$%&\*\+/<=>\?@\\^|~:∷.⇒→←⤚⤙⤜⤛★∀⦇⦈⊸]\+\|\<_\>"
syn match haskellQuote "\<'\+" contained
syn match haskellQuotedType "[A-Z][a-zA-Z0-9_']*\>" contained
syn region haskellQuoted start="\<'\+" end="\>"
	\ contains=
	\ haskellType,
	\ haskellQuote,
	\ haskellQuotedType,
	\ haskellSeparator,
	\ haskellParens,
	\ haskellOperators,
	\ haskellIdentifier
syn match haskellLineComment "---*\([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?$"
	\ contains=
	\ haskellTodo,
	\ @Spell
syn match haskellBacktick "`[A-Za-z_][A-Za-z0-9_\.']*#\?`"
syn match haskellIdentifier "[_a-z][a-zA-Z0-9_']*" contained
syn match haskellSpecialChar contained "\\\([0-9]\+\|o[0-7]\+\|x[0-9a-fA-F]\+\|[\"\\'&\\abfnrtv]\|^[A-Z^_\[\\\]]\)"
syn match haskellSpecialChar contained "\\\(NUL\|SOH\|STX\|ETX\|EOT\|ENQ\|ACK\|BEL\|BS\|HT\|LF\|VT\|FF\|CR\|SO\|SI\|DLE\|DC1\|DC2\|DC3\|DC4\|NAK\|SYN\|ETB\|CAN\|EM\|SUB\|ESC\|FS\|GS\|RS\|US\|SP\|DEL\)"
syn match haskellSpecialCharError contained "\\&\|'''\+"
syn match haskellCharacter "[^a-zA-Z0-9_']'\([^\\]\|\\[^']\+\|\\'\)'"lc=1 contains=hsSpecialChar,hsSpecialCharError
syn match haskellCharacter "^'\([^\\]\|\\[^']\+\|\\'\)'" contains=hsSpecialChar,hsSpecialCharError
syn region haskellString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=hsSpecialChar,@Spell

syn match haskellType "\<[A-Z][a-zA-Z0-9_']*\>"
syn region haskellBlockComment start="{-" end="-}"
	\ contains=
	\ haskellBlockComment,
	\ haskellTodo,
	\ @Spell
syn region haskellPragma start="{-#" end="#-}"
syn region haskellLiquid start="{-@" end="@-}"
syn match haskellPreProc "^#.*$"
syn keyword haskellTodo TODO FIXME HACK NOTE WARNING contained
" Treat a shebang line at the start of the file as a comment
syn match haskellShebang "\%^#!.*$"

if !get(g:, 'haskell_disable_TH', 0)
	syn match haskellQuasiQuoted "." containedin=haskellQuasiQuote contained
	syn region haskellQuasiQuote matchgroup=haskellTH start="\[[_a-zA-Z][a-zA-Z0-9._']*|" end="|\]"
	syn region haskellTHBlock matchgroup=haskellTH start="\[\(d\|t\|p\)\?|\|⟦" end="|]\|⟧" contains=TOP
	syn region haskellTHDoubleBlock matchgroup=haskellTH start="\[||" end="||]" contains=TOP
endif

if get(g:, 'haskell_enable_monad_return', 0)
	syn keyword haskellMonadReturn return
endif

if get(g:, 'haskell_enable_applicative_pure', 0)
	syn keyword haskellApplicativePure pure
endif

if get(g:, 'haskell_enable_typeroles', 0)
	syn keyword haskellTypeRoles phantom representational nominal contained
	syn region haskellTypeRoleBlock matchgroup=haskellTypeRoles start="type\s\+role" end="$" keepend
		\ contains=
		\ haskellType,
		\ haskellTypeRoles
endif

if get(g:, 'haskell_enable_quantification', 0)
	syn keyword haskellForall forall
endif

if get(g:, 'haskell_enable_recursivedo', 0)
	syn keyword haskellRecursiveDo mdo rec
endif

if get(g:, 'haskell_enable_arrowsyntax', 0)
	syn keyword haskellArrowSyntax proc
endif

if get(g:, 'haskell_enable_pattern_synonyms', 0)
	syn keyword haskellPatternKeyword pattern
endif

if get(g:, 'haskell_enable_boolean', 0)
	syn keyword haskellBoolean True False otherwise
endif

if get(g:, 'haskell_enable_ordering', 0)
	syn keyword haskellOrdering LT EQ  GT
endif

if get(g:, 'haskell_backpack', 0)
	syn keyword haskellBackpackStructure unit signature
	syn keyword haskellBackpackDependency dependency
endif

highlight def link haskellBottom Keyword
highlight def link haskellTH Boolean
highlight def link haskellIdentifier Function
highlight def link haskellForeignKeywords Structure
highlight def link haskellKeyword Keyword
highlight def link haskellDefault Keyword
highlight def link haskellConditional Conditional
highlight def link haskellNumber Number
highlight def link haskellFloat Float
highlight def link haskellSeparator Delimiter
highlight def link haskellDelimiter Delimiter
highlight def link haskellInfix Keyword
highlight def link haskellOperators Operator
highlight def link haskellQuote Operator
highlight def link haskellShebang Comment
highlight def link haskellLineComment Comment
highlight def link haskellBlockComment Comment
highlight def link haskellPragma SpecialComment
highlight def link haskellLiquid SpecialComment
highlight def link haskellString String
highlight def link haskellCharacter String
highlight def link haskellBacktick Operator
highlight def link haskellQuasiQuoted String
highlight def link haskellTodo Todo
highlight def link haskellPreProc PreProc
highlight def link haskellAssocType Type
highlight def link haskellQuotedType Type
highlight def link haskellType Type
highlight def link haskellListStructor Type
highlight def link haskellTupleStructor Type
highlight def link haskellImportKeywords Include

if get(g:, 'haskell_classic_highlighting', 0)
	highlight def link haskellDeclKeyword Keyword
	highlight def link haskellDeriveKeyword Keyword
	highlight def link haskellDecl Keyword
	highlight def link haskellWhere Keyword
	highlight def link haskellLet Keyword

	if get(g:, 'haskell_enable_pattern_synonyms', 0)
		highlight def link haskellPatternKeyword Keyword
	else
		highlight def link haskellPatternKeyword Structure
	endif

	if get(g:, 'haskell_enable_typeroles', 0)
		highlight! def link haskellTypeRoles Keyword
	else
		highlight def link haskellTypeRoles Structure
	endif
else
	highlight def link haskellDeclKeyword Structure
	highlight def link haskellDeriveKeyword Structure
	highlight def link haskellDecl Structure
	highlight def link haskellWhere Structure
	highlight def link haskellLet Structure
endif

if get(g:, 'haskell_enable_quantification', 0)
	highlight def link haskellForall Keyword
endif

if get(g:, 'haskell_enable_recursivedo', 0)
	highlight def link haskellRecursiveDo Keyword
endif

if get(g:, 'haskell_enable_arrowsyntax', 0)
	highlight def link haskellArrowSyntax Keyword
endif

if get(g:, 'haskell_enable_static_pointers', 0)
	highlight def link haskellStatic Keyword
endif

if get(g:, 'haskell_backpack', 0)
	highlight def link haskellBackpackStructure Structure
	highlight def link haskellBackpackDependency Include
endif

if get(g:, 'haskell_enable_boolean', 0)
	highlight def link haskellBoolean Boolean
endif

if get(g:, 'haskell_enable_ordering', 0)
	highlight def link haskellOrdering Constant
endif

if get(g:, 'haskell_enable_monad_return', 0)
	highlight def link haskellMonadReturn Function
endif

if get(g:, 'haskell_enable_applicative_pure', 0)
	highlight def link haskellApplicativePure Function
endif

let b:current_syntax = "haskell"
