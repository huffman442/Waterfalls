require "./waterfalls_data.rb"
class Game
    def initialize
        $Empty = 0 
        $User = 1
        $Island = 2
        $Waterfall = 3
        $bullShark = 4
        $message = "Water is all around!"
        $counter = 0
        $shark_x = 5
        $shark_y = 3
        @row_position = 0
        @col_position = 0
        @gridSize = 20
        @board = Board.new(@gridSize)
    end
    def display()
        (0...@gridSize).each do |i|
            (0...@gridSize).each do |j|
                if @row_position == i && @col_position == j
                    print "Ω "
                elsif $shark_x == i && $shark_y == j
                    print "┴ "
                else
                    if $grid[i][j] == $Empty
                        print "≈ "    
                    end
                    if $grid[i][j] == $Waterfall
                        print "▓ "
                    end
                    if $grid[i][j] == $Island
                        print "ö "
                    end                
                end           
            end
            puts #print one array, hits enter, prints next array
        end
    end
    def shark_movement(input)
        while $input != q
            $counter += 1
            if $counter > 20
                $counter = 0
            end
            if $counter.between?(0,5) 
                $shark_y += 1
            end
            if $counter.between?(5, 10)
                $shark_x += 1
            end
            if $counter.between?(10, 15)
                $shark_y -= 1
            end
            if $counter.between?(15, 20)
                $shark_x -= 1
            end
    end
    def movement(input)
        if @row_position > 0 && $grid[@row_position - 1][@col_position] != $Island
            if input == 'w' 
                if @row_position - 1 == $shark_x && @col_position == $shark_y
                    print "You hit the shark & you are dead!"
                    input = "q"  
                    
                end
                if $grid[@row_position - 1][@col_position] == $Waterfall
                    message = "You found a waterfall!!!"  
                    $grid[@row_position - 1][@col_position] = $Empty 
                
                else
                    $message = "Water is all around!"     
                end     
                @row_position = @row_position - 1
                      
            end
        end
        if @col_position > 0 && $grid[@row_position][@col_position - 1] != $Island
            if input == 'a'
                if @row_position == $shark_x && @col_position - 1 == $shark_y
                    print "You hit the shark & you are dead!"
                    sleep(3)
                    input = "q"        
                end
                if $grid[@row_position][@col_position - 1] == $Waterfall
                    message = "You found a waterfall!!!" 
                    #sleep(3) 
                else
                    message = "Water is all around!"     
                end
                @col_position = @col_position - 1
                $grid[@row_position][@col_position] = $Empty
            end
        end
        if @row_position < @gridSize - 1 && $grid[@row_position + 1][@col_position] != $Island
            if input == 's'
                if @row_position + 1 == $shark_x && @col_position == $shark_y
                    print "You hit the shark & you are dead!"
                    sleep(3)
                    input = "q"               
                end
                if $grid[@row_position + 1][@col_position] == $Waterfall
                    message = "You found a waterfall!!!"  
                    #sleep(3) 
                else
                    message = "Water is all around!"     
                end
                @row_position = @row_position + 1
                $grid[@row_position][@col_position] = $Empty
            end
        end
        if @col_position < @gridSize - 1 && $grid[@row_position][@col_position + 1] != $Island
            if input == 'd'
                if @row_position == $shark_x && @col_position + 1 == $shark_y
                    print "You hit the shark & you are dead!"
                    sleep(3)
                    input = "q"          
                end
                if $grid[@row_position][@col_position + 1] == $Waterfall
                    message = "You found a waterfall!!!"  
                    #sleep(3)    
                else
                    $message = "Water is all around!" 
                end
                @col_position = @col_position + 1
                $grid[@row_position][@col_position] = $Empty
            end
        end
        input
    end
end