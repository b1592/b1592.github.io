---
layout: post
title: Overzicht les 4
scrollspy: true
---

Jullie zijn er weer hard tegenaan gegaan bij Hoofdstuk 4 en velen van jullie zijn goed op weg met de `Game`-klasse. We hebben hieronder even de belangrijkste punten uit de laatste les op een rijtje gezet.

Probeer weer alles uit in `irb`!

En denk er aan dat de volgende les op **vrijdag** is om 15.15 uur!

## Objecten

Het duurt even voordat je gewend raakt aan het programmeren met objecten, maar het is zeker de moeite waard en belangrijk om te leren. Zoals jullie hebben gezien maak je eerst een `class` aan, wat de blauwdruk is voor een object. Bijvoorbeeld:

{% highlight ruby %}
class Boek
    attr_accessor :title, :author, :content
    def initialize(title, author, content)
        @title = title
        @author = author
        @content = content
    end

    def words
        @content.split
    end
end
{% endhighlight %}

Belangrijk om te onthouden:

* de naam van je `class` begint met een Hoofdletter
* vergeet niet de `@` voor elke variabele
* met `attr_accessor :variabele1` zorg je dat je `@variabele1` van buitenaf kunt aanroepen
* de functie die `initialize` heet wordt automatisch uitgevoerd zodra je een object maakt
* alle functies schrijf je net als normaal met `def functienaam`

Nadat je een klasse hebt gedefinieerd, kun je een object maken. Dit doe je zo:

{% highlight ruby %}
boek = Boek.new("Lord of the Rings", "J. R. R. Tolkien", "Three Rings for the Elven-kings ...")
{% endhighlight %}

De waarden die je meegeeft aan `Boek.new()` komen terecht bij de `initialize` functie. Let dus goed op dat je deze in dezelfde volgorde zet.

Hierna kun je bij de variabelen en functies van het object:

{% highlight ruby %}
boek.author # => "J. R. R. Tolkien"
boek.words # => ["Three", "Rings", "for", "the", "Elven-kings", "..."]
boek.title = "The Lord of the Rings" # => "The Lord of the Rings"
boek.title # => "The Lord of the Rings"
{% endhighlight %}

Zoals je ziet in de laatste twee regels kun je variabelen van object ook aanpassen, net zoals andere variabelen.

## 2D arrays

Voor een spelbord als in tic tac toe kan een 2D array goed van pas komen. Dit is een lijst die eigenlijk hetzelfde werkt als een gewone (1D) lijst.

{% highlight ruby %}
bord = [[1,2,3], [4,5,6], [7,8,9]]
{% endhighlight %}

Als je hier goed naar kijkt, zie je dat het een lijst is met drie (!) elementen, die zelf ook lijsten zijn. Daarom krijg je dit:

{% highlight ruby %}
bord[0] # => [1,2,3]
{% endhighlight %}

Als je nu een vakje op het bord wilt vinden, zoek je eerst een van deze drie elementen (rijen) en dan daarin een element (kolommen).

{% highlight ruby %}
bord[0][1] # => 2
{% endhighlight %}

Controleer voor jezelf met `irb` of je het door hebt. Wat wordt bijvoorbeeld `bord[2][0]`?

## Bestanden in de opdracht (Tic tac toe)

Voor de opdracht hebben we voor jullie een aantal bestanden gemaakt. Voor de duidelijkheid leggen we nog even uit waar deze voor dienen.

Je werkt voornamelijk in het `game.rb` bestand. Hierin maak je de `game`-klasse. Deze klasse regelt de hele logica van het spel. Zo moet het een aantal functies bevatten (je kunt hier van afwijken in jouw implementatie):

* `over?` -> deze bekijkt of het spel voorbij is, doordat een speler gewonnen heeft of door gelijkspel. Geeft `true` of `false`
* `play(move)` -> deze roep je aan als je een zet wilt doen. Je geeft hem de `move` mee (een getal die de plek aangeeft waar je wilt zetten, 1-9) en hij regelt dat er op de juiste plek een 'X' of 'O' komt

Een ander bestand in de map is `narrator.rb`. De `narrator`-klasse gaat over het weergeven van dingen (`puts`). Zo hebben wij al een functie `draw_board(board)` gemaakt die je spelbord kan weergeven. Je werkt in de `game`-class met een bord als 2D array, maar je hebt de `narrator` nodig om het bord weer te geven.

Daarnaast zal de narrator alles gaan zeggen wat iemand die het spel gaat spelen nodig heeft.

Tot slot is er nog `tictactoe.rb`. Daarmee ga je het spel echt opstarten. Je maakt een spel aan(`game = Game.new`, net als in het voorbeeld met `Boek`) en je vraagt beurt na beurt om input van de speler. Tussendoor laat je de `narrator` het bord weergeven.

## Testen

Een makkelijke manier om snel je spel te testen is om het in te laden in `irb`. Dat doe je zo (zorg wel dat je `irb` opstart vanuit de map waarin je werkt:

{% highlight ruby %}
load "game.rb"
{% endhighlight %}

Daarna kun je de `game`-klasse gaan aanroepen en de functies testen:

{% highlight ruby %}
game = Game.new
game.current_player # => "X"
game.over? # => false
game.play(3)
game.current_player # => "O"
{% endhighlight %}

Het kan natuurlijk dat jouw klasse andere resultaten dan hierboven geeft, maar dit is hoe je het test. Vergeet niet nadat je iets verandert in je script het script op te slaan en opnieuw `load "game.rb"` in `irb` te doen.

Naast het laden in `irb` kun je natuurlijk ook je programma zelf draaien. Gebruik hiervoor `tictactoe.rb`. Net als in `irb` kun je daar een nieuw spel maken en dan je functies proberen.

## Voor thuis

Het zijn de laatste twee weken, maar dit is een iets langere opdracht dan anders. Ook is de volgende les op **vrijdag** (15.15 uur), waardoor je langer hebt tussen de twee lessen. Ga dus lekker thuis aan de slag. Schrijf je script functie voor functie. Ook al snap je misschien even niet meer wat er allemaal gebeurt, kun je de functie wel schrijven.

Kom je er niet uit? Mail dan vooral naar [ghkapteijns@gmail.com](mailto:ghkapteijns@gmail.com)

Succes en tot volgende week!