input = File.read(ARGV[0])

list_of_cities = []
hash_cities = {}

def cities(input, list_of_cities, hash_cities) #Creates a list and a hash of all the cities, the hash values are defaulted to 0.
  input.each_line do |l|
    if !list_of_cities.include? l.chomp.split(/ /)[0]
    	list_of_cities.push(l.chomp.split(/ /)[0])
    end
    if !list_of_cities.include? l.chomp.split(/ /)[2]
    	list_of_cities.push(l.chomp.split(/ /)[2])
    end
    if !hash_cities.include? l.chomp.split(/ /)[0]
    	hash_cities[l.chomp.split(/ /)[0]] = 0
    end
    if !hash_cities.include? l.chomp.split(/ /)[2]
    	hash_cities[l.chomp.split(/ /)[2]] = 0
    end
  end
end
cities(input, list_of_cities, hash_cities)

routes = {}

list_of_cities.each do |city|
	routes[city] = {}
end

input.each_line do |l|
	routes[l.chomp.split(/ /)[0]][l.chomp.split(/ /)[2]] = l.chomp.split(/ /)[4].to_i
	routes[l.chomp.split(/ /)[2]][l.chomp.split(/ /)[0]] = l.chomp.split(/ /)[4].to_i
end

puts routes
#sleep

shortest_val = 10000000
list_of_cities.each do |city|
    puts city
    puts "1st loop"
    puts hash_cities
    hash_cities = {"Faerun"=>0, "Norrath"=>0, "Tristram"=>0, "AlphaCentauri"=>0, "Arbre"=>0, "Snowdin"=>0, "Tambi"=>0, "Straylight"=>0}
	value_count = 0
	hash_cities[city] = 1
	list_of_cities.each do |city2|
        puts "2nd loop"
        puts hash_cities
		if hash_cities[city2] != 1
			hash_cities[city2] = 1
			value_count += routes[city][city2]
            list_of_cities.each do |city3|
                puts "3rd loop"
                puts hash_cities
                if hash_cities[city3] != 1
                    hash_cities[city3] = 1
                    value_count += routes[city2][city3]
                    list_of_cities.each do |city4|
                        puts "4th loop"
                        puts hash_cities
                        if hash_cities[city4] != 1
                            hash_cities[city4] = 1
                            value_count += routes[city3][city4]
                            list_of_cities.each do |city5|
                                puts "5th loop"
                                puts hash_cities
                                if hash_cities[city5] != 1
                                    hash_cities[city5] = 1
                                    value_count += routes[city4][city5]
                                    list_of_cities.each do |city6|
                                        puts "6th loop"
                                        puts hash_cities
                                        if hash_cities[city6] != 1
                                            hash_cities[city6] = 1
                                            value_count += routes[city5][city6]
                                            list_of_cities.each do |city7|
                                                puts "7th loop"
                                                puts hash_cities
                                                if hash_cities[city7] != 1
                                                    hash_cities[city7] = 1
                                                    value_count += routes[city6][city7]
                                                    list_of_cities.each do |city8|
                                                        puts "8th loop"
                                                        puts hash_cities
                                                        if hash_cities[city8] != 1
                                                            puts "check"
                                                            value_count += routes[city7][city8]
                                                            puts value_count
                                                            if value_count < shortest_val
                                                                shortest_val = value_count
                                                            end
                                                            sleep 5
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

puts
puts shortest_val
