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
        @gridSize = 20
        @board = Board.new(@gridSize)
    end
    def display(row_position, col_position)
        (0...@gridSize).each do |i|
            (0...@gridSize).each do |j|
                if row_position == i && col_position == j
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
end