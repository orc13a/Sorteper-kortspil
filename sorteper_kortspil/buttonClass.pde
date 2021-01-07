class Button {
  float boxX;
  float boxY;
  int boxWidth;
  int boxHeight;
  String text;
  int btnFill;
  int textFill;
  int textSize;
  
  Button(float placementX, float placementY, int bWidth, int bHeight, String innerText, int buttonFill, int innertextFill, int innerTextSize) {
    boxX = placementX;
    boxY = placementY;
    boxWidth = bWidth;
    boxHeight = bHeight;
    text = innerText;
    btnFill = buttonFill;
    textFill = innertextFill;
    textSize = innerTextSize;
  }
  
  void display() {
    rectMode(CENTER);
    
    fill(btnFill);
    rect(boxX, boxY, boxWidth, boxHeight, 10, 10, 10, 10);
    
    textAlign(CENTER);
    
    fill(textFill);
    textSize(textSize);
    text(text, boxX, boxY+5);
  }
  
  void pressed() {
    if(mouseX >= boxX - (boxWidth/2) && mouseX <= boxX + (boxWidth/2) && mouseY >= boxY - (boxHeight/2) && mouseY <= boxY + (boxHeight/2)) {
      // < Do action under here >
    }
  }
}
