function viv --description 'Launch Vivado nicely'
	vivado -nolog -nojournal "$argv" > /dev/null 2>&1 &
end
