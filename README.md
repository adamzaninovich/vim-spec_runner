# Spec Runner for vim

Runs rspec specs in vim

## Suggested Mappings:

Run Specs on current line. Repeatable outside of spec

    map <leader>t :call spec_runner#run_line()<cr>
    
Run the current spec file. Repeatable outside of spec

    map <leader>f :call spec_runner#run_file()<cr>
    
Run the entire suite of specs

    map <leader>T :call spec_runner#run('spec')<cr>
    
Repeat whatever was last run

    map <leader>r :call spec_runner#repeat()<cr>

For all of these commands, when run inside a spec file, they will run that file (and line), when run in a non-spec file, they will run the last spec you ran them in.

There is also a repeat function that will repeat the last spec you ran in the way that you run it.
