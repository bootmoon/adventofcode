input = File.read(ARGV[0])

def contains_3_vowels?(line)
	if line.chars.select { |x| x == 'a' || x == 'e' || x == 'i' || x == 'o' || x == 'u' }.size >= 3
		return true
	else
		return false
	end
end

def double_letter?(line)
	double_letter_not_found = true
	index_count = 0
	while double_letter_not_found do
		if line.chars[index_count] == line.chars[index_count+1]
			return true
			double_letter_not_found = false
			break
		else
			index_count += 1
		end
		if index_count == line.size-1
			return false 
			break
		end
	end
end

def naughty_strings?(line)
	not_naughty = true
	index_count = 0
	while not_naughty do
		if (line.chars[index_count] == "a" && line.chars[index_count+1] == "b") || (line.chars[index_count] == "c" && line.chars[index_count+1] == "d") || (line.chars[index_count] == "p" && line.chars[index_count+1] == "q") || (line.chars[index_count] == "x" && line.chars[index_count+1] == "y")
			return true 
			not_naughty = false
			break
		else
			index_count += 1
		end
		if index_count == line.size-1
			return false 
			break
		end
	end
end



def two_pairs_of_two?(line)
	log = []
	line.chars.each_cons(2) do |c|
		log.push(c)
	end

	not_naughty = true
	index_count = 0

	while not_naughty do
		if index_count == line.chars.each_cons(2).size-1
			return false
			break
		end
		for x in 0..line.chars.each_cons(2).size-1
			if log[index_count] == log[x] && (x != index_count && x != index_count+1 && x != index_count-1)
				return true
				not_naughty = false
				break
			end
		end
		index_count += 1
	end
end



def repeating_letter_with_space?(line)
	not_naughty = true
	index_count = 0
	while not_naughty do
		if line.chars[index_count] == line.chars[index_count + 2]
			return true
			not_naughty = false
			break
		else
			index_count += 1
		end
		if index_count == line.size-1
			return false
			break
		end
	end
end 

num_of_strings = 0

input.each_line do |line|
	if contains_3_vowels?(line) && double_letter?(line) && !naughty_strings?(line)
		num_of_strings += 1
	end
end

puts "number of nice strings: #{num_of_strings}"

num_of_new_strings = 0

input.each_line do |line|
	if two_pairs_of_two?(line) && repeating_letter_with_space?(line)
		num_of_new_strings += 1
	end
end

puts "number of new nice strings: #{num_of_new_strings}"
