//The ant turn right
void turnRight() {
  dir++;
  if (dir > ANTUPLEFT) {
    dir = ANTUP;
  }
  grid[x][y] = (grid[x][y]+1)%movement.length();
  ant.pixels[x + y * ant.width] = Colors[grid[x][y]];
  moveForward();
}
void turnHardRight() {
  dir++;
  if (dir > ANTUPLEFT) {
    dir = ANTUP;
  }
  dir++;
  if (dir > ANTUPLEFT) {
    dir = ANTUP;
  }
  grid[x][y] = (grid[x][y]+1)%movement.length();
  ant.pixels[x + y * ant.width] = Colors[grid[x][y]];
  moveForward();
}

//The ant turn left
void turnLeft() {
  dir--;
  if (dir < ANTUP) {
    dir = ANTUPLEFT;
  }
  grid[x][y] = (grid[x][y]+1)%movement.length();
  ant.pixels[x + y * ant.width] = Colors[grid[x][y]];
  moveForward();
}
void turnHardLeft() {
  dir--;
  if (dir < ANTUP) {
    dir = ANTUPLEFT;
  }
  dir--;
  if (dir < ANTUP) {
    dir = ANTUPLEFT;
  }
  grid[x][y] = (grid[x][y]+1)%movement.length();
  ant.pixels[x + y * ant.width] = Colors[grid[x][y]];
  moveForward();
}

//the ant does a Uturn;
void uTurn() {
  dir++;
  if (dir > ANTUPLEFT) {
    dir = ANTUP;
  }
  dir++;
  if (dir > ANTUPLEFT) {
    dir = ANTUP;
  }
  dir++;
  if (dir > ANTUPLEFT) {
    dir = ANTUP;
  }
  dir++;
  if (dir > ANTUPLEFT) {
    dir = ANTUP;
  }
  grid[x][y] = (grid[x][y]+1)%movement.length();
  ant.pixels[x + y * ant.width] = Colors[grid[x][y]];
  moveForward();
}

void forward() {
  grid[x][y] = (grid[x][y]+1)%movement.length();
  ant.pixels[x + y * ant.width] = Colors[grid[x][y]];
  moveForward();
}

void Jump(int amount) {
  grid[x][y] = (grid[x][y]+1)%movement.length();
  ant.pixels[x + y * ant.width] = Colors[grid[x][y]];
  moveForward();
  for (int i = 0; i < amount; i ++) {
    moveForward();
  }
}

void memory(int type, int type2) {
  int type_ = prev;
  if (type2 == 1) {
   type_ = mem;
  }
  switch(movement.charAt(type_)) {
  case 'l':
    turnLeft();
    break;
  case 'L':
    turnHardLeft();
    break;
  case 'r':
    turnRight();
    break;
  case 'R':
    turnHardRight();
    break;
  case 'U':
    uTurn();
    break;
  case 'A':
    forward();
    break;
  case 'V':
    backward();
    break;
  case 'N':
    North();
    break;
  case 'n':
    NorthEast();
    break;
  case 'S':
    South();
    break;
  case 'e':
    SouthEast();
    break;
  case 'E':
    East();
    break;
  case 's':
    SouthWest();
    break;
  case 'W':
    West();
    break;
  case 'w':
    NorthWest();
    break;
  case 'j':
    Jump(1);
    break;
  case 'J':
    Jump(2);
    break;
  }
  grid[x][y] = (grid[x][y]+1)%movement.length();
  ant.pixels[x + y * ant.width] = Colors[grid[x][y]];
  if (type == 1) {
    moveForward();
  } else if (type == 2) {
    moveBackward();
  }
  if (type2 == 1) {
    mem = (mem + 1)%movement.length();
  }
}

void backward() {
  grid[x][y] = (grid[x][y]+1)%movement.length();
  ant.pixels[x + y * ant.width] = Colors[grid[x][y]];
  moveBackward();
}

//The ant moves forward
void moveForward() {
  if (dir == ANTUP) {
    y--;
  } else if (dir == ANTRIGHT) {
    x++;
  } else if (dir == ANTDOWN) {
    y++;
  } else if (dir == ANTLEFT) {
    x--;
  } else if (dir == ANTUPRIGHT) {
    y--;
    x++;
  } else if (dir == ANTDOWNRIGHT) {
    y++;
    x++;
  } else if (dir == ANTDOWNLEFT) {
    y++;
    x--;
  } else if (dir == ANTUPLEFT) {
    y--;
    x--;
  }

  Boundary();
}

//The ant moves backwards
void moveBackward() {
  if (dir == ANTUP) {
    y++;
  } else if (dir == ANTRIGHT) {
    x--;
  } else if (dir == ANTDOWN) {
    y--;
  } else if (dir == ANTLEFT) {
    x++;
  } else if (dir == ANTUPRIGHT) {
    y++;
    x--;
  } else if (dir == ANTDOWNRIGHT) {
    y--;
    x--;
  } else if (dir == ANTDOWNLEFT) {
    y--;
    x++;
  } else if (dir == ANTUPLEFT) {
    y++;
    x++;
  }

  Boundary();
}

//The ant faces north
void North() {
  dir = ANTUP;
  grid[x][y] = (grid[x][y]+1)%movement.length();
  ant.pixels[x + y * ant.width] = Colors[grid[x][y]];
  moveForward();
}
void NorthEast() {
  dir = ANTUPRIGHT;
  grid[x][y] = (grid[x][y]+1)%movement.length();
  ant.pixels[x + y * ant.width] = Colors[grid[x][y]];
  moveForward();
}

//The ant faces east
void East() {
  dir = ANTRIGHT;
  grid[x][y] = (grid[x][y]+1)%movement.length();
  ant.pixels[x + y * ant.width] = Colors[grid[x][y]];
  moveForward();
}

void SouthEast() {
  dir = ANTDOWNRIGHT;
  grid[x][y] = (grid[x][y]+1)%movement.length();
  ant.pixels[x + y * ant.width] = Colors[grid[x][y]];
  moveForward();
}

//The ant faces south
void South() {
  dir = ANTDOWN;
  grid[x][y] = (grid[x][y]+1)%movement.length();
  ant.pixels[x + y * ant.width] = Colors[grid[x][y]];
  moveForward();
}

//The ant faces south
void SouthWest() {
  dir = ANTDOWNLEFT;
  grid[x][y] = (grid[x][y]+1)%movement.length();
  ant.pixels[x + y * ant.width] = Colors[grid[x][y]];
  moveForward();
}

//The ant faces west
void West() {
  dir = ANTLEFT;
  grid[x][y] = (grid[x][y]+1)%movement.length();
  ant.pixels[x + y * ant.width] = Colors[grid[x][y]];
  moveForward();
}

void NorthWest() {
  dir = ANTUPLEFT;
  grid[x][y] = (grid[x][y]+1)%movement.length();
  ant.pixels[x + y * ant.width] = Colors[grid[x][y]];
  moveForward();
}


//Checks to see if ant if offscreen
void Boundary() {
  if (x > (width / scale)-1) {
    x = 0;
  } else if (x < 0) {
    x = (width / scale)-1;
  }
  if (y > (height / scale)-1) {
    y = 0;
  } else if (y < 0) {
    y = (height / scale)-1;
  }
}
