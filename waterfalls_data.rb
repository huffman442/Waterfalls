require "./waterfalls_tiles.rb"

class Board
    def initialize
        gridSize = 100
        @grid = Array.new(gridSize){ Array.new(gridSize){ Water.new } }
    end

    def create_level_one
        island = Island.new
        
        # Place 3 'u-shaped' islands onto the grid
        @grid = island.u_shape @grid, rand(1..8), rand(2..15)
        @grid = island.u_shape @grid, rand(9..14), rand(16..21)
        @grid = island.u_shape @grid, rand(18..24), rand(3..15) 
    end
end

# class Game_Over
#     def initialize
#         $grid = Array.new(gridSize){ Array.new(gridSize) { 0 }}
#         $message = "Game over! New Game (y/n)"
#     end
# end