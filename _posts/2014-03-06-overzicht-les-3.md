---
layout: post
title: Overzicht les 3
scrollspy: true
---

Hier is wat informatie naar aanleiding van de vorige les. Probeer alles uit in `irb`.

## Het alfabet in een lijst

`("a".."z")` is een range. Hier kun je overheen "loopen" met een [for loop](/hoofdstuk3/#for_loops):

{% highlight ruby %}
for letter in ("a".."z")
    puts letter
end
{% endhighlight %}

Hoe maak je hier een lijst van? Met `to_a` *(to array)*.

{% highlight ruby %}
("a".."z").to_a
# => ["a", "b", "c", "d", ..., "z"]
{% endhighlight %}

Voor de versleuteling willen we een spatie toevoegen. Iets toevoegen aan een lijst kan eigenlijk maar op één manier: aan het eind. Dit doe je met `push`.

{% highlight ruby %}
alfabet.push(" ")
# => ["a", "b", ..., "z", " "]
{% endhighlight %}

Het "gepushte" element komt er aan het eind bij.

## De versleutelingshash

Een hash bevat verbindingen tussen twee waarden. In de hash staat welke letter in de versleuteling correspondeert met een letter in het oorspronkelijke bericht.

Met een shift van 3:

{% highlight ruby %}
versleuteling["a"]
# => "d"
{% endhighlight %}

Hoe voeg je verbindingen toe? Zo:

{% highlight ruby %}
versleuteling["b"] = "d"
{% endhighlight %}

### De hash vullen

Weet je nog hoe je elementen uit een lijst aan kan spreken?

{% highlight ruby %}
alfabet[0]
# => "a" 
{% endhighlight %}

De makkelijkste manier om de hash te vullen is door te loopen over de range `(0..26)`. Voor een gegeven shift:

{% highlight ruby %}
for index in (0..26)
    versleuteling( alfabet[index] ) = alfabet[index + shift]
end 
{% endhighlight %}

Zorg dat je deze code helemaal snapt!

Waar gaat het nu fout? Als we bij 26 zijn aangekomen, staat er dit:

{% highlight ruby %}
versleuteling( alfabet[26] ) = alfabet[26 + shift]
{% endhighlight %}

`alfabet[26]` is `" "`. Dat gaat goed. Maar `alfabet[26 + shift]` zit niet meer in de lijst. 26 is namelijk de laatste index. Je krijgt `nil` terug van Ruby.

Je lost dit op met de [modulo-operator](/hoofdstuk2/#de_modulooperator):

{% highlight ruby %}
for index in (0..26)
    versleuteling( alfabet[index] ) = alfabet[ (index + shift) % 26 ]
end 
{% endhighlight %}

Nu krijg je de goede hash. Niet vergeten `return versleuteling` aan het einde van je functie te zetten.

## Een bericht versleutelen
We willen elke letter uit het bericht vervangen door de corresponderende letter uit de versleuteling. Om alle letters uit een stuk tekst in een lijst te krijgen, kun je `split` gebruiken:

{% highlight ruby %}
"hallo".split("")
# => ["h", "a", "l", "l", "o"]
{% endhighlight %}

Nu moet je er met een for loop wel uitkomen.

## Een bestand laden in 'irb'
Je kunt een bestand laden in 'irb' met `load`

{% highlight ruby %}
load "cipher.rb"
{% endhighlight %}

Je moet hiervoor in dezelfde map zitten als `cipher.rb`. Anders moet je het pad veranderen. `load "Hoofdstuk3/cipher.rb"`, bijvoorbeeld. (Net als in de [command line](/command_line).)


