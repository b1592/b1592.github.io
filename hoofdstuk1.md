---
layout: default
title: Hoofdstuk 1
scrollspy: true
---

#Hoofdstuk 1: hallo

We maken kennis met Ruby en Sublime Text. We praten tegen de computer en laten de computer terugpraten.

## De bestanden

In de map Hoofdstuk 1 vind je de volgende bestanden:

    Hoofdstuk1.url - deze beschrijving
    hallo.rb - het script waar je in gaat werken

## Informatie

### `puts`

Open de map `Rubyprog` in Sublime Text. (`File -> Open Folder...`). Links zie je allerlei mappen (Hoofdstuk 1, Hoofdstuk 2, etc.) staan. Open nu het bestand `hallo.rb` in de map "Hoofdstuk 1". Daar staat:

{% highlight ruby %}

puts "Hallo"

{% endhighlight %}

Dit programma zag je in de [command line](/command_line) al in actie. Het commando `puts` (put string) zet een `String` op het scherm. Een string is een stuk tekst.

### `gets`

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

### `if`

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

### (Extra)
Wat doet je programma als je per ongeluk `jongne` in plaats van `jongen` intypt? Probeer dit soort fouten op een mooie manier op te lossen. (Is het irritant om alles opnieuw in te vullen als je één typfout maakt? Antwoord: ja.)