sqrt(325489)


Udfordringen er at finde positionen for input. 
Hvis vi har den. Så har vi svaret. næsten, men let.


570^2 - 325489

Når vi når til et kvadrat - og det sidste tal der
indsættes for at få kvadratet. Så er det kvadratet på et 
ulige tal. Og sidebredden er da lig dette ulige tal. 

Vi når kvadrater på to måder. Vi slutter i venstre øvre 
hjørne. kvadratet har en sidelængde

Når vi har lavet et kvadrat, kan det have lige eller ulige
sidelængder. 
Har det lige sidelængde, er værdien i øvre venstre hjørne 
kvadratet på sidelængden.

Har det ulige sidelængde, er værdien i nedre højre hjørne og
så kvadratet på sdielængden. Den er blot ulige. 

kvadratroden af input er 570. Så kvadratet nås ved
sidelængden 570 - værdien er 
570^2 = 324900
Og det er i øvre venstre hjørne

325489 - 324900 - 571

Derfor vil vi få et grid med 571 kolonner. 
Det er ikke kvadratisk. Men vil have værdier op til
570*571. Den vil være i nederste venstre hjørne.

Vi mangler så at placere:

325489 - 570*571
det er 19. Og værdien vil derfor være i række 571 kolonne 19.


værdien 1 vil være i 
række: 570/2 + 1 = 286
kolonne; 286


1:325489 |> matrix(ncol = 571, byrow = TRUE) |> view()
Når positionen af input er række 571 kolonne 19.
Så skal vi bevæge os:
  (286-19)+(571-286)

Er det noget der kan kodes i stedet?

  
  
part 2

Her bliver jeg nok nødt til at gro den.

