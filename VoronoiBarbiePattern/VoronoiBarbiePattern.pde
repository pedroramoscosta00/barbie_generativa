int numPoints = 40; // Number of Voronoi points
PVector[] points = new PVector[numPoints];
color[] colors = new color[numPoints];
PImage img;
float speed = 2.0;

void setup() {
  size(1920, 960);
  frameRate(12);
  //smooth();
  //noLoop();
  img = loadImage("barbie-and-ken.png");
  
  // Initialize points and colors
  for (int i = 0; i < numPoints; i++) {
    points[i] = new PVector(random(width), random(height));
    if (i%6 == 0){
      colors[i] = color(255);
    }else{
    colors[i] = color(random(220, 255), random(150, 200), random(200, 255));// Random pink shades
    }
  }
  
    // Update points positions
  for (int i = 0; i < numPoints; i++) {
    points[i].x += random(-speed, speed);
    points[i].y += random(-speed, speed);
    
    // Keep points within the window bounds
    points[i].x = constrain(points[i].x, 0, width);
    points[i].y = constrain(points[i].y, 0, height);
  }

}

void draw() {
    // Clear background
  background(255);

  // Update points positions
  for (int i = 0; i < numPoints; i++) {
    points[i].x += random(-speed, speed);
    points[i].y += random(-speed, speed);
    
    // Keep points within the window bounds
    points[i].x = constrain(points[i].x, 0, width);
    points[i].y = constrain(points[i].y, 0, height);
  }

  // Create a 2D array to store the nearest point index for each pixel
  int[][] nearestPoint = new int[width][height];

  // Draw Voronoi diagram
  loadPixels();
  
  // Draw Voronoi diagram
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      float minDist = dist(x, y, points[0].x, points[0].y);
      int closestPointIndex = 0;
      
      for (int i = 1; i < numPoints; i++) {
        float d = dist(x, y, points[i].x, points[i].y);
        if (d < minDist) {
          minDist = d;
          closestPointIndex = i;
        }
      }
      
      nearestPoint[x][y] = closestPointIndex;
      pixels[x + y * width] = colors[closestPointIndex];
    }
  }
  
  updatePixels();

  // Draw strokes between cells
  stroke(#ec5c8d);
  strokeWeight(20);
  for (int x = 1; x < width - 1; x++) {
    for (int y = 1; y < height - 1; y++) {
      int currentIndex = nearestPoint[x][y];
      if (nearestPoint[x + 1][y] != currentIndex || 
          nearestPoint[x - 1][y] != currentIndex || 
          nearestPoint[x][y + 1] != currentIndex || 
          nearestPoint[x][y - 1] != currentIndex) {
        point(x, y);
      }
    }
  }
  
  imageMode(CENTER);
  image(img, width/2, height/2);
  
  // Draw points
  
  /*for (int i = 0; i < numPoints; i++) {
    fill(0);
    ellipse(points[i].x, points[i].y, 8, 8);
  }*/
}
