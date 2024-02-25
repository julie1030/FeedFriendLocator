# FeedFriendLocator

L'idée est de créer une application permettant à tout un chacun de `localiser les "frigos solidaires"` présents dans un rayon
autour d'un point ciblé sur la carte par l'utilisateur afin de pouvoir y déposer de bonnes choses à manger ou à boire.
L'objectif est de faire un bon geste pour des personnes dans le besoin et également de lutter contre les gaspillages alimentaires.
> J'ai pensé initialement cet exercice comme un projet avec un objectif concret ayant du sens.
> Cependant pour respecter le délai j'ai préféré m'en tenir dans un premier aux consignes de base avec quelques améliorations. 


## :recycle: Contexte de développement: :recycle:

Pour préparer un entretien pour un stage dans une entreprise qui travaille avec Flutter j'ai reçu le défi suivant :

"Créer un projet `Flutter` à partir de zéro avec une carte Google sur la page principale en utilisant ce package.
Vous n'avez pas besoin d'une barre de navigation.
Utilisez une API gratuite et publique pour récupérer les pays.
Affichez un marqueur pour chaque ville que vous recherchez sur la carte.
Lorsque vous cliquez sur un marqueur, naviguez vers une nouvelle page et affichez des détails sur ce pays (API au choix).
Vous devriez pouvoir revenir à l'écran principal (Google Map).
Tout autre développement ou amélioration est un plus."

## :curly_loop: Retour aux consignes de base : phase 1 :curly_loop:
Création d'une `application Flutter` qui utilise `Google Maps` pour afficher une carte du monde avec des marqueurs pour chaque pays. 

Les pays sont récupérés à partir d'une API REST et peuvent être `sélectionnés à l'aide d'un menu déroulant`. 

Lorsqu'un pays est sélectionné, un marqueur est affiché sur la carte, et en cliquant sur ce marqueur, l'utilisateur est redirigé vers une page de détails du pays.

S'affichent alors le `drapeau`, le `nom` et les `coordonnées de latitude et de longitude` du pays. Il y a un ´bouton retour` pour revenir à la carte.

## Aperçu
![image](https://github.com/julie1030/FeedFriendLocator/assets/133639183/ab0cd4ba-c7a9-4baf-b539-99e3d26de026)
![image](https://github.com/julie1030/FeedFriendLocator/assets/133639183/0bbde687-0ba4-4827-98a5-28c0f4148448)
![image](https://github.com/julie1030/FeedFriendLocator/assets/133639183/47d25702-c62c-4280-b4ea-c52e1c89ffc7)
![image](https://github.com/julie1030/FeedFriendLocator/assets/133639183/83687a13-898e-4082-acbe-bd3ad6e94662)



phase 1 : Affichage de la carte centrée sur un point par défaut + marqueur :
![image](https://github.com/julie1030/FeedFriendLocator/assets/133639183/0a99905a-d13d-494c-8299-00987712a349)

## :magic_wand: Améliorations :sparkles:
- Ajout d'un thème de couleur : `Jaune` et `Gris`
- Les bannières du haut et du bas de la carte sont personnalisées.
- La couleur du texte est changée en `gris foncé`
- Le menu déroulant ouvert a désormais un fond et le pays sur lequel l'utilisateur passe change avec une nuance différente.
- Un cadre vient contenir les informations sur la seconde page.
- Un fond de couleur est appliqué sur la seconde page.

## :loop: Améliorations futures pensées :loop:
Pour aller au bout de l'idée initiale : faire une simulation à l'échelle de Bruxelles : en ajoutant les frigos solidaires hardcodés car pas d'API gratuite dispo.
Source : https://www.bornin.brussels/categorie/frigo-solidaire/
![image](https://github.com/julie1030/FeedFriendLocator/assets/133639183/cd50fe82-9d86-4f46-96bc-f4b5f27f6211)
### :wheelchair: Accessibilité 
### Dark mode 
