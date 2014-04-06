---
layout: default
title: Hoofdstuk 1
scrollspy: true
---

# Hoofdstuk 1: HTML

Websites worden weergegeven in HTML (HyperText Markup Language).

## Setup

### Sinatra
[Sinatra](http://www.sinatrarb.com/) is Ruby-uitbreiding waarmee je interactieve websites kunt maken. Typ in de command line:

    gem install sinatra

Sinatra is een gem. Dat is code die je binnen je eigen programma kunt aanroepen. Als je een gem eenmaal geïnstalleerd hebt, kun je de code aanroepen met `require`. Net als bij de [standard library van Ruby](/ruby/hoofdstuk4/#_en_de_standard_library).

### Vormgeving
De volgende gems zijn samen een raamwerk om websites vorm te geven: 

    gem install sass
    gem install bourbon
    gem install neat
    gem install bitters

[Hier wat voorbeelden](http://thoughtbot.github.io/refills/).

### Mappenstructuur

We kunnen beginnen. Maak een map met als naam `blog` (of weet je een betere naam?) Alle verdere bestanden komen in deze map.
    
    mkdir blog
    cd blog

Maak in `blog` een map `views`. Hier komen de verschillende pagina's in te staan.

    mkdir views
    cd views

Je staat nu in `blog/views`. Hier maak je een map `scss`. Hier komt alle code die te maken heeft met vormgeving.

    mkdir scss
    cd scss

Nu ben je in `blog/views/scss`. Voer de volgende commando's uit:

    bourbon install
    neat install
    bitters install



