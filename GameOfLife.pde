// Yusuf Fuat Altıok
// A simple simulation of Conway's Game Of Life
// https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life


int cols;
int rows;
int resolution = 5;
Cell[][] oldGrid;
Cell[][] newGrid;
boolean start = false;

void setup() {
  //size(800, 600);
  fullScreen();
  background(0);
  cols = floor(width/resolution);
  rows = floor(height/resolution);
  oldGrid = createGrid(oldGrid);
  newGrid = new Cell[cols][rows];
  newGrid = oldGrid;
}

void draw() {
  if (start) {
    // Step 1 : Draw the grid.
    drawGrid();

    // Step 2 : Find neighbors.
    findAllNeighbors();


    // Step 3 : Create the new generation.
    generateNextGen();
  }
}

void mousePressed() {
  if (start) {
    start = false;
  } else {
    start = true;
  }
}



void generateNextGen() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (oldGrid[i][j].state == 0 &&
        oldGrid[i][j].neighborCount == 3)
      {
        newGrid[i][j].state = 1;
      }
      if (oldGrid[i][j].state == 1 &&
        (oldGrid[i][j].neighborCount < 2 || oldGrid[i][j].neighborCount > 3)) 
      {
        newGrid[i][j].state = 0;
      }
    }
  }
  oldGrid = newGrid;
}

void findAllNeighbors() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      oldGrid[i][j].findNeighbors(oldGrid, i, j);
    }
  }
}


void drawGrid() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      oldGrid[i][j].show();
    }
  }
}

Cell[][] createGrid(Cell[][] arr) {
  arr = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int r = floor(random(2));
      arr[i][j] = new Cell(i*resolution, j*resolution, resolution, r);
    }
  }
  return arr;
}
