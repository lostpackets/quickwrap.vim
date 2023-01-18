function! QuickWrap() range
    let text = join(getline(1, '$'), "\n")
    let words_per_line = input("Enter the number of words per line: ")

    " Split the text into words
    let words = split(text, '\s')

    " Initialize the counter
    let counter = 0

    " Initialize the variable to hold the wrapped text
    let wrapped_text = ""

    " Iterate over the words
    for word in words
        if counter % words_per_line == 0
            if wrapped_text != ""
                let wrapped_text .= "\n"
            endif
            let wrapped_text .= word
        else
            let wrapped_text .= " " . word
        endif
        let counter += 1
    endfor

    execute "%delete"
    call append(line("."), wrapped_text)
    execute ":%s/\n/\r/g"
endfunction
map <F11> :call QuickWrap()<CR>
