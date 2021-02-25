float nextPlayerBtnX;
float nextPlayerBtnY;
float usernameBoxW = 0;
String prevPlayer = "";
ArrayList<Player> playerRank = new ArrayList<Player>();
int mostPairs = 0;
boolean playerRankSet = false;

void gameUI(Player player) {  
  if (nextPlayerAlert == false && loserFound == false) {
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
    textSize(16);
    text(player.username, 145, 118);
    
    rectMode(CENTER);
    textAlign(CENTER);
    fill(255);
    rect((100 + usernameBoxW) - 12.5, (100 + 38) + 6, 25, 25, 0, 0, 10, 10);
    
    fill(0);
    textSize(16);
    text(player.pair, (100 + usernameBoxW) - 12.5, (100 + 38) + 11);
    
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
    textSize(18);
    text("Færdig", nextPlayerBtnX, (nextPlayerBtnY + 6)); // Button text
    
    if (gameRound == 1){
      fill(0);
      textSize(30);
      text("Match dine par", width/2,nextPlayerBtnY);
      textSize(defFontSize);
    }
  }
  
  if (loserFound == true) {
    fill(0);
    textSize(40);
    text(player.username + " har tabt!", width / 2, 300);
    stroke(0);
    line((width / 2) - 200, 350, (width / 2) + 200, 350);
    textSize(30);
    text("Bedste spillere", (width / 2), 425);
    
    // To create an array with the player with most pairs first and then decending (most -> fewest pairs)
    if (playerRankSet == false) {
      while (playerRank.size() != finishPlayers.size()) {
        mostPairs = 0;
        for (Player p : finishPlayers) {
          if (p.pair > mostPairs) {
            playerRank.add(p);
          }
          
          if (playerRank.size() == finishPlayers.size() - 1) {
            if (p.pair == 0) {
              playerRank.add(p);
            }
          }
        }
      }
      // Only want to make the rank array once
      playerRankSet = true;
    }
    
    textSize(22);
    
    for (int i = 0; i < playerRank.size() - 1; i++) {
      Player p = playerRank.get(i);
      
      if (i == 0) {
        text((i + 1) + ". " + p.username + " med " + p.pair + " par", (width / 2), 500);
      } else {
        text((i + 1) + ". " + p.username + " med " + p.pair + " par", (width / 2), 500 + (i * 25));
      }
    }
  }
  
  if (nextPlayerAlert == true) {
    nextPlayerAlertBox(player);
  }
}
