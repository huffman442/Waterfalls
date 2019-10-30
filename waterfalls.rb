# Input and screen clearing things!
require "io/console"
require "./waterfalls_data.rb"
require "./waterfalls_logic.rb"
input = ""
game = Game.new
#loading_message = "Today you wont be sticking to the rivers & lakes that you're used to..."
#loading_message.each_char do |i|
#     print i
#     sleep(0.1)
# end
system "cls"
puts ""
while input != "q" #If key pressed isn't 'q', keep playing the game.
    game.display()
    puts $message
    # game.shark_movement()
    # get single character input
    input = STDIN.getch
    # character doesn't get typed when a person types it   
    game.movement(input)
    # game.still_waterfalls()
    # clear screen for windows
    system "cls"
end