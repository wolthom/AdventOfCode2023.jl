using Chain

function parse_day1(inp_str)
	lines = eachsplit(inp_str, "\n")
	collect(lines)
end

function day1_part1(inp)
	out = 0
	for (idx, line) in enumerate(inp)
		first_num = nothing
		second_num = nothing
		for c in line
			if !isdigit(c)
				continue
			end
			if isnothing(first_num)
				first_num = c
			end
			second_num = c
		end
		if isnothing(first_num) || isnothing(second_num)
			throw(ArgumentError("line $idx did not contain any digits"))
		end
		out += parse(Int, first_num) * 10 + parse(Int, second_num)
	end
	out
end

function day1_part2(inp)
	nothing
end
