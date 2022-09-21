// Temp Array for all shapes (history)
PVector[] history = new PVector[1];
// Draw / brush size
PVector size = new PVector(50, 50);

void setup() {
  fullScreen();
  // Set default variables in history array
  for (int i = 0; i < 1; i++) {
    history[i] = new PVector(0, 0, 0);
  }
}

void draw() {
  // Clear background
  background(51);
  // Loop through array to know what to draw over the cleared background
  for (int i = 0; i < history.length; i++) {
    if (history[i].z > 0) {
      fill(255);
      ellipse(history[i].x, history[i].y, history[i].z, history[i].z);
    }
  }
  // Circle draw guider (follows mouse position)
  noFill();
  stroke(255);
  strokeWeight(2);
  ellipse(mouseX, mouseY, size.x, size.y);
  // Detect when using brush (drawing)
  if (mousePressed) {
    // Add shape (Custom function)
    addShape();
  }
}
// Detect key pressed events
void keyPressed() {
  // Declare and set the increase and decrease amount
  int amount = 1;
  // Test the already size / amount
  // Default - MAX = 500 px; MIN = 5 px;
  if (size.x <= 500 && size.x >= 5) {
    switch(key) {
      // Increase size
      case 'a':
        size.add(amount, amount);
        break;
      // Decrease size
      case 's':
        size.sub(amount, amount);
        break;
    }
    // Size assureance
    if (size.x < 5) {
      size.set(5, 5);
    }
    if (size.x > 500) {
      size.set(500, 500);
    }
  }
}
// Custom Functions
void addShape() {
  // Temp variables
  int x = mouseX;
  int y = mouseY;
  // Loop throught the draw history
  for (int i = 0; i < history.length; i++) {
    if (history[i].z == 0) {
      history[i] = new PVector(x, y, size.x);
      history = (PVector[]) expand(history, history.length +1);
      history[i+1] = new PVector(0, 0, 0);
      break;
    }
  }
}
