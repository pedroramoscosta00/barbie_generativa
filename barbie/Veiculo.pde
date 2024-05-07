class Veiculo {
  PImage img;
  float x, y, ppx, ppy;
  int tamanho;
  PGraphics pg;
  int noiseFreq = 50;
  float noiseScale = 0.005;

  Veiculo(PImage img, float px, float py, int tamanho, PGraphics pg, int noiseFreq, float noiseScale) {
    this.img = img;
    this.ppx = px;
    this.ppy = py;
    this.x = 0;
    this.y = 0;
    this.tamanho = tamanho;
    this.pg = pg;
    this.noiseFreq = noiseFreq;
    this.noiseScale = noiseScale;
  }


  void noiseMovement() {
    int noiseLevel = 50;
    float noiseScale = 0.01;

    float nx = noiseScale * x;
    float nt = noiseScale * frameCount;
    println(ppy);

    y = ppy + noiseLevel * noise(nx, nt);
    x= ppx;
  }

  void desenha() {
    // Resize the image while maintaining aspect ratio
    /*
  if (img != null) {
     img.resize((int) tamanho, 0);
     }*/

    pg.beginDraw();
    image(img, x -img.width/2, y);
    pg.endDraw();
    noFill();
    //rect(x - img.width/2, y, img.width, img.height);
  }
}
