class Cell {

  int state;
  int x;
  int y;
  int w;
  int neighborCount = 0;

  Cell(int x, int y, int w) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.state = 0;
  }

  Cell(int x, int y, int w, int state) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.state = state;
  }

  void updateNeighbors(int count) {
    neighborCount = count;
  }

  int findNeighbors(Cell[][] grid, int x, int y) {
    int sum = 0;
    for (int i = -1; i < 2; i++) {
      for (int j = -1; j < 2; j++) {

        int a = (x + i + grid.length) % grid.length;
        int b = (y + j + grid[0].length) % grid[0].length;
        sum+=grid[a][b].state;
      }
    }
    sum-= grid[x][y].state;
    updateNeighbors(sum);
    return sum;
  }

  void show() {
    if (state == 1) {
      fill(255);
      stroke(0);
    }else{
      fill(0);
    }
    rect(x, y, w, w);
  }
}
