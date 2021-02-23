boolean nextPlayerAlert = false;
boolean nextPlayerAlertButtonPressed = false;

void nextPlayer(/*Player playersTurn, Player playerPickFrom*/) {
  if (nextPlayerAlertButtonPressed == false) {

    playersTurnIndex = gameRoundPlayer % playersAmount;

    gameRoundPlayer++;
    
    if (playersTurnIndex == 0) {
      gameRound++;
    }
    
    if (playersTurnIndex == (playersAmount - 1)) {
      playerPickFromIndex = 0;
    } else {
      playerPickFromIndex = playersTurnIndex + 1;
    }
  
    // If the player has selected cards in storage then they should be removed
    if (playersSelectedCards.size() > 0) {
      for (int i = (playersSelectedCards.size() - 1); i >= 0; i--) {
        Card card = playersSelectedCards.get(i);
        card.isSelected = false;
        
        playersSelectedCards.remove(i);
      }
    }
  }
  
  if (aPlayerIsFinish == true) {
    aPlayerIsFinish = false;
  }
  
  playerPickedCard = false;
  nextPlayerAlertButtonPressed = true; 
}

void nextPlayerAlertBox(Player player) {
  fill(255);
  stroke(owOrange);
  strokeWeight(2.5);
  rect(width / 2, height / 2, width / 5, 150, 10, 10, 10, 10); // Alert box
  
  fill(0);
  textSize(18);
  textAlign(CENTER);
  text("Har " + player.username + " fået enheden?", width / 2, height / 2 - 20); // Alert box
  
  fill(owOrange);
  noStroke();
  rect(width / 2, height / 2 + 40, 50, 38, 10); // Button
  textSize(16);
  fill(255);
  text("Ja", width / 2, height / 2 + 45); // Button text
}

void nextPlayerButtonPress() {
  if (mouseX >= (width - 100) - 50 && mouseX <= (width - 100) + 50 && mouseY >= ((height - 150) - 150) - (38 / 2) && mouseY <= ((height - 150) - 150) + (38 / 2)) {
    nextPlayerAlert = true;
  }
}

void nextPlayerButtonPressed() {
  if (mouseX >= (width / 2) - 25 && mouseX <= (width / 2) + 25 && mouseY >= (height / 2 + 40) - (38 / 2) && mouseY <= (height / 2 + 40) + (38 / 2)) {
    nextPlayerAlert = false;
    nextPlayerAlertButtonPressed = false;
  }
}
