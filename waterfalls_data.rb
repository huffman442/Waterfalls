class Tile
    attr_reader :display
    attr_reader :passable
    attr_reader :has_treasure
    
    def initialize
        @display = "  "
        @passable = true
        @has_treasure = false
    end

    def effect player
        return nil
    end
end

class Water < Tile
    def initialize
        @display = "≈ "
    end
end

class Island < Tile
    def initialize
        @display = "ö "
        @passable = false
    end

    def u_shape grid, start_x, start_y
        col = [4, 1, 2]
        row = [4, 1, 4]
        y = [start_y, start_y + 4, start_y + 5]
        col.each_with_index do |x, i|
            grid = create_block grid, x, row[i], start_x, y[i]
        end
        grid[start_x + 1][start_y + 4] = Waterfall.new
        grid
    end

    def create_block grid, col, row, start_x, start_y
        (start_x...start_x + row).each do |r|
            (start_y...start_y + col).each do |c|
                grid[r][c] = Island.new
            end
        end

        grid
    end

    def effect player
        return "How did you get here?"
    end
end

class Whirlpool < Tile
    def initialize
        "Q)"
    end

    def effect player
        player["health"] -= 1
    end
end

class Waterfall < Tile
    def initialize
        @display = "▓ "
        @has_treasure = true
        @has_been_found = false
    end
    def effect player
        if(@has_been_found)
            return "Someone already took the gold!"
        else
            @has_been_found = true
            @has_treasure = false
            player["gold"] += 10
            return "you got some sweet treasure"
        end
    end
end


class Board
    def initialize
        gridSize = 30
        @grid = Array.new(gridSize){ Array.new(gridSize){ Water.new } }
    end

    def create_level_one
        island = Island.new
        
        @grid = island.u_shape @grid, 1, 3
        @grid = island.u_shape @grid, 9, 21
        @grid = island.u_shape @grid, 18, 3 
    end
end

class Game_Over
    def initialize
        $grid = Array.new(gridSize){ Array.new(gridSize) { 0 }}
        $message = "Game over! New Game (y/n)"
    end
end