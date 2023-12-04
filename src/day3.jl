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

function parse_day3(inp_str)
    lines = eachsplit(inp_str, '\n')
    map(parse_game, lines)
end

function day3_part1(inp)
    start_idx = nothing
    end_idx = nothing

    game = Game(id, 0, 0, 0)

    for (num, color) in color_parts
        num = parse(Int64, num)
        if color[1] == 'r'
            @reset game.red = max(num, game.red)
        elseif color[1] == 'g'
            @reset game.green = max(num, game.green)
        elseif color[1] == 'b'
            @reset game.blue = max(num, game.blue)
        end
    end

    if isnothing(game.red) || isnothing(game.green) || isnothing(game.blue)
        throw(ArgumentError("Invalid input"))
    end
    game
end

function isvalidgame(game, limits)
    game.red <= limits.red && game.green <= limits.green && game.blue <= limits.blue
end

function day3_part1(inp)
    limits = (; red=12, green=13, blue=14)
    sum(game.id * isvalidgame(game, limits) for game in inp)
end

function day3_part2(inp)
    sum(game.red * game.green * game.blue for game in inp)
end
