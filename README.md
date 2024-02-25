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

## :curly_loop: Phase 1 : Retour aux consignes de base.:curly_loop:
Création d'une `application Flutter` qui utilise `Google Maps` pour afficher une carte du monde avec des marqueurs pour chaque pays. 

Les pays sont récupérés à partir d'une API REST et peuvent être `sélectionnés à l'aide d'un menu déroulant`. 

Lorsqu'un pays est sélectionné, un marqueur est affiché sur la carte, et en cliquant sur ce marqueur, l'utilisateur est redirigé vers une page de détails du pays.

S'affichent alors le `drapeau`, le `nom` et les `coordonnées de latitude et de longitude` du pays. Il y a un ´bouton retour` pour revenir à la carte.

## :mag_right: Aperçu de l'appli avant les améliorations
![image](https://github.com/julie1030/FeedFriendLocator/assets/133639183/ab0cd4ba-c7a9-4baf-b539-99e3d26de026)
![image](https://github.com/julie1030/FeedFriendLocator/assets/133639183/0bbde687-0ba4-4827-98a5-28c0f4148448)
![image](https://github.com/julie1030/FeedFriendLocator/assets/133639183/47d25702-c62c-4280-b4ea-c52e1c89ffc7)
![image](https://github.com/julie1030/FeedFriendLocator/assets/133639183/83687a13-898e-4082-acbe-bd3ad6e94662)

Affichage de la carte centrée sur un point par défaut + marqueur :
![image](https://github.com/julie1030/FeedFriendLocator/assets/133639183/0a99905a-d13d-494c-8299-00987712a349)

## :magic_wand: Phase 2 : Améliorations :sparkles:
- Ajout d'un thème de couleur : `Jaune` et `Gris`
- Un cadre avec un fond coloré vient contenir les informations sur la seconde page.

## :mag_right: Apperçu de l'appli avant remise de l'exercice:
![image](https://github.com/julie1030/FeedFriendLocator/assets/133639183/52aa443d-a367-42ba-a670-d60c4aa91027)
![image](https://github.com/julie1030/FeedFriendLocator/assets/133639183/47e73d17-36d6-462d-b072-db091c1b5e93)
![image](https://github.com/julie1030/FeedFriendLocator/assets/133639183/ef5927d4-82fe-4a9c-8f51-bd8e999aa5fc)

## Difficultés rencontrées :
- Cacher la clé API
  > J'ai travaillé pour une version web, n'ayant pas d'environnement ni Ios ni android, je dois trouver le moyen de cacher la clé avec un plugin. En attendant, elle se trouve dans le fichier index.HTML qui est lui-même mentionné dans le gitignore par sécurité.
- Comprendre la syntaxe pour passer correctement les infos au JSON
-  Les erreurs de syntaxe
-  Gérer les couleurs grace au système de thème de couleur
   
## :loop: Améliorations futures pensées :loop:
Pour aller au bout de l'idée initiale : faire une simulation à l'échelle de Bruxelles : en ajoutant les frigos solidaires hardcodés car pas d'API gratuite dispo.
Source : https://www.bornin.brussels/categorie/frigo-solidaire/
![image](https://github.com/julie1030/FeedFriendLocator/assets/133639183/cd50fe82-9d86-4f46-96bc-f4b5f27f6211)

### :wheelchair: Accessibilité 
- Grandes polices : Rendre les widgets de texte avec des tailles de police spécifiées par l'utilisateur
- Lecteurs d'écran : Communiquer un retour d'information oral sur le contenu de l'interface utilisateur
- Contraste suffisant : Rendre les widgets avec des couleurs suffisamment contrastées

### Dark mode 

## La récompense après des heures de galères pour fixer tous les bugs que j'ai créé :
![image](https://github.com/julie1030/FeedFriendLocator/assets/133639183/91a6d825-5365-4789-9e68-86d58a4f6554)
