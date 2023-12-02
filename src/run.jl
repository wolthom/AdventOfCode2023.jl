macro run_days(days, session_token_symbol=nothing)
    range = Meta.eval(days)
    out = quote end

    for day in range
        push!(out.args, run_day_expr(day, session_token_symbol))
    end

    return out
end

function run_day_expr(day, session_token_symbol)
    parse_fn = Symbol("parse_day$day")
    p1_fn = Symbol("day$(day)_part1")
    p2_fn = Symbol("day$(day)_part2")
    quote
        inp_str = load_day($day, $(esc(session_token_symbol)))     
        inp = $(esc(parse_fn))(inp_str)
        p1 = $(esc(p1_fn))(inp)
        p2 = $(esc(p2_fn))(inp)
        println($("Day $day:"))
        println("\t Part 1: ", p1)
        println("\t Part 2: ", p2)
        println()
    end
end
