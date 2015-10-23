RSpec.describe "Cell" do
	describe '#regenerate' do
		context "when a cell has to regenerate" do
			it "regenerates a dead cell from a dead cell if it has 0 neighbors" do
				cell1 = Cell.new(0, 0)
				expect(cell1.regenerate).to eq(0)
			end

			it "it regenerates a dead cell from a dead cell if it has 2 neighbors" do
				cell1 = Cell.new(0, 2)
				expect(cell1.regenerate).to eq(0)
			end

			it "regenerates a live cell from a live cell if it has 2 neighbors" do
				cell1 = Cell.new(1, 2)
				expect(cell1.regenerate).to eq(1)
			end

			it "regenerates a live cell from a live cell if it has 3 neighbors" do
				cell1 = Cell.new(1, 3)
				expect(cell1.regenerate).to eq(1)
			end


			it "regenerates a live cell from a dead cell if it has 3 neightbors" do
				cell1 = Cell.new(0, 3)
				expect(cell1.regenerate).to eq(1)
			end

			it "regenerates a dead cell from a live cell if it has 4 neighbors" do
				cell1 = Cell.new(1, 4)
				expect(cell1.regenerate).to eq(0)
			end

			it "regenerates a dead cell from a dead cell if it has 4 neightbors" do
				cell1 = Cell.new(0, 4)
				expect(cell1.regenerate).to eq(0)
			end
		end
	end
end