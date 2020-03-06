" Functions {{{
nmap ; :%s//g<LEFT><LEFT>
xmap ; :s//g<LEFT><LEFT>
" Undo window {{{
nnoremap <silent> <C-w><C-c> :call <SID>QuickSaveSession()<CR><C-w>c
nnoremap <silent> <C-w><C-q> :call <SID>QuickSaveSession()<CR><C-w><C-q>
nnoremap <silent> <C-w>c     :call <SID>QuickSaveSession()<CR><C-w>c
nnoremap <silent> <C-w>q     :call <SID>QuickSaveSession()<CR><C-w>q
nnoremap <silent> <C-w><C-a> :call <SID>QuickLoadSession()<CR>
nnoremap <silent> <C-w>a     :call <SID>QuickLoadSession()<CR>

function! s:QuickSaveSession()
    if !exists('s:pid')
        let s:pid = getpid()
    endif
    call system('mkdir /tmp/$USER')
    execute  'mksession! /tmp/$USER/lastwin'.s:pid.'.vim'
endfunction

function! s:QuickLoadSession()
    if !exists('s:pid')
        let s:pid = getpid()
    endif
    execute  'source /tmp/$USER/lastwin'.s:pid.'.vim'
endfunction

" }}}
" Change Register Content {{{
function! ChangeReg() abort
    let r = nr2char(getchar())
    if r =~# '[a-zA-Z0-9"@\-:.%#=*"~_/]'
        call feedkeys("q:ilet @" . r . " = \<C-r>\<C-r>=string(@" . r . ")\<CR>\<ESC>", 'n')
    endif
endfunction
nnoremap <silent> cr :call ChangeReg()<CR>
" }}}
" Visual Selection tool {{{
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmDLine("%s" . '\'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction
"}}}
" Toggle ColorColumn {{{
" Toggle with leader+l
function! ToggleCC()
  if exists("t:ccline")
    unlet t:ccline
    let &colorcolumn=join(range(100,999),',')
    set list
  else
    let t:ccline = winnr()
    set colorcolumn=0
    set list!
    redraw!
  endif
endfuncti

" }}}
" make list-like commands more intuitive {{{
function! CCR()
    let cmdline = getcmdline()
    if cmdline =~ '\v\C^(ls|files|buffers)'
        " like :ls but prompts for a buffer command
        return "\<CR>:b"
    elseif cmdline =~ '\v\C/(#|nu|num|numb|numbe|number)$'
        " like :g//# but prompts for a command
        return "\<CR>:"
    elseif cmdline =~ '\v\C^(dli|il)'
        " like :dlist or :ilist but prompts for a count for :djump or :ijump
        return "\<CR>:" . cmdline[0] . "j  " . split(cmdline, " ")[1] . "\<S-Left>\<Left>"
    elseif cmdline =~ '\v\C^(cli|lli)'
        " like :clist or :llist but prompts for an error/location number
        return "\<CR>:sil " . repeat(cmdline[0], 2) . "\<Space>"
    elseif cmdline =~ '\C^old'
        " like :oldfiles but prompts for an old file to edit
        set nomore
        return "\<CR>:sil se more|e #<"
    elseif cmdline =~ '\C^changes'
        " like :changes but prompts for a change to jump to
        set nomore
        return "\<CR>:sil se more|norm! g;\<S-Left>"
    elseif cmdline =~ '\C^ju'
        " like :jumps but prompts for a position to jump to
        set nomore
        return "\<CR>:sil se more|norm! \<C-o>\<S-Left>"
    elseif cmdline =~ '\C^marks'
        " like :marks but prompts for a mark to jump to
        return "\<CR>:norm! `"
    elseif cmdline =~ '\C^undol'
        " like :undolist but prompts for a change to undo
        return "\<CR>:u "
        " Propmpt pastes the selected register content
    elseif cmdline =~ '\C^reg'
        return "\<CR>:norm! \"p\<Left>"
    else
        return "\<CR>"
    endif
endfunction
cnoremap <expr> <CR> CCR()
" }}}
" Most Recently Used allows you to open files from :oldfile easily. {{{
" Use together with tab-completion
" MRU command-line completion
function! s:MRUComplete(ArgLead, CmdLine, CursorPos)
    return filter(copy(v:oldfiles), 'v:val =~ a:ArgLead')
endfunction

" MRU function
function! s:MRU(command, arg)
    if a:command == "tabedit"
        execute a:command . " " . a:arg . "|lcd %:p:h"
    else
        execute a:command . " " . a:arg
    endif
endfunction

" commands
command! -nargs=1 -complete=customlist,<sid>MRUComplete ME call <sid>MRU('edit', <f-args>)
command! -nargs=1 -complete=customlist,<sid>MRUComplete MS call <sid>MRU('split', <f-args>)
command! -nargs=1 -complete=customlist,<sid>MRUComplete MV call <sid>MRU('vsplit', <f-args>)
command! -nargs=1 -complete=customlist,<sid>MRUComplete MT call <sid>MRU('tabedit', <f-args>)
" }}}
" Color scheme selector <F7> {{{
function! s:colors(...)
  return filter(map(filter(split(globpath(&rtp, 'colors/*.vim'), "\n"),
        \                  'v:val !~ "^/usr/"'),
        \           'fnamemodify(v:val, ":t:r")'),
        \       '!a:0 || stridx(v:val, a:1) >= 0')
endfunction

function! s:rotate_colors()
  if !exists('s:colors')
    let s:colors = s:colors()
  endif
  let name = remove(s:colors, 0)
  call add(s:colors, name)
  execute 'colorscheme' name
  redraw
  echo name
endfunction
" }}}
" Quick toggle to transparent background {{{
command Transparent :call Transparent()

function! Transparent()
    if !exists('s:transparent')
        let s:transparent = 1
        set nocursorline
        hi Normal ctermbg=None guibg=None
        hi EndOfBuffer ctermbg=None guibg=None
    else
        unlet s:transparent
        set cursorline
        execute 'colorscheme ' . g:colors_name
    endif
endfunction
" }}}
" Quick toggle to light colorscheme <F8>{{{
function! s:light_colors()
    if !exists('s:colorsreset')
        let s:colorsreset = 1
        set background=light
        execute 'colorscheme seoul256-light'
        execute 'AirlineTheme seagull'
    else
        unlet s:colorsreset
        set background=dark
        execute 'colorscheme seoul256'
        execute 'AirlineTheme deus'
    endif
endfunction
" }}}
" :A opens corresponding header/source file for c projects {{{
function! s:a(cmd)
  let name = expand('%:r')
  let ext = tolower(expand('%:e'))
  let sources = ['c', 'cc', 'cpp', 'cxx']
  let headers = ['h', 'hh', 'hpp', 'hxx']
  for pair in [[sources, headers], [headers, sources]]
    let [set1, set2] = pair
    if index(set1, ext) >= 0
      for h in set2
        let aname = name.'.'.h
        for a in [aname, toupper(aname)]
          if filereadable(a)
            execute a:cmd a
            return
          end
        endfor
      endfor
    endif
  endfor
endfunction
command! A call s:a('e')
command! AV call s:a('botright vertical split')
" }}}
" :Danger gives 777 permission for active file {{{
command! Danger if !empty(expand('%'))
         \|   write
         \|   call system('chmod 777 '.expand('%'))
         \|   silent e
         \| else
         \|   echohl WarningMsg
         \|   echo 'Save the file first'
         \|   echohl None
         \| endif
" }}}
" :Share gives +w permission to group for active file {{{
command! Share if !empty(expand('%'))
         \|   write
         \|   call system('chmod +gw '.expand('%'))
         \|   silent e
         \| else
         \|   echohl WarningMsg
         \|   echo 'Save the file first'
         \|   echohl None
         \| endif
" }}}
" :EX gives +x permission to active file {{{
command! EX if !empty(expand('%'))
         \|   write
         \|   call system('chmod +x '.expand('%'))
         \|   silent e
         \| else
         \|   echohl WarningMsg
         \|   echo 'Save the file first'
         \|   echohl None
         \| endif
" }}}
" <Leader>?/! | Google it / Feeling lucky {{{
function! s:goog(pat, lucky)
  let q = '"'.substitute(a:pat, '["\n]', ' ', 'g').'"'
  let q = substitute(q, '[[:punct:] ]',
       \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  call system(printf('open "https://www.google.com/search?%sq=%s"',
                   \ a:lucky ? 'btnI&' : '', q))
endfunction

nnoremap <leader>? :call <SID>goog(expand("<cWORD>"), 0)<cr>
nnoremap <leader>! :call <SID>goog(expand("<cWORD>"), 1)<cr>
xnoremap <leader>? "gy:call <SID>goog(@g, 0)<cr>gv
xnoremap <leader>! "gy:call <SID>goog(@g, 1)<cr>gv
" }}}
" text objects {{{
" ?ii / ?ai | indent-object {{{
" ?io       | strictly-indent-object
function! s:indent_len(str)
  return type(a:str) == 1 ? len(matchstr(a:str, '^\s*')) : 0
endfunction

function! s:indent_object(op, skip_blank, b, e, bd, ed)
  let i = min([s:indent_len(getline(a:b)), s:indent_len(getline(a:e))])
  let x = line('$')
  let d = [a:b, a:e]

  if i == 0 && empty(getline(a:b)) && empty(getline(a:e))
    let [b, e] = [a:b, a:e]
    while b > 0 && e <= line('$')
      let b -= 1
      let e += 1
      let i = min(filter(map([b, e], 's:indent_len(getline(v:val))'), 'v:val != 0'))
      if i > 0
        break
      endif
    endwhile
  endif

  for triple in [[0, 'd[o] > 1', -1], [1, 'd[o] < x', +1]]
    let [o, ev, df] = triple

    while eval(ev)
      let line = getline(d[o] + df)
      let idt = s:indent_len(line)

      if eval('idt '.a:op.' i') && (a:skip_blank || !empty(line)) || (a:skip_blank && empty(line))
        let d[o] += df
      else | break | end
    endwhile
  endfor
  execute printf('normal! %dGV%dG', max([1, d[0] + a:bd]), min([x, d[1] + a:ed]))
endfunction
xnoremap <silent> ii :<c-u>call <SID>indent_object('>=', 1, line("'<"), line("'>"), 0, 0)<cr>
onoremap <silent> ii :<c-u>call <SID>indent_object('>=', 1, line('.'), line('.'), 0, 0)<cr>
xnoremap <silent> ai :<c-u>call <SID>indent_object('>=', 1, line("'<"), line("'>"), -1, 1)<cr>
onoremap <silent> ai :<c-u>call <SID>indent_object('>=', 1, line('.'), line('.'), -1, 1)<cr>
xnoremap <silent> io :<c-u>call <SID>indent_object('==', 0, line("'<"), line("'>"), 0, 0)<cr>
onoremap <silent> io :<c-u>call <SID>indent_object('==', 0, line('.'), line('.'), 0, 0)<cr>
" }}}
" Various {{{
" ?il | inner line
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<CR>
" }}}
" ?ic | inner comment {{{
function! s:inner_comment(vis)
  if synIDattr(synID(line('.'), col('.'), 0), 'name') !~? 'comment'
    call s:textobj_cancel()
    if a:vis
      normal! gv
    endif
    return
  endif

  let origin = line('.')
  let lines = []
  for dir in [-1, 1]
    let line = origin
    let line += dir
    while line >= 1 && line <= line('$')
      execute 'normal!' line.'G^'
      if synIDattr(synID(line('.'), col('.'), 0), 'name') !~? 'comment'
        break
      endif
      let line += dir
    endwhile
    let line -= dir
    call add(lines, line)
  endfor

  execute 'normal!' lines[0].'GV'.lines[1].'G'
endfunction
xmap <silent> ic :<C-U>call <SID>inner_comment(1)<CR><Plug>(TOC)
omap <silent> ic :<C-U>call <SID>inner_comment(0)<CR><Plug>(TOC)
" }}}
" }}}
" goyo.vim + limelight.vim {{{
let g:limelight_paragraph_span = 1
let g:limelight_priority = -1

function! s:goyo_enter()
  if has('gui_running')
    " set fullscreen
    set background=light
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
  set cursorline!
  Limelight
  let &l:statusline = '%M'
  hi StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE
endfunction

function! s:goyo_leave()
  if has('gui_running')
    " set nofullscreen
    set background=dark
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
  set cursorline!
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <Leader>G :Goyo<CR>
" }}}
" gv.vim {{{
function! s:gv_expand()
  let line = getline('.')
  GV --name-status
  call search('\V'.line, 'c')
  normal! zz
endfunction

autocmd! FileType GV nnoremap <buffer> <silent> + :call <sid>gv_expand()<cr>
" }}}

" Search {{{
 "=====[ Completion during search (via Command window) ]======================
 "Press TAB while searching to see options

function! s:search_mode_start()
    cnoremap <tab> <c-f>:resize 1<CR>a<c-n>
    let s:old_complete_opt = &completeopt
    let s:old_last_status = &laststatus
    set completeopt-=noinsert
    set laststatus=0
endfunction

function! s:search_mode_stop()
    try
        silent cunmap <tab>
    catch
    finally
        let &completeopt = s:old_complete_opt
        let &laststatus  = s:old_last_status
    endtry
endfunction

augroup SearchCompletions
    autocmd!
    autocmd CmdlineEnter [/\?] call <SID>search_mode_start()
    autocmd CmdlineLeave [/\?] call <SID>search_mode_stop()
augroup END

if has('patch-8.0.1206')
    augroup SearchCompletions
        autocmd!
        autocmd CmdlineEnter [/\?] call <SID>search_mode_start()
        autocmd CmdlineLeave [/\?] call <SID>search_mode_stop()
    augroup END
endif

" }}}
" Netrw {{{
" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 1  " open new files in previous window (no new splits)
let g:netrw_altv = 1          " Split to hte right instead of the left
let g:netrw_banner = 0        " removes the banner
let g:netrw_winsize = 22      " makes the file browsing tree take up only 20% of the screen instead of 50%
let g:netrw_liststyle= 3      " tree view when using netrw (file browsing)
" }}}

" vim:foldmethod=marker:foldlevel=0
