import autoload 'neoformat/utils.vim'

function! neoformat#formatters#ebuild#enabled() abort
    return ['shfmt']
endfunction

function! neoformat#formatters#ebuild#shfmt() abort
    let opts = s:utils.VarDefault('shfmt_opt', '')
    return {
            \ 'exe': 'shfmt',
            \ 'args': ['-i ' . (&expandtab ? shiftwidth() : 0), opts],
            \ 'stdin': 1,
            \ }
endfunction
