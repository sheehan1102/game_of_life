class Cell
	attr_reader :coordinates
	attr_accessor :state, :live_neighbors

	REACTIONS = {
		0 => 0,
		1 => 0,
		2 => 1,
		3 => 1,
		4 => 0,
		5 => 0,
		6 => 0,
		7 => 0,
		8 => 0
	}

	def initialize(state, live_neighbors, coordinates = [0,0])
		@state = state
		@live_neighbors = live_neighbors
		@coordinates = coordinates
	end

	def regenerate
		if @state == 0 && live_neighbors == 2
			0
		else
			@state = REACTIONS[live_neighbors]
		end
	end
end