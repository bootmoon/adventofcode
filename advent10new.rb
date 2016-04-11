def look_and_say(num)
    output = []
    num.to_s.chars.chunk_while { |a,b| a == b}.each do |x|
        output.push(x.size, x[0])
    end 
end

p look_and_say(11)
