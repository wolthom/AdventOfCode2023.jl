using Chain

function parse_day1(inp_str)
    lines = eachsplit(inp_str, '\n')
end

function parse_digits(line, words=false)
    first_num = nothing
    second_num = nothing
    for idx in 1:length(line)
        segment = @view line[idx:end]
        digit = parse_digit(segment, words)
        isnothing(digit) && continue

        if isnothing(first_num)
            first_num = digit
        end
        second_num = digit
    end

    if isnothing(first_num) || isnothing(second_num)
        throw(ArgumentError("line did not contain any digits"))
    end

    first_num * 10 + second_num
end

function parse_digit(segment, words=false)
    # Short circuit if it is a single digit
    if isdigit(segment[1])
        return parse(Int64, segment[1])
    end

    # Short circuit if written out words should not be considered or it cannot be one
    if !words || (segment[1] ∉ ('z', 'o', 't', 'f', 's', 'e', 'n'))
        return nothing
    end

    if startswith(segment, "zero")
        return 0
    elseif startswith(segment, "one")
        return 1
    elseif startswith(segment, "two")
        return 2
    elseif startswith(segment, "three")
        return 3
    elseif startswith(segment, "four")
        return 4
    elseif startswith(segment, "five")
        return 5
    elseif startswith(segment, "six")
        return 6
    elseif startswith(segment, "seven")
        return 7
    elseif startswith(segment, "eight")
        return 8
    elseif startswith(segment, "nine")
        return 9
    end
end

function day1_part1(inp)
    sum(parse_digits(line, false) for line in inp)
end

function day1_part2(inp)
    sum(parse_digits(line, true) for line in inp)
end
