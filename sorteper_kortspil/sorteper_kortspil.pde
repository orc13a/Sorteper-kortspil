import processing.sound.*;
SoundFile soundFile;


PImage owLogoImage;

int[] defBgColor = {255, 255, 255};
int defaultTextSize = 12;
int maxPlayers = 6; // Dette siger hvor mange spillere der kan spille på samme tid. [HARD CODED]

// State der siger om spillerene skal have kort

// [DEV] vars
boolean playerAmountAndNamesSet = true;
String[] playerNames = {"Oliver", "Nixi", "Gustav", "Kasper", null, null};
int players = 4;
//

void setup() {
  fullScreen(); // Spillet er i fuldskærm
  background(defBgColor[0], defBgColor[1], defBgColor[2]);
  
  // https://processing.org/reference/libraries/sound/SoundFile.html
  soundFile = new SoundFile(this, "ow_st_menu.mp3");
  soundFile.play();
  soundFile.loop();
  soundFile.amp(0.5); // volume (0.0 - 1.0) [float]
  
  imageMode(CENTER);
  
  owLogoImage = loadImage("ow-title-dlc.png");
  
  image(owLogoImage, width/2, height/2);
  
  textSize(60);
  textAlign(CENTER); // Sætter skriftens x- og y-koordinat til midten af teksten
  fill(0);
  text("Sorteper", width/2, 250);
  textSize(20);
  text("Tryk på et bogstav for at starte",  width/2, height-100);
  textSize(defaultTextSize); // ændre skriften tilbage
}

Button testBtn;

void draw() {
  testBtn = new Button(100, 100, 100, 50, "Hello World",  169, 0, 18);
  
  testBtn.display();
}

void mousePressed() {
  testBtn.pressed();
}

void keyPressed() {
  
}
