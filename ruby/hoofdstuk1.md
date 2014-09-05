---
layout: default_repl
title: Hoofdstuk 1
scrollspy: true
lesson: hoofdstuk1
---

#Hoofdstuk 1: hallo

We maken kennis met Ruby en Sublime Text. We praten tegen de computer en laten de computer terugpraten.

## De bestanden

In de map Hoofdstuk 1 vind je de volgende bestanden:

    Hoofdstuk1.url - deze beschrijving
    hallo.rb - het script waar je in gaat werken

## Informatie

### Iets op het scherm zetten: `puts`

Open de map `Rubyprog` in Sublime Text. (`File -> Open Folder...`). Links zie je allerlei mappen (Hoofdstuk 1, Hoofdstuk 2, etc.) staan. Open nu het bestand `hallo.rb` in de map "Hoofdstuk 1". Daar staat:

{% highlight ruby %}

puts "Hallo"

{% endhighlight %}

Dit programma zag je in de [command line](/command_line) al in actie. Het commando `puts` (put string) zet een `String` op het scherm. Een string is een stuk tekst.

### Om input vragen: `gets`

Als je input van de gebruiker wilt hebben, gebruik je `gets` (get string):

{% highlight ruby %}

naam = gets

{% endhighlight %}

Wat gebeurt hier? `naam` is een *variabele*. Dat is een soort opslagplaats voor informatie. Als je zegt:

{% highlight ruby %}

geluksgetal = 1

{% endhighlight %}

dan sla je `1` op als `geluksgetal`. Later kun je typen:

{% highlight ruby %}

puts geluksgetal

{% endhighlight %}

en dan geeft Ruby `1` als output.

Maar terug naar `gets`. Dit is een commando dat de gebruiker om *input* vraagt: je kunt iets intypen. `naam = gets` vertelt de computer de input van de gebruiker op te slaan in `naam`.

### Het `if`-statement

Een programma is meer dan een rij commando's, die achter elkaar worden uitgevoerd. Een computer kan ook keuzes maken. Hier zijn aparte commando's voor nodig, en één van de krachtigste is `if`. Hiermee geef je aan dat de computer alleen iets moet uitvoeren onder een bepaalde voorwaarde en anders niet.

Neem bijvoorbeeld:

{% highlight ruby %}

if naam == "Jan"
    puts "De naam is Jan!"
end

{% endhighlight %}

Je kunt wel raden wat hier gebeurt: alleen als de variabele `naam` gelijk is aan "Jan", dan zegt de computer iets. Voor het vergelijken van twee waarden gebruik je `==`, een dubbel is-teken. Vergeet het `if`-statement niet af te sluiten met `end`.

Maar als de naam geen Jan is, hoe zeg je dan wat de computer moet doen? Hiervoor heb je `else`:

{% highlight ruby %}

if naam == "Jan"
    puts "De naam is Jan!"
else
    puts "De naam is niet Jan!"
end

{% endhighlight %}

En om het nog mooier te maken: je kunt ook vragen of `naam` misschien Piet is. Dit doe je met `elsif`:

{% highlight ruby %}

if naam == "Jan"
    puts "De naam is Jan!"
elsif naam == "Piet"
    puts "De naam is Piet!"
else
    puts "De naam is niet Jan of Piet!"
end

{% endhighlight %}

Je kunt er net zoveel `elsif`s achter zetten als je wilt.

##De opdracht

Je weet nu alles wat je nodig hebt om zelf aan de slag te gaan. Je eerste script gaat over het communiceren met de computer. Schrijf een programma dat de volgende dingen doet:

* Begroet de gebruiker
* Vraagt de naam van de gebruiker
* Verwerkt de naam in een antwoord en vraagt de gebruiker om `jongen` of `meisje`, of `man` of `vrouw` in te typen
* Maakt een persoonlijke begroeting, waarin de gebruiker wordt begroet met "Meneer" of "Mevrouw" en dan de naam, allemaal bepaald door wat de gebruiker eerder heeft ingetypt

{% highlight bash %}

Wat is je naam?
Piet
Ben je een jongen of een meisje?
jongen
Hallo, meneer Piet!

{% endhighlight %}

### (Extra) Oeps, foutje!
Wat doet je programma als je per ongeluk `jongne` in plaats van `jongen` intypt? Probeer dit soort fouten op een mooie manier op te lossen. (Het is irritant om alles opnieuw in te vullen als je één typfout maakt. Probeer daar rekening mee te houden.) Lees hiervoor alvast over de [while-loop](/ruby/hoofdstuk2#whileloop).

## Extra commando's

### Een enter afbijten met `chomp`
Er staat in je programma `naam = gets`. Jij typt `Jan` in. Staat er in `naam` dan de waarde `"Jan"`? Nee! De enter, die je hebt ingetoetst om de input te beëindigen, is ook opgeslagen. `naam` heeft de waarde `"Jan\n"`. `"\n"` is een speciaal karakter dat een _newline_ (nieuwe regel) aangeeft --- een enter dus.

Met `chomp` haal je de newline aan het eind van een string weg. Lees de [officiële uitleg van Ruby](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-chomp).

### Een variabele verwerken in een string: `"Hallo, #{naam}"`
Hiermee zet je de waarde van `naam` op de juiste plek in de string. Je kunt daarna weer verder typen: `"Wat is #{naam} een mooie naam!"`. Als `naam` de string `"Jan"` bevat, krijg je:

{% highlight ruby %}
"Wat is Jan een mooie naam!"
{% endhighlight %}

### Hint voor de extra opdracht
Je hebt een programma dat "Hoi meneer!" of "Hoi mevrouw" en de juiste naam zegt. Hoe kun je er voor zorgen dat het programma doorgaat tot de gebruiker het _eindelijk_ goed heeft ingevoerd? Met een [while loop](/hoofdstuk2/#whileloop)!

Net als bij een [`if-statement`](/hoofdstuk1/#het_statement), checkt een while loop een [logische uitspraak](/hoofdstuk2/#logische_uitspraken). Welke logische uitspraak moeten we in dit geval checken? Wij hadden zoiets bedacht:

{% highlight ruby %}
correct = false
while correct == false
    # De code
end
{% endhighlight %}

Ergens in de while loop zul je dan `correct = true` moeten zetten, zodat `correct == false` niet meer waar is. Dan stopt de while loop.
