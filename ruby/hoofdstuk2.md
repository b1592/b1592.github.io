---
layout: default
title: Hoofdstuk 2
scrollspy: true
---

# Hoofdstuk 2: priemgetallen
In dit hoofdstuk gaan we bepalen of een getal priem is of niet. Een getal is priem als het alleen deelbaar is door 1 en door zichzelf. De eerste paar priemgetallen zijn:

    2, 3, 5, 7, 11, 13, 17, ...

Jullie gaan een _algoritme_ schrijven. Dat is een set instructies die tot een duidelijke conclusie leiden: is het gegeven getal een priemgetal, ja of nee?

## Informatie

### Booleans: waar of niet waar?
Ruby kent verschillende _datatypen_. `String` kennen jullie al. Gehele getallen zijn van het type `Integer`. Maar we hebben ook nog een ander datatype nodig: `Boolean`. Dit datatype heeft twee mogelijke waarden: `true` of `false`.

### Logische uitspraken
In bijna elk programma moeten er keuzes worden gemaakt: als dít waar is, doe dan dát. Deze _logische uitspraken_ leveren `true` of `false` op. Een paar voorbeelden (testen met `irb`!)

{% highlight ruby %}
8 > 5   # => true
6 < 6   # => false
6 <= 6  # => true
8 >= 9  # => false

naam = "Piet"
naam == "Piet"  # => true
{% endhighlight %}

### Logische uitspraken combineren met EN (`&&`) en OF (`||`)
Als je wilt weten of de variabele `weekdag` de waarde `"zaterdag"` of `"zondag"` bevat, gebruik je de OF-operator.

{% highlight ruby %}
if weekdag == "zaterdag" || weekdag == "zondag"
  puts "Het is weekend."
end
{% endhighlight %}

En als je wilt kijken of de leeftijd groter of gelijk is aan `10`, maar kleiner dan `20`? Dan gebruik je de EN-operator:

{% highlight ruby %}
if leeftijd >= 10 && leeftijd < 20
    puts "Een tiener."
end
{% endhighlight %}

### De modulo-operator
Een belangrijke operator voor deze opdracht is `%`, de modulo-operator. Deze geeft de rest terug van deling van twee getallen.

{% highlight ruby %}
10 % 3  # => 1
17 % 7  # => 3
8 % 2   # => 0

# is 14 deelbaar door 3?
14 % 3 == 0 # => false
# is 12 deelbaar door 4?
12 % 4 == 0 # => true
{% endhighlight %}

### While-loop
Een if-statement is een eenmalige beslissing. Maar soms wil je met een opdracht doorgaan zolang als _(while)_ een bepaalde uitspraak waar is. Haal een ei uit de doos, zolang er nog eieren zijn. Wat komt hier uit?

{% highlight ruby %}
counter = 0
while counter < 10
    counter = counter + 1
end
puts counter
{% endhighlight %}

## De opdracht

Om een gevoel te krijgen voor de bovenstaande uitleg volgen hier twee korte opdrachten.

### Getallen deelbaar door 3 onder 100

Begin eens met het uitprinten van alle getallen kleiner dan 100 die deelbaar zijn door 3 (met uitprinten bedoelen we hier op het scherm zetten, met `puts`).

### Fizz Buzz

Een klassiek spelletje, dat je zowel als drankspelletje kunt tegenkomen als bij een sollicitatiegesprek voor Google, staat in het Engels bekend als 'Fizz Buzz'.

Het idee is dat er twee getallen worden gekozen, bijvoorbeeld 5 en 7. Vervolgens beginnen de spelers om de beurt te tellen, maar vervangen ze elk getal dat deelbaar is door 5 door 'Fizz', en elk getal deelbaar door 7 door 'Buzz'. Bij getallen die deelbaar zijn door 5 én 7 zeg je 'Fizz Buzz'.

Schrijf nu een script die alle getallen tot en met 100 uitprint, met 'Fizz', 'Buzz' en 'Fizz Buzz' op de juiste plaatsen, volgens de regels hierboven:

    1
    2
    3
    4
    Fizz
    6
    Buzz
    8
    ...

### Priemgetallen zoeken

Jullie gaan een script schrijven dat de gebruiker vraagt om een getal en vervolgens antwoord of dat getal een priemgetal is of niet. Bijvoorbeeld in deze vorm:

{% highlight ruby %}
getal = gets.to_i

# Code waarbij wordt gecheckt of 'getal' een priemgetal is ...

puts "#{getal} is een priemgetal."
# of
puts "#{getal} is geen priemgetal."

{% endhighlight %}

### (Extra) Duizendste priemgetal
Nu heb je een programma die kan bedenken of een getal een priemgetal is. Kun je nu ook het honderdste priemgetal vinden? Tip: stop de code van de vorige opdracht in een `while`-loop.

Maar kun je ook het duizendste priemgetal vinden? En het miljoenste? En het miljardste? Nu begint de snelheid van je algoritme een rol te spelen. Probeer je algoritme te optimaliseren. Check je niet onnodig veel getallen?

### (Extra) Zeef van Eratosthenes
Wat dacht je van alle priemgetallen onder de duizend? [Een oude Griek](http://nl.wikipedia.org/wiki/Zeef_van_Eratosthenes) heeft hier al over nagedacht. Tip: kijk ook bij [`Arrays`](/ruby/hoofdstuk3/#arrays)
