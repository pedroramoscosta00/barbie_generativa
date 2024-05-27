import processing.sound.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

import java.io.File;
import java.util.HashMap;

//Sound
//SoundFile sound;
Minim minim;
AudioPlayer player;
BeatDetect beat;


PImage imgVeiculo, imgKen, imgFore1;
PGraphics pg;
Veiculo veiculo, element;
StaticVeiculo element2, element3, element4;
Foreground foreground1, foreground2, foreground1_3, foreground1_4, foreground1_5;
Foreground foreground2_1, foreground2_2, foreground2_3, foreground2_4, foreground2_5;
Background bg1;

//Mapear as images da pasta staticElements para depois definir um t especifico para cada um
HashMap<String, Float> staticElementosYMap = new HashMap<String, Float>();
HashMap<PImage, Float> foregroundYMap = new HashMap<PImage, Float>();


// Array to store particles
ArrayList<Particle> particles = new ArrayList<Particle>();
float centerX, centerY; // center of the explosion
boolean emitParticles = true; // flag to control emission
float lastTime = 0;
float currentTime;

void setup() {
  size(1920, 960);

  // Definir objetos de classes
  pg = createGraphics(width, height);

  //sound = new SoundFile(this, "musica/Dua Lipa - Dance The Night .mp3");
  minim = new Minim(this);
  
  // Load an audio file
  player = minim.loadFile("musica/Dua Lipa - Dance The Night .mp3", 1024);
  player.play();
  
  // Initialize BeatDetect
  beat = new BeatDetect();


  // Veiculo(imgVeiculo, x, y, altura, largura, pgraphics, noiseFreq(25-200), noiseScale(0.1-0.0001));

  /*______________________Lista de Foregrounds______________________*/
  // Receber lista de itens da pasta
  /*PImage fore1 = loadImage(sketchPath("imagens/foregrounds/foreground1.png"));
   PImage fore2 = loadImage(sketchPath("imagens/foregrounds/foreground2.png"));
   PImage fore3 = loadImage(sketchPath("imagens/foregrounds/foreground3.png"));
   PImage fore4 = loadImage(sketchPath("imagens/foregrounds/foreground4.png"));
   PImage fore5 = loadImage(sketchPath("imagens/foregrounds/foreground5.png"));*/

  /*String fore1Path = sketchPath("imagens/foregrounds/foreground1.png");
   String fore2Path = sketchPath("imagens/foregrounds/foreground2.png");
   String fore3Path = sketchPath("imagens/foregrounds/foreground3.png");
   String fore4Path = sketchPath("imagens/foregrounds/foreground4.png");
   String fore5Path = sketchPath("imagens/foregrounds/foreground5.png");*/

  /*foreground1_1 = new Foreground(fore1, 0, height-fore1.height, 0, 50, pg);
   foreground1_2 = new Foreground(fore2, 0, 0, 0, 50, pg);
   foreground1_3 = new Foreground(fore3, 0, 0, 0, 50, pg);
   foreground1_4 = new Foreground(fore4, 0, 0, 0, 50, pg);
   foreground1_5 = new Foreground(fore5, 0, 0, 0, 50, pg);
   
   foreground2_1 = new Foreground(fore1, 0, width, 0, 50, pg);
   foreground2_2 = new Foreground(fore2, 0, width, 0, 50, pg);
   foreground2_3 = new Foreground(fore3, 0, width, 0, 50, pg);
   foreground2_4 = new Foreground(fore4, 0, width, 0, 50, pg);
   foreground2_5 = new Foreground(fore5, 0, width, 0, 50, pg);*/

  PImage fore1 = getRandomImageFrom(sketchPath("imagens/foregrounds"));
  foreground1 = new Foreground(fore1, 0, 0, 0, 50, pg);
  foreground2 = new Foreground(fore1, 0, width, 0, 50, pg);

  /*______________________Lista de Veiculos______________________*/
  PImage img2 = getRandomImageFrom(sketchPath("imagens/veiculos"));
  veiculo = new Veiculo(img2, width/2, height/2, 500, pg, 25, 0.01, 1, 1);

  /*______________________Lista de Elementos______________________*/
  PImage img3 = getRandomImageFrom(sketchPath("imagens/elementos"));
  element = new Veiculo(img3, random(0, width), random(0, height/2), 500, pg, 200, 1, 1, 1);
  //element = new Veiculo(img3, random(0, width), random(0, height/2), 500, pg, 200, 1, 1, 1);
  //element2 = new StaticVeiculo(img4, random(0, width), 400, 500, pg, 200, 0.00001, 1, 1);

  // Define specific y values for images from "staticElementos" folder
  staticElementosYMap.put("asset2.png", 450.0); // Set y value for asset2
  staticElementosYMap.put("asset5.png", 500.0); // Set y value for asset5
  staticElementosYMap.put("asset7.png", 500.0); // Set y value for asset7

  // Load and initialize images from "staticElementos" folder
  PImage img4 = loadImage(sketchPath("imagens/staticElementos/asset2.png"));
  element2 = new StaticVeiculo(img4, random(0, width), height-foreground1.img.height - img4.height, 500, pg, 200, 0.00001, 1, 1);
  print(height-foreground1.img.height);

  PImage img5 = loadImage(sketchPath("imagens/staticElementos/asset5.png"));
  element3 = new StaticVeiculo(img5, random(0, width), staticElementosYMap.get("asset5.png"), 500, pg, 200, 0.00001, 1, 1);
  PImage img6 = loadImage(sketchPath("imagens/staticElementos/asset7.png"));
  element4 = new StaticVeiculo(img6, random(0, width), staticElementosYMap.get("asset7.png"), 500, pg, 200, 0.00001, 1, 1);

  /*______________________Lista de Backgrounds______________________*/
  PImage background1 = getRandomImageFrom(sketchPath("imagens/backgrounds"));
  bg1 = new Background(background1, 0, 0, pg);

  currentTime = millis();
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

  bg1.desenha();


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


  //float interval = 0;
  
  // Detect beats in the current audio frame
  beat.detect(player.mix);

  print(beat.isKick());
  if (beat.isKick()) {
    print(beat.isKick());
  }
  
  //if (currentTime - lastTime >= interval) {
  // Your processing code here
  if (emitParticles) {
    float randomX = random(0, width);
    float randomY = random(0, height/3);

    for (int i = 0; i < 50; i++) {
      // Random positions within the canvas (adjust range as needed)
      //float randomX = width/2;
      //float randomY = height/2;

      int randomShape = round(random(3)); // random shape between 0 (circle) and 2 (asterisk)

      particles.add(new Particle(randomX, randomY, randomShape));
    }
    emitParticles = false; // disable further emission
  }

  // Update and display particles
  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.update();
    p.display();
    if (p.isDead()) {
      particles.remove(i);
    }
  }


  if (currentTime >= 545) {
    currentTime = 0;
    print(currentTime);
  }

  // Call the particles again if lifespan is done (explosion fades)
  if (particles.isEmpty() && currentTime == 0) {
    //lastTime = currentTime; // Update last action time
    emitParticles = true;
  }
  //}
}
