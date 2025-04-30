" Neovim {{{
if has('nvim')
    " In Neovim, you can set up fzf window using a Vim command
    " let g:fzf_layout = { 'window': 'enew' }
    " let g:fzf_layout = { 'window': '-tabnew' }
    " let g:fzf_layout = { 'window': '10split' }
    set emoji
    " set inccommand=nosplit
    let g:use_cursor_shapes = 1

    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-n> <C-\><C-n>
    tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

    tnoremap <A-h> <C-\><C-N><C-w>h
    tnoremap <A-j> <C-\><C-N><C-w>j
    tnoremap <A-k> <C-\><C-N><C-w>k
    tnoremap <A-l> <C-\><C-N><C-w>l
    tnoremap <C-w><C-w> <C-\><C-N><C-w><C-w>

    inoremap <A-h> <C-\><C-N><C-w>h
    inoremap <A-j> <C-\><C-N><C-w>j
    inoremap <A-k> <C-\><C-N><C-w>k
    inoremap <A-l> <C-\><C-N><C-w>l

    nnoremap <A-h> <C-w>h
    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l
    " requires neoterm I believe
    " nnoremap <silent> <leader>o :vertical botright Ttoggle<CR><C-w>l

    " Nvim Functions {{{
    " Opens up a new buffer, either vertical or horizontal. Count can be used to
    " specify the number of visible columns or rows.
    fun! s:openBuffer(count, vertical)
    let cmd = a:vertical ? 'vnew' : 'new'
    let cmd = a:count ? a:count . cmd : cmd
    exe cmd
    endf

    " Opens a new terminal buffer, but instead of doing so using 'enew' (same
    " window), it uses :vnew and :new instead. Usually, I want to open a new
    " terminal and not replace my current buffer.
    fun! s:openSplitTerm(args, count, vertical)
    let direction = 1
    call s:openBuffer(a:count, direction)
    call s:openTerm(a:args)
    endf

    " Opens a new terminal buffer, but instead of doing so using split buffer, it
    " uses :tabnew instead.
    fun! s:openTabTerm(args)
    exe 'tabnew'
    call s:openTerm(a:args)
    endf

    " Open a new terminal in the active buffer, while defining default mappings
    " for this plugin.
    fun! s:openTerm(args)
    exe 'terminal' a:args
    exe 'startinsert'
    endf
    " }}}

    command! -count -nargs=* Term call s:openSplitTerm(<q-args>, <count>, 0)
    command! -count -nargs=* TermV call s:openSplitTerm(<q-args>, <count>, 1)



endif
" }}}
" vim:foldmethod=marker:foldlevel=0
