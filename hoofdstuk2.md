---
layout: default_repl
title: Hoofdstuk 2
scrollspy: true
---

# Hoofdstuk 2: priemgetallen
In dit hoofdstuk gaan we bepalen of een getal priem is of niet. Een getal is priem als het alleen deelbaar is door 1 en door zichzelf. De eerste paar priemgetallen zijn:

    2, 3, 5, 7, 11, 13, 17, ...

Jullie gaan een _algoritme_ schrijven. Dat is een set instructies die tot een duidelijke conclusie leiden: is het gegeven getal een priemgetal, ja of nee?

## Bestanden

    Hoofdstuk2.url - deze beschrijving
    prime.rb - het script waar je in gaat werken
    prime_test.rb - de testjes 

## Informatie

### Booleans: waar of niet waar?
Ruby kent verschillende _datatypen_. `String` kennen jullie al. Gehele getallen zijn van het type `Integer`. Maar we hebben ook nog een ander datatype nodig: `Boolean`. Dit datatype heeft twee mogelijke waarden: `true` of `false`.

### Logische uitspraken
In bijna elk programma moeten er keuzes worden gemaakt: als dít waar is, doe dan dát. Deze _logische uitspraken_ leveren `true` of `false` op. Een paar voorbeelden (testen met `irb`!)

{% highlight ruby %}
8 > 5   # => true
6 < 6   # => false
6 <= 6  # => true

naam = "Piet"
naam == "Piet"  # => true
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
while counter < 10 do
    counter = counter + 1
end
puts counter
{% endhighlight %}

### Functies
Een functie is één van de belangrijkste wapens die een programmeur tot zijn beschikking heeft. Wat voorbeelden (test zoals altijd met `irb`.)

{% highlight ruby %}
# Een functie begint met def, en wordt niet direct uitgevoerd.
def f(x)
    return x + 1
end

f(4)    # => 5

def greet(naam)
    return "Hallo, #{naam}!"
end

greet("Bob")    # => "Hallo, Bob!"

# Meerdere variabelen.
def multiply(a, b)
    return a * b
end

multiply(5, 8)  # => 40
{% endhighlight %} 

Een functie geeft overzicht en scheelt behoorlijk wat typwerk. Stel dat je drie mensen wilt begroeten.

{% highlight ruby %}
greet("Anna")
greet("Bert")
greet("Chloe")
{% endhighlight %}

Als je nu de groet wilt veranderen, hoef je alleen maar de functiedefinitie aan te passen (`def ... end`). Dan worden Anna, Bert en Chloe meteen op de juiste manier begroet.

### Scope van variabelen

{% highlight ruby %}
def mijn_functie
    puts "Dit is mijn functie"
    naam = "Klaas"
end

puts naam
# => undefined local variable or method `naam'
{% endhighlight %}

Waarom is `naam` onbekend? Er staat toch `naam = "Klaas"` in `mijn_functie`?

Het antwoord is dat de variabele `naam` alleen bekend is in de functie `mijn_functie`. Daarbuiten bestaat `naam` niet. Je zegt ook wel: `naam` is bekend in de _scope_   van `mijn_functie`. De scope bepaalt vanaf welke plek een variabele bereikbaar is.

Dus wat gebeurt hier?

{% highlight ruby %}
naam = "Pieter"

def mijn_functie
    puts "Dit is mijn functie"
    naam = "Klaas"
    puts naam
end

puts naam
# => "Pieter"
mijn_functie
# => "Dit is mijn functie"
# => "Klaas"
puts naam
# => "Pieter"
{% endhighlight %}

Buiten de functie staat nu `naam = "Pieter"`. Dus `puts naam` geeft `"Pieter"` terug.

Maar binnen de functie, in de _lokale scope_, staat `naam = "Klaas"`. Dus het commando `puts naam` binnen `mijn_functie` geeft `"Klaas"`.

Wat gebeurt er als we `naam = "Klaas"` weghalen?

{% highlight ruby %}
naam = "Pieter"

def mijn_functie
    puts "Dit is mijn functie"
    puts naam
end

mijn_functie
# "Dit is mijn functie"
# => undefined local variable or method `naam'
{% endhighlight %}

`naam` is niet bekend! Variabelen die binnen functies worden gedefinieerd zijn onzichtbaar buiten de functie en _vice versa_!

Wees niet bang als je het bovenstaande niet begrijpt. Programmeer vrolijk door, tot je een keer `undefined local variable or method 'naam'` in de command line ziet staan, terwijl je zéker weet dat je `naam` gedefinieerd hebt. Lees dan dit stuk nog eens door. Programmeren ga je snappen door te doen.

## De opdracht
Jullie gaan een functie schrijven die `false` teruggeeft als het getal niet priem is, en `true` als het getal wel priem is. Dit is de bedoeling:

{% highlight ruby %}
def prime?(number)
    # Algoritme ...
end

prime?(8)   # => false
prime?(13)  # => true
prime?(104729)  # => true 
{% endhighlight %}

### Tests
We hebben een programma geschreven dat je functie aan een paar simpele tests onderwerpt. Dit programma voer je uit met:

    ruby prime_test.rb

Aan de slag!

### (Extra) Duizendste priemgetal
Je hebt de functie `prime?` geschreven. Kun je het duizendste priemgetal vinden? En het miljoenste? En het miljardste? Nu begint de snelheid van je algoritme een rol te spelen. Probeer je algoritme te optimaliseren. Check je niet onnodig veel getallen? Snelste algoritme van de klas krijgt een verrassing!

### (Extra) Zeef van Eratosthenes
Wat dacht je van alle priemgetallen onder de duizend? [Een oude Griek](http://nl.wikipedia.org/wiki/Zeef_van_Eratosthenes) heeft hier al over nagedacht.
