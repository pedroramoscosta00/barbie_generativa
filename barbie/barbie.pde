import java.io.File;

PImage imgVeiculo, imgKen, imgFore1;
Veiculo veiculo;
Foreground foreground1;
PGraphics pg;

void setup() {
  size( 1920, 960);

  // Carregar Imagens
  imgVeiculo = loadImage("imagens/asset10.png");
  imgKen = loadImage("barco/ken.png");
  imgFore1 = loadImage("imagens/foregrounds/foreground1.png");

  // Definir objetos de classes
  pg = createGraphics(width, height);

  // Veiculo(imgVeiculo, x, y, altura, largura, pgraphics, noiseFreq(25-200), noiseScale(0.1-0.0001));
  veiculo = new Veiculo(imgVeiculo, width/2, height/2, 500, pg, 25, 0.01);

  // Receber lista de itens da pasta
  File folder = new File(sketchPath("imagens/foregrounds"));
  File[] files = folder.listFiles();

  // Escolher uma imagem aleatoriamente
  if (files != null && files.length > 0) {
    int randomIndex = int(random(files.length));
    PImage selectedImage = loadImage(files[randomIndex].getPath());

    foreground1 = new Foreground(selectedImage, 0, 0, 1,50, pg);
  }
}

void draw() {
  background(255);

  veiculo.desenha();
  veiculo.noiseMovement();

  //foreground1.desenha();
  foreground1.scroll();
}
