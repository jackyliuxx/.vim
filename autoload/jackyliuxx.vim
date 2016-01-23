function jackyliuxx#CP_R( fileinput )
    let fn = expand("%")
    let fn2 = expand("%:r")
    let cwd = expand("%:h")
	
	if( &ft == 'cpp') 
		let cpl = 'clang++ -w -o "' . fn2 . '" -std=c++11 "' . fn . '' | let exc = '"./' . fn2 . '"'
	elseif( &ft == 'c')
		let cpl = 'clang -w -o "' . fn2 . '" "' . fn . '"' | let exc = '"./' . fn2 . '"'
	elseif( &ft == 'java')
		let cpl = 'javac "' . fn . '"' | let exc = 'java "' . fn2 . '"'
	elseif( &ft == 'python')
		let exc = 'python3 "' . fn . '"'
    elseif( &ft == 'sh' )
        let exc = 'sh "' . fn . '"'
    elseif( &ft == 'verilog' )
        let cpl = 'iverilog -o "' . fn2 . '.vvp" "' . fn . '"' | let exc = 'vvp "' . fn2 . '.vvp"'
	endif

	let pause = 'printf "Press any key to continue..." && read -n 1 && exit'
	if !exists('exc')
		echo 'Can''t compile or run this file...'
		return
	endif

    if a:fileinput
        call inputsave()
        let inputfile = input('Input file: ')
        let outputfile = input('Output file: ')
        call inputrestore()
        if inputfile != ''
            let exc = exc . ' < "' . inputfile . '"'
        endif
        if outputfile != ''
            let exc = exc . ' > "' . outputfile . '"'
        endif
    endif
	
    if exists('cpl')
		let cp_r = cpl . ' && time ' . exc
	else
		let cp_r = 'time ' . exc
    endif
	silent execute '!$COLORTERM -x bash -c ''' . cp_r . ';' . pause . ''''
    redraw!
endfunction
