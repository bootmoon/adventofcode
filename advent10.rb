def look_and_say(number)#Function only works if leading digit is not 0, due to #to_s method.
    output = []
    chars = number.to_s.chars #chars will be an array with all integers as characters: ["1","1","1","2"]
    num_done = false
    start = 0
    while !num_done do
        set = chars.drop(start).take_while { |c| c == chars[start] }
        output.push(set.size.to_s,set[0])
        start += set.size
        if start == chars.size
            num_done = true
        end
    end
    output.join.to_i
end

def count_digits(number)#Counts the digits of a given number.
    number.to_s.chars.size
end

val = look_and_say(1)
49.times do |i| #39 for part a, 49 for part b.
    p i
    val = look_and_say(val)
end
p count_digits(val)
