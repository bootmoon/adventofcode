def sum(xs)
	if xs.empty
		0
	else
		xs.first + sum(xs.drop(1))
	end
end

def min(xs)
	if xs.size == 1
		xs[0]
	else
		a = xs.first
		b = xs.drop(1)
		if a < min(b)
			a
		else
			min(b)
		end
	end
end

def fact(n)
	if n == 0 
		1
	else
		n * min(n-1)
	end
end

def last(xs)
	if xs.size == 1
		xs.first
	else
		last(xs.drop(1))
	end
end

def first(xs)
	xs[0]
end

puts fact(3)