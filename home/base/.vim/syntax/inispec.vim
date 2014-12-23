
syn match specComment "\v#.*"
highlight link specComment Comment

syn match sectionMatch '^ *SECTION .*'
syn match sectionMatch '^ *SUBSECTION .*'
syn match propertyMatch '^ *PROPERTY .*'
syn match sectionMatch '^ *SECTION .*'

hi sectionHighlight ctermfg=Red
hi propertyHighlight ctermfg=Blue

hi def link sectionMatch sectionHighlight
hi def link propertyMatch propertyHighlight
