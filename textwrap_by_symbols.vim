function! WrapText() range
    let symbols = input("Enter the symbols for newline (separated by a space): ")
    let save_pos = getpos('.')

    python << EOF
import vim
symbols = vim.eval('symbols').split(" ")
for symbol in symbols:
    if symbol == "":
        continue
    vim.command(":%s/" + symbol + "/" + symbol + "\\r/g")
EOF

    call setpos('.', save_pos)
endfunction
nnoremap <F8> :call WrapText()<CR>
