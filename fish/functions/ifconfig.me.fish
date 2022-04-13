function ifconfig.me --description 'Display external IP address'
	dig +short myip.opendns.com @resolver1.opendns.com
end
