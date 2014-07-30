" spec_runner.vim - useful commands for running specs
" Maintainer:   Adam Zaninovich
" Version:      0.2.3
"
" Suggested Mappings:
" Run Specs on current line. Repeatable outside of spec
"   map <leader>t :call spec_runner#Runline()<cr>
" Run the current spec file. Repeatable outside of spec
"   map <leader>f :call spec_runner#Runfile()<cr>
" Run the entire suite of specs
"   map <leader>T :call spec_runner#Run('spec')<cr>
" Repeat whatever was last run
"   map <leader>r :call spec_runner#Repeat()<cr>
"
" For all of these commands, when run inside a spec file,
" they will run that file (and line), when run in a non-
" spec file, they will run the last spec you ran them in.
"
" There is also a repeat function that will repeat the
" last spec you ran in the way that you run it.

command! SRRunAll call spec_runner#Run('spec')
command! SRRunFile call spec_runner#Runfile()
command! SRRunLine call spec_runner#Runline()
command! SRRepeat call spec_runner#Repeat()

