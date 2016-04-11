#input = File.open(ARGV[0])

def char_count(input)
	chars = 0
	input.each_line do |x|
		chars += x.split[0].size
	end
	return chars
end

p char_count("Hello\nMy name is burr")