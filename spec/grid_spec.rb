RSpec.describe "::Grid" do
	before :each do
		@grid = Grid.new(14, 14)
		@grid.create_grid
		@cell = Cell.new(0, 0, [5,5])
	end

	describe "#create_grid" do
		context "when game begins" do
			it "creates a grid" do
				expect(@grid.current_grid.length).to eq(14)
			end
		end

		context "when the board gets cells" do
			it "finds a cell in any square" do
				expect(@grid.current_grid[rand(13)][rand(13)]).to be_instance_of(Cell)
			end

			it "shows the grid owns the cells" do
				check_cell = @grid.current_grid[0][0]
				expect(@grid.controlled_cells.find { |cell| cell == check_cell }).to be_truthy
			end
		end
	end

	describe "#check_neighborhood" do
		it "gets the neighborhood" do
			expect(@grid.check_neighborhood(@cell)).to be(0) 
		end
	end

	describe "#refresh_board" do
		it "returns a new board" do
			@grid.refresh_grid
			expect(@grid.current_grid.length).to eq(14)
		end
	end

	describe "#seed_board" do
		it "places living cells on board" do
			@grid.seed_grid([[1,2],[3,4],[2,6],[2,5],[3,4]])
			seed = @grid.controlled_cells.find { |cell| cell.coordinates == [1,2] }
			expect(seed.state).to eq(1)
		end
	end
end