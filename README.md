# GESTION DES DELIBERATIONS

Avans de commancer, voici un tutoriel pour utiliser [**git**](https://www.youtube.com/watch?v=HVsySz-h9r4) et [**github**](https://www.youtube.com/watch?v=hPfgekYUKgk): 

## Rappel sur les taches à faire
```
taches/
├── binome1 (Khalid et Boussif)
│   ├── La structure d'enseignement
│   ├── Les étudiants: inscription administrative
│   ├── Les étudiants: inscription en ligne
│   ├── Les étudiants: L'inscription pédagogique
│   └── L'etablissement et la filiere
├── binome2 (Yassine et Asmae)
│   ├──  Les utilisateurs (créaction, authentification et permissions): Les professeurs
│   ├── Les utilisateurs (création, authentification et permissions): Administrateur
│   └── Les utilisateurs (création, authentification et permissions): Le responsable de la filière
└── binome3 (Salah et Oussama)
    ├── Délibération annuelle
    ├── Délibération des modules de la session de rattrapage
    ├── Délibération des modules de la session ordinaire
    └── Délibération du semestre
```

## Proposistion des frameworks

je propose d'utiliser les frameworks suivants:
* ``` spring ``` pour les implémentations rapides et faciles des controlleurs
* ``` hibernate ``` pour la transformation automatique des information de la base de données en **POJO** *(Plain Old Java Object)*, et inversement
* ``` maven ``` pour l'importation rapide et automatique des librairies que nous allons utiliser
* ``` kwonnam jsp ``` pour l'heritage des pages jsp *sans réecrire du code de multitudes de fois* ...

## Ce qu'il faut avoir

* une version **Java** supérieur à la **version 10** _(11 ou plus)_
* maven

