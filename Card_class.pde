boolean previousHandSizeCheck = false;

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
    
    frontImage.resize(imageW, imageH);
    image(frontImage, x, y);
    
    if (mouseX >= x - (w / 2) && mouseX <= x + (w / 2) && mouseY >= y - (imageH / 2) && mouseY <= y + (imageH / 2)) {
      y = y - 10;
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
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
    
    fill(255);
    stroke(0);
    strokeWeight(2.5);
    rect(backX, backY, backW, backimageH, 10, 10, 10, 10);
    
    image(backImage, backX, backY);
    backImage.resize(int(backW) - 50, int(backW) - 50); // "backW" has width and height because the picture is and should be rectangle
    
    if (mouseX >= x - (backW / 2) && mouseX <= x + (backW / 2) && mouseY >= y - (backimageH / 2) && mouseY <= y + (backimageH / 2)) {
      backY = backY - 10;
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
  }
  
  // When the player selects one of the cards in his/hers hand
  void handSelect() {
  
  }
  
  // When the player selects one of the cards in the opponent's hand
  void oppSelect() {
  
  }
  
  float[] cardsDisplayCal(Player player) {
    if (player.cards.size() != player.previousHandSize || previousHandSizeCheck == false) {
      if (player.finish == false && player.cards.size() > 0) {
        float newCardImageWidth;
        float cardMargin;
        float cardW;
        float spaceBetweenCards;
        float totalAllCardsW;
        float cardsDisplayWidth;
        float cardsDisplayWidthMargin;
        
        newCardImageWidth = (width / player.cards.size());
    
        if(newCardImageWidth > 200) {
          newCardImageWidth = 200;
        }
        
        cardMargin = (newCardImageWidth / 100) * 16.5; // 16,5 %
        cardW = newCardImageWidth - (cardMargin * 2);
        spaceBetweenCards = cardMargin * (player.cards.size() - 1);
        totalAllCardsW = cardW * player.cards.size();
        cardsDisplayWidth = totalAllCardsW + spaceBetweenCards;
        cardsDisplayWidthMargin = (width - cardsDisplayWidth) / 2;
      }
    }
    
    float[] returnArray = {newCardImageWidth, cardMargin, cardW, spaceBetweenCards, totalAllCardsW, cardsDisplayWidth, cardsDisplayWidthMargin};
    return returnArray;
  }
}
