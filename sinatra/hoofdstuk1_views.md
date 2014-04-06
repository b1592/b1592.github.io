---
layout: default
title: Hoofdstuk 1
scrollspy: true
lesson: hoofdstuk1
---

## Pagina's

Nu gaan we iets meer inhoud toevoegen. Daarvoor gebruik je `erb`, wat staat voor "embedded ruby". Dat wil zeggen dat je Ruby in de pagina kunt zetten. Maar voordat je `erb` kunt gebruiken, moet je eerst iets van HTML weten. Dat is de taal die alle websites gebruiken om hun inhoud weer te geven. Eigenlijk is `erb` ook gewoon HTML, maar je kunt er stukjes Ruby in stoppen.

### HTML

HTML is niet een echte programmeertaal, zoals Ruby, maar je gebruikt het alleen om te zeggen welke inhoud waar op je pagina moet verschijnen. HTML bestaat uit "tags", die er zo uit zien: `<html>`, `<p>`, `<a>`. Je sluit ze af met een `/`: `</html>`.

Het begint allemaal met een `<html>`-tag:

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
* `<head>` -> hier stop je extra informatie over je pagina, bijvoorbeeld de titel
* `<title>` -> wat hier in staat, komt in je browser bovenaan te staan. Let op dat de `<title>` in de `<head>` moet staan
* `<body>` -> hier begint je pagina pas echt. Alle inhoud stop je in de `<body>`

Dit is al een volledige pagina, maar het doet nog niets. Laten we dat eens proberen: maak een nieuw bestand aan in je "views" map: `views/home.erb`. Ook al is dit een erb-bestand, kun je er gewoon HTML in stoppen. Plak de HTML-code van hierboven in het bestand en sla het op. 

Deze tags zijn de belangrijkste in HTML, maar er zijn er nog veel meer. De `<div>`-tag ga je vooral nog veel tegenkomen. Deze maakt een soort "blokje" waar je tekst of plaatjes in kunt zetten. Maar daarover later meer!

Nu moet je Sinatra nog vertellen dat het je bestand moet laden. Dit doe je in `application.rb`. Daar zie je als het is nog deze route staan:

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

Dat is alles! Heb je shotgun nog aan staan in je command line? Dan kun je gewoon je browser verversen. Start anders shotgun weer opnieuw op met `shotgun application.rb` in je command line.

Je zou nu een lege witte pagina moeten zien, met 'Home' aan de bovenkant van je browser. Laten we wat inhoud toevoegen. In je `<body>` kun je gewoon gaan typen. Zet wel elk stukje tekst in een `<p>`-tag (de p staat voor paragraaf). In Sublime kun je snel een voorbeeldtekstje maken met `ctrl + shift + p` -> `Snippet: Lorem Ipsum`. Dan krijg je dit:

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

## CSS

Nu zou je een hele lap tekst moeten zien als je de pagina laadt. Het is nog erg kaal, maar daarvoor is er `CSS`. Met CSS geef je 'stijl' aan je website. Eerder heb je een map gemaakt `views/scss` met daarin Bourbon, Neat en Bitters. Deze pakketten bestaan voornamelijk uit stijlbestanden. Wat we eerst moeten doen is deze inladen.

Maak een nieuw bestand aan `views/scss/style.scss` (let op de 's' in 'scss' - SCSS is een betere versie van CSS, daar vertellen we later meer over). Hierin kun je de pakketten importeren met `@import`. Typ dit in je `style.scss` (in deze volgorde):

{% highlight scss %}

@import "normalize";
@import "bourbon/bourbon";
@import "bitters/bitters";
@import "neat/neat"; 

{% endhighlight %}

In de eerste regel importeer je ook het bestand `normalize.scss`. Dit bestand zorgt dat je pagina in elke browser er hetzelfde uitziet. Typ daaronder de volgende regels:

{% highlight scss %}

$column: 90px;
$gutter: 30px;
$grid-columns: 10;
$max-width: em(720);

{% endhighlight %}

Dit zijn de standaardinstellingen voor je pagina. Met deze waarden kun je later gaan experimenteren. Vooral de laatste is belangrijk: hiermee stel je de breedte van de pagina in. 

### Klassen

In CSS kun je stijl meegeven aan bijvoorbeeld tags. Met het volgende:

{% highlight scss %}

body {
  background-color: #ccc;
}

{% endhighlight %}

maak je de achtergrondkleur van je pagina grijs. Dit hoort bij de `<body>`-tag. Let op de syntax: je sluit alles bij de tag hoort in met `{}` en elke regel bestaat uit `eigenschap: waarde;`. Je sluit elke regel af met een `;`. Wat hierboven is gebeurd is dat de eigenschap `background-color` wordt ingesteld op `#ccc` (grijs, dit is hoe je kleuren maakt in CSS; zie [colorpicker](http://www.colorpicker.com)).  

Als je niet wilt dat elke tag dezelfde stijl krijgt, kun je klassen gebruiken. Alleen elementen met deze klasse worden dan gestijld. Typ in `style.scss` de volgende regels:

{% highlight scss %}

div.container {
  @include outer-container;
}

{% endhighlight %}

Met het stukje `div.container` krijg je alle `<div>` elementen met de klasse `container` in je pagina. Met de middelste regel zorg je dat je inhoud mooi in het midden op de pagina komt, in een vak met de breedte die je eerder met `$max-width: em(720);` hebt ingesteld.

Nu moeten we nog de klasse in je erb-pagina stoppen. Typ daarvoor het volgende:

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

Let op dat je de `<div>` ook weer afsluit. Zoals je waarschijnlijk wel kunt raden geef je de klasse aan met `class="container"`. Tot slot moeten we nog het stijlbestand aanroepen, zodat de browser weet dat welk stijlbestand hij moet laden op deze pagina. Dit doe je met `<link>`. Stop deze in je head, zodat je het volgende krijgt:

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

Zo geef je aan dat de browser het bestand "/style.css" moet laden. Maar als je kijkt in je bestanden, dan zie dit bestand niet staan - wat gebeurt hier? Maak in `application.rb` de volgende route (dat wil zeggen, typ deze regels):

{% highlight ruby %}

get '/style.css' do 
  scss :"/scss/style"
end

{% endhighlight %}

Je hoeft hier het fijne niet van te weten, maar wat er gebeurt is gewoon een GET-request. De browser vraagt om het bestand '/style.css' en dan geeft Sinatra antwoord. Het commando `scss :/"scss/style"` zoekt naar het bestand `style.scss` en zet hem om naar `style.css`. Dit is vrij ingewikkeld, maar het lijkt op wat er gebeurt bij

{% highlight ruby %}

get '/' do 
  erb :home
end

{% endhighlight %}

Deze route zet een erb-bestand om naar een HTML-bestand.  

## Meerdere pagina's

Nu wordt het tijd om eens wat meer pagina's te maken. Maar als je eens in je `home.erb` kijkt, zie je dat maar een klein gedeelte bestaat uit de inhoud van de pagina:

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

Eigenlijk alleen het gedeelte in de `<div class="container">` bevat de inhoud van de pagina. De rest is opbouw. Als je nu meerdere pagina's wilt maken, waarbij de opbouw hetzelfde blijft, wil je natuurlijk niet de opbouw elke keer opnieuw typen. Daar heeft Sinatra ook iets op gevonden: maak een pagina `views/layout.erb` (de naam is belangrijk).  

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

Als je goed kijkt zie je een `<a>`-tag staan in ons voorbeeld. Daarmee maak je links. In de `href=""` zet je het adres waar je naartoe wilt (bijv. `www.google.com`).

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

## Margin

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
