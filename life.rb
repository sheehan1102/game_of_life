require 'rspec'
require 'colorize'
# require 'pry'

require_relative 'lib/cell'
require_relative 'lib/grid'

require_relative 'spec/cell_spec'
require_relative 'spec/grid_spec'

grid = Grid.new(8, 8)
seed = [
	[3,6],
	[3,7],
	[3,5],
	[4,4],
	[4,5],
	[4,6],
	[4,7],
	[0,0],
	[0,1],
	[1,1],
	[2,1],
	[2,2],
	[1,2],
	[1,0],
	[2,0]
]

grid.create_grid
grid.seed_grid(seed)
grid.print_grid
while true
	sleep 0.25
	system "clear"
	grid.refresh_grid
	grid.print_grid
end

