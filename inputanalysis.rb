input = File.read(ARGV[0])

input.each_line do |line|
	first_el = line.split(/ /)[0]
	if first_el.to_i != 0
		puts line
	end
end