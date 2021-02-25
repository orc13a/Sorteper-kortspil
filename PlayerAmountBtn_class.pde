class playerAmountBtn {
  float x;
  float y;
  int w;
  int h;
  String innerText = "";
  color btnColor = 255;
  color btnCurrentColor = btnColor;
  color btnStrokeColor = owOrange;
  color textColor = 0;
  boolean selected = false;
  
  playerAmountBtn(int w_, int h_, String text_) {
    this.w = w_;
    this.h = h_;
    this.innerText = text_;
  }
  
  void display(float x_, float y_) {
    this.x = x_;
    this.y = y_;
    
    if (this.selected == true) {
      this.btnCurrentColor = this.btnStrokeColor;
    }
    
    stroke(btnStrokeColor);
    strokeWeight(2.5);
    fill(btnCurrentColor);
    rect(x, y, w, h, 10);
    
    fill(textColor);
    textFont(owFont);
    textSize(30);
    text(innerText, x, y + 12);
    
    textFont(robo);
  }
  
  void choose() {
    if (mouseX >= x - (w / 2) && mouseX <= x + (w / 2) && mouseY >= y - (h / 2) && mouseY <= y + (h / 2)) {
      playerAmountSelected = int(innerText);
      
      for (playerAmountBtn btn : allPlayerAmountBtns) {
        if (btn.selected == true) {
          btn.selected = false;
        } 
      }
      
      this.selected = true;
    }
  }
  
  void hover() {
    if (mouseX >= x - (w / 2) && mouseX <= x + (w / 2) && mouseY >= y - (h / 2) && mouseY <= y + (h / 2)) {
      this.btnCurrentColor = this.btnStrokeColor;
    } else {
      this.btnCurrentColor = this.btnColor;
    }
  }
}
