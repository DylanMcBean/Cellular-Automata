void reset(boolean generateRandom) {
  if ( generateRandom ) {
    generateRandomMovement();
  }

  pal = pals[floor(random(pals.length))];
  grid = new int[width/scale][height/scale];
  ant = createImage(width, height, RGB);
  fx = new PostFX(this);
  ant.loadPixels();
  mem = 0;
  prev = 0;
  updateSpeed = 1;
  frameRate(10);
  for (int i = 0; i < ant.pixels.length; i++) {
    ant.pixels[i] = color(0);
  }
  ant.updatePixels();
  setColor(pal);

  x = width / (scale * 2);
  y = height / (scale * 2);

  dir = ANTUP;
  for(int i = 0; i < 100; i ++) {
   println();
  }
  printMovement();
  surface.setTitle(movement + " - " + pal.name);
}

void setColor(Palette pal) {
  Colors = new color[movement.length()];

  Colors[0] = color(0);
  for ( int i = 1; i < Colors.length; ++i ) {
    Colors[i] = pal.col(map(i, 1, Colors.length, 0.0, 1.0));
  }
  
  updateSmallFrame();
}

void updateSmallFrame(){
  loadPixels();
  for (int i = 0; i < width/scale; i++) {
      for (int j = 0; j < height/scale; j++) {
        ant.pixels[i+j*(width/scale)] = Colors[grid[i][j]];
      }
    }
  updatePixels();
}

void generateRandomMovement() {
  movement = "";
  String letters = "LRUANESWVlrneswJjmfbMFB";
  int amount = floor(random(2, 10));
  for (int i = 0; i < amount; i ++) {
    movement += letters.charAt(floor(random(letters.length())));
  }
}

void printMovement() {
  println("Scale: " + scale);
  println("Inputs:\n\tR - reset\n\tP - Pause\n\tI - Step\n\tT - Toggle Shaders\n\tS - Screenshot\n\tM - recording\n\t[0 - 9,A - E] - Color Scheme");
  print("Movement: ", movement);
  for (int i = 0; i < movement.length(); i ++) {
    char letter = movement.charAt(i);
    switch(letter) {
    case 'l':
      print("\n     - Left");
      break;
    case 'L':
      print("\n     - Hard Left");
      break;
    case 'r':
      print("\n     - Right");
      break;
    case 'R':
      print("\n     - Hard Right");
      break;
    case 'U':
      print("\n     - U-Turn");
      break;
    case 'A':
      print("\n     - Ahead");
      break;
    case 'V':
      print("\n     - Reverse");
      break;
    case 'N':
      print("\n     - North");
      break;
    case 'n':
      print("\n     - North East");
      break;
    case 'S':
      print("\n     - South");
      break;
    case 's':
      print("\n     - South West");
      break;
    case 'E':
      print("\n     - East");
      break;
    case 'e':
      print("\n     - South East");
      break;
    case 'W':
      print("\n     - West");
      break;
    case 'w':
      print("\n     - North West");
      break;
    case 'j':
      print("\n     - Jump");
      break;
    case 'J':
      print("\n     - Big Jump");
      break;
   case 'm':
      print("\n     - Short Term Memory Switch");
      break;
   case 'f':
      print("\n     - Short Term Memory Move Forward");
      break;
   case 'b':
      print("\n     - Short Term Memory Move Backward");
      break;
   case 'M':
      print("\n     - Long Term Memory Switch");
      break;
   case 'F':
      print("\n     - Long Term Memory Move Forward");
      break;
   case 'B':
      print("\n     - Long Term Memory Move Backward");
      break;
    }
  }
  println();
}
