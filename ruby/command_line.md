---
layout: default
title: Windows Command Line
scrollspy: true
---

# Command Line
Op de command line kun je rechtstreeks tegen de computer praten. Veel van de commando's (zoals een nieuwe map maken) kun je ook met de muis doen, maar je zult zien dat je op de command line sneller kunt werken.

- **Windows**: Klik op start, typ dan `powershell` en druk op Enter. Je ziet een zwart scherm. Hier kun je de computer commando's geven. Powershell is geïntegreerd in Windows.
- **Mac / Linux**: Open het programma Terminal.

## cd (change directory)
Eerst moet je snappen hoe je door bestandsmappen kunt wandelen, zoals je dat normaal met de muis zou doen. Op je scherm staat iets als dit:

    C:/> (Windows)
    ~ Naam$ (Mac/Linux)

Je kunt zien in welke map je je precies bevindt met het commando `pwd`. Laten we nu een map maken voor de cursus: dit doe je met `mkdir`:

    mkdir Programmeren

Vervolgens kun je naar deze nieuwe map toe gaan met `cd` ('change directory'):

    cd Programmeren

Let hierbij op dat mappen op de meeste systemen hoofdlettergevoelig zijn. Nu zie je iets staan als:

    C:/Programmeren> (Windows)
    Programmeren Naam$ (Mac/Linux)

Je staat nu in de map Programmeren. Maak nu een map aan voor het eerste hoofdstuk:

    mkdir Hoofdstuk1

Let op dat je geen spaties kunt gebruiken in de naam van de map, daar moet je iets extra's voor doen. We raden je aan geen spaties te gebruiken; dit is handig verderop in de cursus.

Je zet een stap terug met:

    cd ..

Nu sta je weer in de map waar je begon (je kunt het checken met `pwd`). Je kunt ook meerdere stappen tegelijk zetten:

    cd Rubyprog/Hoofdstuk1

Als je op tab drukt, wordt je invoer aangevuld. Probeer het maar eens. Met pijltje-omhoog en pijltje-omlaag kun je vorige commando's terughalen.

## ls
Met `ls` (voor list) kun je alle bestanden en mappen in de huidige map zien.
