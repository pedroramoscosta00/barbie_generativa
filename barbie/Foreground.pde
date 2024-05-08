class Foreground {
  PImage img;
  float x, y, tamanho;
  PGraphics pg;
  float vel;

  Foreground(PImage img, float x, float y, float tamanho, float vel, PGraphics pg) {
    this.img = img;
    this.x = x;
    this.y = y;
    this.tamanho = tamanho;
    this.vel = vel;
    this.pg = pg;
  }

  /*void desenha() {
   pg.beginDraw();
   y = pg.height - img.height * tamanho;
   image(img, x, y);
   pg.endDraw();
   }*/

  void scroll() {
    float x = -frameCount * vel % img.width;
    for (float i = -x; i < width; i += img.width) {
      pg.beginDraw();
      y = pg.height - img.height * tamanho;
      image(img, x, y);
      pg.endDraw();
      //copy(img, 0, 0, img.width, height, i, 0, img.width, height);
    }
  }
}
