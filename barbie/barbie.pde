PImage imgVeiculo, imgKen;
Veiculo veiculo;
PGraphics pg;

void setup(){
  size( 1920,960);
  imgVeiculo = loadImage("barco/barco.png");
  imgKen = loadImage("barco/ken.png");
  pg = createGraphics(width, height);
  // Veiculo(imgVeiculo, x, y, altura, largura, pgraphics, noiseFreq(25-200), noiseScale(0.1-0.0001));
  veiculo = new Veiculo(imgVeiculo, width/2,height/2, 500, pg, 25, 0.01);
}

void draw(){
  background(255);
  veiculo.desenha();
  veiculo.noiseMovement();
}
