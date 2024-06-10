class Star {
  float angle;
  float radius;
  float angularSpeed;
  float radiusSpeed;

  Star(float angle, float radius, float angularSpeed, float radiusSpeed) {
    this.angle = angle;
    this.radius = radius;
    this.angularSpeed = angularSpeed;
    this.radiusSpeed = radiusSpeed;
  }

  void update() {
    angle += angularSpeed;
    radius += radiusSpeed;
  }

  void display() {
    float x = width / 2 + radius * cos(angle);
    float y = height / 2 + radius * sin(angle);
    drawStar(x, y, 5, 30, 15);
  }
}

// Function to draw a star
void drawStar(float x, float y, int numPoints, float outerRadius, float innerRadius) {
  float angleIncrement = TWO_PI / numPoints;
  float angleOffset = HALF_PI;

  beginShape();
  for (int i = 0; i < numPoints * 2; i++) {
    float radius = (i % 2 == 0) ? outerRadius : innerRadius;
    float currentAngle = angleOffset + i * angleIncrement;
    float xPos = x + cos(currentAngle) * radius;
    float yPos = y + sin(currentAngle) * radius;
    vertex(xPos, yPos);
  }
  endShape(CLOSE);
}
