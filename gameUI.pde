float nextPlayerBtnX;
float nextPlayerBtnY;
float usernameBoxW = 0;
String prevPlayer = "";

void gameUI(Player player) {  
  if (nextPlayerAlert == false) {
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
  
  if (nextPlayerAlert == true) {
    nextPlayerAlertBox(player);
  }
}
