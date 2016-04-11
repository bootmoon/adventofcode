input = "abcdefgh"
test_word = "pizza, hazz"

def count_in_letters(string)
    chars = string.chars
    p chars
    for i in 0..chars.size-1 do
        puts i
        if chars[chars.size-(i+1)] != "z"
            return chars.size-(i+1)
            break
        end
    end
end

puts count_in_letters("abcz")#Should give answer 2
puts count_in_letters("hellzz")#should give answer 0
puts count_in_letters("zezzg")#should give answer 4


    #if chars[chars.size-n] != "z"
    #    chars[chars.size-n] = (chars[chars.size-n].ord+1).chr
    #end
