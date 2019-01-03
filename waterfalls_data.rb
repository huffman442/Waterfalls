class Board
    def initialize(gridSize)
        $grid = Array.new(gridSize){ Array.new(gridSize){ 0 } }
        $grid[2][4] = 3
        $grid[3][5] = 3
        $grid[2][7] = 3
        $grid[2][3] = 2
        $grid[1][3] = 2
        $grid[3][3] = 2
        $grid[4][4] = 2
        $grid[4][3] = 2
        $grid[4][5] = 2
        $grid[1][4] = 2
        $grid[1][5] = 2
        $grid[1][6] = 2
        $grid[1][7] = 2
        $grid[1][8] = 2
        $grid[1][9] = 2
        $grid[2][9] = 2
        $grid[3][9] = 2
        $grid[4][9] = 2
    end
end