---
layout: default
title: Hoofdstuk 2
scrollspy: true
---

##Een dynamische route

Jullie hebben nu kennis gemaakt met routes. Maar routes kunnen veel meer dan alleen bepaalde bestanden vinden. Je kunt aan routes variabelen meegeven. Laten we eens gaan testen hoe dat werkt.

Maak een nieuwe view aan: `views/welkom.erb`. Deze pagina gaat je begroeten met je naam. Typ maar iets leuks, zodat er iets in deze vorm komt te staan:

{% highlight html %}

<p>Hallo, bezoeker, welkom op deze site!</p>

{% endhighlight %}

Nu zou het leuk zijn als je de bezoeker bij zijn of haar naam kunt noemen. Hiervoor moet je in de routes aangeven dat je een variabele wilt doorgeven. Dat doe je met `:naam`. Deze dubbele punten geven aan dat alles wat op die plaats staat, wordt opgeslagen in een variabele. Je kunt bij deze variabele met `params[:naam]`. `params` is dus een hash met daarin de variabelen die de route binnenkrijgt.

Voor dit voorbeeld typ je dit in `application.rb`:

{% highlight ruby %}

get "/welkom/:naam" do
  @naam = params[:naam]
  erb :welkom
end

{% endhighlight %}

Wat staat hier? Zoals je ziet gaat de route naar 'welkom' met daarachter een variabele. Als je in je browser gaat naar `.../welkom/Jan` dan krijgt `params[:naam]` de waarde 'Jan'.

Je moet nog wel aangeven dat je view straks ook bij die variabele kan. Je kunt voordat je de view aanroept (`erb :welkom`) nog deze variabele maken. Je zet er een `@` voor zodat je view er ook bij kan.

In je view `views/welkom.erb` kun je deze variabele vervolgens gebruiken:

{% highlight erb %}

<p>Hallo, <%= @naam %>, welkom op deze site!</p>

{% endhighlight %}

Zie je hoe dit werkt? Net als bij `<%= yield %>` in je layout zeg je hier dat het stukje ruby (`@naam`) moet worden uitgevoerd en het resultaat daarvan moet worden weergegeven.

Probeer nu maar eens te gaan naar `.../welkom/jouwnaam`.

Dit zijn dynamische routes. En het werkt niet alleen met een variabele, maar je kunt er net zoveel maken als je wilt. Zolang er tussen elke maar een `/` staat. Bijvoorbeeld:

{% highlight ruby %}

get "/welkom/:naam/:leeftijd/:woonplaats" do
  @naam = params[:naam]
  @leeftijd = params[:leeftijd]
  @woonplaats = params[:woonplaats]
  erb :welkom
end

{% endhighlight %}

Je kunt vast zelf wel bedenken nu hoe je deze variabelen in je view verwerkt.

## Databases


##Create, read, update en destroy

Nu wordt het interessant: we gaan beginnen aan de blog. Aan de basis van elke blog (en heel veel andere soorten websites) staat een zogenaamde 'CRUD'. Dit staat voor:

* Create: maak een nieuw item (bijv. een blogpost)
* Read: geef een item weer
* Update: pas een item aan
* Destroy: gooi het item weg

Met deze vier functies heb je eigenlijk al een werkende blog, en in dit hoofdstuk gaan we ze maken.

###Create

We maken een blog, en op een blog heb je posts. Je moet als eerste iets inbouwen waarmee je een nieuwe post kunt maken. Het is handig om te beginnen bij de route. Typ het volgende in `application.rb`:

{% highlight ruby %}

get "/posts/new" do
  erb :nieuwepost
end

{% endhighlight %}

En een view `views/nieuwepost.erb`. Hierin maak je een tekstveld waar je je post in kunt 


###Read

bas

###Update

asgasg

###Destroy

asgsag
