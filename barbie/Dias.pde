class Dias {
  float x, y, xf, yf, raio, raioG, ang;
  int step;
  boolean isPaused;
  long pauseStartTime;
  int pauseDuration; // Duration in milliseconds

  Dias(float x, float y, float raio, float raioG, int step, int pauseDuration) {
    this.x = x;
    this.y = y;
    this.raio = raio;
    this.raioG = raioG;
    this.step = step;
    this.pauseDuration = pauseDuration;
    this.isPaused = false;
    this.pauseStartTime = 0;
  }

  void desenha() {
    if (isPaused) {
      // Check if the pause duration has passed
      if (millis() - pauseStartTime >= pauseDuration) {
        isPaused = false; // Resume the animation
      }
    } else {
      ang += TAU / step;
      // Check if it's time to pause
      if ((ang % PI) < (TAU / step)) {
        isPaused = true;
        pauseStartTime = millis();
      }
    }

    // Calculate the positions of the two circles
    xf = x + raioG * cos(ang+PI/4);
    yf = y + raioG * sin(ang+PI/4);

    float xi = x + raioG * cos(ang + PI+PI/4);
    float yi = y + raioG * sin(ang + PI+PI/4);

    // Draw the circles
    //stroke(0);
    fill(255, 150, 10, 100);
    circle(xf, yf, raio);
    fill(50, 0, 255, 100);
    circle(xi, yi, raio);
  }
}
