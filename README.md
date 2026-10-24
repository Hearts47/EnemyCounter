# EnemyCounter

Un addon pour **Azeroth Survivors** qui affiche le nombre d'ennemis en vie sur la carte, dans un petit cadre à l'écran.

> Projet de fan, non officiel. Il n'est affilié ni à Blizzard Entertainment ni aux créateurs d'Azeroth Survivors.

## Ce qu'il fait

Un cadre affiche en direct `Ennemis : X`. Le chiffre vient directement du jeu (champ `en` de la table `AZS_RUN`), pas d'une estimation faite à partir des barres de nom.

- Cadre déplaçable au clic gauche (la position est sauvegardée).
- Mis à jour 5 fois par seconde.
- En dehors d'une partie, il affiche `Ennemis : -`.

## Installation

1. Télécharge le dossier `EnemyCounter` de ce dépôt (ou la dernière *release*).
2. Dans le jeu, ouvre **Options → AddOns → Ouvrir le dossier AddOns**.
3. Place le dossier `EnemyCounter` dedans (le dossier doit s'appeler exactement `EnemyCounter`).
4. Relance le jeu, puis vérifie que l'addon est coché dans la liste des AddOns.

Le jeu charge les addons écrits pour l'API de WoW 1.12.

## Limites connues

- Le jeu semble plafonner le nombre d'ennemis simultanés (autour de 50, à confirmer). Le compteur affiche la valeur fournie par le jeu, il ne la limite pas lui-même.
- Rien ne s'affiche tant qu'aucune partie n'est lancée : les addons ne tournent pas dans le menu principal.

## Licence

[MIT](LICENSE)
