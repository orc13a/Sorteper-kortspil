boolean cardChecking = false;
ArrayList<Card> allCards = new ArrayList<Card>();
ArrayList<Card> givenCards = new ArrayList<Card>();

int giveCard = 0;
int givePlayerCard = 0; // Index in allPlayers array, index of that player whitch is gettin the card

int cardIndex;
Card card;


// Function that creates and hands out the cards amoung the players
void giveCards() {
  while(giveCard != allCards.size()) {
    cardChecking = false;
    
    Player player = allPlayers.get(givePlayerCard);
    
    if (givenCards.size() > 0) {
      while (cardChecking == false) {
        cardIndex = int(random(0, allCards.size()));
        card = allCards.get(cardIndex);
        
        for (int i = 0; i < givenCards.size(); i++) {
          Card cardCheck = givenCards.get(i);
          if (card.id == cardCheck.id) {
            break;
          }
          
          if (i == (givenCards.size() - 1) && card.id != cardCheck.id) {
            cardChecking = true;
            break;
          }
        }
      }
    } else {
      cardIndex = int(random(0, allCards.size()));
      card = allCards.get(cardIndex);
    }

    player.cards.add(card);
    givenCards.add(card);

    giveCard++; // Tæller hvor mange card er blivet delt ud (25 maks)
    
    if(givePlayerCard == allPlayers.size() - 1) {
      givePlayerCard = 0;
    } else {
      givePlayerCard++;
    }
  }
  
  // When all card are handed out can the game start
  cardsGiven = true;
  gameStarted = true;
}
