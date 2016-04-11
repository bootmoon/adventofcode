input = File.read(ARGV[0])

list_of_cities = []

def cities(input, list_of_cities) #Creates a list and a hash of all the cities, the hash values are defaulted to 0.
  input.each_line do |l|
    if !list_of_cities.include? l.chomp.split(/ /)[0]
    	list_of_cities.push(l.chomp.split(/ /)[0])
    end
    if !list_of_cities.include? l.chomp.split(/ /)[2]
    	list_of_cities.push(l.chomp.split(/ /)[2])
    end
  end
end
cities(input, list_of_cities)

routes = {}

list_of_cities.each do |city|
	routes[city] = {}
end

input.each_line do |l|
	routes[l.chomp.split(/ /)[0]][l.chomp.split(/ /)[2]] = l.chomp.split(/ /)[4].to_i
	routes[l.chomp.split(/ /)[2]][l.chomp.split(/ /)[0]] = l.chomp.split(/ /)[4].to_i
end

final_distance = Float::INFINITY
list_of_cities.permutation.to_a.each do |permutation|
    count = 0
    permutation.each_cons(2) do |a|
        count += routes[a[0]][a[1]]
    end
    if count < final_distance
        final_distance = count
        p permutation
        puts count
    end
end

final_distance = 0
list_of_cities.permutation.to_a.each do |permutation|
    count = 0
    permutation.each_cons(2) do |a|
        count += routes[a[0]][a[1]]
    end
    if count > final_distance
        final_distance = count
        p permutation
        puts count
    end
end
