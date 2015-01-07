" Vim syntax file
" Language:	C++ special highlighting for Boost classes and methods
" Maintainer:	ShenYu
" Last Change:	2013 October 11

syn keyword cppBoost		elapsed elapsed_max elapsed_min

syn keyword cppBoosttype		boost timer	

" Default highlighting
if version >= 508 || !exists("did_cpp_syntax_inits")
  if version < 508
    let did_cpp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink cppBoost				Identifier
  HiLink cppBoosttype         Type
  delcommand HiLink
endif
