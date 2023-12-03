module AdventOfCode2023
using Reexport

# ~~~~~ Utility functions
include("./load.jl")
export load_day

include("./run.jl")
export @run_days

# ~~~~~ Solutions for the days
module Day1
include("./day1.jl")
export parse_day1, day1_part1, day1_part2
end # module Day1
@reexport using .Day1

module Day2
include("./day2.jl")
export parse_day2, day2_part1, day2_part2
end # module Day2
@reexport using .Day2

module Day3
include("./day3.jl")
export parse_day3, day3_part1, day3_part2
end # module Day3
@reexport using .Day3

end # module AdventOfCode2023
