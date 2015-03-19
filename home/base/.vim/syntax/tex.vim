
syn match texComment "%.*"
syn match texCommand "\\\('\|[^ {[]*\)"
syn region texMath start=/\v\$/ end=/\v\$/

highlight link texComment Comment
highlight texCommand ctermfg=green
highlight texMath ctermfg=red

let b:current_syntax = "simple_tex"
