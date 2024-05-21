class Veiculo {
  PImage img;
  float x, y, ppx, ppy, velX;
  int tamanho, intervalo;
  PGraphics pg;
  int noiseFreq;
  float noiseScale;

  Veiculo(PImage img, float px, float py, int tamanho, PGraphics pg, int noiseFreq, float noiseScale, int intervalo, int velX) { //adicionados dois ultimos parametros que está a fuder com tudo ou contudo
    this.img = img;
    this.ppx = px;
    this.ppy = py;
    this.x = 0;
    this.y = 0;
    this.tamanho = tamanho;
    this.pg = pg;
    this.noiseFreq = noiseFreq;
    this.noiseScale = noiseScale;
    this.intervalo = intervalo;
    this.velX = velX;
  }


  void noiseMovement() {
    //int noiseLevel = 50;
    float noiseScale = 0.01;

    float nx = noiseScale * x;
    float nt = noiseScale * frameCount;

    y = ppy + noiseFreq * noise(nx, nt);
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


  /*void desaparece() {
    float currentMillis = millis();
    float previousMillis;
    if (currentMillis - previousMillis >= intervalo) {
      x += velX;
    }
    previousMillis = currentMillis;
  }*/
}
