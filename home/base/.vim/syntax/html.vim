syn region htmlComment start="<!--" end="-->"
highlight link htmlComment Comment

syn region htmlTag start=/\v\</ end=/\v\>/
highlight htmlTag ctermfg=green

let b:current_syntax = "simple_html"
