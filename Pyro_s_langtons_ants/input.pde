void keyPressed() {
  switch ( key ) {
  case 'r':
    reset(true);
    break;
    
  case 'q':
    reset(false);
    break;
    
  case '+':
    scale = min(20,scale+1);
    reset(false);
    break;
    
  case '-':
    scale = max(1,scale-1);
    reset(false);
    break;
    
  case 'p':
    updateSpeed *= -1;
    break;
    
  case 'i':
    updateAntPos();
    break;

  case 't':
    shaders = !shaders;
    break;

  case 's':
    screenshot();
    break;

  case 'm':
    recording = true;
    break;
    
  case '0':
    pal = pals[0];
    setColor(pal);
    break;
    
  case '1':
    pal = pals[1];
    setColor(pal);
    break;
    
  case '2':
    pal = pals[2];
    setColor(pal);
    break;
    
  case '3':
    pal = pals[3];
    setColor(pal);
    break;
    
  case '4':
    pal = pals[4];
    setColor(pal);
    break;
    
  case '5':
    pal = pals[5];
    setColor(pal);
    break;
    
  case '6':
    pal = pals[6];
    setColor(pal);
    break;
    
  case '7':
    pal = pals[7];
    setColor(pal);
    break;
    
  case '8':
    pal = pals[8];
    setColor(pal);
    break;
    
  case '9':
    pal = pals[9];
    setColor(pal);
    break;
    
  case 'a':
    pal = pals[10];
    setColor(pal);
    break;
    
  case 'b':
    pal = pals[11];
    setColor(pal);
    break;
    
  case 'c':
    pal = pals[12];
    setColor(pal);
    break;
    
  case 'd':
    pal = pals[13];
    setColor(pal);
    break;
    
  case 'e':
    pal = pals[14];
    setColor(pal);
    break;
  }
}
