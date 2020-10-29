int[] defBgColor = {255, 255, 255};
int defaultTextSize = 12;
int maxPlayers = 6; // Dette siger hvor mange spillere der kan spille på samme tid. [HARD CODED]

void setup() {
  fullScreen(); // Spillet er i fuldskærm
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
  
  if(playerAmountAndNamesSet == false) {
  
  }
}
