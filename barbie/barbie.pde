import java.io.File;

PImage imgVeiculo, imgKen, imgFore1;
Veiculo veiculo, element;
StaticVeiculo element2, element3, element4;
Foreground foreground1, foreground2;
PGraphics pg;

//Mapear as images da pasta staticElements para depois definir um t especifico para cada um
HashMap<String, Float> staticElementosYMap = new HashMap<String, Float>();

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
  element = new Veiculo(img3, random(0, width), random(0, height/2), 500, pg, 200, 1, 1, 1);

  //PImage img4 = getRandomImageFrom(sketchPath("imagens/staticElementos"));

  element = new Veiculo(img3, random(0, width), random(0, height/2), 500, pg, 200, 1, 1, 1);
  //element2 = new StaticVeiculo(img4, random(0, width), 400, 500, pg, 200, 0.00001, 1, 1);

  // Define specific y values for images from "staticElementos" folder
  staticElementosYMap.put("asset2.png", 450.0); // Set y value for asset2
  staticElementosYMap.put("asset5.png", 500.0); // Set y value for asset5
  staticElementosYMap.put("asset7.png", 500.0); // Set y value for asset7

  // Load and initialize images from "staticElementos" folder
  PImage img4 = loadImage(sketchPath("imagens/staticElementos/asset2.png"));
  element2 = new StaticVeiculo(img4, random(0, width), staticElementosYMap.get("asset2.png"), 500, pg, 200, 0.00001, 1, 1);
  PImage img5 = loadImage(sketchPath("imagens/staticElementos/asset5.png"));
  element3 = new StaticVeiculo(img5, random(0, width), staticElementosYMap.get("asset5.png"), 500, pg, 200, 0.00001, 1, 1);
  PImage img6 = loadImage(sketchPath("imagens/staticElementos/asset7.png"));
  element4 = new StaticVeiculo(img6, random(0, width), staticElementosYMap.get("asset7.png"), 500, pg, 200, 0.00001, 1, 1);
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
  element3.desenha();
  element3.noiseMovement();
  element4.desenha();
  element4.noiseMovement();

  veiculo.desenha();
  veiculo.noiseMovement();

  foreground1.scroll();
  foreground2.scroll();
}
