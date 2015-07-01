---
layout: default_repl
title: Hoofdstuk 1
scrollspy: true
lesson: hoofdstuk1
---

#Hoofdstuk 1: hallo

We maken kennis met Ruby en Atom. We praten tegen de computer en laten de computer terugpraten.

## Introductie

Open de [command line](/ruby/command_line), navigeer naar de map `Programmeren` (met `cd`) en typ `atom .` (vergeet de punt niet.) De punt staat voor de huidige map. Hiermee open je alle mappen en bestanden in `Programmeren`. Je ziet in het navigatiemenu `Hoofdstuk1` staan, de map die je eerder had gemaakt.

Klik met de rechtermuisknop op `Hoofdstuk1` en klik op `New File`. Typ `Hoofdstuk1/hallo.rb`. Ruby-files eindigen op `.rb`. Typ nu:

{% highlight ruby %}

puts "Hallo"

{% endhighlight %}

Het commando `puts` (put String) zet een string op het scherm. Een string is een stuk tekst. Sla het bestand op. Ga terug naar de commandline en navigeer naar `Hoofdstuk1` met `cd Hoofdstuk1`. Typ nu `ruby hallo.rb`. Nu zie je:

{% highlight bash %}

Hallo

{% endhighlight %}

Je hebt net je eerste Ruby-programma gemaakt en uitgevoerd! Dat gaat dus zo: in Atom typ je Ruby-code, en in de command line voer je het programma uit met `ruby naam_van_programma.rb`.

### Interactive Ruby (irb)
Als je korte commando's wilt uitproberen, hoef je niet eerst een programma te maken en dat uit te voeren. Ruby heeft ook een interactieve modus, `irb`, die je vanaf de command line opent door `irb` te typen. Je ziet dan:

```
irb(main):001:0>
```

Nu kun je Ruby-commando's typen, en krijg je direct output.

```
irb(main):001:0> 1 + 1
```

Druk op enter en je ziet:

```
irb(main):001:0> 1 + 1
=> 2
irb(main):002:0>
```

Wij hebben `irb` altijd open staan in een apart tabblad van de command line. In totaal heb je dus Atom en een command line met twee tabbladen (waarvan één `irb`) geopend. Als je onderstaande uitleg doorleest, probeer dan zo veel mogelijk uit in `irb`.

## Informatie

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

en dan geeft Ruby `1` als output. (Uitproberen in `irb`!)

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

### Een enter afbijten met `chomp`
Er staat in je programma `naam = gets`. Jij typt `Jan` in. Staat er in `naam` dan de waarde `"Jan"`? Nee! De enter, die je hebt ingetoetst om de input te beëindigen, is ook opgeslagen. `naam` heeft de waarde `"Jan\n"`. `"\n"` is een speciaal karakter dat een _newline_ (nieuwe regel) aangeeft --- een enter dus.

Met `chomp` haal je de newline aan het eind van een string weg.

{% highlight ruby %}

"Jan\n".chomp # => "Jan"

{% endhighlight %}

### Een variabele verwerken in een string: `"Hallo, #{naam}"`
Hiermee zet je de waarde van `naam` op de juiste plek in de string. Je kunt daarna weer verder typen: `"Wat is #{naam} een mooie naam!"`. Als `naam` de string `"Jan"` bevat, krijg je:

{% highlight ruby %}
"Wat is Jan een mooie naam!"
{% endhighlight %}

##De opdracht

Je weet nu alles wat je nodig hebt om zelf aan de slag te gaan. Je eerste script gaat over het communiceren met de computer. Schrijf een programma dat de volgende dingen doet:

* Begroet de gebruiker
* Vraagt de naam van de gebruiker
* Verwerkt de naam in een antwoord en vraagt de gebruiker om `man` of `vrouw` in te typen
* Maakt een persoonlijke begroeting, waarin de gebruiker wordt begroet met "Meneer" of "Mevrouw" en dan de naam, allemaal bepaald door wat de gebruiker eerder heeft ingetypt

{% highlight bash %}

Wat is je naam?
Piet
Ben je een man of een vrouw?
man
Hallo, meneer Piet!

{% endhighlight %}

### (Extra) Oeps, foutje!
Wat doet je programma als je per ongeluk `vruow` in plaats van `vrouw` intypt? Probeer dit soort fouten op een mooie manier op te lossen. (Het is irritant om alles opnieuw in te vullen als je één typfout maakt. Probeer daar rekening mee te houden.) Lees hiervoor alvast over de [while-loop](/ruby/hoofdstuk2#whileloop).

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
