contents = File.read(ARGV[0])

log = [[0,0]]
santa_x = 0
santa_y = 0
robo_x = 0
robo_y = 0

contents.each_char.with_index do |char, index|
	if index % 2 == 0 	
		if char == '^'
			santa_y += 1
		elsif char == '>'
			santa_x += 1
		elsif char == '<'
			santa_x -= 1
		else 
			santa_y -= 1
		end
		log.push([santa_x,santa_y])
	else 
		if char == '^'
			robo_y += 1
		elsif char == '>'
			robo_x += 1
		elsif char == '<'
			robo_x -= 1
		else 
			robo_y -= 1
		end
		log.push([robo_x,robo_y])
	end*
end

print "Number of Houses: "
print log.uniq.size