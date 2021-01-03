void updateAntPos() {
  frames += 1;
  int state = grid[x][y];
  char letter = movement.charAt(state);
  switch(letter) {
  case 'l':
    turnLeft();
    prev = state;
    break;
  case 'L':
    turnHardLeft();
    prev = state;
    break;
  case 'r':
    turnRight();
    prev = state;
    break;
  case 'R':
    turnHardRight();
    prev = state;
    break;
  case 'U':
    uTurn();
    prev = state;
    break;
  case 'A':
    forward();
    prev = state;
    break;
  case 'V':
    backward();
    prev = state;
    break;
  case 'N':
    North();
    prev = state;
    break;
  case 'n':
    NorthEast();
    prev = state;
    break;
  case 'S':
    South();
    prev = state;
    break;
  case 'e':
    SouthEast();
    prev = state;
    break;
  case 'E':
    East();
    prev = state;
    break;
  case 's':
    SouthWest();
    prev = state;
    break;
  case 'W':
    West();
    prev = state;
    break;
  case 'w':
    NorthWest();
    prev = state;
    break;
  case 'j':
    Jump(1);
    prev = state;
    break;
  case 'J':
    Jump(2);
    prev = state;
    break;
  case 'm':
    memory(0,0);
    break;
  case 'f':
    memory(1,0);
    break;
  case 'b':
    memory(2,0);
    break;
  case 'M':
    memory(0,1);
    break;
  case 'F':
    memory(1,1);
    break;
  case 'B':
    memory(2,1);
    break;
  }
}

void renderAnt() {
  ant.updatePixels();
  if (scale == 1) {
    image(ant, 0, 0);
  } else {
    noStroke();
    for (int i = 0; i < width/scale; i++) {
      for (int j = 0; j < height/scale; j++) {
        fill(Colors[grid[i][j]]);
        rect(i*scale, j*scale, scale, scale);
      }
    }
    drawArrow();
  }
  ant.loadPixels();
}

void drawArrow() {
  if (scale > 2) {
    fill(0, 100);
    rect(x*scale+1, y*scale+1, scale - 2, scale - 2);
    textSize(scale - 2);
    fill(255);
    if (dir == 0) {
      text("↑", x*scale+1, y*scale+(scale - 2));
    } else if (dir == 1) {
      text("↗", x*scale+1, y*scale+(scale - 2));
    } else if (dir == 2) {
      text("→", x*scale+1, y*scale+(scale - 2));
    } else if (dir == 3) {
      text("↘", x*scale+1, y*scale+(scale - 2));
    } else if (dir == 4) {
      text("↓", x*scale+1, y*scale+(scale - 2));
    } else if (dir == 5) {
      text("↙", x*scale+1, y*scale+(scale - 2));
    } else if (dir == 6) {
      text("←", x*scale+1, y*scale+(scale - 2));
    } else if (dir == 7) {
      text("↖", x*scale+1, y*scale+(scale - 2));
    }
  }
}
