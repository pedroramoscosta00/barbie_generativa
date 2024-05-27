class Particle {
  float x, y; // position
  float vx, vy; // velocity
  float lifespan; // lifetime remaining
  color cor; // particle color (replacing 'color')
  int shapeType;
  float sizeElipse = random(3, 10);
  float sizeStar = random(8, 10);
  float sizeInsideStar = random(5, 7);
  float r = 50;
  float r2 = 5;


  float size = 100.0f; // Size of the asterisk
  int numLines = 5; // Number of lines in the asterisk
  float animationProgress = 0.0f; // Tracks animation progress (0.0 - fully drawn, 1.0 - fully disappeared)

  Particle(float x, float y, int shapeType) {
    this.x = x;
    this.y = y;
    vx = random(-3, 3); // random initial horizontal velocity
    vy = random(-3, 3); // random initial vertical velocity
    lifespan = 255.0; // lifespan in terms of color (opacity)
    cor = color(255, lifespan, 0); // initial color: yellow
    this.shapeType = shapeType;
  }

  // Update particle position and lifespan
  void update() {
    // Apply some air resistance (slow down)
    vx *= 0.95;
    vy *= 0.95;
    x += vx;
    y += vy;
    lifespan -= 5.0; // decrease lifespan faster for explosion effect

    // Update color based on lifespan
    int brightness = floor(lifespan);
    cor = color(255, brightness);


    animationProgress += 0.01f; // Update animation progress (adjust for desired speed)
    if (animationProgress > 1.0f) {
      animationProgress = 1.0f; // Limit progress to 1.0 (fully disappeared)
    }
  }

  void display() {
    noFill(); // set fill color based on lifespan
    stroke(cor);

    // Call the appropriate drawing function based on shapeType
    switch (shapeType) {
    case 0:
      ellipse(x, y, sizeElipse, sizeElipse);
      break;
    case 1:
      drawStar(x, y, sizeInsideStar, sizeStar); // adjust star size as needed
      break;
    case 2:
      drawAnimatedAsterisk(x, y, size, numLines, animationProgress);// adjust asterisk size as needed
      break;
    }
  }

  void drawStar(float x, float y, float radius1, float radius2) {
    int numPoints = 5;
    float angle = TWO_PI / numPoints;
    float halfAngle = angle / 2.0;

    beginShape();
    for (int i = 0; i < TWO_PI; i += angle) {
      float sx = x + cos(i) * radius2;
      float sy = y + sin(i) * radius2;
      vertex(sx, sy);
      sx = x + cos(i + halfAngle) * radius1;
      sy = y + sin(i + halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }

  void drawAnimatedAsterisk(float x, float y, float size, int numLines, float animationProgress) {
    float angleStep = TWO_PI / numLines; // Calculate angle between each line

    for (int i = 0; i < numLines; i++) {
      float angle = i * angleStep; // Calculate current angle

      // Calculate line endpoints based on animation progress
      float lineLength = size * (1.0f - animationProgress); // Adjust length based on progress
      float x1 = x + r *cos(angle);
      float y1 = y + r * sin(angle);

      float x2 = x + r2 *cos(angle);
      float y2 = y + r2 * sin(angle);

      while (r2<r) {
        r2 += 0.001;
      }

      // Optional: Fade out line color as animation progresses
      float alpha = 1.0f - animationProgress; // Adjust alpha for fading

      // Draw the line with potential fading
      stroke(cor); // Set stroke color with fading alpha
      strokeWeight(2); // Set line thickness
      //line(x1, y1, x - cos(angle) * lineLength / 2, y - sin(angle) * lineLength / 2);
      line(x2, y2, x1, y1);
    }
  }



  // Check if particle is still alive (has lifespan)
  boolean isDead() {
    return lifespan <= 0;
  }
}
