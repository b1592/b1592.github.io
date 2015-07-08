---
layout: default
title: Hoofdstuk 4
scrollspy: true
---

#HOOFDSTUK 4: TIC TAC TOE

In dit hoofdstuk ga je [boter, kaas en
eieren](http://en.wikipedia.org/wiki/Tic-tac-toe) of
[mastermind](http://nl.wikipedia.org/wiki/Mastermind) aan de computer uitleggen.

<p><iframe width="420" height="315" src="//www.youtube.com/embed/F7qOV8xonfY"
  frameborder="0" allowfullscreen="allowfullscreen">  </iframe></p>

##Bestanden

Download [tic_tac_toe.rb](/public/downloads/tic_tac_toe.rb).

## Informatie

### Objecten

Om de wereld zo begrijpelijk mogelijk te vatten in code, gebruiken veel programmeertalen objecten (`Objects`). Ook Ruby. In onderstaand voorbeeld willen we boeken modelleren:

{% highlight ruby %}
class Book
  def initialize(author, title, content)
    @author = author
    @title = title
    @content = content
  end
end
{% endhighlight %}

Een klasse (`Class`) is de blauwdruk van een object.

`initialize` is een speciale functie, die wordt uitgevoerd zodra er een object van klasse `Book` wordt aangemaakt. Je maakt een object door `new` aan te roepen:

{% highlight ruby %}
book1 = Book.new("Lord of the Rings", "J. R. R. Tolkien", "Three Rings for the Elven-kings ...")
book2 = Book.new("Titaantjes", "Nescio", "Jongens waren we - maar aardige jongens. Al zeg ik 't zelf ...")
{% endhighlight %}

Elk boek heeft dezelfde structuur, die wordt bepaald door de klasse `Book`. Het is een container van de variabelen `author`, `title` en `content`. Variabelen die bij een object horen --- _instance variables_ --- beginnen met een `@`.

Deze variabelen zijn afgeschermd van de code buiten de klasse:

{% highlight ruby %}
book1.title # => NoMethodError: undefined method `title'
{% endhighlight %}

Als je bepaalde variabelen beschikbaar wilt maken, doe je dat met `attr_accessor`:

{% highlight ruby %}
class Book
    attr_accessor :title, :author, :content

    def initialize(author, title, content)
        @author = author
        @title = title
        @content = content
    end
end
{% endhighlight %}

Nu kunnen we aan het boek vragen wat zijn titel is:

{% highlight ruby %}
book1.title # => "Lord of the Rings"
book1.author # => "J. R. R. Tolkien"
{% endhighlight %}

En we kunnen attributen veranderen:

{% highlight ruby %}
book2.title = "De uitvreter"
book2.content = "Behalve den man, die de Sarphatistraat ..."

book2.title # => "De uitvreter"
{% endhighlight %}

So far so good.

Stel dat we willen bijhouden waar we zijn gebleven met lezen. Bij elk nieuw boek dat we maken, zetten we de variable `@current_page` op 1. Dit gebeurt dus in `initialize`. We schrijven een functie `flip_page`:

{% highlight ruby %}
class Book
    attr_accessor :title, :author, :content, :current_page

    def initialize(author, title, content)
        @author = author
        @title = title
        @content = content
        @current_page = 1
    end

    def flip_page
        @current_page = @current_page + 1
    end
end
{% endhighlight %}

Niet vergeten `:current_page` toe te voegen aan `attr_accessor`. Nu kunnen we dit doen:

{% highlight ruby %}
book1.current_page # => 1
book1.flip_page
book1.current_page # => 2
{% endhighlight %}

Als we de woorden van een boek nodig hebben, dan definiëren we gewoon een functie `words`:

{% highlight ruby %}
class Book
    attr_accessor :title, :author, :content, :current_page

    def initialize(author, title, content)
        @author = author
        @title = title
        @content = content
        @current_page = 1
    end

    def flip_page
        @current_page = @current_page + 1
    end

    def words
        @content.split(" ")
    end
end
{% endhighlight %}

{% highlight ruby %}
book1.words # => ["Three", "rings", "for", ... ]
{% endhighlight %}

Wat is het voordeel van objecten? Zodra we de blauwdruk hebben gespecificeerd, kunnen we precies vragen aan het object wat we nodig hebben. Niets meer en niets minder. Dit geeft overzicht, en maakt software hergebruiken makkelijk.

Nu weten jullie wat hier gebeurt:

{% highlight ruby %}
getallen = [1, 2, 3, 4, 5]
getallen.max # => 5
{% endhighlight %}

`getallen` is een object, van de klasse `Array`! `max` is een functie die in deze klasse staat gedefinieerd. Stiekem is alles in Ruby een object:

{% highlight ruby %}
"Obama".reverse # => "amabO"
{% endhighlight %}

`"Obama"` is een object van klasse `String`, met een functie `reverse`.

Laat je niet overdonderen. Het kost de meeste mensen minstens een half jaar om aan _objectgeörienteerd_ programmeren gewend te raken.

### `require` en de standard library
Je hoeft het wiel niet opnieuw uit te vinden. Voorbeeld: je wilt een datum omrekenen naar een weekdag. Daar heeft Ruby al iets op bedacht. Je "leent" het bestand `date` uit de _standard library_. Daar staan alle files die standaard bij de Ruby-taal geleverd worden. Dat gaat zo:

{% highlight ruby %}
require "date"

date = Date.new(2014, 2, 3)
date.wday # => 2
date.tuesday? # => true
{% endhighlight %}

Nu kun je alle code uit `date` aanroepen, zonder te weten wat er precies in dat bestand staat. Op de [pagina van `date`](http://ruby-doc.org/stdlib-1.9.3/libdoc/date/rdoc/Date.html#method-i-wday) staat wat je er mee kunt doen. In Ruby hoef je bijna geen basisfunctionaliteit zelf te schrijven. Kijk dus eerst in de [documentatie](http://ruby-doc.org/core-1.9.3/), zodat je geen onnodig werk doet.

## Tic Tac Toe

Implementeer het spelletje boter kaas en eieren (zie hulpbestand).

<!-- ### De spelregels
Jullie zullen vooral aan de `Game`-klasse werken. Deze klasse bevat alle spellogica. We moeten aan een `Game`-object kunnen vragen wie er aan de beurt is, of het spel al over is, hoe het huidige bord eruit ziet, enzovoort. Bovendien moeten we een zet kunnen doen.

{% highlight ruby %}
game = Game.new
game.over? # => false
game.current_player # => "Player 1"
game.play(1)
game.current_player # => "Player 2"
{% endhighlight %}

Het leek ons handig om de plaatsen op het bord te nummeren zoals het NumPad. 7
is linksboven, 1 is linksonder, enz. `game.play(1)` betekent: de speler die aan
de beurt is speelt linksonder. Welke speler aan de beurt is, moet het
`Game`-object zelf bijhouden. -->

### (Extra) Tegen de computer
De ultieme uitdaging van deze cursus. Maak een klasse `ComputerPlayer` en zorg
dat je tegen de computer kunt spelen!
