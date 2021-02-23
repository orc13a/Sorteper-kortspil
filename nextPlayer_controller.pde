boolean nextPlayerAlert = false;
boolean nextPlayerAlertButtonPressed = false;
boolean noFinishPlayers = true;

void nextPlayer(Player playersTurn, Player playerPickFrom) {
  if (nextPlayerAlertButtonPressed == false) {  
    // If the next players is not finished
    if (noFinishPlayers == true && playersTurn.finish == false && playersTurn.cards.size() > 0 && playerPickFrom.finish == false && playerPickFrom.cards.size() > 0) {
      if (playersTurnIndex == (playersAmount - 1)) {
        playersTurnIndex = 0;
        gameRound++;
      } else {
        playersTurnIndex++;
      }
      
      if (playerPickFromIndex == (playersAmount - 1)) {
        playerPickFromIndex = 0;
      } else {
        playerPickFromIndex++;
      }
      // 
    }
    
    if (playersTurn.finish == true && playersTurn.cards.size() == 0) {
      // While playerPickFrom has no cards and is not playersTurn, then will we go on to the next player
      while (playersTurn.finish == true && playersTurn.cards.size() == 0) {  
        playersTurn = allPlayers.get(playersTurnIndex);
        
        // If we have been througt all the players do we start over
        if (playersTurnIndex == (playersAmount - 1)) {
          playersTurnIndex = 0;
        } else {
          playersTurnIndex++;
        }
      }
      
      nextPlayerAlert = true;
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
