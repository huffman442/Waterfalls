require "./waterfalls_data.rb"
require 'colorize'
require 'colorized_string'

class Game
    def initialize
        @horizontal_min = 0 
        @horizontal_max = 15
        @vertical_min = 0
        @vertical_max = 15
        $message = "Water is all around!"
        $counter = 0
        @up = 'w'
        @left = 'a'
        @right = 'd'
        @down = 's'
        @shark = {
            :icon => "┴ ",
            :row_pos => 5,
            :col_pos => 3
        }   
        @display_count 
        @still_searching = false
        @level = Board.new
        
        @board = @level.create_level_one()


        @ship = {
            :health => 4,
            # "current_item" => nil,
            # "current_armor" => nil,
            :points => 0,
            :vertical_pos => 0,
            :horizontal_pos => 0,
            :icon => "Ω ",
            :light_radius => 3
        }
    end
    # This function displays the    level
    def display
        @board.each_with_index do |tiles, vertical_index|
            tiles.each_with_index do |tile, horizontal_index|
                if @ship[:vertical_pos] == vertical_index && @ship[:horizontal_pos] == horizontal_index
                    print @ship[:icon].on_black
                elsif @shark[:row_pos] == vertical_index && @shark[:col_pos] == horizontal_index
                    print @shark[:icon]
                else
                    if check_display(vertical_index, horizontal_index, tile)
                        if tile.revealed
                            print tile.display.colorize(tile.color).on_black
                        else
                            print tile.display.colorize(:white).on_black
                        end
                    end
                end           
            end
            if vertical_index >= @vertical_min && vertical_index < @vertical_max
                puts
            end
             #print one array, hits enter, prints next array
        end
    end
    # This function is how the shark moves
    def shark_movement()
        $counter += 1
        if $counter > 20
            $counter = 0
        end
        if $counter.between?(0,5) 
          @shark[:col_pos] += 1
        end
        if $counter.between?(5, 10)
          @shark[:row_pos] += 1
        end
        if $counter.between?(10, 15)
          @shark[:col_pos] -= 1
        end
        if $counter.between?(15, 20)
          @shark[:row_pos] -= 1
        end
    end
    # This function moves the player around the level
    def movement(direction)
        move_vertical = 0
        move_horizontal = 0
        move_up = -1
        move_down = 1
        move_left = -1
        move_right = 1


        if direction == @up
            move_vertical = move_up
        end
        if direction == @down
            puts 's'
            move_vertical = move_down           
        end
        if direction == @left
            move_horizontal = move_left
        end
        if direction == @right
            move_horizontal = move_right
        end
        if check_move(@ship[:vertical_pos] + move_vertical, @ship[:horizontal_pos] + move_horizontal)
            @ship[:vertical_pos] += move_vertical
            @ship[:horizontal_pos] += move_horizontal
        end
        if check_scroll(@ship[:vertical_pos] + move_vertical, @ship[:horizontal_pos] + move_horizontal, direction)
            @vertical_min += move_vertical
            @vertical_max += move_vertical
            @horizontal_min += move_horizontal
            @horizontal_max += move_horizontal
        end
    end

    def check_display(vertical_coord, horizontal_coord, current_tile)
        if vertical_coord < @vertical_min || vertical_coord >= @vertical_max
            return false
        end
        if horizontal_coord < @horizontal_min || horizontal_coord >= @horizontal_max
            return false
        end
        current_tile.check_reveal(vertical_coord, horizontal_coord, @ship[:vertical_pos], @ship[:horizontal_pos], @ship[:light_radius] )
        true   
    end

    def check_scroll(potential_vertical, potential_horizontal, direction)
        if @vertical_max - potential_vertical == 5 && direction == @down && potential_vertical < @board[0].length - 5
            return true
        end
        if potential_vertical - @vertical_min == 5  && direction == @up && potential_vertical >= 6
            return true
        end
        if @horizontal_max - potential_horizontal == 5 && direction == @right && potential_horizontal < @board[0].length - 5
            return true
        end
        if potential_horizontal - @horizontal_min == 5  && direction == @left && potential_horizontal >= 6
            return true
        end
        return false      
    end

    def check_move(potential_vertical, potential_horizontal)
        if potential_vertical < 0 || potential_vertical >= @board[0].length      
            return false
        end
        if potential_horizontal < 0 || potential_horizontal >= @board[0].length
            return false
        end
        if @board[potential_vertical][potential_horizontal].passable == false
            return false
        end
        return true
    end
    # def handle_move(key, modifier_x, modifier_y)
    #     if $input == key 
    #         if @ship["x"] + modifier_x =:row_pos && @ship["y"] + modifier_y =:col_pos
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