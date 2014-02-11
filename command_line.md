---
layout: default
title: Windows Command Line
---

# Windows Command Line 

Klik op start, typ dan `cmd` en druk op Enter. Je ziet een zwart scherm. Hier kun je de computer commando's geven.

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

## dir
Met `dir` kun je alle bestanden en mappen in de huidige map zien.

## ruby
We voeren Ruby-programma's uit via de command line. Ga naar de map `Rubyprog/Hoofdstuk1` en typ `dir`. Je ziet `hallo.rb` staan.

Typ nu: `ruby hallo.rb`. Nu zie je:

    Hallo!

Met `ruby <programma>` vertel je de ruby-interpreter dat hij een programma uit moet voeren.

## irb
`irb` staat voor interactive Ruby. Typ maar eens `irb` in de command line. Je komt in een omgeving waar je Ruby-code kunt typen, die meteen geïnterpreteerd wordt. Heel handig als je wilt testen hoe bepaalde commando's werken. 