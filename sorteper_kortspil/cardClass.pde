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
  
  void display(float x_, float y_) {
    cardImg.resize(200,200);
    image(cardImg, x_, y_);
  }
}
