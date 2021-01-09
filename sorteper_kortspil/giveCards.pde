boolean cardGiven = false;
ArrayList<Card> alleKort = new ArrayList<Card>();
ArrayList<Card> kortGivet = new ArrayList<Card>();

int givKort = 0;
int givSpillerKort = 0; // Index i alle spiller arrayen, altså den spiller vi vil give kort til
int checkKort = 0;

int kortIndex;
Card kort;

void giveCards() {
  while(givKort != alleKort.size()) {
    
    Player spiller = alleSpillere.get(givSpillerKort);
    
    kortIndex = int(random(0, alleKort.size()));
    kort = alleKort.get(kortIndex);
    
    if(kortGivet.size() != 0) {
      while(kort == kortGivet.get(checkKort)) {
        kortIndex = int(random(0, alleKort.size()));
        kort = alleKort.get(kortIndex);
        checkKort++;
      }
    }
    
    spiller.kort.add(kort);
    kortGivet.add(kort);

    givKort++; // Tæller hvor mange kort er blivet delt ud (25 maks)
    
    if(givSpillerKort == alleSpillere.size() - 1) {
      givSpillerKort = 0;
    } else {
      givSpillerKort++;
    }
  }
  
  cardGiven = true;
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
