void generateCards() {
  String[] heroes = {"Dva", "Reinhardt", "Winston", "Genji", "Hanzo", "Tracer", "Soldier", "Bastion", "Reaper", "Mercy", "Zen", "Ana"};
  
  String cardColor = "blue";
  for(int i = 0; i < heroes.length; i++) {
    int cardID = i + 1;
    String cardFrontImage = heroes[i] + "_" + cardColor + ".png";
    
    Card card = new Card(cardID, heroes[i], cardColor, loadImage(cardFrontImage), loadImage("ow-card-logo.png"));
    allCards.add(card);
  };
  
  cardColor = "red";
  for(int i = 0; i < heroes.length; i++) {
    int cardID = (i + 1) * 13;
    String cardFrontImage = heroes[i] + "_" + cardColor + ".png";
    
    Card card = new Card(cardID, heroes[i], cardColor, loadImage(cardFrontImage), loadImage("ow-card-logo.png"));
    allCards.add(card);
  };
  
  Card sorteperCard = new Card(666, "Doomfist", "black", loadImage("Doom.png"), loadImage("ow-card-logo.png"));
  allCards.add(sorteperCard);
}
