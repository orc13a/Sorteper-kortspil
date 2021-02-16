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
  float cardRealWidth;
  boolean cardSelected = false;
  
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
    h = imgH_;
    w = imgW_;
    cardRealWidth = realW;
    
    if (mouseX >= x - (realW / 2) && mouseX <= x + (realW / 2) && mouseY >= y - (imgH_ / 2) && mouseY <= y + (imgH_ / 2)) {
      y = y - 10;
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
    
    cardImg.resize(imgW_, imgH_);
    image(cardImg, x, y);
  }
  
  void cardSelect() {
    if(cardId != 666) {
      if (mouseX >= x - (cardRealWidth / 2) && mouseX <= x + (cardRealWidth / 2) && mouseY >= y - (h / 2) && mouseY <= y + (h / 2)) {
        if(cardSelected == false) {
          cardSelected = true;
          
          playersHandCardSelected.add(this);
        }
      }
    }
  }
}
