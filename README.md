# Sorteper kortspil

## Indholdsfortegnelse
1. Kort beskrivelse af projektet
2. Krav specifikationer
3. Design specifikationer
4. Teknisk beskrivelse + et par diagrammer
5. Klassediagram & flowchart

## 1.Kort beskrivelse af projektet
Dette projekt er del 2 af et kortspil forløb, hvor man i den første del skulle designe en kortspils App til en specifik målgruppe vha. KommIT A. I den anden del skal gruppen programmere stilladset af Appen vha. Programmering B

## 2.Krav specifikationer

Skal have de rigtige regler fra sorteper
- Spillet er bygget op af det originale-sorteper

##### Spillerantal
- 2 - 6 spillere

##### Spillere
- Navn
- Par
- Kort
- Ikon

##### Knapper som gør man kan navigere rundt
- Kort
- Navn
- ID
- Sorteper (boolean)
- billede

##### Uddeling af kort
- lav alle kort
- giv alle spillere kort (en efter en)

##### Pass-around
Spillet er offline, man skal sende tabletten / telefonen rundt mellem hinanden

### 3. Design specifikationer
Vores design skal være meget magen til Overwatch’s stil, dvs. baggrund, font m.m. Det vil bestå af et simplet stil billede fra overwatch som baggrund, og kortene vil være en blanding af selvlavede billeder og billeder klippet ud fra spillet. De udklippede billeder er placeholders, for de yderligere selvlavede billeder som ville blive lavet hvis spillet skal realiseres helt. I venstre hjørne af skærmen vil spillerens billede vises samt spillerens score, og imellem hver spillers tur kommer en besked der oplyser den næste spiller. Når spillet er ovre bliver taberen af spillet vist frem i midten af skærmen. Kortene i spillet har 2 forskellige farve blå og rød, og de er i stik af en rød og blå med samme figur.
Dette er et skærm billede af hvordan det kommer til at se ud, når spillet er i gang. Kasper, er den spiller som skal trække fra en af de andre nu. Altså det er hans tur.
De 3 ikoner i midten er de andre  spillere, Kasper kan vælge en af dem og efter kommer han til at kunne vælge selv hvilken en af de kort han vil trække.
(Dette er den endelige mål, men vi blev tidspresset og lavede at det bare er spilleren "til venstre" for en selv som man trækker fra).

![in game, spiller vælger hvem de skal trække fra](https://raw.githubusercontent.com/orc13a/Sorteper-kortspil/README-files/Kortspil1.png "Img1")

![Billede af in game menu](https://raw.githubusercontent.com/orc13a/Sorteper-kortspil/README-files/Kortspil2.png "img2")

Vi ser det samme som før, men nu har Kasper trykket på tandhjulet oppe i højre hjørne.

## 4.Teknisk beskrivelse + et par diagrammer
Vi har gjort sådan at kortene bliver displayet vha. en loop funktion 

## 5.Klasse-diagram & flowchart
Klasse-diagram

![Billede af klasse-diagram](https://raw.githubusercontent.com/orc13a/Sorteper-kortspil/README-files/V3-Klassediagram.PNG "img3") 

Flowchart

![Billede af Flowchart](https://raw.githubusercontent.com/orc13a/Sorteper-kortspil/README-files/Kortspil4.png "img4")

#### Lavet af 
Oliver C, Kasper, Gustav & Celia.<br>
2.i Kerm/It - H. C. Ørsted Gymnasiet Lyngby


