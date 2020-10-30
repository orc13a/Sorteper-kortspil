int[] defBgColor = {255, 255, 255};
int defaultTextSize = 16;
int maxPlayers = 6; // Dette siger hvor mange spillere der kan spille på samme tid. [HARD CODED]
String userInput = ""; // Her spilleren skrive i når der skal skrives noget

void setup() {
  fullScreen(); // Spillet er i fuldskærm
  frameRate(120);
  background(defBgColor[0], defBgColor[1], defBgColor[2]);
  textSize(60);
  textAlign(CENTER); // Sætter skriftens x- og y-koordinat til midten af teksten
  fill(0);
  text("Sorteper", width/2, height/2);
  textSize(20);
  text("Tryk på et bogstav for at starte",  width/2, height-100);
  textSize(defaultTextSize); // ændre skriften tilbage
}

void draw() {
  
}

void keyPressed() {
  clear();
  background(defBgColor[0], defBgColor[1], defBgColor[2]); // Hvid baggroundsfarve og når man har klikket
  
  // Ser om spiller tal og naven er givet
  if(playerAmountAndNamesSet == false) {
    confirmNames();
    playersAmount();
    playersNames();
    changePlayerName();
    
    if(playersAmountSet == false) {
      textSize(30);
      text("Hvor mange spiller?", width/2, height/2-300);
      textSize(16);
      text("Der kan være 2-"+maxPlayers+" med, klik 2-"+maxPlayers+" tasterne for at vælge", width/2, height/2-200);
      
      if(players != 0) {
        textSize(22);
        text(players + " spillere", width/2, height/2-150);
        textSize(16);
        text("[ENTER] for at fortsætte", width/2, height/2-100);
      }
    }
    
    if(playersNameSet == false && playersAmountSet == true) {
      printPlayersNames();
      
      textSize(30);
      text("Vælg jeres spiller navne", width/2, height/2-300);
      textSize(16);
      if(givNameToPlayer != players) {
        text("Skriv navn for spiller " + (givNameToPlayer + 1), width/2, height/2-200);
      }
    }
    
    if(changePlayerName == false && continueOrChangeName == true && playersNameSet == true && playersAmountSet == true) {
      printPlayersNames();
      
      textSize(30);
      text("Sikker?", width/2, height/2-300);
      textSize(16);
      text("Vil i gå med disse navne?", width/2, height/2-200);
      text("[ENTER] for ja | [TAB] for nej", width/2, height/2-150);
    }
    
    if(changePlayerName == true && playersNameSet == true && playersAmountSet == true) {
      printPlayersNames();
      
      textSize(30);
      text("Ændring af spiller navne", width/2, height/2-300);
      textSize(16);
      
      if(givNameToPlayer == 0) {
        text("Vælg en spiller, ud fra deres nummer", width/2, height/2-200);
      } else {
        text("Du ændre navnet for spiller " + givNameToPlayer, width/2, height/2-200);
      }
    }
  }
}
