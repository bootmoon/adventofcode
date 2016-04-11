input = File.read(ARGV[0])

def populate_array(array, size_square) #This will populate a 2D array that is size_square*size_square big with false booleans
	for x in 0...size_square 
		array[x] = []
		for y in 0...size_square
			array[x][y] = false
		end
	end
end

def change_state(array, range, mode) #changes a given array of booleans states based on the mode it is set to and the range specified

	first_x = range[0]
	first_y = range[1]
	last_x = range[2]
	last_y = range[3]

	for x in first_x..last_x
		for y in first_y..last_y
			if mode == 1 #toggle state
				array[x][y] = !array[x][y]
			elsif mode == 2 #turn off state
				array[x][y] = false
			else #tirn on state
				array[x][y] = true
			end
		end
	end
end

def values(line) #evaluates ranges from input given and returns an array with the range as 2 sets of coordinates
	if line.split(/ /)[0] == "toggle"
		first_x = line.split(/ /)[1].split(/,/)[0]
		first_y = line.split(/ /)[1].split(/,/)[1]
		last_x = line.split(/ /)[3].split(/,/)[0]
		last_y = line.split(/ /)[3].split(/,/)[1]
	else
		first_x = line.split(/ /)[2].split(/,/)[0]
		first_y = line.split(/ /)[2].split(/,/)[1]
		last_x = line.split(/ /)[4].split(/,/)[0]
		last_y = line.split(/ /)[4].split(/,/)[1]
	end
	return [first_x.to_i, first_y.to_i, last_x.to_i, last_y.to_i]
end

grid = []

populate_array(grid, 1000)

input.each_line do |line|
	if line.split(/ /)[0] == "toggle"
		change_state(grid, values(line), 1)
	elsif line.split(/ /)[0] == "turn" && line.split(/ /)[1] == "off"
		change_state(grid, values(line), 2)
	else
		change_state(grid, values(line), 3)
	end
end

lights_on = 0
for x in 0...grid.size
	lights_on += grid[x].select {|y| y == true}.size
end

puts "Lights that are lit: #{lights_on}"