" Comments range (handles multiple file types)
function! Comment() range
  if &filetype == "c" || &filetype == "php" || &filetype == "css"
    execute ":" . a:firstline . "," . a:lastline . 's/^\(.*\)$/\/\* \1 \*\//'
  elseif &filetype == "html" || &filetype == "xml" || &filetype == "xslt" || &filetype == "xsd"
    execute ":" . a:firstline . "," . a:lastline . 's/^\(.*\)$/<!-- \1 -->/'
  else
    if &filetype == "java" || &filetype == "cpp" || &filetype == "cs"
      let commentString = "//"
    elseif &filetype == "vim"
      let commentString = '"'
    else
      let commentString = "#"
    endif
    execute ":" . a:firstline . "," . a:lastline . 's,^,' . commentString . ','
  endif
endfunction

" Uncomments range (handles multiple file types)
function! Uncomment() range
  if &filetype == "c" || &filetype == "php" || &filetype == "css" || &filetype == "html" || &filetype == "xml" || &filetype == "xslt" || &filetype == "xsd"
    " [[VimTip271]]
    execute ":" . a:firstline . "," . a:lastline . 's/^\([/(]\*\|<!--\) \(.*\) \(\*[/)]\|-->\)$/\2/'
  else
    if &filetype == "java" || &filetype == "cpp" || &filetype == "cs"
      let commentString = "//"
    elseif &filetype == "vim"
      let commentString = '"'
    else
      let commentString = "#"
    endif
    execute ":" . a:firstline . "," . a:lastline . 's,^' . commentString . ',,'
  endif
endfunction

" Uncomments from current line up to last line that's commented
function! UncommentBlock()
  if &filetype == "c" || &filetype == "php" || &filetype == "css" || &filetype == "html" || &filetype == "xml" || &filetype == "xslt" || &filetype == "xsd"
    echoerr "TODO: haven't implemented UncommentBlock; use Uncomment instead"
  else
    if &filetype == "java" || &filetype == "cpp" || &filetype == "cs"
      let commentString = '\/\/'
      let firstChar = '/'
    elseif &filetype == "vim"
      let commentString = '"'
      let firstChar = '"'
    else
      let commentString = '#'
      let firstChar = '#'
    endif
    if version < 600 && strlen( commentString ) > 1
      echoerr "TODO: haven't implemented multi-character comment block"
    else
      " TODO: doesn't handle case where the block ends at end of file
      execute ':.,/^\(\(' . commentString . '\)\@!\|[^' . firstChar . ']\|$\)/-1s/^' . commentString . "//"
    endif
  endif
endfunction

