class Player {
  // -- Data
  String username;
  PImage iconImage;
  ArrayList<Card> cards = new ArrayList<Card>();
  int par = 0;
  boolean finish = false; // True if the player has none cards left
  
  // -- Constructor
  Player(String username_, PImage iconImage_) {
    username = username_;
    iconImage = iconImage_;
  }
  
  // -- Methods
  
  // For the player to see his/hers own hand
  void displayHandFront() {
    for (int i = 0; i < cards.size(); i++) {
      Card card = cards.get(i);
      
      //card.frontDisplay(,,,,);
    }
  }
  
  // For displaying the back of this players hand for an opponent
  void displayHandBack() {
    for (int i = 0; i < cards.size(); i++) {
      Card card = cards.get(i);
      
      //card.backDisplay(,,,,);
    }
  }
}
