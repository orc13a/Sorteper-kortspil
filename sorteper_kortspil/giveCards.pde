boolean cardGiven = false;
ArrayList<Card> alleKort = new ArrayList<Card>();

int givKort = 0;
int givSpillerKort = 0;

void giveCards() {
  while(givKort != alleKort.size()) {
    
    
    if(givSpillerKort == alleSpillere.size()) {
      givSpillerKort = 0;
    }
  }
}

// Laver alle kort
void lavKort() {
  String[] heroes = {"Dva", "Reinhardt", "Winston", "Genji", "Hanzo", "Tracer", "Soldier", "Bastion", "Reaper", "Mercy", "Zenyatte", "Ana"};
  String sorteper = "Doomfist";
  
  String cardColor = "Blå";
  for(int i = 0; i < heroes.length; i++) {
    int cardID = i + 1;
    Card card = new Card(0, 0, cardID, heroes[i], false, cardColor, "none");
    alleKort.add(card);
  };
  
  cardColor = "Rød";
  for(int i = 0; i < heroes.length; i++) {
    int cardID = (i + 1) * 13;
    Card card = new Card(0, 0, cardID, heroes[i], false, cardColor, "none");
    alleKort.add(card);
  };
  
  Card sorteperCard = new Card(0, 0, 666, sorteper, true, "Black", "none");
  alleKort.add(sorteperCard);
}
