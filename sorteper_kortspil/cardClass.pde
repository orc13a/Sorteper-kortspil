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
  float oppX;
  float oppY;
  float oppCardWidth;
  int oppCardHeigth;
  
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
  
  void opponetDisplay(float oppX_, float oppY_, float oppCardWidth_, int oppCardHeigth_) {
    oppX = oppX_;
    oppY = oppY_;
    oppCardWidth = oppCardWidth_;
    oppCardHeigth = oppCardHeigth_;
    
    if (mouseX >= oppX - (oppCardWidth / 2) && mouseX <= oppX + (oppCardWidth / 2) && mouseY >= oppY - (oppCardHeigth / 2) && mouseY <= oppY + (oppCardHeigth / 2)) {
      oppY = oppY - 10;
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
    
    fill(255);
    stroke(0);
    strokeWeight(2.5);
    rect(oppX, oppY, oppCardWidth, oppCardHeigth, 10, 10, 10, 10);
    
    image(owCardLogo, oppX, oppY);
    owCardLogo.resize(int(oppCardWidth) - 50, int(oppCardWidth) - 50);
  }
  
  void opponentCardSelected(Player spiller, int oppPlayer) {
    if(mouseX >= oppX - (oppCardWidth / 2) && mouseX <= oppX + (oppCardWidth / 2) && mouseY >= oppY - (oppCardHeigth / 2) && mouseY <= oppY + (oppCardHeigth / 2)) {
      spiller.kort.add(this);
      Player oppPlayerSwitch = alleSpillere.get(oppPlayer);
      oppPlayerSwitch.kort.remove(this);
    }
  }
}
