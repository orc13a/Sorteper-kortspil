// Importere liberies vi skal bruge
import processing.sound.*;
// Laver en varibale til title screen musik
SoundFile titleScreenAudio;

// En class som er en del af processing
// Laver billede variabel
PImage owTitleDCLImage;

int[] defBgColor = {255, 255, 255};
int defaultTextSize = 12;
int header1 = 60;
int header2 = 45;
int maxPlayers = 6; // Dette siger hvor mange spillere der kan spille på samme tid. [HARD CODED]
color owOrange = #F79D1A;

boolean titleScreen = true;
boolean gameStarted = true; // [DEV] skal være false standard

void setup() {
  fullScreen(); // Spillet er i fuldskærm
  background(defBgColor[0], defBgColor[1], defBgColor[2]);
  frameRate(60);
  smooth(8);

  // https://processing.org/reference/libraries/sound/SoundFile.html
  titleScreenAudio = new SoundFile(this, "ow_st_menu.mp3");
  titleScreenAudio.play();
  titleScreenAudio.loop();
  titleScreenAudio.amp(0.2); // volume (0.0 - 1.0) [float]
  
  rectMode(CENTER);
  imageMode(CENTER);
   
  owTitleDCLImage = loadImage("ow-title-dlc.png");
  
  choosePlayers();
  lavKort();
}

//Button testBtn;

void draw() {
  clear();
  background(defBgColor[0], defBgColor[1], defBgColor[2]);
  
  if(titleScreen == true) {
    textSize(header1);
    textAlign(CENTER); // Sætter skriftens x- og y-koordinat til midten af teksten
    fill(0);
    text("Sorteper", width/2, 250);
    textSize(20);
    text("Tryk på en tast, for at fortsætte",  width/2, height-100);
    textSize(defaultTextSize); // ændre skriften tilbage
    image(owTitleDCLImage, width/2, height/2);
  }
  
  //testBtn = new Button(100, 100, 100, 50, "Hello World", 169, 0, 0, 18);
  
  //testBtn.display();
  
  // Til at angive navne og spiller tal
  if(playerNamesAndAmoutSet == true && playerNamesAndAmoutIsSet == false) {
    choosePlayers();
  }
  
  // Giver kortene ud og først efter kan spillet starte
  if(playerNamesAndAmoutIsSet == true && cardGiven == false) {
    giveCards();
  }
  
  if(gameStarted == true && cardGiven == true) {
    game();
  }
}

void mousePressed() {
  //testBtn.pressed();
}

void keyPressed() {
  /*if(titleScreen == true) {
    playerNamesAndAmoutSet = true;
    //titleScreenAudio.stop();
    titleScreen = false;
  }*/
  titleScreen = false;
  // [DEV]
  if(titleScreen == false) {
    playerNamesAndAmoutIsSet = true;
  }
}
