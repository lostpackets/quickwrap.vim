function! TestPy4() range
    let text = join(getline(1, '$'), "\n")
    let line_length = input("Enter the line length to wrap text to: ")
    let X = pyeval("textwrap.fill('''" . text . "'''," . line_length . ")")
    execute "%delete"
    call append(line("."),X)
    execute ":%s/\n/\r/g"
endfunction
map <F11> :call TestPy4()<CR>
