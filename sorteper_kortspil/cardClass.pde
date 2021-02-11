class Card {
  float x;
  float y;
  int cardId;
  String cardName;
  String cardColor;
  PImage cardImg;
  boolean black; // Om kortet er sorteper
  int h = 200;
  int w = 100;
  
  Card(float newX, float newY, int newCardId, String givenCardName, boolean isBlack, String givenCardColor, PImage givenCardImg) {
    x = newX;
    y = newY;
    cardId = newCardId;
    cardName = givenCardName;
    cardColor = givenCardColor;
    cardImg = givenCardImg;
    black = isBlack;
  }
  
  void display(float x_, float y_, int imgW_, int imgH_, float realW) {
    x = x_;
    y = y_;
    
    if (mouseX >= x - (realW / 2) && mouseX <= x + (realW / 2) && mouseY >= y - (imgH_ / 2) && mouseY <= y + (imgH_ / 2)) {
      y = height - 175;
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
    
    cardImg.resize(imgW_, imgH_);
    image(cardImg, x, y);
  }
  
  void cardSelect() {
    if (mouseX >= x - 100 && mouseX <= x + 100 && mouseY >= y - 100 && mouseY <= y + 100) {
      
    }
  }
}
