require "./waterfalls_data.rb"

class Tile
    attr_accessor :display
    attr_accessor :revealed
    attr_reader :passable
    attr_accessor :has_treasure
    attr_reader :color
    
    def initialize
        @display = "  "
        @passable = true
        @has_treasure = false
        @revealed = false
        @color = :cyan
    end

    def effect player
        return nil
    end

    def check_reveal vertical_coord, horizontal_coord, ship_vert, ship_horiz, light_rad
        if (vertical_coord - ship_vert).abs() <= light_rad && (horizontal_coord - ship_horiz).abs() <= light_rad 
            @revealed = true
            if self.is_a? Waterfall 
                 @display = "▓ "
            end
        end
        if self.is_a? Waterfall
        if (vertical_coord - ship_vert).abs() > light_rad || (horizontal_coord - ship_horiz).abs() > light_rad 
            @display = "≈ "
        end
    end
    end
end

class Water < Tile
    def initialize
        @display = "≈ "
        @color = :cyan
    end
end

class Island < Tile
    def initialize
        @display = "ö "
        @passable = false
        @color = :green
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
        @color = :cyan
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