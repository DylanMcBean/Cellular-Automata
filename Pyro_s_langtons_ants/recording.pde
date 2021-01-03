import java.io.*;
import java.lang.*;

void screenshot() {
  File file;
  file = new File(dataPath("img"));
  String[] listPath = file.list();
  save("data/img/img__" + movement + "__" + pal.name + "__" + listPath.length + ".png");
}


boolean recording = false;
int framesToSave = 1000;

void record() {
  if ( recording ) {
    saveFrame("data/movie/img#####.tif");
    if ( framesToSave <= 0 ) {
      exit();
    }
    --framesToSave;
  }
}
