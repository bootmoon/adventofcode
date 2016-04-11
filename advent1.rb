input = File.read(ARGV[0])

index = 0
count = 0
reached_basement = false
input.each_char do |x|
	if x == '('
		count += 1
	else 
		count -= 1
	end
	if !reached_basement
		index += 1
	end
	if count == -1
		reached_basement = true
	end
end

puts "Count: #{count}"
puts "Index: #{index}"
