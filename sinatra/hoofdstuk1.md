---
layout: default
title: Hoofdstuk 1
scrollspy: true
---

# Hoofdstuk 1: Je eigen site

Je gaat je eigen site maken! Je leert wat HTML en CSS zijn, en hoe je je website kunt besturen met Sinatra. 

## Setup

### Sinatra
[Sinatra](http://www.sinatrarb.com/) is Ruby-uitbreiding waarmee je interactieve websites kunt maken. Typ in de command line:

    gem install sinatra

Sinatra is een gem. Dat is code die je binnen je eigen programma kunt aanroepen. Als je een gem eenmaal geïnstalleerd hebt, kun je de code aanroepen met `require`. Net als bij de [standard library van Ruby](/ruby/hoofdstuk4/#_en_de_standard_library).

[Shotgun](https://github.com/rtomayko/shotgun) zorgt ervoor dat veranderingen in bestanden meteen worden verwerkt in de website. Typ dit in:

    gem install shotgun

### Vormgeving
De volgende gems zijn samen een raamwerk om websites vorm te geven: 

    gem install sass
    gem install bourbon
    gem install neat
    gem install bitters

[Hier wat voorbeelden](http://thoughtbot.github.io/refills/).

### Mappenstructuur

We kunnen beginnen. Maak een map met als naam `blog` (of weet je een betere naam?) Alle verdere bestanden komen in deze map.
    
    mkdir blog
    cd blog

Maak in `blog` een map `views`. Hier komen de verschillende pagina's in te staan (de views).

    mkdir views
    cd views

Je staat nu in `blog/views`. Hier maak je een map `scss`. Hier komt alle code die te maken heeft met vormgeving. 

    mkdir scss
    cd scss

Nu ben je in `blog/views/scss`. Voer de volgende commando's uit:

    bourbon install
    neat install
    bitters install

Nu zijn er mappen `bourbon`, `neat` en `bitters` gemaakt die standaardvormgeving bevatten.

Download het bestand [normalize.scss](/public/downloads/normalize.scss) en zet het in de map `scss`. normalize.scss reset veel waarden, zodat je site er op alle browsers hetzelfde uitziet.

Je moet nog één ding doen. Open het bestand `_bitters.scss`, in de map `bitters`. Verander de bovenste twee regels:

{% highlight scss %}
// @import "neat-helpers"; // or "neat/neat-helpers" when not in Rails
// @import "grid-settings";
{% endhighlight %}

in het volgende: (Niet vergeten op te slaan!)

{% highlight scss %}
    @import "../neat/neat-helpers";
    @import "grid-settings";
{% endhighlight %}

De mappenstructuur moet er zo uitzien:

![Mappenstructuur](/public/images/mappenstructuur.png)

Ga terug naar de hoofdmap met `cd ../..`.

## Eerste app

Maak in de hoofdmap een bestand `application.rb` (met Sublime Text). Hier komt de code die de website bestuurt. Typ dit in:

{% highlight ruby %}
require "sinatra"

get "/" do
  "Hello world!"
end
{% endhighlight %}

Typ nu in de command line:

    shotgun application.rb

Je ziet onder andere:
    
    INFO  WEBrick::HTTPServer#start: pid=4517 port=9393

Start een webbrowser en ga naar:

    localhost:9393

Je ziet:

    Hello world!

Je hebt je eerste app gemaakt! Maar wat is hier in godsnaam gebeurd?

### GET requests
Als je een pagina opvraagt &mdash; bijvoorbeeld [www.google.com](http://google.com) &mdash; doe je een GET request. Je vraagt aan de server van Google of je de hoofdpagina mag zien. Een *server* is een (hele grote) computer die zit te wachten tot iemand een pagina opvraagt. Als er een verzoek binnenkomt, stuurt de server je alle informatie van de pagina. De browser laat de pagina vervolgens zien.

Je hebt zelf een server opgestart met `shotgun application.rb`. De server staat niet in Amerika (zoals bij Google), maar op je eigen computer. De server luistert op poort 9393 van je computer (`localhost`). 

Hoe weet de server welke informatie hij moet opsturen? Daar is Sinatra voor:

{% highlight ruby %}
get "/" do
  "Hello world!"
end
{% endhighlight %}

Nu weet de server dat hij bij een `GET` request voor de pagina `/` (de hoofdpagina, oftewel `localhost:9393/`) de string `"Hello world!"` moet terugsturen.

## HTML

Nu gaan we een echte pagina weergeven. Daarvoor gebruik je HTML. HTML vertelt de browser wat er op de pagina moet verschijnen. Waar moeten de kopjes? Waar moet de inhoud?

Wij gebruiken `erb`, dat is een uitbreiding op HTML. Je kunt stukjes Ruby toevoegen. `erb` staat voor Embedded Ruby.

### HTML-tags
HTML bestaat uit tags, die er zo uit zien: `<html>`, `<p>`, `<a>`. Je sluit ze zo af: `</html>`, `</p>`, `</a>`. Elke tag heeft een betekenis. Tussen `<html>` en `</html>` komen alle andere tags. `<p>` staat voor paragraaf en `<a>`staat voor een link.

Je begint altijd met een `<html>`-tag:

{% highlight html %}

<html>
<head>
  <title>Home</title>
</head>

<body>
</body>
</html>

{% endhighlight %}

Wat gebeurt hier allemaal? Je ziet een aantal tags staan:  

* `<html>` -> hier begint de pagina mee. Alles moet tussen de `<html></html>`-tags staan
* `<head>` -> hiertussen stop je extra informatie over je pagina, bijvoorbeeld de titel
* `<title>` -> de titel van de pagina
* `<body>` -> alle inhoud van de pagina

Dit is een volledige pagina, maar omdat er tussen `<body>` en `</body>` niks staat, zie je niks. Maak nu een nieuw bestand aan in je `views` map: `views/home.erb`. Typ de HTML-code van hierboven in en sla het bestand op.

<!-- Deze tags zijn de belangrijkste in HTML, maar er zijn er nog veel meer. De `<div>`-tag ga je vooral nog veel tegenkomen. Deze maakt een soort "blokje" waar je tekst of plaatjes in kunt zetten. Maar daarover later meer! -->

Nu moet je Sinatra vertellen dat `home.erb` moet worden weergegeven. Dit doe je in `application.rb`. Daar zie je als het goed is staan:

{% highlight ruby %}

get '/' do
    "Hello world!"
end

{% endhighlight %}

Met het commando `erb :bestand` laat je Sinatra `bestand.erb` laden. Zo kun je `home.erb` laten zien:

{% highlight ruby %}

get '/' do
    erb :home
end

{% endhighlight %}

Nu weet de server dat als je naar `"/"` gaat, hij de html in `home.erb` moet weergegeven. Als je `shotgun` nog aan hebt staan, kun je de pagina verversen. Start anders shotgun opnieuw op met `shotgun application.rb` in de command line.

Je zou nu een witte pagina moeten zien, met 'Home' als titel. Laten we wat inhoud toevoegen. In je `<body>` kun je gewoon gaan typen. Zet wel elk stukje tekst in een `<p>`-tag (een paragraaf). In Sublime kun je snel een voorbeeldtekstje maken met `ctrl + shift + p` -> `Snippet: Lorem Ipsum`. Dan krijg je dit:

{% highlight html %}

<html>
<head>
  <title>Home</title>
</head>

<body>
  <p>Lorem ipsum dolor sit amet, ... est laborum.</p>
</body>
</html>

{% endhighlight %}

### Meer tags

Tussen `<a>` en `</a>` plaats je links. [Een link naar Google](https://www.google.com) maak je zo:

{% highlight html %}
<a href="https://www.google.com">Een link naar Google</a>
{% endhighlight %}

Zoals je ziet, geef je met `href` het adres waar je heen wilt linken. 

Een `<ul>` (*unordered list*) maak je zo:

{% highlight html %}
<ul>
  <li>Item 1</li>
  <li>Item 2</li>
  <li>Item 3</li>
</ul>
{% endhighlight %}

`<li>` is een *list item*. Het resultaat is:

- Item 1
- Item 2
- Item 3

Een plaatje voeg je toe met:

{% highlight html %}
<img src="http://www.engr.uconn.edu/~rohitm/tutorials/crash2/images/matz.jpg">
{% endhighlight %}

Het resultaat is:

<img src="/public/images/matz.jpg">

Dit is de maker van Ruby. Onze dank is groot.

Maar wacht even. We hebben de `<img>`-tag helemaal niet afgesloten! `<img>` is één van de weinige tags die je niet hoeft af te sluiten, omdat er niks tussen hoort te staan. Alle informatie zit al in het attribuut `src`, dat wijst naar de locatie van de foto.

Kopjes maak je met `<h1>`, `<h2` en `<h3>`:

{% highlight html %}
<h1>Kopje één</h1>
<h2>Kopje twee</h2>
<h3>Kopje drie</h3>
{% endhighlight %}

Een `<div>` is een *division*, een afscheiding. Het wordt vaak gebruikt om de verschillende delen van een site te scheiden.

{% highlight html %}
<div>Een deel van de site dat op zichzelf staat.</div> 
{% endhighlight %} 

In [de uitgebreide documentatie van Mozilla](https://developer.mozilla.org/en-US/docs/Web/HTML/Element) staat uitleg over alle tags. Als je zoekt naar informatie op internet, probeer dan altijd eerst de site van Mozilla. Voeg MDN of Mozilla toe als zoekterm. Op internet wordt een hoop onzin verkondigd. (Al eens opgevallen?) De mensen van Mozilla weten waarover ze het hebben.

## CSS

Je kunt nu tekst en plaatjes weergeven, maar het is erg kaal. Daarvoor is er CSS. Met CSS geef je 'stijl' aan je website. Eerder heb je een map `views/scss` gemaakt met daarin Bourbon, Neat en Bitters. Deze pakketten bestaan uit stijlbestanden. Eerst moeten we deze inladen.

Maak een nieuw bestand `views/scss/style.scss` (let op de 's' in 'scss' - SCSS is een betere versie van CSS, daar vertellen we later meer over). Hierin kun je de pakketten importeren met `@import`. Typ dit in `style.scss` (in deze volgorde):

{% highlight scss %}

@import "normalize";
@import "bourbon/bourbon";
@import "bitters/bitters";
@import "neat/neat"; 

{% endhighlight %}

Typ daaronder de volgende regels:

{% highlight scss %}

$column: 90px;
$gutter: 30px;
$grid-columns: 10;
$max-width: em(720);

{% endhighlight %}

Dit zijn de standaardinstellingen voor de pagina. Met deze waarden kun je later experimenteren. Vooral `$max-width` is belangrijk: hiermee stel je de breedte van de pagina in. 

### Tags selecteren

Met CSS-regels geef je stijl en opmaak mee aan specifieke tags:

{% highlight scss %}

body {
  background-color: #cccccc;
}

{% endhighlight %}

Zo maak je de achtergrondkleur van de pagina grijs. Je sluit alles wat bij een tag hoort in met `{}`. Elke regel bestaat uit `eigenschap: waarde;` en geldt alleen voor de tag die je selecteert (in dit geval `<body>`.) Let op de `;` aan het eind van elke regel. De regel hierboven stelt de eigenschap `background-color` in op `#cccccc`. Dit is grijs.

Zo'n kleurcode bestaat uit zes hexadecimale cijfers (van 0 tot f). De eerste twee cijfers stellen de hoeveelheid rood voor, cijfers drie en vier de hoeveelheid groen en de laatste twee cijfers de hoeveelheid blauw.

Zie [colorpicker](http://www.colorpicker.com) en [clrs.cc](http://clrs.cc/).

Nog een voorbeeld. De standaardkleur voor links is blauw. Probeer maar eens iets tussen `<a>` tags te zetten. Maar wat als je rood wilt? 

{% highlight scss %}

a {
  color: #ff4136;
}

{% endhighlight %}

We geven aan dat we alleen `<a>` tags willen stijlen door de regel tussen `a { ... }` te zetten.

Waarom worden links in de tekst wel rood, maar links in het navigatiemenu niet? In de SCSS voor het menu staat in versimpelde vorm:

{% highlight scss %}
  header {
    ul li {
      a {
        color: $navigation-color;
      }
    }
  }
{% endhighlight %}

Dit `<a>`-element wordt veel specifieker benoemd. Hier staat: als je een `<header` hebt, met daarin een `<ul>` (een unordered list), met daarin een `<li>` (een list item), met *daarin* een `<a>`-element, *dan pas* moet de kleur `$navigation-color` worden. (`$navigation-color` is ergens anders ingesteld, maar is net zo'n waarde als `#ff4136` of `#cccccc`.)

Regels die specifieker benoemd worden, hebben prioriteit. Dus `color: $navigation-color;` wint het van `color: #ff4136;` in de navigatiebalk, omdat het `<a>`-element daar specifieker benoemd is.

### Klassen
Behalve door specifiek te benoemen, kun tags van elkaar onderscheiden met klassen. Alleen elementen met een bepaalde klasse worden dan gestijld. Stel dat je een bepaalde paragraaf extra opvallend wilt maken, dan kun je in de CSS typen:

{% highlight scss %}
.opvallend {
  color: #ff4136;
}
{% endhighlight %}

Met `.opvallend` stijl je dus geen specifieke tags, maar alle tags met de klasse `opvallend`. Let op de punt. In de HTML moet je typen:

{% highlight html %}
<p class="opvallend">Opvallende paragraaf.</p>
{% endhighlight %}

Hoe gaan we dit gebruiken? Typ in `style.scss` de volgende regels:

{% highlight scss %}

div.container {
  @include outer-container;
}

{% endhighlight %}

Met het stukje `div.container` selecteer je alle `<div>` elementen met de klasse `container` op de pagina. Met `@include outer-container` zorg je dat je inhoud mooi in het midden op de pagina komt, in een vak met de breedte die je eerder met `$max-width: em(720);` hebt ingesteld.

Nu moeten we de klasse aan de tag toekennen. Typ daarvoor het volgende in `home.erb`:

{% highlight html %}

<html>
<head>
  <title>Home</title>
</head>

<body>
  <div class="container">
    <p>Lorem ipsum dolor sit amet, ... est laborum.</p>
  </div>
</body>
</html>

{% endhighlight %}

Let op dat je de `<div>` ook weer afsluit. Je geeft de klasse aan met `class="container"`.

### Het stijlbestand aanroepen

Tot slot moeten we het stijlbestand aanroepen, zodat de browser weet welk stijlbestand hij moet laden op deze pagina. Dit doe je met `<link>`. Stop de `<link>`-tag in je head, zodat je het volgende krijgt:

{% highlight html %}

<html>
<head>
  <link href="/style.css" rel="stylesheet">
  <title>Home</title>
</head>

<body>
  <div class="container">
    <p>Lorem ipsum dolor sit amet, ... est laborum.</p>
  </div>
</body>
</html>

{% endhighlight %}

Zo geef je aan dat de browser het bestand "/style.css" moet laden. Maar als je kijkt in je bestanden, dan zie dit bestand niet staan. Wat gebeurt hier? Maak in `application.rb` de volgende route (dat wil zeggen, typ deze regels):

{% highlight ruby %}

get '/style.css' do 
  scss :"/scss/style"
end

{% endhighlight %}

Je hoeft hier het fijne niet van te weten, maar wat er gebeurt is gewoon een GET-request. De browser vraagt om het bestand `/style.css` en dan geeft Sinatra antwoord. Het commando `scss :/"scss/style"` zoekt naar het bestand `style.scss` en zet hem om naar `style.css`. Dit is vrij ingewikkeld, maar het lijkt op wat er gebeurt bij:

{% highlight ruby %}

get '/' do 
  erb :home
end

{% endhighlight %}

Deze route zet een erb-bestand om naar een HTML-bestand.  

## Meerdere pagina's

Nu wordt het tijd om eens wat meer pagina's te maken. Maar als je in `home.erb` kijkt, zie je dat maar een klein gedeelte bestaat uit de inhoud van de pagina:

{% highlight html %}

<html>
<head>
  <link href="/style.css" rel="stylesheet">
  <title>Home</title>
</head>

<body>
  <div class="container">
    <p>Lorem ipsum dolor sit amet, ... est laborum.</p>
  </div>
</body>
</html>

{% endhighlight %}

Eigenlijk bevat alleen het gedeelte in de `<div class="container">` de inhoud van de pagina. De rest is opbouw. Als je meerdere pagina's wilt maken, waarbij de opbouw hetzelfde blijft, wil je natuurlijk niet de opbouw elke keer opnieuw typen. Daar heeft Sinatra ook iets op gevonden: maak een pagina `views/layout.erb` (de naam is belangrijk).  

Plak daar alles in uit `home.erb`, maar haal de inhoud eruit. Zet daarvoor in de plaats `<%= yield %>`. Dit lijkt abracadabra, maar dit is nu een stukje Ruby! Met `<%= %>` zeg je dat daar een stukje Ruby moet worden uitgevoerd en de output daarvan moet worden weergegeven. En `yield` betekent iets als: stop hier een pagina in.

Dan ziet `layout.erb` er zo uit:

{% highlight html+erb %}

<html>
<head>
  <link href="/style.css" rel="stylesheet">
  <title>Home</title>
</head>

<body>
  <div class="container">
    <%= yield %>
  </div>
</body>
</html>

{% endhighlight %}

Het mooie is dat `layout.erb` automatisch wordt geladen; daar hoef je niks meer voor te doen. Nu kun je de hele opbouw uit `home.erb` halen, zodat daar alleen nog maar dit in staat:

{% highlight html %}

<p>Lorem ipsum dolor sit amet, ... est laborum.</p>

{% endhighlight %}

### Over en Contact

Nu kun je makkelijk nieuwe pagina's maken. Twee pagina's die je vaak tegenkomt op websites zijn "Over" en "Contact". Maak eerst `views/over.erb` aan en typ iets over jezelf, zoals dit:

{% highlight html %}

<p>Wij zijn Rubyprog en we vinden Sinatra top!</p>

{% endhighlight %}

Maak daarna `views/contact.erb` met iets als dit:

{% highlight html %}

<p>Hallo! Als je ons iets wilt vragen mail dan naar <a href="mailto:ghkapteijns@gmail.com">Rubyprog</a></p>

{% endhighlight %}

### Nieuwe routes

De pagina's heb je, maar je moet Sinatra nog wel vertellen wanneer hij ze te voorschijn moet halen. Hiervoor maak je extra routes. Typ het volgende in `application.rb`:

{% highlight ruby %}

get '/over' do
  erb :over
end

get '/contact' do
  erb :contact
end

{% endhighlight %}

Zie je wat hier gebeurt? Als de browser vraagt om `/over` dan laat Sinatra de pagina `over.erb` zien. Probeer maar eens in je browser te gaan naar `localhost:9393/over`, dan zie je de pagina die je net gemaakt hebt. Maar op deze manier navigeren is natuurlijk niet erg handig voor de gebruikers van je app. Daarom gaan we een menu maken!

## Een menu

Nu kunnen we echt aan de slag. Kijk even op de [site van Refills](http://thoughtbot.github.io/refills/). Hier staan allemaal prachtige dingen op, die je kunt gebruiken in jouw app. Scroll naar het bovenste element (Navigation) en klik op 'Show Code'. Dan verschijnen er twee stukken code, links de HTML, rechts de CSS. Klik op de linker 'copy' (boven het vak met HTML code). Plak het in `layout.erb` net onder `<div class="container">`, voor `<%= yield %>`:

{% highlight html+erb %}

<html>
<head>
  <link href="/style.css" rel="stylesheet">
  <title>Home</title>
</head>

<body>
  <div class="container">
    <header class="navigation">
      <div class="menu-wrapper">
        ...
      </div>
    </header>

    <%= yield %>
  </div>
</body>
</html>

{% endhighlight %}

Kopieer nu ook de CSS van het menu vanuit Refills en plak het onderaan je `style.scss`:

{% highlight scss %}

@import "normalize";
@import "bourbon/bourbon";
@import "bitters/bitters";
@import "neat/neat";

$column: 90px;
$gutter: 30px;
$grid-columns: 10;
$max-width: em(720);

div.container {
  @include outer-container;
}

header.navigation {
  ...
}

{% endhighlight %}

Kijk nu nog eens naar je app in de browser. Als je het goed hebt gedaan, zie je nu een mooi menu bovenaan je pagina! Alleen staan er nog veel dingen in die je niet nodig hebt, en de knoppen doen niks. Sloop het er maar uit en maak je eigen knoppen. Bij elke link zie je iets als `<a href="javascript:void(0)">` staan. Dit doet niks, dus verander ze naar `<a href="/">` (voor Home) en bijvoorbeeld `<a href="/over">` (voor Over).

Je kunt ook nog het logo weghalen als je wilt (of je eigen logo er in plakken). Als je hem weghaalt, vervang hem dan door `&nbsp;`, dit betekent een spatie. Dan krijg je iets als dit:

{% highlight html+erb %}

...
<header class="navigation">
  <div class="menu-wrapper">
    <a href="javascript:void(0)" class="logo">
      &nbsp;
    </a>
    <p class="navigation-menu-button" id="js-mobile-menu">MENU</p>
    <div class="nav">
      <ul id="navigation-menu">
        <li><a href="/">Home</a></li>
        <li><a href="/over">Over</a></li>
        <li><a href="/contact">Contact</a></li>
      </ul>
    </div>
  </div>
</header>
...

{% endhighlight %}

### Margin

Om nog even de puntjes op de i te zetten, kun je nog wat extra ruimte toevoegen onder het menu. Je ziet namelijk dat de tekst er te dicht op staat. Dit doe je met `margin` (marge). Om het menu een beetje marge aan de onderkant te geven, typ je in `style.css` het volgende:

{% highlight scss %}

...

header.navigation {
  margin-bottom: 30px;

  ...
}

{% endhighlight %}

Let op dat je de regel toevoegd in `header.navigation { }`. Kijk maar eens of je hiermee tevreden bent - van de 30px kun je alles maken wat je wilt.

Dat was het! Je hebt nu een hele website in elkaar gezet. En zeg nou zelf, ziet het er goed uit of niet? Maar dit is natuurlijk nog maar het begin. In hoofdstuk 2 gaan we de site *dynamisch* maken, en uiteindelijk maken we er een hele blog van.

## Opdracht

De opdracht is om zelf te klooien. Verwerk een component uit [Refills](http://thoughtbot.github.io/refills/) in je site. Je kunt knippen en plakken (druk op Show Code), maar probeer te begrijpen wat er staat. Welke html-tags ken je al? Welke nog niet? In de [Mozilla guide](https://developer.mozilla.org/en-US/docs/Web/HTML/Element) staan alle tags op een rijtje.

Let op: als er iets tussen `<head>`-tags staat, hoort het in de `<head>`. Je kunt de `<head>` maar op één plek beschrijven, dus moet je die regels in `layout.erb` tussen de bestaande `<head>`-tags stoppen.

### Variabelen

Open het bestand `_variables.scss`. Hier staan variabelen die je kunt veranderen. De variabele `$base-font-family` geeft het lettertype aan, `$base-font-size` de lettergrootte, `$base-font-color` de tekstkleur, etc. Maak er wat moois van!

In `style.scss` kun je zelf regels toevoegen. [Hier](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference) is een lijst van CSS-dingen die je kunt veranderen. Kijk goed naar de voorbeelden.

