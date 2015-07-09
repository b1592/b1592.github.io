---
layout: default
title: Hoofdstuk 3
scrollspy: true
---

#Hoofdstuk 3: Cipher

Download [hier](/public/downloads/caesar_cipher.rb) een mogelijke oplossing.

Al duizenden jaren proberen mensen elkaar berichten te versturen die niet door anderen mogen worden gelezen.

Een van de oudste manieren zou door Julius Caesar zelf zijn gebruikt en is redelijk eenvoudig. Hij schoof elke letter in een bericht een vast aantal plaatsen door in het alfabet. Dus hij maakte bijvoorbeeld van een 'a' een 'd', van een 'b' een 'e' etc. Met deze methode gaan we in deze opdracht aan de slag. Zie ook: [Caesar Cipher op wikipedia](http://en.wikipedia.org/wiki/Caesar_cipher).

## Informatie

### Functies
Een functie is één van de belangrijkste wapens die een programmeur tot zijn beschikking heeft. Wat voorbeelden (test zoals altijd met `irb`):

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



### Arrays
Binnen Ruby zijn er eigenlijk maar twee manieren om een collectie van gegevens op te slaan in een variabele. Je zult zien dat je aan deze twee typen genoeg zult hebben.

Een `Array` is een geordende collectie.

{% highlight ruby %}
namen = ["Harrie", "Maria", "Evelien", "Piet"]
{% endhighlight %}

Je spreekt een voorwerp uit een array aan met de index. Het eerste voorwerp uit de array correspondeert met index `0`.

{% highlight ruby %}
namen[0]    # => "Harrie"
namen[2]    # => "Evelien"
{% endhighlight %}

-1 correspondeert met het laatste element uit de array.

{% highlight ruby %}
namen[-1]   # => "Piet"
{% endhighlight %}

Je kunt ook strings op deze manier aanspreken!

{% highlight ruby %}
naam = "Jan"
naam[0]     # => "J"
{% endhighlight %}

Met `push` voeg je elementen aan een array toe.

{% highlight ruby %}
getallen = [1, 2, 3]
getallen.push(4)  # => [1, 2, 3, 4]
{% endhighlight %}

Met de functie `index` vraag je de index van een element op.

{% highlight ruby %}
namen = ["Harrie", "Maria", "Evelien", "Piet"]
namen.index("Maria") # => 1
namen.index("Sjaak") # => nil
{% endhighlight %}

### Hashes
Een `Hash` lijkt op een array, maar je spreekt een waarde uit de collectie niet aan met een index, maar met een _key_. Een key kan van elk datatype zijn. De volgende hash verbindt landen met hun hoofdsteden:

{% highlight ruby %}
hoofdsteden = {
    "Nederland" => "Amsterdam",
    "Frankrijk" => "Parijs",
    "Slowakije" => "Bratislava"
    }

hoofdsteden["Nederland"]    # => "Amsterdam"
{% endhighlight %}

`"Nederland"` en `"Amsterdam"` worden samen een _key, value pair_ genoemd.

Je kunt altijd waarden aan een hash toevoegen:

{% highlight ruby %}
hoofdsteden["Duitsland"] = "Berlijn"
hoofdsteden["Duitsland"] # => "Berlijn"
{% endhighlight %}

### For Loops
Als je een opdracht een vast aantal keer uit moet voeren, gebruik je een for loop. Stel dat je elk element uit een array wilt aanspreken:

{% highlight ruby %}
for naam in namen
    puts "Hallo, #{naam}!"
end
# => "Hallo, Harrie!"
# => "Hallo, Maria!"
# => "Hallo, Evelien!"
# => "Hallo, Piet!"
{% endhighlight %}

Je kunt ook over een _range_ itereren. Experimenteer met de volgende loops in `irb`.

{% highlight ruby %}
for number in (0..100)
    puts number
end

for letter in ("a"..."z")
    puts letter
end
{% endhighlight %}

Wat is het verschil tussen `(0..10)` en `(0...10)`?

Met de functie `to_a` (to array) maak je van een range een array.

{% highlight ruby %}
(0..5).to_a # => [0, 1, 2, 3, 4, 5]
{% endhighlight %}

### File Input/Output
Stel dat je `bericht.txt` wilt inlezen. Dat gaat als volgt:

{% highlight ruby %}
contents = File.read('bericht.txt')
{% endhighlight %}

`contents` is nu een (hele lange) string.

Naar bestanden schrijven kan ook.

{% highlight ruby %}
file = File.open("test.txt", "w")
file.write("hallo!")
file.close
{% endhighlight %}

### Ruby Documentation
Nu jullie een aantal basisbegrippen hebben leren kennen, moeten jullie de documentatie van de ruby-taal leren lezen. Ook wij zoeken nog dagelijks dingen op.

* [http://www.ruby-doc.org/core-1.9.3/String.html](http://www.ruby-doc.org/core-1.9.3/String.html)
* [http://www.ruby-doc.org/core-1.9.3/Array.html](http://www.ruby-doc.org/core-1.9.3/Array.html)
* [http://www.ruby-doc.org/core-1.9.3/Hash.html](http://www.ruby-doc.org/core-1.9.3/Hash.html)

De volgende functies kunnen van pas komen:

* `String#split`
* `Array#join`

`String#split` betekent: de functie `split` die hoort bij `String`. Gebruik de bovenstaande documentatie (of gebruik google) om uit te vinden hoe je `split` en `join` gebruikt.

## De opdracht

### Opdrachten vooraf

Om te oefenen met loops, arrays en hashes, eerst wat kleine oefeningen.

- Maak een programma dat de getallen 1 tot 1000 uitprint.
- Maak een programma dat alle letters van het alfabet uitprint.
- Maak een array met alle letters van het alfabet. (Gebruik een for loop
  of de functie `to_a`.)
- Maak een programma dat om een woord vraagt en vervolgens de letters van dat woord één voor één uitprint. (Gebruik een for
  loop of de functie `split`)
- Maak een programma dat om een woord vraagt en dat woord omgekeerd uitprint.
- Maak een programma dat om een woord vraagt en de scrabbelwaarde van dat woord
  teruggeeft. Hiervoor gebruik je een hash `scrabbelwaardes` die letters
  verbindt met waardes.

### De functie `shift`

Begin nu met een functie `shift` die twee parameters binnen krijgt:

* `letter` -> de letter die je wilt vervangen
* `number_of_places` -> hoeveel plaatsen de letter moet worden opgeschoven in het alfabet

Deze functie versleutelt één letter tegelijk. Deze vorm zou het kunnen hebben:

{% highlight ruby %}

def shift(letter, number_of_places)
  # Code

  return shifted_letter
end

shift("c", 3)   # => "f"
shift("o", 5)   # => "t"

{% endhighlight %}

Let op dat je rekening moet houden met het einde van het alfabet: als je in Ruby een element uit een array vraagt met een index die buiten het bereik ligt, dan krijg je `nil` terug. De bedoeling is dat je functie na de 'z' weer van voren af aan begint. Dit zou je functie dus moeten kunnen:

{% highlight ruby %}

shift("z", 1)   # => "a"
shift("x", 6)   # => "d"

{% endhighlight %}

Tip: hier kan de [`modulo-operator`](/ruby/hoofdstuk2/#de_modulooperator) van hoofdstuk 2 van pas komen.

###De functie `encrypt`

Dit is de functie waar het allemaal om draait. Als je deze functie een bericht en een bepaalde `number_of_places` geeft, zou het de `shift`-functie moeten aanroepen en dan vervolgens het bericht *letter voor letter* (denk hierbij aan een `for`-loop) moeten coderen tot tekst waar je niks zinnigs meer in ziet.

###De functie `decrypt`

Als je iets codeert, wil je het natuurlijk ook weer terug kunnen vertalen. Hiervoor heb je deze functie nodig. We gaan er hier van uit dat je de 'sleutel' (`number_of_places`) weet. Denk goed na, je hoeft hiervoor niet veel nieuwe code te schrijven!

### (Extra) Hoofdletters, getallen en leestekens

Je programma kan nu allerlei stukken tekst, zo lang als je maar wilt,
versleutelen en weer decoderen. Maar hoofdletters, getallen en leestekens
coderen lukt nog niet. Verzin hier iets op.


### (Extra) Geheim bericht kraken
Nu gaan jullie een bericht ontcijferen! Hoe zou je dit doen?

Je kunt alle mogelijkheden langsgaan. Deze methode heet _brute force_. Of is er een slimmere manier?

Het bericht staat in het bestand `secret.txt`. Download het
[hier](/public/downloads/secret.txt).

## Extra informatie

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
