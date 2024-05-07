class Foreground {
  PImage img;
  float x, y, tamanho;
  PGraphics pg;
  
  Foreground(PImage img, float x, float y, float tamanho, PGraphics pg) {
    this.img = img;
    this.x = x;
    this.y = y;
    this.tamanho = tamanho;
    this.pg = pg;
  }

  void desenha() {
    pg.beginDraw();
    y = pg.height - img.height * tamanho;
    image(img, x, y);
    pg.endDraw();
  }
}
