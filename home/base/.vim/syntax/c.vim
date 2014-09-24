syn match cComment "//.*"
syn region cComment start="/\*" end="\*/"
highlight link cComment Comment

"syn region cString start=/\v"/ skip=/\v\\./ end=/\v"/
"highlight link cString String

let b:current_syntax = "simple_c"
