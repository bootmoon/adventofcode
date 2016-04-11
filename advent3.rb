contents = File.read(ARGV[0])
log = [[0,0]]
santa_x, santa_y = 0,0
contents.each_char do |char|
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
end
print "Number of Houses: #{log.uniq.size}"