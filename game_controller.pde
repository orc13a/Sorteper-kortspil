// Which player's turn it is (index in allPlayers array) 
int playersTurnIndex = 0;
// What round it is
int gameRound = 1;

// Function that controls the game itself
void game() {
  // Set background
  gameBackgroundImage.resize(width, height);
  image(gameBackgroundImage, (width / 2), (height / 2));
  
  // Whitch player's turn it is
  Player playersTurn = allPlayers.get(playersTurnIndex);
  
  if (gameRound == 1) {
    
    playersTurn.displayHandFront(playersTurn);
  } else {
    
  }
  
  // Display the game UI (user interface)
  //gameUI();
}

void mousePressed() {
  
}
