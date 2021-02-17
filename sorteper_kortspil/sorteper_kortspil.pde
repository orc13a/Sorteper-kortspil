// https://bingur.github.io/sounds-of-overwatch/pages/misc_pages/music.html

// Importere liberies vi skal bruge
import processing.sound.*;
// Laver en varibale til title screen musik
SoundFile titleScreenAudio;
SoundFile gameMusic;

// Fonts
PFont robo;
PFont roboMedium;
PFont owFont;
PFont owFontItalic;

// En class som er en del af processing
// Laver billede variabel
PImage owTitleDCLImage;
PImage titleBgImage;
PImage gameBgImage;
PImage owCardLogo;

int[] defBgColor = {255, 255, 255};
int defaultTextSize = 12;
int header1 = 60;
int header2 = 45;
int maxPlayers = 6; // Dette siger hvor mange spillere der kan spille på samme tid. [HARD CODED]
color owOrange = #F79D1A;

int screenWidth;
int screenHeight;

boolean startGameAudio = true;

boolean titleScreen = true;
boolean gameStarted = true; // [DEV] skal være false standard

void setup() {
  fullScreen(); // Spillet er i fuldskærm
  background(defBgColor[0], defBgColor[1], defBgColor[2]);
  frameRate(60);
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
  
  gameMusic = new SoundFile(this, "game-musik.mp3");
  
  rectMode(CENTER);
  imageMode(CENTER);
   
  owTitleDCLImage = loadImage("ow-title-dlc.png");
  //titleBgImage = loadImage("titlescreen-bg.jpg");
  gameBgImage = loadImage("game-bg-image.png");
  owCardLogo = loadImage("ow-card-logo.png");
  
  
  robo = createFont("Roboto-Regular.ttf", defaultTextSize);
  roboMedium = createFont("Roboto-Medium.ttf", defaultTextSize);
  owFont = createFont("big_noodle_titling.ttf", defaultTextSize);
  owFontItalic = createFont("big_noodle_titling_oblique.ttf", defaultTextSize);
  textFont(robo);
  
  
  choosePlayers();
  lavKort();
}

void draw() {
  clear();
  background(defBgColor[0], defBgColor[1], defBgColor[2]);
  
  // Når navne, antal spiller og kort er givet
  if(gameStarted == true && cardGiven == true) {
    game();
  }
  
  if(titleScreen == true) {
    //image(titleBgImage, width / 2, height / 2);
    //titleBgImage.resize(width, height);
    
    textFont(owFont);
    textSize(header1);
    textAlign(CENTER); // Sætter skriftens x- og y-koordinat til midten af teksten
    fill(0);
    text("Sorteper", width/2, 250);
    textFont(owFontItalic);
    textSize(24);
    text("Tryk på en tast, for at fortsætte",  width/2, height-100);
    textSize(defaultTextSize); // ændre skriften tilbage
    image(owTitleDCLImage, width/2, height/2);
    textFont(robo);
  }
  
  // Til at angive navne og spiller tal
  if(playerNamesAndAmoutSet == true && playerNamesAndAmoutIsSet == false) {
    choosePlayers();
  }
  
  // Giver kortene ud og først efter kan spillet starte
  if(playerNamesAndAmoutIsSet == true && cardGiven == false) {
    giveCards();
  }
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
