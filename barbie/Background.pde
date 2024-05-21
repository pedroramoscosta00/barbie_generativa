class Background {
  float x, y;
  PImage img;
  PGraphics pg;

  Background(PImage img, float x, float y, PGraphics pg) {
    this.img = img;
    this.x = x;
    this.y = y;
    this.pg = pg;
  }

  void desenha() {
    pg.beginDraw();
    image(img, x, y);
    pg.endDraw();
  }
}
