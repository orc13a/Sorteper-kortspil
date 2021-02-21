// Which player's turn it is (index in allPlayers array) 
int playersTurn = 0;

// Function that controls the game itself
void game() {
  // Set background
  gameBackgroundImage.resize(width, height);
  image(gameBackgroundImage, (width / 2), (height / 2));
  
  
  // Display the game UI (user interface)
  gameUI();
}

void mousePressed() {
  
}
