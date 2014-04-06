---
layout: default
title: Hoofdstuk 1
scrollspy: true
lesson: hoofdstuk1
---

## Views

Nu gaan we iets meer inhoud toevoegen. Daarvoor gebruik je `erb`, wat staat voor "embedded ruby". Dat wil zeggen dat je stukjes Ruby in de pagina kunt stoppen. Maar voordat je `erb` kunt gebruiken, moet je eerst iets van HTML weten. Dat is de taal die alle websites gebruiken om hun inhoud weer te geven.  
### HTML

HTML is niet een echte programmeertaal, zoals Ruby, maar je gebruikt het alleen om te zeggen welke inhoud waar op je pagina moet verschijnen. HTML bestaat uit "tags", die er zo uit zien: `<html>`, `<p>`, `<a>`. Je sluit ze af met een `/`: `</html>`.

Het begint allemaal met een `<html>`-tag:

{% highlight html %}

<html>
<head>
<title>Titel</title>
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
