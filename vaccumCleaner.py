class VacuumCleaner:
    def _init_(self, rows, cols):
        self.rows = rows
        self.cols = cols
        self.position = (0, 0)  # Initial position at top-left corner
        self.grid = [[0] * cols for _ in range(rows)]  # Initialize a clean grid

    def move_left(self):
        if self.position[1] > 0:
            self.position = (self.position[0], self.position[1] - 1)
    
    def move_right(self):
        if self.position[1] < self.cols - 1:
            self.position = (self.position[0], self.position[1] + 1)
    
    def move_up(self):
        if self.position[0] > 0:
            self.position = (self.position[0] - 1, self.position[1])
    
    def move_down(self):
        if self.position[0] < self.rows - 1:
            self.position = (self.position[0] + 1, self.position[1])
    
    def clean(self):
        self.grid[self.position[0]][self.position[1]] = 0
    
    def make_dirty(self, row, col):
        self.grid[row][col] = 1
    
    def print_grid(self):
        for row in self.grid:
            print(' '.join(map(str, row)))

def main():
    rows = 5
    cols = 5
    vacuum = VacuumCleaner(rows, cols)

    # Make some spots dirty
    vacuum.make_dirty(1, 2)
    vacuum.make_dirty(3, 4)

    # Clean the spots
    vacuum.clean()

    # Move the vacuum around and clean
    vacuum.move_right()
    vacuum.clean()
    vacuum.move_down()
    vacuum.clean()
    vacuum.move_left()
    vacuum.clean()

    print("Final Grid:")
    vacuum.print_grid()

if _name_ == "_main_":
    main()
