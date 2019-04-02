if exists("b:current_syntax")
	finish
endif

let b:current_syntax = "cds"

syntax keyword cdsKeyword entity namespace key to on
syntax keyword cdsType Integer String Association to Decimal Boolean
highlight link cdsKeyword Keyword
highlight link cdsType Constant
