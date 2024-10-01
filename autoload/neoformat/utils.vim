vim9script

export def Log(msg: any)
    if ShouldBeVerbose()
        BetterEcho(msg)
    endif
enddef

export def LogFileContent(path: any)
    if ShouldBeVerbose()
        BetterEcho(readfile(path))
    endif
enddef

export def Warn(msg: any)
    echohl WarningMsg
    BetterEcho(msg)
    echohl NONE
enddef

export def Msg(msg: any)
    if exists('g:neoformat_only_msg_on_error') && g:neoformat_only_msg_on_error
        return
    endif
    BetterEcho(msg)
enddef

export def ShouldBeVerbose(): bool
    if !exists('g:neoformat_verbose')
        g:neoformat_verbose = 0
    endif
    return &verbose || g:neoformat_verbose
enddef

export def Var(name: string): any
    return VarDefault(name, 0)
enddef

export def VarDefault(name: string, default: any): any
    return exists('b:' .. name) ? get(b:, name) : get(g:, name, default)
enddef

def BetterEcho(msg: any)
    if type(msg) != type('')
        echom 'Neoformat: ' .. string(msg)
    else
        echom 'Neoformat: ' .. msg
    endif
enddef
