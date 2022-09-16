
PVector[] history = new PVector[1];

PVector size = new PVector(50, 50);

void setup() {
  fullScreen();
  for (int i = 0; i < 1; i++) {
    history[i] = new PVector(0, 0, 0);
  }
}

void draw() {
  
  background(51);
  
  for (int i = 0; i < history.length; i++) {
    if (history[i].z > 0) {
      fill(255);
      ellipse(history[i].x, history[i].y, history[i].z, history[i].z);
    }
  }
  
  noFill();
  stroke(255);
  strokeWeight(2);
  ellipse(mouseX, mouseY, size.x, size.y);
  
  if (mousePressed) {
    drawCircle();
  }
  
}

void keyPressed() {
  if (size.x <= 500 && size.x >= 5) {
    if (key == 'a') {
      size.add(1, 1);
    } else if (key == 's') {
      size.sub(1, 1);
    }
    if (size.x < 5) {
      size.set(5, 5);
    }
    if (size.x > 500) {
      size.set(500, 500);
    }
  }
}

void drawCircle() {
  
  int x = mouseX;
  int y = mouseY;
  
  for (int i = 0; i < history.length; i++) {
    if (history[i].z == 0) {
      history[i] = new PVector(x, y, size.x);
      history = (PVector[]) expand(history, history.length +1);
      history[i+1] = new PVector(0, 0, 0);
      break;
    }
  }
  
}
