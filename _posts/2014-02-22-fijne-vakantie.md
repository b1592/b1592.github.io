---
layout: post
title: Fijne vakantie!
---

*TL;DR: Ga hierheen: [Project Euler](https://projecteuler.net/problems).*

Fijne vakantie, jongens. We zien jullie pas 3 maart weer.

Wetenschappers zeggen dat een groene kleur creativiteit opwekt. Een rode kleur wat minder. [Echt waar](http://www.prevention.com/mind-body/emotional-health/looking-color-green-enhances-creativity). Dus hier is de nieuwe site! Wat vinden jullie ervan? Laat het vooral weten: [ghkapteijns@gmail.com](mailto:ghkapteijns@gmail.com).
<!-- more -->

## In de tussentijd

We geven toe dat de vorige les heel moeilijk was.

Het goede nieuws is: vanaf nu valt het mee. Eigenlijk valt alles mee, als je eenmaal algorithmisch kan denken.

Neem <a href="/hoofdstuk2/#functies" target="_blank">functies</a> nog eens door. Als je een functie `prime?` hebt:

{% highlight ruby %}
def prime?(getal)
    if getal % 2 == 0
        return false
    end

    deler = 3
    while deler * deler <= getal
        # Etc.
        # Niet vergeten deler op te hogen!
    end

    return true
end

{% endhighlight %}

Door het `def`-commando weet ruby dat het om een functie gaat. De code wordt pas uitgevoerd als je de functie aanroept:

{% highlight ruby %}
    puts prime?(8) # => false
    puts prime?(31) # => true
{% endhighlight %}

Als je dit doorhebt, weet je voorlopig genoeg.

## Project Euler
Als je dit soort puzzels leuk vindt, dan moet je eens naar [Project Euler](https://projecteuler.net/problems) kijken. Dit is een geweldige site om te leren programmeren. Je moet een wiskundig vraagstuk met de computer oplossen. Als je het goede antwoord invoert, kom je op een forum waar je kunt zien hoe anderen de oplossing hebben gevonden. (Eerst even een account aanmaken.)

<s>Drie middagen Project Euler staat gelijk aan een jaar middelbaar onderwijs.</s>

Project Euler is heel leerzaam.

## Command Line

Verder kun je nog een paar hoofdstukken van de [Command Line Crash Course](http://cli.learncodethehardway.org/book/) doen. En vergeet [Ruby Warrior](https://www.bloc.io/ruby-warrior/#/) niet.

Tot volgende keer!