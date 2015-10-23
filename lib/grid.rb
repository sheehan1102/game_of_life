class Grid
	attr_reader :height, :width, :current_grid, :controlled_cells

	DIRECTIONS = [
		[0,1],
		[1,1],
		[1,0],
		[1,-1],
		[0,-1],
		[-1,-1],
		[-1,0],
		[-1,1]
	]

	def initialize(width = 12, height = 12)
		@width = width
		@height = height
		@current_grid = [*0..(width - 1)]
		@controlled_cells = []
	end

	def create_grid
		@current_grid.each do |col|
			@current_grid[col] = [*0..(height - 1)]
			@current_grid[col].each do |row|
				new_cell = Cell.new(0, 0, [col, row])
				@current_grid[col][row] = new_cell
				@controlled_cells << new_cell
			end
		end
	end

	def get_color(state)
		if state == 1
			"#{state} ".colorize(:red)
		else
			"#{state} "
		end
	end

	def print_grid
		printable_grid = []
		[*0..(height - 1)].each do |row|
			printable_grid[row] = []
			[*0..(width - 1)].each do |col|
				cell = @controlled_cells.find { |cell| cell.coordinates == [col, row] }
				printable_grid[row][col] = cell.state
			end
		end
		reverse = printable_grid.reverse
		reverse.each do |row|
			row.each do |col|
				print get_color(col)
			end
			puts "\n"
		end
	end

	def check_neighborhood(cell)
		x, y = cell.coordinates.first, cell.coordinates.last
		neighborhood = 0
		DIRECTIONS.each do |direction|
			new_x = x + direction.first
			new_y = y + direction.last
			if (new_x >= 0 && new_x < @width) && (new_y >= 0 && new_y < @height)
				neighbor = @controlled_cells.find { |cell| cell.coordinates == [new_x,new_y] }
				neighborhood += neighbor.state
			end
		end
		neighborhood
	end

	def seed_grid(array)
		array.each do |coordinates|
			cell = @controlled_cells.find { |cell| cell.coordinates == coordinates }
			cell.state = 1
		end
	end

	def send_neighborhood_to_cell
		(0..(height - 1)).to_a.each do |row|
			(0..(width - 1)).to_a.each do |col|
				@current_grid[col][row].live_neighbors = check_neighborhood(@current_grid[col][row])
			end
		end
	end

	def refresh_grid
		send_neighborhood_to_cell
		@controlled_cells.each do |cell|
			cell.regenerate
		end
	end
end


