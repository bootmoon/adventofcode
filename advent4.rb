require 'digest/md5'

input = "iwrupvqb"

def has_five_zeroes?(input, number)
	if Digest::MD5.hexdigest(input+number.to_s).scan(/.{5}/)[0].chars.take_while { |x| x == "0"}.size == 5
		return true
	else
		return false
	end
end

counter = 0
num_not_found = true

while num_not_found do 
	if has_five_zeroes?(input, counter)
		puts "input: #{input}, number: #{counter}"
		puts Digest::MD5.hexdigest(input+counter.to_s)
		num_not_found = false
	else
		counter += 1
	end
end