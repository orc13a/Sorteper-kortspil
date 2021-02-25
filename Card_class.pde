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
    this.id = id_;
    this.name = name_;
    this.type = type_;
    this.frontImage = frontImage_;
    this.backImage = backImage_;
  }
  
  // -- Methods
  
  // Display methode for the font of the card
  void frontDisplay(float x_, float y_, int imageW_, int imageH_, int w_) {
    this.x = x_;
    this.y = y_;
    this.imageW = imageW_;
    this.imageH = imageH_;
    this.w = w_;
    
    if (mouseX >= this.x - (w / 2) && mouseX <= this.x + (w / 2) && mouseY >= this.y - (imageH / 2) && mouseY <= this.y + (imageH / 2)) {
      this.y = this.y - 10;
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
    
    //frontImage.resize(imageW, imageH);
    image(this.frontImage, this.x, this.y, this.imageW, this.imageH);
    
    if (this.isSelected == true) {
      noFill();
      stroke(owOrange);
      strokeWeight(4);
      rect(this.x - 1, this.y, this.w + 4, this.imageH + 1, 10);
    }
  }
  
  // Display methode for the back of the card
  void backDisplay(float x_, float y_, int imageW_, int imageH_, int w_) {
    this.backX = x_;
    this.backY = y_;
    this.backimageW = imageW_;
    this.backimageH = imageH_;
    this.backW = w_;
    
    if (mouseX >= this.backX - (this.backW / 2) && mouseX <= this.backX + (this.backW / 2) && mouseY >= this.backY - (backimageH / 2) && mouseY <= this.backY + (this.backimageH / 2)) {
      this.backY = this.backY - 10;
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
    
    //backImage.resize((backW - 50), (backW - 50));
    image(backImage, backX, backY, (backW - 50), (backW - 50));
    
    fill(255);
    stroke(0);
    strokeWeight(2.5);
    rect(this.backX, this.backY, this.backW, this.backimageH, 10, 10, 10, 10);
    
    image(this.backImage, this.backX, this.backY, int(this.backW) - 50, int(this.backW) - 50);
    //backImage.resize(int(backW) - 50, int(backW) - 50); // "backW" has width and height because the picture is and should be rectangle
  }
  
  // When the player selects one of the cards in his/hers hand
  void handSelect() {
    if(this.id != 666) {
      if (mouseX >= this.x - (this.w / 2) && mouseX <= this.x + (this.w / 2) && mouseY >= this.y - (this.imageH / 2) && mouseY <= y + (this.imageH / 2)) {
        if(isSelected == false) {
          this.isSelected = true;
          
          playersSelectedCards.add(this);
        }
      }
    }
  }
  
  // When the player selects one of the cards in the opponent's hand
  void oppSelect(Player playersTurn, Player playerPickFrom) {
    // playerPickedCard from game_controller
    if(playerPickedCard == false && mouseX >= this.backX - (this.backW / 2) && mouseX <= this.backX + (this.backW / 2) && mouseY >= this.backY - (this.backimageH / 2) && mouseY <= this.backY + (this.backimageH / 2)) {
      playersTurn.cards.add(this);
      playerPickFrom.cards.remove(this);
      
      playerPickedCard = true; // // game_controller
      
      playerPickFrom.isPlayerFinish(false);
      
      //playerFinishCheck(playerPickFrom); // game_controller
    }
  }
}
