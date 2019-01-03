# Input and screen clearing things!
require "io/console"
require "./waterfalls_data.rb"
require "./waterfalls_logic.rb"
input = ""
game = Game.new
row_position = 0
col_position = 0
gridSize = 20
#%x ( say 'today you wont be sticking to the rivers and the lakes that youre used to' )
#loading_message = "Today you wont be sticking to the rivers & lakes that you're used to..."
#loading_message.each_char do |i|
#     print i
#     sleep(0.1)
# end
system "cls"
puts ""
while input != "q" 
    game.display(row_position, col_position)
    puts $message
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
       
    
    # get single character input
    input = STDIN.getch
    # character doesn't get typed when a person types it
   
    if row_position > 0 && $grid[row_position - 1][col_position] != $Island
        if input == 'w' 
            if row_position - 1 == $shark_x && col_position == $shark_y
                print "You hit the shark & you are dead!"
                input = "q"  
                
            end
            if $grid[row_position - 1][col_position] == $Waterfall
                message = "You found a waterfall!!!"  
                $grid[row_position - 1][col_position] = $Empty 
            
            else
                $message = "Water is all around!"     
            end     
            row_position = row_position - 1
                  
        end
    end
    if col_position > 0 && $grid[row_position][col_position - 1] != $Island
        if input == 'a'
            if row_position == $shark_x && col_position - 1 == $shark_y
                print "You hit the shark & you are dead!"
                sleep(3)
                input = "q"        
            end
            if $grid[row_position][col_position - 1] == $Waterfall
                message = "You found a waterfall!!!" 
                #sleep(3) 
            else
                message = "Water is all around!"     
            end
            col_position = col_position - 1
            $grid[row_position][col_position] = $Empty
        end
    end
    if row_position < gridSize - 1 && $grid[row_position + 1][col_position] != $Island
        if input == 's'
            if row_position + 1 == $shark_x && col_position == $shark_y
                print "You hit the shark & you are dead!"
                sleep(3)
                input = "q"               
            end
            if $grid[row_position + 1][col_position] == $Waterfall
                message = "You found a waterfall!!!"  
                #sleep(3) 
            else
                message = "Water is all around!"     
            end
            row_position = row_position + 1
            $grid[row_position][col_position] = $Empty
        end
    end
    if col_position < gridSize - 1 && $grid[row_position][col_position + 1] != $Island
        if input == 'd'
            if row_position == $shark_x && col_position + 1 == $shark_y
                print "You hit the shark & you are dead!"
                sleep(3)
                input = "q"          
            end
            if $grid[row_position][col_position + 1] == $Waterfall
                message = "You found a waterfall!!!"  
                #sleep(3)    
            else
                $message = "Water is all around!" 
            end
            col_position = col_position + 1
            $grid[row_position][col_position] = $Empty
        end
    end
    still_searching = false
    (0...gridSize).each do |i|
        (0...gridSize).each do |j|
            if $grid[i][j] == $Waterfall
                still_searching = true
            end
        end
    end
    if still_searching == false
        message = "You have found all waterfalls! You don't want no scrubs!"
    end
    # clear screen for windows
    system "cls"
end