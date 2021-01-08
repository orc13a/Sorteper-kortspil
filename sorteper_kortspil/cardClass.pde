class Card {
  float x;
  float y;
  int cardId;
  String cardName;
  String cardColor;
  String cardImg;
  boolean black; // Om kortet er sorteper
  int h = 200;
  int w = 100;
  
  Card(float newX, float newY, int newCardId, String givenCardName, boolean isBlack, String givenCardColor, String givenCardImg) {
    x = newX;
    y = newY;
    cardId = newCardId;
    cardName = givenCardName;
    cardColor = givenCardColor;
    cardImg = givenCardImg;
    black = isBlack;
  }
  
  void display() {
    
  }
}
