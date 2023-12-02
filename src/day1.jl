using Chain

function parse_day1(inp_str)
    elves = eachsplit(inp_str, "\n\n")
    collect(map(parse_elve, elves))
end

function parse_elve(inp_str)
    @chain inp_str begin
        eachsplit("\n")
        map(el -> parse(Int64, el), _)
        collect
    end
end

function day1_part1(inp)
    maximum(sum, inp)
end

function day1_part2(inp)
    indices = partialsortperm(inp, 1:3; by=sum, rev=true)
    map(indices) do idx
        sum(inp[idx])
    end |> sum
end
