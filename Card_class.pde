class Card {
  // -- Data
  int id;
  float x;
  float y;
  int imageW;
  int imageH;
  int w; // width of the card itself in the image
  PImage frontImage;
  PImage backImage;
  String type;
  String name;
  boolean isSelected = false;
  float backX; // x-coordinat for when the cards needs to display for an opponent
  float backY; // y-coordinat for when the cards needs to display for an opponent
  int backimageW;
  int backimageH;
  int backW; // width of the card itself in the image
  
  // -- Constructor
  Card(int id_, String name_, String type_, PImage frontImage_, PImage backImage_) {
    id = id_;
    name = name_;
    type = type_;
    frontImage = frontImage_;
    backImage = backImage_;
  }
  
  // -- Methods
  
  // Display methode for the font of the card
  void frontDisplay(float x_, float y_, int imageW_, int imageH_, int w_) {
    x = x_;
    y = y_;
    imageW = imageW_;
    imageH = imageH_;
    w = w_;
    
    if (mouseX >= x - (w / 2) && mouseX <= x + (w / 2) && mouseY >= y - (imageH / 2) && mouseY <= y + (imageH / 2)) {
      y = y - 10;
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
    
    frontImage.resize(imageW, imageH);
    image(frontImage, x, y);
    
    if (isSelected == true) {
      noFill();
      stroke(owOrange);
      strokeWeight(4);
      rect(x - 1, y, w + 4, imageH, 10);
    }
  }
  
  // Display methode for the back of the card
  void backDisplay(float x_, float y_, int imageW_, int imageH_, int w_) {
    backX = x_;
    backY = y_;
    backimageW = imageW_;
    backimageH = imageH_;
    backW = w_;
    
    if (mouseX >= backX - (backW / 2) && mouseX <= backX + (backW / 2) && mouseY >= backY - (backimageH / 2) && mouseY <= backY + (backimageH / 2)) {
      backY = backY - 10;
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
    
    backImage.resize((backW - 50), (backW - 50));
    image(backImage, backX, backY);
    
    fill(255);
    stroke(0);
    strokeWeight(2.5);
    rect(backX, backY, backW, backimageH, 10, 10, 10, 10);
    
    image(backImage, backX, backY);
    backImage.resize(int(backW) - 50, int(backW) - 50); // "backW" has width and height because the picture is and should be rectangle
  }
  
  // When the player selects one of the cards in his/hers hand
  void handSelect() {
    if(id != 666) {
      if (mouseX >= x - (w / 2) && mouseX <= x + (w / 2) && mouseY >= y - (imageH / 2) && mouseY <= y + (imageH / 2)) {
        if(isSelected == false) {
          isSelected = true;
          
          playersSelectedCards.add(this);
        }
      }
    }
  }
  
  // When the player selects one of the cards in the opponent's hand
  void oppSelect() {
  
  }
}
