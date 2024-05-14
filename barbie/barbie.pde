import java.io.File;

PImage imgVeiculo, imgKen, imgFore1;
Veiculo veiculo, element, element2;
Foreground foreground1, foreground2;
PGraphics pg;

void setup() {
  size( 1920, 960);

  // Definir objetos de classes
  pg = createGraphics(width, height);

  // Veiculo(imgVeiculo, x, y, altura, largura, pgraphics, noiseFreq(25-200), noiseScale(0.1-0.0001));

  //Lista de Foregrounds
  // Receber lista de itens da pasta
  PImage img1 = getRandomImageFrom(sketchPath("imagens/foregrounds"));
  foreground1 = new Foreground(img1, 0, 0, 0, 50, pg);
  foreground2 = new Foreground(img1, 0, width, 0, 50, pg);

  PImage img2 = getRandomImageFrom(sketchPath("imagens/veiculos"));
  veiculo = new Veiculo(img2, width/2, height/2, 500, pg, 25, 0.01, 1, 1);

  PImage img3 = getRandomImageFrom(sketchPath("imagens/elementos"));
  PImage img4 = getRandomImageFrom(sketchPath("imagens/elementos"));
  element = new Veiculo(img3, random(0, width), random(0, height/2), 500, pg, 200, 1, 1, 1);
  element2 = new Veiculo(img4, random(0, width), random(0, height/2), 500, pg, 200, 0.00001, 1, 1);
}

PImage getRandomImageFrom(String pathToFolderWithImgs) {
  // Return image selected from a given directory selected at random
  File folderWithImgs  = new File(pathToFolderWithImgs);
  File[] filesImgs = folderWithImgs.listFiles();
  if (filesImgs != null && filesImgs.length > 0) {
    int randomIndex  = int(random(filesImgs.length));
    return loadImage(filesImgs[randomIndex].getPath());
  }
  return null;
}

void draw() {
  background(255);

  element.desenha();
  element.noiseMovement();

  element2.desenha();
  element2.noiseMovement();

  veiculo.desenha();
  veiculo.noiseMovement();

  foreground1.scroll();
  foreground2.scroll();
}
