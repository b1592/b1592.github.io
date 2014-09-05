---
layout: default
title: Windows Command Line
scrollspy: true
---

# Command Line
Op de command line kun je rechtstreeks tegen de computer praten. Veel van de commando's (zoals een nieuwe map maken) kun je ook met de muis doen, maar je zult zien dat je op de command line sneller kunt werken.

- **Windows**: Klik op start, typ dan `powershell` en druk op Enter. Je ziet een zwart scherm. Hier kun je de computer commando's geven.
- **Mac / Linux**: Open het programma Terminal.

## cd (change directory)
Eerst moet je snappen hoe je door bestandsmappen kunt wandelen, zoals je dat normaal met de muis zou doen. Op je scherm staat iets als dit:

    C:/>

Dit betekent dat je je op de C-schijf bevindt. Typ nu:

    cd Programmeren

En je ziet staan:

    C:/Programmeren>

Je staat nu in de map Programmeren. Je zet een stap terug met:

    cd ..

Nu sta je weer in `C:/`. Je kunt ook meerdere stappen tegelijk zetten:

    cd Rubyprog/Hoofdstuk1

Als je op tab drukt, wordt je invoer aangevuld. Probeer het maar eens. Met pijltje-omhoog en pijltje-omlaag kun je vorige commando's terughalen.

## ls
Met `ls` (voor list) kun je alle bestanden en mappen in de huidige map zien.

## ruby
We voeren Ruby-programma's uit via de command line. Ga naar de map `Rubyprog/Hoofdstuk1` en typ `ls`. Je ziet `hallo.rb` staan.

Typ nu: `ruby hallo.rb`. Nu zie je:

    Hallo!

Met `ruby <programma>` vertel je de ruby-interpreter dat hij een programma uit moet voeren.

## irb
`irb` staat voor interactive Ruby. Typ maar eens `irb` in de command line. Je komt in een omgeving waar je Ruby-code kunt typen, die meteen geïnterpreteerd wordt. Heel handig als je wilt testen hoe bepaalde commando's werken.
