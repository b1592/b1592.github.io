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
    attr_accessor :content, :title, :author
    def initialize(content, title, author)
        @content = content
        @title = title
        @author = author
    end
end
{% endhighlight %}

Belangrijk om te onthouden:

* de naam van je `class` begint met een Hoofdletter
* vergeet niet de `@` voor elke variabele
* met `attr_accessor :variabele1` zorg je dat je @variabele1 van buitenaf kunt aanroepen
* 