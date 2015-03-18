syn match pythonComment "#.*"
highlight link pythonComment Comment

syn region pythonString1 start=/\v"/ skip=/\v\\./ end=/\v"/
syn region pythonString2 start=/\v'/ skip=/\v\\./ end=/\v'/
syn region pythonString3 start=/\v'''/ skip=/\v\\./ end=/\v'''/
highlight link pythonString1 String
highlight link pythonString2 String
highlight link pythonString3 String

let b:current_syntax = "simple_python"
