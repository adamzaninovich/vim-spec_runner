" Utility functions

function! s:setfile()
  let s:file = @%
endfunction

function! s:setline()
  let s:line = line('.')
endfunction

function! s:in_spec_file()
  return match(expand("%"), '_spec.rb$') != -1
endfunction

function! s:get_suffix(list_of_args)
  if len(a:list_of_args) == 1
    return a:list_of_args[0]
  else
    if exists("s:line")
      unlet s:line
    endif
  endif
  return ""
endfunction

" Running Specs

function! spec_runner#Run(filename)
  :w
  :silent !echo;echo;echo;echo;echo
  exec ":!rspec ".a:filename
endfunction

function! spec_runner#Runfile(...)
  if s:in_spec_file()
    call s:setfile()
  elseif !exists("s:file")
    return " display not available message?
  end
  call spec_runner#Run(s:file.s:get_suffix(a:000))
endfunction

function! spec_runner#Runline()
  if s:in_spec_file()
    call s:setline()
  elseif !exists("s:line")
    return " display not available message?
  end
  call spec_runner#Runfile(":".s:line)
endfunction

function! spec_runner#Repeat()
  if exists("s:file")
    if exists("s:line")
      call spec_runner#Run(s:file.":".s:line)
    else
      call spec_runner#Run(s:file)
    endif
  endif
endfunction
