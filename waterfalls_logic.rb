require "./waterfalls_data.rb"
class Game
    def initialize
        $Waterfall = 3
        $bullShark = 4
        $message = "Water is all around!"
        $counter = 0
        @column_count = 0...30
        @row_count = 0...30
        @shark = {
            "icon" => "┴ ",
            "x" => 5,
            "y" => 3
        }   
        @still_searching = false
        @level_one = Board.new.create_level_one
        @ship = {
            "health" => 4,
            # "current_item" => nil,
            # "current_armor" => nil,
            "points" => 0,
            "x" => 0,
            "y" => 0,
            "icon" => "Ω "
        }
    end
    # This function displays the level_one
    def display
        @column_count.each do |column|
            @row_count.each do |row|
                if @ship["x"] == column && @ship["y"] == row
                    print @ship["icon"]
                elsif @shark["x"] == column && @shark["y"] == row
                    print @shark["icon"]
                else
                    print @level_one[column][row].display  
                end           
            end
            puts #print one array, hits enter, prints next array
        end
    end
    # This function is how the shark moves
    def shark_movement()
        $counter += 1
        if $counter > 20
            $counter = 0
        end
        if $counter.between?(0,5) 
            @shark["y"] += 1
        end
        if $counter.between?(5, 10)
            @shark["x"] += 1
        end
        if $counter.between?(10, 15)
            @shark["y"] -= 1
        end
        if $counter.between?(15, 20)
            @shark["x"] -= 1
        end
    end
    # This function moves the player around the level_one
    def movement()
        up_key = 'w'
        up_mod = -1
        down_mod = 1
        stay = 0
        right_mod = 1
        left_mod = -1
        if @ship["x"] > 0 &&  @level_one[@ship["x"] - 1][@ship["y"]].passable == true
            handle_move(up_key, up_mod, stay)
        end
        if @ship["y"] > 0 &&  @level_one[@ship["x"]][@ship["y"] - 1].passable == true
            handle_move('a', stay, left_mod)
        end
        if @ship["x"] < @gridSize - 1 #&& level_one[@ship["x"] + 1][@ship["y"]].passable == true
            handle_move('s', down_mod, stay)
        end
        if @ship["y"] < @gridSize - 1 &&  @level_one[@ship["x"]][@ship["y"] + 1].passable == true
            handle_move('d', stay, right_mod)
        end
    end

    def handle_move(key, modifier_x, modifier_y)
        if $input == key 
            if @ship["x"] + modifier_x == @shark["x"] && @ship["y"] + modifier_y == @shark["y"]
                shark_hit()         
            end
            if @level_one[@ship["x"] + modifier_x][@ship["y"] + modifier_y] == $Waterfall
                waterfall_found()             
            else
                $message = "Water is all around!"     
            end     
            @ship["x"] += modifier_x
            @ship["y"] += modifier_y
         @level_one[@ship["x"]][@ship["y"]] = $empty                      
        end        
    end

    def waterfall_found
        $message = "You found a waterfall!!!"
    end

    def shark_hit
        print "You hit the shark and you are dead"
        $input = "q"
    end
    
    def still_waterfalls
        (0...@gridSize).each do |column|
            (0...@gridSize).each do |row|
                if @level_one[column][row] == $Waterfall
                    @still_searching = true
                end
            end
        end
        if @still_searching == false
            $message = "You have found all waterfalls! You don't want no scrubs!"
        end
    end
end

class Move_config
end