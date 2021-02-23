// Which player's turn it is (index in allPlayers array) 
int playersTurnIndex = 0;
// Which player the player is gonna pick a card from (index in allPlayers array) 
int playerPickFromIndex = 1; // Always one more then playersTurnIndex to get the next player in the array
// What round it is
int gameRound = 1;
// If the player picks a card from a opponet
boolean playerPickedCard = false;
boolean loserFound = false;

// Function that controls the game itself
void game() {
  // Set background
  gameBackgroundImage.resize(width, height);
  image(gameBackgroundImage, (width / 2), (height / 2));
  
  // If "færdig" button has been preesed should we go to the next player
  if (nextPlayerAlert == true) {
    nextPlayer(/*playersTurn, playerPickFrom*/);
  }
  
  // Whitch player's turn it is
  Player playersTurn = allPlayers.get(playersTurnIndex);
  
  // Which player the player is gonna pick a card from
  Player playerPickFrom;
  if (finishPlayers.size() != playersAmount) {
    playerPickFrom = allPlayers.get(playerPickFromIndex);
  } else {
    playerPickFrom = allPlayers.get(0);
    loserFound = true;
  }
  
  //playerCardsCheck(playersTurn, playerPickFrom);
  
  // Game mecanichs that should only be displayed if the game is not paused or anything like that
  if (nextPlayerAlert == false && loserFound == false) {
    // Checks if the gmae should display only players hand or also an opponets hand
    if (gameRound == 1) {
      playersTurn.displayHandFront(playersTurn);
    } else {
      playerPickFrom.displayHandBack(playerPickFrom, playerPickedCard);
      playersTurn.displayHandFront(playersTurn);
    }
    
    // Function that makes player able to pick pairs
    pairSelect(playersTurn, playerPickFrom);
  }
  
  if (loserFound == true) {
    text(playersTurn.username + " LOSER", width / 2, height / 2);
  }
  
  if (loserFound == false) {
    // Display the game UI (user interface)
    gameUI(playersTurn);
  }
}

/*void playerFinishCheck(Player player) {
  if (player.cards.size() == 0) {
    player.finish = true;
    updateFinishPlayers(player);
  }
}*/

void mousePressed() {
  // Whitch player's turn it is
  Player playersTurn = allPlayers.get(playersTurnIndex);
  // Which player the player is gonna pick a card from
  Player playerPickFrom = allPlayers.get(playerPickFromIndex);
  
  // Game mecanichs that should only be available if the game is not paused or anything like that 
  if (nextPlayerAlert == false) {
    nextPlayerButtonPress();
    
    // Cards in players hand
    for (int i = 0; i < playersTurn.cards.size(); i++) {
      Card card = playersTurn.cards.get(i);
      card.handSelect();
    }
    
    if (gameRound > 1) {
      // Cards in players pick from hand
      for (int i = 0; i < playerPickFrom.cards.size(); i++) {
        Card card = playerPickFrom.cards.get(i);
        card.oppSelect(playersTurn, playerPickFrom);
      }
    }
  }
  
  if (nextPlayerAlert == true) {
    nextPlayerButtonPressed();
  }
}
