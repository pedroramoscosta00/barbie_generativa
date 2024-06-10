import processing.sound.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

import java.io.File;
import java.util.HashMap;

//fonts
PFont myFont;


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
int currentTime;

//DIAS variables
Dias dias;

// Declare a TextDisplay object
TextDisplay textDisplay;
int interval = 13000;       // Interval between actions (in milliseconds)
int actionDuration = 7000; // Duration of the action (in milliseconds)
int lastActionTime = 0;
boolean isActionActive = false;

int intervalCavalos = 1000;
int lastActionTimeCavalo = 0;
boolean isCavalosActive = false;

PImage personagem, imgCavalo;

//stars in quotes
ArrayList<Star> stars;



void setup() {
  size(1920, 960);

  // Definir objetos de classes
  pg = createGraphics(width, height);


  //==============================SOUND==============================
  minim = new Minim(this);
  song = minim.loadFile("musica/Dua Lipa - Dance The Night .mp3", 1024);
  song.play();
  // a beat detection object that is FREQ_ENERGY mode that
  // expects buffers the length of song's buffer size
  // and samples captured at songs's sample rate
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());

  beat.setSensitivity(300);
  kickSize = snareSize = hatSize = 16;
  // make a new beat listener, so that we won't miss any buffers for the analysis
  bl = new BeatListener(beat, song);


  //==============================Dias==============================
  dias = new Dias(width, height, 150, width/2, 500, 545*10);

  //fonts
  myFont = loadFont("Bartex-48.vlw");


 

  //==============================Imagens==============================
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


  //==============================Timer==============================
  lastActionTime = millis();
  lastActionTimeCavalo = millis();
  
  //==============================stars in quotes==============================
  // Initialize stars
  stars = new ArrayList<Star>();
  for (int i = 0; i < 10; i++) {
    stars.add(new Star(random(TWO_PI), 50 + i * 10, 0.05, 0.5));
  }
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
  //==============================Background==============================
  bg1.desenha();

  //==============================Dias==============================
  dias.desenha();


  //==============================Elementos==============================
  element.desenha();
  element.noiseMovement();

  //element2.desenha();
  //element2.noiseMovement();
//element3.desenha();
  //element3.noiseMovement();
  //element4.desenha();
  //element4.noiseMovement();

  //==============================Veiculos==============================
  veiculo.roda();
  veiculo.desenha();
  veiculo.noiseMovement();
  veiculo.desaparece();



  //==============================Foreground==============================
  foreground1.scroll();
  foreground2.scroll();

  //==============================Particles==============================
  if (emitParticles) {
    float randomX = random(0, width);
    float randomY = random(0, height/3);

    for (int i = 0; i < 50; i++) {
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

  // Call the particles again if lifespan is done (explosion fades)
  if (beat.isSnare()) {
    emitParticles = true;
  }

  //==============================Text==============================
  currentTime = millis();
  if (currentTime - lastActionTime >= interval) {
    lastActionTime = currentTime; // Update the last action time
    isActionActive = true;

    textFont(myFont);
    textDisplay = new TextDisplay(messages, personagem, color(224, 33, 138));
    personagem = getRandomImageFrom(sketchPath("imagens/personagens"));
  }

  // Check if the action duration has passed
  if (isActionActive && (currentTime - lastActionTime <= actionDuration)) {
    textDisplay.desenharPersonagem(personagem);
    textDisplay.display(width / 2, height / 4*3);
    
    for (Star star : stars) {
    star.update();
    star.display();
  }
  
  } else {
    isActionActive = false; // End the action
  }


  //==============================CAVALOS==============================
  if (currentTime - lastActionTimeCavalo >= intervalCavalos) {
    lastActionTimeCavalo = currentTime; // Update the last action time
    isCavalosActive = true;

    imgCavalo = getRandomImageFrom(sketchPath("imagens/cavalos"));
  }

  // Check if the action duration has passed
  if (isCavalosActive && (currentTime - lastActionTime <= actionDuration)) {
    image(imgCavalo, 0, 0);
  } else {
    isCavalosActive = false; // End the Cavalos
  }
}


/*void mousePressed() {
 // Select new random text when the mouse is pressed
 textDisplay.selectRandomText(messages);
 }*/
