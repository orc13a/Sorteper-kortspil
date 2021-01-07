class Card {
  float x;
  float y;
  int cardId;
  String cardColor;
  String cardImg;
  boolean black; // Om kortet er sorteper
  int h = 200;
  int w = 100;
  
  Card(float newX, float newY, int newCardId, boolean isBlack, String givenCardColor, String givenCardImg) {
    x = newX;
    y = newY;
    cardId = newCardId;
    cardColor = givenCardColor;
    cardImg = givenCardImg;
    black = isBlack;
  }
  
  void display() {
    
  }
}
