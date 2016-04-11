input = File.read(ARGV[0]) #edit -- not sure how to actually get the text in here

total_paper = 0
total_ribbon = 0

def surface_area(l,w,h)
	area1 = 2*l*w
	area2 = 2*l*h
	area3 = 2*w*h
	area = area1 + area2 + area3

	if area1 < area2 && area1 < area3
		return area + area1/2
	elsif area2 < area3
		return area + area2/2
	else 
		return area + area3/2
	end
end

def volume(l,w,h)
	return l*w*h
end

def shortest_perimeter(l,w,h)
	perimeter = 0
	if l == w && l == h #all of the sides are equal
		perimeter = 4*l
	elsif l == w || l == h || w == h #two of the sides are equal
		if l == w
			if l > h
				perimeter = 2*l + 2*h
			else 
				perimeter = 4*l
			end
		elsif l == h 
			if l > w
				perimeter = 2*l + 2*w
			else 
				perimeter = 4*l
			end
		else #w == h
			if w > l
				perimeter = 2*w + 2*l
			else 
				perimeter = 4*w
			end
		end
	else #none of the sides are equal
		if l < w || l < h  #length is not the largest side
			perimeter += 2*l
		end
		if w < l || w < h #width is not the largest side
			perimeter += 2*w
		end
		if h < l || h < w #height is not the largest side
			perimeter += 2*h
		end
	end
	return perimeter
end

puts shortest_perimeter(2,1,2)

input.each_line do |line| 
	length = line.split("x")[0].to_i
	width = line.split("x")[1].to_i
	height = line.split("x")[2].to_i
	total_paper += surface_area(length,width,height)
	total_ribbon += volume(length,width,height) + shortest_perimeter(length,width,height)
end

puts "total_paper: #{total_paper}"
puts "total_ribbon: #{total_ribbon}"
		