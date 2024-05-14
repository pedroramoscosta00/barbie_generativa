class Foreground {
  PImage img;
  float x, xp, y, tamanho;
  PGraphics pg;
  float vel;

  Foreground(PImage img, float x, float xp, float y, float vel, PGraphics pg) {
    this.img = img;
    this.x = x;
    this.xp = xp;
    this.y = y;
    this.vel = vel;
    this.pg = pg;
  }

  void desenha() {
   pg.beginDraw();
   y = pg.height - img.height;
   image(img, x, y);
   pg.endDraw();
   }

  void scroll() {
   x = xp- frameCount * vel % img.width;
   
    for (float i = -x; i < width; i += img.width) {
      pg.beginDraw();
      y = pg.height - img.height;
      image(img, x, y);
      pg.endDraw();
    }
  }
}
