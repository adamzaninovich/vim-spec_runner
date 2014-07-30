function! spec_runner#Run(filename)
  :w
  :silent !echo;echo;echo;echo;echo
  exec ":!rspec " . a:filename
endfunction

function! spec_runner#Setfile()
  let s:file = @%
endfunction

function! spec_runner#Setline()
  let s:line = line('.')
endfunction

function! spec_runner#Runfile(...)
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
    call spec_runner#Setfile()
  elseif !exists("s:file")
    return
  end
  call spec_runner#Run(s:file . command_suffix)
endfunction

function! spec_runner#Runline()
  let in_spec_file = match(expand("%"), '_spec.rb$') != -1
  if in_spec_file
    call spec_runner#Setline()
  elseif !exists("s:line")
    return
  end
  call spec_runner#Runfile(":" . s:line)
endfunction

function! spec_runner#Repeat()
  if exists("s:file")
    if exists("s:line")
      call spec_runner#Run(s:file . ":" . s:line)
    else
      call spec_runner#Run(s:file)
    endif
  endif
endfunction
