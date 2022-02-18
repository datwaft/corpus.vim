if exists("b:current_syntax")
  finish
endif

syntax case match

syntax match corpusTitleDelimiter /=\{3,}/ oneline
syntax region corpusTitle matchgroup=corpusTitleDelimiter start=/=\{3,}/ end=/=\{3,}/

syntax match corpusExpectedResultDelimiter /-\{3}/ oneline
syntax region corpusExpectedResult matchgroup=corpusExpectedResultDelimiter start=/-\{3}/ end=/\ze=\{3,}/ contains=corpusNode

syntax match corpusNodeDelimiter /[()]/ contained containedin=corpusNode
syntax region corpusNode matchgroup=corpusNodeDelimiter start=/(/ end=/)/ contained contains=corpusNodeName,corpusNode,corpusFieldName containedin=ExpectedResult
syntax match corpusNodeName /\w\+/ contained containedin=corpusNode
syntax match corpusFieldName /\w\+:/ contained containedin=corpusNode

highlight def link corpusTitleDelimiter Comment
highlight def link corpusTitle Title

highlight def link corpusExpectedResultDelimiter Comment

highlight def link corpusNodeDelimiter Comment
highlight def link corpusNodeName Function
highlight def link corpusFieldName Keyword

syntax sync fromstart

let b:current_syntax = "corpus"
