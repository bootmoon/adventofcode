input = File.read(ARGV[0])
num_of_lines = input.count("\n") + 1
 
def interpret(line)
 
    array_words = line.split(/ /)
    array_words[array_words.size-1] = array_words[array_words.size-1].split[0]
    factor = 0
    variable_dependant = array_words[array_words.size-1]
    variable_independant = "default"
    variable_independant1 = "default"
    variable_independant2 = "default"
 
    if array_words[0] == "NOT"
        mode = 1
        variable_independant = array_words[1]
    elsif array_words[1] == "RSHIFT"
        mode = 2
        factor = array_words[2].to_i
        variable_independant = array_words[0]
    elsif array_words[1] == "LSHIFT"
        mode = 3
        factor = array_words[2].to_i
        variable_independant = array_words[0]
    elsif array_words[1] == "AND"
        mode = 4
        variable_independant1 = array_words[0]
        variable_independant2 = array_words[2]
    elsif array_words[1] == "OR"
        mode = 5
        variable_independant1 = array_words[0]
        variable_independant2 = array_words[2]
    elsif array_words[1] == "->"
        mode = 6
        variable_independant = array_words[0]
    end
 
    return [mode, factor, variable_dependant, variable_independant, variable_independant1, variable_independant2]
end
 
def has_digits?(string)
    string.count("0-9") > 0
end
 
gates = {}
gates.default = "default"
 
def evaluate(line, gates)
    info = interpret(line)
    if info[0] == 1
        if has_digits?(info[3])
            gates[info[2]] = ~(info[3].to_i)
        else
            gates[info[2]] = ~(gates[info[3]])
        end
    elsif info[0] == 2
        if has_digits?(info[3])
            gates[info[2]] = (info[3].to_i >> info[1])
        else
            gates[info[2]] = (gates[info[3]] >> info[1])
        end
    elsif info[0] == 3
        if has_digits?(info[3])
            gates[info[2]] = (info[3].to_i << info[1])
        else
            gates[info[2]] = (gates[info[3]] << info[1])
        end
    elsif info[0] == 4
        if has_digits?(info[4]) && has_digits?(info[5])
            gates[info[2]] = (info[4].to_i & info[5].to_i)
        elsif has_digits?(info[4])
            gates[info[2]] = (info[4].to_i & gates[info[5]])
        elsif has_digits?(info[5])
            gates[info[2]] = (gates[info[4]] & info[5].to_i)
        else
            gates[info[2]] = (gates[info[4]] & gates[info[5]])
        end
    elsif info[0] == 5
        if has_digits?(info[4]) && has_digits?(info[5])
            gates[info[2]] = (info[4].to_i | info[5].to_i)
        elsif has_digits?(info[4])
            gates[info[2]] = (info[4].to_i | gates[info[5]])
        elsif has_digits?(info[5])
            gates[info[2]] = (gates[info[4]] | info[5].to_i)
        else
            gates[info[2]] = (gates[info[4]] | gates[info[5]])
        end
    elsif info[0] == 6
        if has_digits?(info[3])
            gates[info[2]] = info[3].to_i
        else
            gates[info[2]] = gates[info[3]] #edit: might not work, have to double check all of this
        end
    end
end
 
$lines_processed = []
 
while $lines_processed.size != num_of_lines do #as long as all lines haven't been processed run this loop
    input.each_line.with_index do |line, index|
        if !$lines_processed.include? index #if line is not processed yet run this branch      
            info = interpret(line)
            if info[0] < 4 || info[0] > 5 #mode is set to 1,2,3 or 6
                if (gates[info[3]] != "default") || has_digits?(info[3]) #if the independant variable has a value already assigned to it(by hash or from input)
                    $lines_processed.push(index)
                    evaluate(line, gates)
                end
            else #mode is 4 or 5
                if (gates[info[4]] != "default" || has_digits?(info[4])) && (gates[info[5]] != "default" || has_digits?(info[5])) #if both independant variables have values
                    $lines_processed.push(index)
                    evaluate(line, gates)
                end
            end
        end
    end
end
 
puts "Value on wire a: #{gates["a"]}"