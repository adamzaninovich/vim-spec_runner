# spec_runner.vim

Runs rspec specs in vim

## Installation

### Pathogen installation

    cd ~/.vim/bundle
    git clone git://github.com/adamzaninovich/vim-spec_runner.git

### Vundle installation

In your vimrc:

    Bundle 'adamzaninovich/vim-spec_runner'

## Usage

For all of the commands, when run inside a spec file, they will run that file (and/or line). When run in a non-spec file, they will run command as you ran it last time you were in a spec file. There is also a repeat function that will repeat the last spec you ran in the way that you run it.

## Suggested Mappings:

Run Specs on current line. Repeatable outside of spec

    map <leader>t :call spec_runner#Runline()<cr>

Run the current spec file. Repeatable outside of spec

    map <leader>f :call spec_runner#Runfile()<cr>

Run the entire suite of specs

    map <leader>T :call spec_runner#Run('spec')<cr>

Repeat whatever was last run

    map <leader>r :call spec_runner#Repeat()<cr>
