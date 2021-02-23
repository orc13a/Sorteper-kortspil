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
      
      player.isPlayerFinish(false);
      
      //playerFinishCheck(player); // game_controller
      //updateFinishPlayers(player); // nextPlayer_controller
    } else {
      cardOne.isSelected = false;
      cardTwo.isSelected = false;
    }
    
    if (playersSelectedCards.size() > 0) {
      for (int i = (playersSelectedCards.size() - 1); i >= 0; i--) {
        Card card = playersSelectedCards.get(i);
        card.isSelected = false;
        
        playersSelectedCards.remove(i);
      }
    }
  }
}
