// All credits to Pyro - PyroDeathAdder(Pyro)

import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;

PostFX fx;

Palette[] pals;
Palette pal;
color[] Colors;

//Usable Characters - LRUANESWVlrneswJjmfbMFB
//movement - (L - Sharp Left(90), R - Sharp Right(90), U - Uturn, A - Ahead, V - Reverse,
//            N - North, E - East, S - South, W - West, l - Left(45), r - Right(45)
//            n - North East, e - South east, s - South West, w - North West,
//            j[1]/J[2] - jump. skips 1/2 block in current direction)
//            mfb - short term memory. stores last tile index
//            MFB - long term memory. increments memory index by one each pass
//            Memory:
//                m/M - switches the state of current tile
//                f/F - switches the state of current tile and moves forward
//                b/B - switches the state of current tile and moves backward

String movement = "RUUUUUL"; //Edit the movement string with the avalible letters or leave blank for random
int scale = 10;
/* cool patterns for reference UUUUWRL - UUJULRJ - URVUL - URJ
 UUUSENUEUWSULE
 UUUUWRL
 UUJULRJ
 AUNLRUUR
 mAAAWEJVSJfAS
 RbELbW
 
 Spirals
 URVUL
 URJ
 LRVrEWwn
 lJJ
 Spiral that never breaks
 URVULU
 
 vines - LSFmlRjJwJeMfE
 
URM
RMB
LFM
RUb
RUM
REj
RsL
RbE
Rbr
AJR
EjR
RsU

Factory
UUUULRJ

Long
RUUUUUL
 */
void setup() {
  size(1000, 1000, P3D);
  //fullScreen(P3D,1);
  frameRate(40); // idk

  fx = new PostFX(this);

  pals = new Palette[]{
    new Palette("palette_1"),
    new Palette("palette_2"),
    new Palette("palette_3"),
    new Palette("palette_4"),
    new Palette("palette_A"),
    new Palette("palette_B"),
    new Palette("palette_boreal"),
    new Palette("palette_C"),
    new Palette("palette_D"),
    new Palette("palette_etheral"),
    new Palette("palette_ice"),
    new Palette("palette_limefresh"),
    new Palette("palette_saltyice"),
    new Palette("palette_snake"),
    new Palette("palette_tuttifruty")
  };

  reset(movement == "");
}

void draw() {
  //frameRate(map(mouseX, width, 0, 1, 240));
  //println(map(mouseX, width, 0, 1, 240));
  for (int i = 0; i < updateSpeed; i ++) {
    updateAntPos();
  }
  renderAnt();
  if ( shaders ) {
    fx.render() //<>//
      .bloom(0.5,20,40)
      .compose();
  }
  
  record();
}

void mouseClicked() {
  frameRate(map(mouseX, width, 0, 1, 120));
  updateSpeed = int(map(mouseY, height, 0, 100, 1));
}
