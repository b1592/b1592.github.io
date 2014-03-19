---
layout: post
title: Overzicht les 4
scrollspy: true
---

Jullie hebben je goed ingezet bij Hoofdstuk 4 en veel van jullie zijn goed op weg met de `Game`-klasse. We hebben hieronder even de belangrijkste punten uit de laatste les op een rijtje gezet.

Probeer weer alles uit in `irb`!

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

Nadat je een `class` hebt gedefinieerd, kun je een object maken. Dit doe je zo:

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