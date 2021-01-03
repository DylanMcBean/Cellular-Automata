// ant data
int x;
int y;
int dir;

// environment data
int[][] grid;
int scale = 10;
PImage ant;
int mem;
int prev;
int updateSpeed = 1;
boolean shaders = false;
int frames = 0;

// data
final int ANTUP = 0;
final int ANTUPRIGHT = 1;
final int ANTRIGHT = 2;
final int ANTDOWNRIGHT = 3;
final int ANTDOWN = 4;
final int ANTDOWNLEFT = 5;
final int ANTLEFT = 6;
final int ANTUPLEFT = 7;
