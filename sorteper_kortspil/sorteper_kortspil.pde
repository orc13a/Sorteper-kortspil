// Importere liberies vi skal bruge
import processing.sound.*;
// Laver en varibale til title screen musik
SoundFile titleScreenAudio;

// Fonts
PFont robo;

// En class som er en del af processing
// Laver billede variabel
PImage owTitleDCLImage;

int[] defBgColor = {255, 255, 255};
int defaultTextSize = 12;
int header1 = 60;
int header2 = 45;
int maxPlayers = 6; // Dette siger hvor mange spillere der kan spille på samme tid. [HARD CODED]
color owOrange = #F79D1A;

int screenWidth;
int screenHeight;

boolean titleScreen = true;
boolean gameStarted = true; // [DEV] skal være false standard

void setup() {
  fullScreen(); // Spillet er i fuldskærm
  background(defBgColor[0], defBgColor[1], defBgColor[2]);
  frameRate(120);
  // Disse gør alt mere smooth og mindre pixel
  smooth(8);
  pixelDensity(2);
  
  screenWidth = width;
  screenHeight = height;
  
  // https://processing.org/reference/libraries/sound/SoundFile.html
  titleScreenAudio = new SoundFile(this, "ow_st_menu.mp3");
  titleScreenAudio.play();
  titleScreenAudio.loop();
  titleScreenAudio.amp(0.2); // volume (0.0 - 1.0) [float]
  
  rectMode(CENTER);
  imageMode(CENTER);
   
  owTitleDCLImage = loadImage("ow-title-dlc.png");
  
  robo = createFont("Roboto-Regular.ttf", defaultTextSize);
  textFont(robo);
  
  
  choosePlayers();
  lavKort();
}

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
  
  // Til at angive navne og spiller tal
  if(playerNamesAndAmoutSet == true && playerNamesAndAmoutIsSet == false) {
    choosePlayers();
  }
  
  // Giver kortene ud og først efter kan spillet starte
  if(playerNamesAndAmoutIsSet == true && cardGiven == false) {
    giveCards();
  }
  
  // Når navne, antal spiller og kort er givet
  if(gameStarted == true && cardGiven == true) {
    game();
  }
}

void mousePressed() {
  
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
