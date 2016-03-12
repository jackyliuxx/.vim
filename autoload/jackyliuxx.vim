function jackyliuxx#CP_R( fileinput )
    let fn = expand("%")
    let fn_wo_exp = expand("%:r")
	
	if( &ft == 'cpp') 
		let cpl = 'clang++ -w -o "' . fn_wo_exp . '" -std=c++11 "' . fn . '"' | let exc = '"./' . fn_wo_exp . '"'
	elseif( &ft == 'c')
		let cpl = 'clang -w -o "' . fn_wo_exp . '" "' . fn . '"' | let exc = '"./' . fn_wo_exp . '"'
	elseif( &ft == 'java')
		let cpl = 'javac "' . fn . '"' | let exc = 'java "' . fn_wo_exp . '"'
	elseif( &ft == 'python')
		let exc = 'python3 "' . fn . '"'
    elseif( &ft == 'sh' )
        let exc = 'sh "' . fn . '"'
    elseif( &ft == 'verilog' )
        let cpl = 'iverilog -o "' . fn_wo_exp . '.vvp" "' . fn . '"' | let exc = 'vvp "' . fn_wo_exp . '.vvp"'
    elseif( &ft == 'javascript' )
        let exc = 'nodejs "' . fn . '"'
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
