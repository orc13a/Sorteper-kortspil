float nextPlayerBtnX;
float nextPlayerBtnY;
float usernameBoxW = 0;
String prevPlayer = "";
ArrayList<Player> playerRank = new ArrayList<Player>();
int mostPairs = 0;
int playerLoop = 0;
boolean playerRankSet = false;
boolean startGameEndAudio = true;

void gameUI(Player player) {  
  if (nextPlayerAlert == false && loserFound == false) {
    // menu
    image(GearMenu, (width - 50), 50, 50, 50);
    
    // Player details
    // Name and pair
    rectMode(CORNER);
    textAlign(LEFT);
    
    if(prevPlayer != player.username) {
      usernameBoxW = 0;
      usernameBoxW = (textWidth(player.username) * 3);

      if (usernameBoxW < 100) {
        usernameBoxW = (textWidth(player.username) * 3) + 20;
      }
      
      prevPlayer = player.username;
    }
    
    fill(255);
    stroke(owOrange);
    strokeWeight(2.5);
    rect(100, 93, usernameBoxW, 38, 0, 10, 0, 0);
    
    fill(0);
    textFont(owFont);
    textSize(24);
    text(player.username, 145, 122);
    
    rectMode(CENTER);
    textAlign(CENTER);
    fill(255);
    rect((100 + usernameBoxW) - 12.5, (100 + 38) + 6, 25, 25, 0, 0, 10, 10);
    
    fill(0);
    textSize(16);
    text(player.pair, (100 + usernameBoxW) - 12.5, (100 + 38) + 11);
    textFont(robo);
    // rectMode(CENTER);
    // textAlign(CENTER);
    
    // Icon and outline
    image(player.iconImage, 100, 100, 60, 60);
    image(loadImage("player-icon-outline-gold.png"), 100, 100, 140, 140);
    
    // Next player btn
    nextPlayerBtnX = width - 100;
    nextPlayerBtnY = (height - 150) - 150;
    fill(owOrange);
    noStroke();
    rect(nextPlayerBtnX, nextPlayerBtnY, 100, 38, 10); // Button
    fill(255);
    textFont(owFont);
    textSize(25);
    text("Færdig", nextPlayerBtnX, (nextPlayerBtnY + 10)); // Button text
    textFont(robo);
    
    if (gameRound == 1){
      fill(0);
      textFont(owFont);
      textSize(45);
      text("Match dine par", width/2,nextPlayerBtnY + 15);
      textFont(robo);
      textSize(defFontSize);
    }
  }
  
  // UI for game end
  if (loserFound == true) {
    if(startGameEndAudio == true) {
      gameMusic.stop(); // Stopper musikken fra start skærmen
      gameEndMusic.play(); // Starter musikken til spillet
      gameEndMusic.amp(0.5);
      
      startGameEndAudio = false;
    }
    
    fill(0);
    textFont(owFont);
    textSize(70);
    text(player.username + " har tabt!", width / 2, 300);
    stroke(0);
    line((width / 2) - 200, 350, (width / 2) + 200, 350);
    textSize(35);
    text("Bedste spillere", (width / 2), 425);
    
    // To create an array with the player with most pairs first and then decending (most -> fewest pairs)
    if (playerRankSet == false) {
      while (playerRank.size() != finishPlayers.size()) {
        mostPairs = 0;
        for (Player p : finishPlayers) {
          if (p.pair > mostPairs) {
            playerRank.add(p);
          }
          
          if (playerLoop > finishPlayers.size()) {
            if (p.pair == 0) {
              playerRank.add(p);
            }
          }
        }
        playerLoop++;
      }
      // Only want to make the rank array once
      playerRankSet = true;
    }
    
    textSize(26);
    
    for (int i = 0; i < playerRank.size(); i++) {
      Player p = playerRank.get(i);
      
      if (i == 0) {
        text(p.username + " - " + p.pair + " par", (width / 2), 500);
      } else {
        text(p.username + " - " + p.pair + " par", (width / 2), 500 + (i * 35));
      }
    }
    
    fill(owOrange);
    noStroke();
    rect((width / 2), (height - 150), 100, 38, 10);
    
    fill(0);
    text("Afslut", (width / 2), (height - 150) + 10);
    
    textFont(robo);
  }
  
  if (nextPlayerAlert == true) {
    nextPlayerAlertBox(player);
  }
}

void exitGame() {
  if (loserFound == true && mouseX >= (width / 2) - (100 / 2) && mouseX <= (width / 2) + (100 / 2) && mouseY >= (height - 150) - (38 / 2) && mouseY <= (height - 150) + (38 / 2)) {
    exit();
  }
};
