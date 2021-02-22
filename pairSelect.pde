ArrayList<Card> playersSelectedCards = new ArrayList<Card>();

void pairSelect(Player player, Player playerPickFrom) {
  if (playersSelectedCards.size() == 2) {
    int cardOneMatchId = 0;
    
    Card cardOne = playersSelectedCards.get(0);
    Card cardTwo = playersSelectedCards.get(1);
    
    if(cardOne.id < 13) {
      cardOneMatchId = cardOne.id * 13;
    } else {
      cardOneMatchId = cardOne.id / 13;
    }
    
    if(cardOneMatchId == cardTwo.id && cardOne.type != cardTwo.type) {
      player.pair++;
      
      player.cards.remove(cardOne);
      player.cards.remove(cardTwo);
      
      playerCardCheck(playerPickFrom); // game_controller
    } else {
      cardOne.isSelected = false;
      cardTwo.isSelected = false;
    }
    
    playersSelectedCards.remove(1);
    playersSelectedCards.remove(0);
  }
}
