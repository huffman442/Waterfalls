# Input and screen clearing things!
require "io/console"
require "./waterfalls_data.rb"
require "./waterfalls_logic.rb"
input = ""
game = Game.new
gridSize = 20

#loading_message = "Today you wont be sticking to the rivers & lakes that you're used to..."
#loading_message.each_char do |i|
#     print i
#     sleep(0.1)
# end
system "cls"
puts ""
while input != "q" 
    game.display()
    puts $message
    
    game.shark_movement(input)       
    
    # get single character input
    input = STDIN.getch
    # character doesn't get typed when a person types it
   
    game.movement(input)
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