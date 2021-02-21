class Card {
  // -- Data
  int id;
  float x;
  float y;
  int w; // Not the image itself, but the card on the image width
  int h; // Not the image itself, but the card on the image height
  PImage image;
  String type;
  String name;
  boolean isSelected = false;
  float backX; // x-coordinat for when the cards needs to display for an opponent
  float backY; // y-coordinat for when the cards needs to display for an opponent
  int backW; // Not the image itself, but the card on the image width
  int backH; // Not the image itself, but the card on the image height
  
  // -- Constructor
  Card(int id_, String name_, String type_, PImage image_) {
    id = id_;
    name = name_;
    type = type_;
    image = image_;
  }
  
  // -- Methods
  
  // Display methode for the player's own hand (front of the card)
  void playerDisplay(float x_, float y_, int w_, int h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }
  
  // Display methode for the back of the card
  void oppDisplay() {
  
  }
  
  // When the player selects one of the cards in his/hers hand
  void handSelect() {
  
  }
  
  // When the player selects one of the cards in the opponent's hand
  void oppSelect() {
  
  }
}
