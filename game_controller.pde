// Which player's turn it is (index in allPlayers array) 
int playersTurnIndex = 0;
int playerPickFromIndex = 1;
// What round it is
int gameRound = 2;

// Function that controls the game itself
void game() {
  // Set background
  gameBackgroundImage.resize(width, height);
  image(gameBackgroundImage, (width / 2), (height / 2));
  
  // Whitch player's turn it is
  Player playersTurn = allPlayers.get(playersTurnIndex);
  Player playerPickFrom = allPlayers.get(playerPickFromIndex);
  
  if (playerPickFrom.finish == true && playerPickFrom.cards.size() == 0) {
    while (playerPickFrom.finish == true && playerPickFrom.cards.size() == 0) {  
      playerPickFrom = allPlayers.get(playerPickFromIndex);
      
      if (playerPickFromIndex == (playersAmount - 1)) {
        playerPickFromIndex = 0;
      } else {
        playerPickFromIndex++;
      }
    }
  }
  
  if (gameRound == 1) {
    playersTurn.displayHandFront(playersTurn);
  } else {
    playerPickFrom.displayHandBack(playerPickFrom);
    playersTurn.displayHandFront(playersTurn);
  }
  
  // Display the game UI (user interface)
  gameUI(playersTurn);
}

void mousePressed() {
  
}
