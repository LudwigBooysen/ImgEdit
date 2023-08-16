// Vars
PVector currentPos;
int currentSize;

PVector lastPos;
int lastSize;

// Holding controls/keys
boolean holdingCtrl = false;

void setup() {
  size(600, 600);
  background(51);
  
  currentSize = 50;
}

void draw() {
  
  currentPos = new PVector(mouseX, mouseY);
  
  // Mouse down/click
  if (mousePressed) {
    // Draw circle
    fill(255);
    noStroke();
    ellipse(currentPos.x, currentPos.y, currentSize, currentSize);
    
    // Store last draw
    lastPos = new PVector(mouseX, mouseY);
    lastSize = 50;    
  }
  
}

void keyPressed() {
  // Check/Set holding states of controls
  if (keyCode == 17) {
    holdingCtrl = true;
  }
  
  // Controls functions
  // - Undo
  if (holdingCtrl && keyCode == 90) {
    undo();
  }
  
  // - Brush resize
  // 61 = '=' 45 = '-'
  if (holdingCtrl && keyCode == 61) {
    currentSize++;
  } else if (holdingCtrl && keyCode == 45) {
    currentSize--;
  }
  
  // println("Key Pressed: " + keyCode + "\n" + "Key: " + key); // Debug: Key logs
}

void keyReleased() {
  // Check/Set holding states of contorls
  if (keyCode == 17) {
    holdingCtrl = false;
  }
}

void undo() {
  // Fill up/clear previous drawn item
  fill(51);
  noStroke();
  ellipse(lastPos.x, lastPos.y, lastSize+2, lastSize+2);
}

// Version (SemVer)
// 0.0.0-aplha.1
