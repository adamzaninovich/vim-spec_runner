" spec_runner.vim - useful commands for running specs
" Maintainer:   Adam Zaninovich
" Version:      2.0.0
"
" Suggested Mappings:
" Run Specs on current line. Repeatable outside of spec
"   map <leader>t :call spec_runner#run_line()<cr>
" Run the current spec file. Repeatable outside of spec
"   map <leader>f :call spec_runner#run_file()<cr>
" Run the entire suite of specs
"   map <leader>T :call spec_runner#run('spec')<cr>
" Repeat whatever was last run
"   map <leader>r :call spec_runner#repeat()<cr>
"
" For all of these commands, when run inside a spec file,
" they will run that file (and line), when run in a non-
" spec file, they will run the last spec you ran them in.
"
" There is also a repeat function that will repeat the
" last spec you ran in the way that you run it.

function! spec_runner#run(filename)
  :w
  :silent !echo;echo;echo;echo;echo
  exec ":!rspec " . a:filename
endfunction

function! spec_runner#set_file()
  let s:file = @%
endfunction

function! spec_runner#set_line()
  let s:line = line('.')
endfunction

function! spec_runner#run_file(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
    if exists("s:line")
      unlet s:line
    endif
  endif

  " Run the tests for the previously-marked file.
  let in_spec_file = match(expand("%"), '_spec.rb$') != -1
  if in_spec_file
    call spec_runner#set_file()
  elseif !exists("s:file")
    return
  end
  call spec_runner#run(s:file . command_suffix)
endfunction

function! spec_runner#run_line()
  let in_spec_file = match(expand("%"), '_spec.rb$') != -1
  if in_spec_file
    call spec_runner#set_line()
  elseif !exists("s:line")
    return
  end
  call spec_runner#run_file(":" . s:line)
endfunction

function! spec_runner#repeat()
  if exists("s:file")
    if exists("s:line")
      call spec_runner#run(s:file . ":" . s:line)
    else
      call spec_runner#run(s:file)
    endif
  endif
endfunction
