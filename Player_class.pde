class Player {
  // -- Data
  String username;
  PImage iconImage;
  ArrayList<Card> cards = new ArrayList<Card>(); // players hand
  int previousHandSize;
  int pair = 0;
  boolean finish = false; // True if the player has none cards left
  
  // -- Constructor
  Player(String username_, PImage iconImage_) {
    this.username = username_;
    this.iconImage = iconImage_;
  }
  
  // -- Methods
  
  // For the player to see his/hers own hand
  void displayHandFront(Player player) {    
    float[] cDPA = cardsDisplayCal(player);
    
    for (int i = 0; i < cards.size(); i++) {
      Card card = cards.get(i);
      
      if (i == 0) {
        float cardX = cDPA[6] + (cDPA[2] / 2);
        
        card.frontDisplay(cardX, (height - 150), int(cDPA[0]), int(cDPA[0]), int(cDPA[2]));
      } else {
        float cardX = cDPA[6] + (cDPA[2] / 2) + ((cDPA[2] + cDPA[1]) * i);
        
        card.frontDisplay(cardX, (height - 150), int(cDPA[0]), int(cDPA[0]), int(cDPA[2]));
      }
    }
    
    //isPlayerFinish();
  }
  
  // For displaying the back of this players hand for an opponent
  void displayHandBack(Player player, boolean playerPickedCard) {   
    // If the player has not picked a card, then display the cards
    if (playerPickedCard == false) {
      float[] cDPA = cardsDisplayCal(player);
    
      for (int i = 0; i < cards.size(); i++) {
        Card card = cards.get(i);
        
        if (i == 0) {
          float cardX = cDPA[6] + (cDPA[2] / 2);
          
          card.backDisplay(cardX, (height / 2), int(cDPA[0]), int(cDPA[0]), int(cDPA[2]));
        } else {
          float cardX = cDPA[6] + (cDPA[2] / 2) + ((cDPA[2] + cDPA[1]) * i);
          
          card.backDisplay(cardX, (height / 2), int(cDPA[0]), int(cDPA[0]), int(cDPA[2]));
        }
      }
      
      //isPlayerFinish();
    }
  }
  
  void isPlayerFinish(boolean handPick) {
    if(this.finish == false && this.cards.size() == 0) {
      this.finish = true;
      
      finishPlayers.add(this);
      allPlayers.remove(this);
      
      playersAmount = allPlayers.size();
      
      aPlayerIsFinish = true;
      //nextPlayerAlert = false;
      
      /*if (handPick == true) {
        nextPlayerAlert = true;
      }*/
    }
  }
}
