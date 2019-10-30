require "./waterfalls_data.rb"
class Game
    def initialize
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
        @level = Board.new
        
        @board = @level.create_level_one()
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
    # This function displays the    level
    def display
        @column_count.each do |column|
            @row_count.each do |row|
                if @ship["x"] == column && @ship["y"] == row
                    print @ship["icon"]
                elsif @shark["x"] == column && @shark["y"] == row
                    print @shark["icon"]
                else
                    print @board[column][row].display  
                end           
            end
            puts #print one array, hits enter, prints next array
        end
    end
    # This function is how the shark moves
    # def shark_movement()
    #     $counter += 1
    #     if $counter > 20
    #         $counter = 0
    #     end
    #     if $counter.between?(0,5) 
    #         @shark["y"] += 1
    #     end
    #     if $counter.between?(5, 10)
    #         @shark["x"] += 1
    #     end
    #     if $counter.between?(10, 15)
    #         @shark["y"] -= 1
    #     end
    #     if $counter.between?(15, 20)
    #         @shark["x"] -= 1
    #     end
    # end
    # This function moves the player around the level
    def movement(key_press)
        move_x = 0
        move_y = 0
        if key_press == 'w'
            move_x -= 1
        end
        if key_press == 's'
            puts 's'
            move_x += 1            
        end
        if key_press == 'a'
            move_y -= 1
        end
        if key_press == 'd'
            move_y += 1
        end
        if check_move(@ship['x'] + move_x, @ship['y'] + move_y)
            @ship['x'] += move_x
            @ship['y'] += move_y
        end
    end

    def check_move(pot_x, pot_y)
        if pot_x < 0 || pot_x > @board[0].length         
            return false
        end
        if pot_y < 0 || pot_y > @board[0].length
            return false
        end
        if @board[pot_x][pot_y].passable == false
            return false
        end
        return true
    end
    # def handle_move(key, modifier_x, modifier_y)
    #     if $input == key 
    #         if @ship["x"] + modifier_x == @shark["x"] && @ship["y"] + modifier_y == @shark["y"]
    #             shark_hit()         
    #         end
    #         if    @board[@ship["x"] + modifier_x][@ship["y"] + modifier_y] == $Waterfall
    #             waterfall_found()             
    #         else
    #             $message = "Water is all around!"     
    #         end     
    #         @ship["x"] += modifier_x
    #         @ship["y"] += modifier_y
    #         @board[@ship["x"]][@ship["y"]] = $empty                      
    #     end        
    # end

    def waterfall_found
        $message = "You found a waterfall!!!"
    end

    def shark_hit
        print "You hit the shark and you are dead"
        $input = "q"
    end
    
    # def still_waterfalls
    #     (0...@gridSize).each do |column|
    #         (0...@gridSize).each do |row|
    #             if    @board[column][row] == $Waterfall
    #                 @still_searching = true
    #             end
    #         end
    #     end
    #     if @still_searching == false
    #         $message = "You have found all waterfalls! You don't want no scrubs!"
    #     end
    # end
end