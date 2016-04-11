chars = File.read(ARGV[0]).chomp.chars
puts chars.count{|x| x == "("} - chars.count{|x| x == ")"}