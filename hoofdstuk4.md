---
layout: default
title: Hoofdstuk 4
scrollspy: true
---

#HOOFDSTUK 4: TIC TAC TOE EN MASTERMIND

In dit hoofdstuk ga je [boter, kaas en eieren](http://en.wikipedia.org/wiki/Tic-tac-toe) of [mastermind](http://nl.wikipedia.org/wiki/Mastermind) aan de computer uitleggen. 

Beide spellen zijn een grote uitdaging, maar wij denken dat boter, kaas en eieren iets lastiger is dan mastermind. Je mag zelf weten welke je gaat maken.

Lees eerst goed de informatie door, die is voor beide spellen belangrijk.

<p><iframe width="420" height="315" src="//www.youtube.com/embed/F7qOV8xonfY"
  frameborder="0" allowfullscreen="allowfullscreen">  </iframe></p>

##Bestanden

[Download hier de tictactoe bestanden](/public/downloads/Hoofdstuk4.zip)

In de map `Hoofdstuk4` vind je de volgende bestanden:

    Hoofdstuk4.url - deze beschrijving
    mastermind.rb
    game.rb

[Download hier de mastermind bestanden](/public/downloads/Mastermind.zip)
En in `Mastermind`:

    Hoofdstuk4.url
    tictactoe.rb
    game.rb
    narrator.rb

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

### Eigen bestanden aanroepen

Grote programma's worden vaak gesplitst in meerdere bestanden. Dit geeft overzicht. Als je code uit je eigen mappen wilt aanroepen, moet je `require_relative` gebruiken.

In de map `Hoofdstuk4B` staat `tictactoe.rb`. Dit bestand willen we uitvoeren om het spel te starten. Maar om het overzicht te bewaren, zetten we alle code van de klasse `Game` in `game.rb` en van klasse `Narrator` in `narrator.rb`. In `tictactoe.rb` zetten we vervolgens:

{% highlight ruby %}
require_relative "game"
require_relative "narrator"

game = Game.new
narrator = Narrator.new
{% endhighlight %}

Zoals je ziet, kun je `.rb` weglaten uit de bestandsnaam. De hulpcode van Mastermind is op dezelfde manier gescheiden.

### 2D-array

Deze informatie is nuttig als je boter, kaas en eieren gaat maken.

Je hebt al kennis gemaakt met arrays. Nu gaan we een stapje verder: tweedimensionale arrays. Dit zijn arrays in arrays. Het spelbord is precies dat:

{% highlight ruby %}
[["X", "X", "O"], ["O", "O", "X"], [" ", " ", "O"]]
{% endhighlight %}

Je ziet dat er één grote array is met daarin drie kleine arrays. Deze kleine arrays vormen de rijen van het bord:

     X | X | O 
    ---|---|---
     O | O | X 
    ---|---|---
       |   | O 

Probeer zelf een paar van dit soort arrays te maken in `irb`, zodat je echt begrijpt hoe ze werken.

## Tic Tac Toe
### De spelregels
Jullie zullen vooral aan de `Game`-klasse werken. Deze klasse bevat alle spellogica. We moeten aan een `Game`-object kunnen vragen wie er aan de beurt is, of het spel al over is, hoe het huidige bord eruit ziet, enzovoort. Bovendien moeten we een zet kunnen doen.

{% highlight ruby %}
game = Game.new
game.over? # => false
game.current_player # => "Player 1"
game.play(1)
game.current_player # => "Player 2"
{% endhighlight %}

Het leek ons handig om de plaatsen op het bord te nummeren zoals het NumPad. 7 is linksboven, 1 is linksonder, enz. `game.play(1)` betekent: de speler die aan de beurt is speelt linksonder. Welke speler aan de beurt is, moet het `Game`-object zelf bijhouden.

### Het bord tekenen

Kijk eens naar de `Narrator`-klasse, in `narrator.rb`. Dit kun je ermee:

{% highlight ruby %}
narrator = Narrator.new

board = [[" ", "X", " "], 
        ["O", "X", " "], 
        [" ", " ", "O"]]
narrator.draw_board(board)
{% endhighlight %}

Kijk maar wat je dan krijgt!

De lege functie `intro` mogen jullie gebruiken, maar het hoeft niet. Het is maar een ideetje. Je kunt er handig gebruik van maken in het hoofdbestand `tictactoe.rb`:

{% highlight ruby %}
narrator = Narrator.new
narrator.intro 
{% endhighlight %} 

In `narrator.rb` kun je `intro` programmeren zoals je wilt. Misschien wil je de spelers begroeten, of de regels uitleggen. Het gaat erom dat het hoofdbestand `tictactoe.rb` overzichtelijk blijft: het scheelt enorm als je alleen een instructie hoeft te geven aan het `Narrator`-object. `narrator.intro` is een stuk duidelijker dan meerdere regels met `puts`- commando's.

### (Extra) Tegen de computer
De ultieme uitdaging van deze cursus. Maak een klasse `ComputerPlayer` en zorg dat je tegen de computer kunt spelen!

## Mastermind

### De spelregels
Alle spellogica staat in de `Game`-klasse. Wat moeten we allemaal aan een spelobject kunnen vragen? Hoe vaak de speler nog mag raden, wat de score van de laatste gok was, of het spel al voorbij is, enzovoorts. Stel je zoiets voor:

{% highlight ruby %}
# game.rb

# De geheime code is 1234
game = Game.new("1234")
game.guesses_left # => 10
game.guess("1241")
# voor elk getal op de juiste plaats krijg je een plusje,
# voor elk getal op de verkeerde plek een minnetje.   
game.score # => ++-
game.over? # => false
game.guesses_left # => 9
{% endhighlight %}

Dit is slechts een voorbeeld, het gaat erom dat je de spellogica "verstopt" in een object, zodat je de relevante informatie op een overzichtelijke manier kunt opvragen. De details laten we aan jullie over.

In `mastermind.rb` hoef je je geen zorgen meer te maken over de spellogica. Een voorbeeldje:

{% highlight ruby %}
# mastermind.rb

require_relative "game"

game = Game.new("1234")
puts "Welkom bij Mastermind, raad de code van vier cijfers."

while game.over? == false
    # vraag speler om code en geef score
end
{% endhighlight %}

## Pen en papier
Het is verleidelijk om meteen te gaan typen. Maar begin eens met pen en papier. Hoe verloopt een speelbeurt? Wanneer is het spel afgelopen? Schroom niet om functies toe te voegen aan `Game` of (in het geval van Tic Tac Toe) `Narrator`.

