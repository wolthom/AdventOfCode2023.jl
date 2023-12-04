function parse_day3(inp_str)
    hcat([collect(l) for l in eachsplit(inp_str, '\n')]...)
end

function consider_digit(neighborhood)
    valid = false
    for c in neighborhood
        if c != '.' && !isdigit(c)
            valid = true
            break
        end
    end

    valid
end

function day3_part1(inp)
    start_idx = nothing
    end_idx = nothing

    digit_stack = Char[]
    out = 0

    for idx in CartesianIndices(inp)
        if isdigit(inp[idx]) && isnothing(start_idx)
            start_idx = idx
            end_idx = idx
            push!(digit_stack, inp[idx])
        elseif isdigit(inp[idx])
            end_idx = idx
            push!(digit_stack, inp[idx])
        elseif !isnothing(start_idx) && !isnothing(end_idx)
            upper_left = max(start_idx - CartesianIndex(1, 1), CartesianIndex(1, 1))
            lower_right = min(end_idx + CartesianIndex(1, 1), CartesianIndex(size(inp)))

            neighborhood = @view inp[upper_left:lower_right]
            if consider_digit(neighborhood)
                # TODO: Remove superfluous allocation
                out += parse(Int, join(digit_stack))
            end

            start_idx = nothing
            end_idx = nothing
            empty!(digit_stack)
        end
    end
    out
end

function day3_part2(inp)
    nothing
end
