import autoload 'neoformat/utils.vim'

function! neoformat#formatters#zsh#enabled() abort
    return ['shfmt']
endfunction

function! neoformat#formatters#zsh#shfmt() abort
    let opts = s:utils.VarDefault('shfmt_opt', '')
    return {
            \ 'exe': 'shfmt',
            \ 'args': ['-i ' . (&expandtab ? shiftwidth() : 0), opts],
            \ 'stdin': 1,
            \ }
endfunction
