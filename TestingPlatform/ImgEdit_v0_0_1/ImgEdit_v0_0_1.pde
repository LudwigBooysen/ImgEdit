
// Libs
ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();

// Vars
PVector lastPos;
int lastSize;
boolean holdingCtrl = false;

void setup() {
  //fullScreen();
  size(600, 600);
  background(51);
  
  textbox();
}

void draw() {
  
  // Mouse down/click
  if (mousePressed) {
    // Draw circle
    fill(255);
    noStroke();
    ellipse(mouseX, mouseY, 50, 50);
    
    // Store last draw
    lastPos = new PVector(mouseX, mouseY);
    lastSize = 50;    
  }
  
  // Draw textbox/prompt
  for (TEXTBOX t : textboxes) {
    t.DRAW();
  }
  
}

void keyPressed() {
  // Check/Set holding state of CTRL
  if (keyCode == 17) {
    holdingCtrl = true;
  }
  
  // Ctrl + z = Undo
  if (holdingCtrl && keyCode == 90) {
    undo();
  }
}

void keyReleased() {
  // Check/Set holding state of CTRL
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

// Uses TEXTBOX Lib (might change in future)
void textbox() {
  TEXTBOX receiver = new TEXTBOX();
  receiver.W = 100;
  receiver.H = 35;
  receiver.X = (width - 100) / 2;
  receiver.Y = (height - 35) / 2;
  
  textboxes.add(receiver);
  
}

// Version (SemVer)
// 0.0.0-aplha.1
