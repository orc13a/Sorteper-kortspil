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
  void fontDisplay(float x_, float y_, int imageW_, int imageH_, int w_) {
    x = x_;
    y = y_;
    imageW = imageW_;
    imageH = imageH_;
    w = w_;
    
    frontImage.resize(imageW, imageH);
    image(frontImage, x, y);
  }
  
  // Display methode for the back of the card
  void backDisplay(float x_, float y_, int imageW_, int imageH_, int w_) {
    backX = x_;
    backY = y_;
    backimageW = imageW_;
    backimageH = imageH_;
    backW = w_;
    
    backImage.resize(imageW, imageH);
    image(backImage, x, y);
  }
  
  // When the player selects one of the cards in his/hers hand
  void handSelect() {
  
  }
  
  // When the player selects one of the cards in the opponent's hand
  void oppSelect() {
  
  }
}
