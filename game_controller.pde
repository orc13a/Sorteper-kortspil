// Which player's turn it is (index in allPlayers array) 
int playersTurnIndex = 0;
// Which player the player is gonna pick a card from (index in allPlayers array) 
int playerPickFromIndex = 1; // Always one more then playersTurnIndex to get the next player in the array
// What round it is
int gameRound = 1;
int gameRoundPlayer = 1;
int totalPair = 0;
int lastTotalPair = 0;
// If the player picks a card from a opponet
boolean playerPickedCard = false;
boolean loserFound = false;
boolean noMorePickCards = false;
boolean aPlayerIsFinish = false;
boolean totalPairChange = false;

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
  Player playersTurn;
  
  if (playersTurnIndex == playersAmount) {
    playersTurnIndex = 0;
    playersTurn = allPlayers.get(playersTurnIndex);
  } else {
    playersTurn = allPlayers.get(playersTurnIndex);
  }
  
  //pairCounter();
  
  // Which player the player is gonna pick a card from
  Player playerPickFrom;
  
  if (allPlayers.size() == 1) {
    noMorePickCards = true;
    
    if (allPlayers.get(0).cards.get(0).id == 666) {
      nextPlayerAlert = false;
      loserFound = true;
    }
  }
  
  if (playerPickFromIndex == playersAmount && loserFound != true && noMorePickCards != true) {
    playerPickFromIndex = 0;
    playerPickFrom = allPlayers.get(playerPickFromIndex);
  } else {
    if (noMorePickCards != true) {
      if (playerPickFromIndex == -1) {
        playerPickFrom = allPlayers.get(0);
      } else {
        playerPickFrom = allPlayers.get(playerPickFromIndex);
      }
    } else {
      playerPickFrom = allPlayers.get(0);
    }
  }
  
  /*if (totalPair == (allCards.size() - 1) / 2) {
    nextPlayerAlert = false;
    loserFound = true;
    noMorePickCards = true;
  }*/
  
  // Game mecanichs that should only be displayed if the game is not paused or anything like that
  if (nextPlayerAlert == false && loserFound == false) {
    // Checks if the gmae should display only players hand or also an opponets hand
    if (gameRound == 1) {
      playersTurn.displayHandFront(playersTurn);
    } else {
      if (noMorePickCards != true) {
        playerPickFrom.displayHandBack(playerPickFrom, playerPickedCard);
      }
      playersTurn.displayHandFront(playersTurn);
    }
    
    // Function that makes player able to pick pairs
    pairSelect(playersTurn, playerPickFrom);
  }

  //if (loserFound == false) {
    // Display the game UI (user interface)
    gameUI(playersTurn);
  //}
}

void pairCounter() {
  if (totalPairChange == true) {
    totalPair = 0;
    
    for (int i = 0; i < allPlayers.size(); i++) {
      Player player = allPlayers.get(i);
      totalPair += player.pair;
    }
    
    if (finishPlayers.size() > 0) {
      for (int i = 0; i < finishPlayers.size(); i++) {
        Player player = finishPlayers.get(i);
        totalPair += player.pair;
      }
    }
    
    totalPairChange = false;
  }
}

void mousePressed() {
  if (gameStarted == false) {
    if (allPlayerAmountBtns.size() > 0) {
      for (playerAmountBtn btn : allPlayerAmountBtns) {
        btn.choose();
      }
    }
    
    saveSetPlayerAmount(); // PlayerSetUp
  } else {
  
    // #########################
    //   Player index checking
    // #########################
    // Whitch player's turn it is
    Player playersTurn;
    
    if (playersTurnIndex == playersAmount) {
      playersTurnIndex = 0;
      playersTurn = allPlayers.get(playersTurnIndex);
    } else {
      playersTurn = allPlayers.get(playersTurnIndex);
    }
    
    // Which player the player is gonna pick a card from
    Player playerPickFrom;
    
    if (allPlayers.size() == 1) {
      noMorePickCards = true;
    }
    
    if (playerPickFromIndex == playersAmount && loserFound != true && noMorePickCards != true) {
      playerPickFromIndex = 0;
      playerPickFrom = allPlayers.get(playerPickFromIndex);
    } else {
      if (noMorePickCards != true) {
        if (playerPickFromIndex == -1) {
          playerPickFrom = allPlayers.get(0);
        } else {
          playerPickFrom = allPlayers.get(playerPickFromIndex);
        }
      } else {
        playerPickFrom = allPlayers.get(0);
      }
    }
    // #########################
    
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
}
