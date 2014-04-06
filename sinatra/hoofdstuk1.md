---
layout: default
title: Hoofdstuk 1
scrollspy: true
---

# Hoofdstuk 1: Je eigen site

Je gaat je eigen site maken! Je leert wat `HTML` en `CSS` zijn, en hoe je je website kunt besturen met Sinatra. 

## Setup

### Sinatra
[Sinatra](http://www.sinatrarb.com/) is Ruby-uitbreiding waarmee je interactieve websites kunt maken. Typ in de command line:

    gem install sinatra

Sinatra is een gem. Dat is code die je binnen je eigen programma kunt aanroepen. Als je een gem eenmaal geïnstalleerd hebt, kun je de code aanroepen met `require`. Net als bij de [standard library van Ruby](/ruby/hoofdstuk4/#_en_de_standard_library).

[Shotgun](https://github.com/rtomayko/shotgun) zorgt ervoor dat veranderingen in bestanden meteen worden verwerkt in de website. Typ dit in:

    gem install shotgun

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

Maak in `blog` een map `views`. Hier komen de verschillende pagina's in te staan (de views).

    mkdir views
    cd views

Je staat nu in `blog/views`. Hier maak je een map `scss`. Hier komt alle code die te maken heeft met vormgeving. 

    mkdir scss
    cd scss

Nu ben je in `blog/views/scss`. Voer de volgende commando's uit:

    bourbon install
    neat install
    bitters install

Nu zijn er mappen `bourbon`, `neat` en `bitters` gemaakt die standaardvormgeving bevatten. Als laatste: download het bestand [normalize.scss](/public/downloads/normalize.scss) en zet het in de map `scss`. normalize.scss reset veel waarden, zodat je site er op alle browsers hetzelfde uitziet. De mappenstructuur is zo:

![Mappenstructuur](/public/images/mappenstructuur.png)

Ga terug naar de hoofdmap met `cd ../..`.

## Eerste app

Maak in de hoofdmap een bestand `application.rb` (met Sublime Text). Hier komt de code die de website bestuurt. Typ dit in:

{% highlight ruby %}
require "sinatra"

get "/" do
  "Hello world!"
end
{% endhighlight %}

Typ nu in de command line:

    shotgun application.rb

Je ziet onder andere:
    
    INFO  WEBrick::HTTPServer#start: pid=4517 port=9393

Start een webbrowser en ga naar:

    localhost:9393

Je ziet:

    Hello world!

Je hebt je eerste app gemaakt! Maar wat is hier in godsnaam gebeurd?

### GET requests
Als je een pagina opvraagt &mdash; bijvoorbeeld [www.google.com](http://google.com) &mdash; doe je een GET request. Je vraagt aan de server van Google of je de hoofdpagina mag zien. Een *server* is een (hele grote) computer die zit te wachten tot iemand een pagina opvraagt. Als er een verzoek binnenkomt, stuurt de server je alle informatie van de pagina. De browser laat de pagina vervolgens zien.

Je hebt zelf een server opgestart met `shotgun application.rb`. De server staat niet in Amerika (zoals bij Google), maar op je eigen computer. De server luistert op poort 9393 van je computer (`localhost`). 

Hoe weet de server welke informatie hij moet opsturen? Daar is Sinatra voor:

{% highlight ruby %}
get "/" do
  "Hello world!"
end
{% endhighlight %}

Nu weet de server dat hij bij een `GET` request voor de pagina `/` (de hoofdpagina, oftewel `localhost:9393/`) de string `"Hello world!"` moet terugsturen.