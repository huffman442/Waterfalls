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

class Island_tile < Tile
    def initialize
        @display = "ö "
        @passable = false
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
    def initialize(gridSize)
        $grid = Array.new(gridSize){ Array.new(gridSize){ Water.new } }
        $grid[2][4] = Waterfall.new
        $grid[3][5] = Waterfall.new
        $grid[2][7] = Waterfall.new
        $grid[2][3] = Island_tile.new
        $grid[1][3] = Island_tile.new
        $grid[3][3] = Island_tile.new
        $grid[4][4] = Island_tile.new
        $grid[4][3] = Island_tile.new
        $grid[4][5] = Island_tile.new
        $grid[1][4] = Island_tile.new
        $grid[1][5] = Island_tile.new
        $grid[1][6] = Island_tile.new
        $grid[1][7] = Island_tile.new
        $grid[1][8] = Island_tile.new
        $grid[1][9] = Island_tile.new
        $grid[2][9] = Island_tile.new
        $grid[3][9] = Island_tile.new
        $grid[4][9] = Island_tile.new
    end
end

class Game_Over
    def initialize
        $grid = Array.new(gridSize){ Array.new(gridSize) { 0 }}
        $message = "Game over! New Game (y/n)"
    end
end