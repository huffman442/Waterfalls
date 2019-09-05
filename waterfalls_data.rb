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

    def create grid, col, row, start_x, start_y
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
        @grid = island.create(@grid, 4, 4, 1, 3)
        @grid = island.create(@grid, 1, 1, 1, 7)
        @grid = island.create(@grid, 2, 4, 1, 8)
        
        @grid[2][7] = Waterfall.new
    

        return @grid
    end
end

class Game_Over
    def initialize
        $grid = Array.new(gridSize){ Array.new(gridSize) { 0 }}
        $message = "Game over! New Game (y/n)"
    end
end