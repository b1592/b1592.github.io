---
layout: post
title: Overzicht les 1
excerpt: "Hoi iedereen,

Bedankt voor de interesse gisteren! Wij kijken uit naar volgende week. Hier een overzicht van de eerste les:"
identifier: "overzicht-les-1"
scrollspy: true
---

Hoi iedereen,

Bedankt voor de interesse gisteren! Wij kijken uit naar volgende week. Hier een overzicht van de eerste les:<!-- more -->

## Voor thuis
* [Installeer](/installatie/) Ruby en Sublime Text.
* Probeer de eerste paar bladzijden van de [command line crash course](http://cli.learncodethehardway.org/book/). In plaats van `cmd` werkt dit boek met `powershell`, maar de verschillen zijn heel klein. Bovendien hebben de computers op het Felisenum ook `powershell` (zoals Daan terecht opmerkte.)
* [Ruby Warrior](https://www.bloc.io/ruby-warrior/#/)! Wie komt er langs level 4? Zie onder voor een korte uitleg. De eerste die de code voor level 4 naar ons mailt krijgt een verrassing&hellip;

## Extra informatie

### While loop (voor de extra opdracht)
Je hebt een programma dat "Hoi meneer!" of "Hoi mevrouw" en de juiste naam zegt. Hoe kun je er voor zorgen dat het programma doorgaat tot de gebruiker het _eindelijk_ goed heeft ingevoerd? Met een [while loop](/hoofdstuk2/#whileloop)!

Net als bij een [`if-statement`](/hoofdstuk1/#het_statement), checkt een while loop een [logische uitspraak](/hoofdstuk2/#logische_uitspraken). Welke logische uitspraak moeten we in dit geval checken? Wij hadden zoiets bedacht:

{% highlight ruby %}
correct = false
while correct == false do
    # De code
end
{% endhighlight %}

Ergens in de while loop zul je dan `correct = true` moeten zetten, zodat `correct == false` niet meer waar is. Dan stopt de while loop.

### Wat is `gets.chomp`?
Er staat in je programma `naam = gets`. Jij typt `Jan` in. Staat er in `naam` dan de waarde `"Jan"`? Nee! De enter, die je hebt ingetoetst om de input te beëindigen, is ook opgeslagen. `naam` heeft de waarde `"Jan\n"`. `"\n"` is een speciaal karakter dat een _newline_ (nieuwe regel) aangeeft --- een enter dus.

Met `chomp` haal je de newline aan het eind van een string weg. Lees [hier](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-chomp) de officiële uitleg.

### Wat doet `"Hallo, #{naam}"`?
Hiermee zet je de waarde van `naam` op de juiste plek in de string. Je kunt daarna weer verder typen: `"Wat is #{naam} een mooie naam!"`.

Dit is niet de enige manier om strings aan elkaar te maken. Met `+` lukt het ook:

{% highlight ruby %}
naam = "Jan"
puts "Wat is " + naam + " een mooie naam!"
# => Wat is Jan een mooie naam!
{% endhighlight %}

Maar de eerste methode is in dit geval handiger.

### || (OF) en && (EN)
Als je wilt checken of `geslacht` de waarde `"vrouw"` of de waarde `"meisje"` bevat, moet je de OF-operator gebruiken. Dat gaat zo:

{% highlight ruby %}
if geslacht == "vrouw" || geslacht == "meisje"
    puts "Hallo mevrouw #{naam}!"
end
{% endhighlight %}

Wat nou als je wilt kijken of de leeftijd groter is dan `10`, maar kleiner dan `20`? Dan gebruik je de EN-operator:

{% highlight ruby %}
if leeftijd > 10 && leeftijd < 20
    puts "Een tiener."
end
{% endhighlight %}

### `!=` (niet gelijk aan)
Met `!=` eis je dat twee dingen _niet_ gelijk aan elkaar zijn.
{% highlight ruby %}
5 != 10             # => true
"Piet" != "Jan"     # => true
"Jan" != "Jan"      # => false
{% endhighlight %}

### Error messages
Ruby klaagt luidkeels als je een typfout maakt. All hope is not lost. Wat gebeurt hier?

{% highlight ruby %}
# test.rb
correct == false
{% endhighlight %}

Je bedoelde `correct = false`, maar je gebruikte `==`. Je vraagt Ruby de waarde van `correct` te checken, terwijl `correct` nog niet bestaat! Je krijgt nu:

    test.rb:2:in `<main>': undefined local variable or method `correct'
    for main:Object (NameError)

Wat staat hier in godsnaam?
* `test.rb:2`: Ruby zegt dat het in regel 2 van bestand `test.rb` is fout is gegaan. Het is een goed idee om daar een kijkje te nemen!
* `undefined local variable or method 'correct'`: Ruby zegt dat `correct` niet gedefinieerd is.

Genoeg informatie om je fout snel te herstellen. Nog een voorbeeld:

{% highlight ruby %}
correct = false
while correct == false do
    puts "Ben je een jongen, of een meisje?"
    geslacht = gets.chomp
    if geslacht == "jongen"
        puts "Hallo, meneer"
        correct = true
    elsif geslacht == "meisje"
        puts "Hallo, mevrouw"
        correct = true
    else
        puts "Ik begrijp het niet, probeer het nog eens."
end
{% endhighlight %}

Nu is de foutboodschap:

    test.rb:13: syntax error, unexpected end-of-input, expecting keyword_end

Het regelnummer is 13 (de laatste regel). Daar heb je niet zoveel aan. Maar de boodschap is duidelijker: `unexpected end-of-input, expecting keyword_end`. We zijn een `end` vergeten! Zien jullie waar?

Elk apart codeblok moet je laten inspringen met Tab. Alles in de while loop hoort bij elkaar. Dit krijgt één Tab. Alles in de if-statements krijgt nóg een Tab. Nu is het makkelijk onthouden: elke Tab die je inspringt, moet je afsluiten met een `end`. We zijn hier twee Tabs ingesprongen, maar we hebben maar één `end`. Je ziet meteen dat het niet klopt.

### Ruby Warrior
Speel [hier](https://www.bloc.io/ruby-warrior/#/). Er gebeuren wat dingen die jullie nog niet snappen (aan het eind van de cursus wel.) De functie `play_turn` wordt steeds opnieuw uitgevoerd. Als je een functie gebruikt met een uitroepteken, zoals `warrior.walk!`, dan is de beurt voorbij en begin je vooraan `play_turn`. Dus je kunt maar één keer lopen, slaan of healen per beurt.

In het eerste level hoef je alleen maar vooruit te lopen:

{% highlight ruby %}
def play_turn(warrior)
    warrior.walk!
end
{% endhighlight %}

Links in beeld voor staan alle functies uitgelegd. Succes!










