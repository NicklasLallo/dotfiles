function! GuiVSCterm()
    let s:CtermOnly = ['dream', 'dream-light', 'wal'] " Add themes manually if they don't support termguicolors
    if (index(s:CtermOnly, g:colors_name) >= 0)
        set notermguicolors
    else
        set termguicolors
    endif
endfunction

function! ReturnHighlightTerm(group, term)
   " Store output of group to variable
   let output = execute('hi ' . a:group)

   " Find the term we're looking for
   let value = matchstr(output, a:term.'=\zs\S*')
   if value ==# ''
       let value = 'NONE'
   endif
   return value
endfunction

function! Hic(group, ctermbg, guibg, ctermfg, guifg)
    " Hic - Hi[light] c[ange]
    execute('hi ' . a:group . ' ctermbg='    . a:ctermbg . ' guibg=' . a:guibg . ' ctermfg=' . a:ctermfg . ' guifg=' . a:guifg)
endfunction

function! FixBrokenColors()
    let s:leftColCtermBg  = ReturnHighlightTerm('LineNr', 'ctermbg')
    let s:leftColGuiBg    = ReturnHighlightTerm('LineNr', 'guibg')

    execute('hi SignColumn ctermbg=' . s:leftColCtermBg . ' guibg=' . s:leftColGuiBg)

    " Use diff colors for Sign as well:
    let s:DiffAddCterm       = ReturnHighlightTerm('DiffAdd', 'ctermfg')
    let s:DiffChangeCterm    = ReturnHighlightTerm('DiffChange', 'ctermfg')
    let s:DiffDeleteCterm    = ReturnHighlightTerm('DiffDelete', 'ctermfg')
    let s:DiffAddGui         = ReturnHighlightTerm('DiffAdd', 'guifg')
    let s:DiffChangeGui      = ReturnHighlightTerm('DiffChange', 'guifg')
    let s:DiffDeleteGui      = ReturnHighlightTerm('DiffDelete', 'guifg')

    let s:SignMarkTextCterm    = ReturnHighlightTerm('SignatureMarkText', 'ctermfg')
    let s:SignMarkTextGui    = ReturnHighlightTerm('SignatureMarkText', 'guifg')

    let s:SignMarkerTextCterm    = ReturnHighlightTerm('SignatureMarkerText', 'ctermfg')
    let s:SignMarkerTextGui    = ReturnHighlightTerm('SignatureMarkerText', 'guifg')

    " SignatureMarkText xxx guifg=#7daea3 guibg=#32302f
    " SignatureMarkerText xxx guifg=#d3869b guibg=#32302f
    " ShowMarksHLl   xxx guifg=#7daea3 guibg=#32302f
    " ShowMarksHLu   xxx guifg=#7daea3 guibg=#32302f
    " ShowMarksHLo   xxx guifg=#7daea3 guibg=#32302f
    " ShowMarksHLm   xxx guifg=#7daea3 guibg=#32302f

    " Optionally force to always use these gree/blue/red defaults:
    " Add ctermfg=108 guifg=#87af87
    " Add ctermfg=108 guifg=#a9b665
    " Change ctermfg=68 guifg=#5f87d7
    " Change ctermfg=68 guifg=#7daea3
    " Delete ctermfg=161 guifg=#d7005f
    " Delete ctermfg=12 guifg=#ea6962

    let s:DiffAddGui         = '#87af87'
    let s:DiffChangeGui      = '#5f87d7'
    let s:DiffDeleteGui      = '#d7005f'


    call Hic('SignatureMarkText', s:leftColCtermBg, s:leftColGuiBg, s:SignMarkTextCterm, s:SignMarkTextGui)
    call Hic('SignatureMarkText', s:leftColCtermBg, s:leftColGuiBg, s:SignMarkerTextCterm, s:SignMarkerTextGui)

    call Hic('SignifySignChange', s:leftColCtermBg, s:leftColGuiBg, s:DiffChangeCterm, s:DiffChangeGui)

    call Hic('SignifySignAdd', s:leftColCtermBg, s:leftColGuiBg, s:DiffAddCterm, s:DiffAddGui)
    call Hic('SignifySignChange', s:leftColCtermBg, s:leftColGuiBg, s:DiffChangeCterm, s:DiffChangeGui)
    call Hic('SignifySignDelete', s:leftColCtermBg, s:leftColGuiBg, s:DiffDeleteCterm, s:DiffDeleteGui)

    " Sometimes Signify use GitGutter highlight groups for some reason
    call Hic('GitGutterAdd', s:leftColCtermBg, s:leftColGuiBg, s:DiffAddCterm, s:DiffAddGui)
    call Hic('GitGutterChange', s:leftColCtermBg, s:leftColGuiBg, s:DiffChangeCterm, s:DiffChangeGui)
    call Hic('GitGutterDelete', s:leftColCtermBg, s:leftColGuiBg, s:DiffDeleteCterm, s:DiffDeleteGui)


    call Hic('ALEErrorSign', s:leftColCtermBg, s:leftColGuiBg , 161, '#d7005f')
    call Hic('ALEWarningSign', s:leftColCtermBg, s:leftColGuiBg , 161, '#d7005f')

    " Wilder {{{
    " call('WildMode', 1, NONE, NONE, '#e0e0e0', '#8F575A', italic)
    " call('WildStatus', 1, NONE, NONE, '#988C99', '#153C63', NONE)
    " call('WilderSeparator', 1, NONE, NONE, '#FA2C77', '#153C63', NONE)
    " }}}
    " Spelling errors fix

    call Hic('SpellBad', 167, '#D75F5F', 255, '#EEEEEE')
    call Hic('SpellCap', 74, '#5FAFD7', 255, '#EEEEEE')
    call Hic('SpellRare', 140, '#AF87D7', 255, '#EEEEEE')
    call Hic('SpellLocal', 14, '#5FB3B3', 255, '#EEEEEE')

    call GuiVSCterm()
endfunction



highlight ExtraWhitespace ctermbg=1 guibg=#db6c6c
augroup custom_highlighting
    autocmd!
    " autocmd needed otherwise it only applies to the first window each
    " session
    autocmd VimEnter,WinEnter * match DiffDelete /[^\t]\zs\t\+/
    "Show tabs that are not at the start of a line
    " Except when typing that line:
    autocmd VimEnter,WinEnter * match DiffDelete /\s\+\%#\@<!$\| \+\ze\t/

    " http://vim.wikia.com/wiki/Highlight_unwanted_spaces
    " au BufNewFile,BufRead,InsertLeave * silent! match ExtraWhitespace /\s\+$/
    " au InsertEnter * silent! match ExtraWhitespace /\s\+\%#\@<!$/

    " Strip trailing whitespaces in GV
    autocmd! FileType GV set ma! | %s/ *$// | nohl | 1 | set ma!

    if exists('##ColorScheme')
        autocmd ColorScheme * call FixBrokenColors()
    else
        autocmd VimEnter,WinEnter * call FixBrokenColors()
    endif
augroup END




" vim:foldmethod=marker:foldlevel=0
