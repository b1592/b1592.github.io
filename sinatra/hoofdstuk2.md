---
layout: default
title: Hoofdstuk 2
scrollspy: true
---

# Hoofdstuk 2 - De blog bouwen

In dit hoofdstuk gaan we beginnen aan de blog. Geen statische pagina's meer, maar inhoud die wordt opgeslagen in en gelezen uit een database. Maak je geen zorgen; wat een database is en hoe het werkt leggen we ook uit. Volg de voorbeelden en geef er vooral je eigen draai aan.

## Een dynamische route

Jullie hebben nu kennis gemaakt met routes. Maar routes kunnen veel meer dan alleen bepaalde bestanden vinden. Je kunt aan routes variabelen meegeven. Laten we gaan testen hoe dat werkt.

Maak eens een nieuwe view aan: `views/welkom.erb`. Deze pagina gaat je begroeten. Typ maar iets leuks, zodat er iets in deze vorm komt te staan:

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

## Posts opslaan in een database
Een blog bestaat uit posts, die moeten worden opgeslagen in een database. Hiervoor gebruiken we [DataMapper](http://datamapper.org/getting-started.html):

    gem install data_mapper

Met DataMapper kun je communiceren met een database. Wij gebruiken een sqlite-database, dus hebben we nog nodig:

    gem install dm-sqlite-adapter

Bovenaan `application.rb` moet je DataMapper verbinden met een database.

{% highlight ruby %}

require 'sinatra'
require 'sass'
require 'data_mapper'
require 'dm-sqlite-adapter'

# verbindt DataMapper met de database blog.db
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")
{% endhighlight %}

### Het postmodel
Wat moet er worden opgeslagen? Laten we een lijstje maken:

- titel van de blogpost
- tekst (body)
- auteur
- datum en tijd waarop de blogpost geschreven is
- **een id**: dit is een uniek nummer waarmee de post geïdentificeerd wordt

In de database ziet dat er zo uit:

![Database](/public/images/database.png)

Om posts te kunnen vinden, moeten ze te herkennen zijn aan een unieke kolomwaarde. *titel* is geen goede kandidaat: twee posts kunnen namelijk dezelfde titel hebben. Daarom hebben we id nodig: dit nummer is uniek. De kolom waarmee we posts kunnen opzoeken heet de *primary key*.

In Ruby doe je dat zo:

{% highlight ruby %}
class Post
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :body, Text
  property :created_at, DateTime
  property :author, String
end
{% endhighlight %}

Wat gebeurt hier? We schrijven een klasse `Post`, zodat we later `Post`-objecten aan kunnen maken. De `Post`-objecten worden de rijen in de database. Met de regel `property :id, Serial`, geven we aan dat elke post een uniek nummer moet krijgen, zodat we dat zelf niet bij hoeven te houden.

Als je alle modellen hebt beschreven, moet je nog het volgende typen:

{% highlight ruby %}
# Leg modellen vast
DataMapper.finalize

# Maak de poststabel aan in de database
Post.auto_upgrade!
{% endhighlight %}

### Posts toevoegen en opzoeken

Nu kun je een post toevoegen aan de database:

{% highlight ruby %}
mijn_post = Post.create(
  :title      => "Eerste post",
  :body       => "Bla bla bla",
  :author     => "Piet"
  :created_at => Time.now
)
mijn_post.titel # => "Eerste post"
{% endhighlight %}

Behalve `create`, hebben DataMappermodellen nog veel meer functies. Start `irb` op en typ `load "application.rb"`. Nu kun je experimenteren.

{% highlight ruby %}
# Geef alle posts uit de database
Post.all

# Geef post met id 1
post = Post.get(1)

# Verander de titel van post 1
post.title = "Andere titel"
post.save
{% endhighlight %}

Let op! Als je de titel van een post wilt veranderen, moet je het object aanpassen (met `post.title = "Andere titel"`) maar ook saven naar de database.

## Posts weergeven
Je kunt nu posts aanmaken in `irb`. Nu moeten we ze weergeven op de homepagina. Dat is een koud kunstje: geef de variabele `@posts` door aan de view.

{% highlight ruby %}
get '/' do
  @posts = Post.all
  erb :home
end
{% endhighlight %}

En in de view zelf:

{% highlight erb %}
<% @posts.each do |post| %>
  <article class="type-system-geometric">

    <h1><%= post.title %></h1>

    <p class="date"><%= post.created_at %></p>
    <p>
    <%=
    if post.body.length < 100
      post.body
    else
        "#{post.body[0..100]}..."
    end %>
    <hr>
    <p class="author"><%= post.author %></p>

  </article>
  <hr>
<% end %>
{% endhighlight %}

## Create, read, update en destroy

Nu wordt het interessant: we gaan beginnen aan de blog. Aan de basis van elke blog (en heel veel andere soorten websites) staat een zogenaamde 'CRUD'. Dit staat voor:

* Create: maak een nieuw item (bijv. een blogpost)
* Read: geef een item weer
* Update: pas een item aan
* Destroy: gooi het item weg

Met deze vier functies heb je eigenlijk al een werkende blog, en in dit hoofdstuk gaan we ze maken.

###Create

We maken een blog, en op een blog heb je posts. Je moet als eerste iets inbouwen waarmee je een nieuwe post kunt maken. Het is handig om te beginnen bij de route. Typ het volgende in `application.rb`:

{% highlight ruby %}

get '/posts/new' do
  erb :nieuwepost
end

{% endhighlight %}

En een view `views/nieuwepost.erb`. Hierin maak je een tekstveld waar je je post in kunt typen en een knop waarmee je het opslaat. Dit doe je in HTML met een `<form>`. Probeer maar eens iets als dit:

{% highlight html %}

<h2>Nieuwe post</h2>

<form action="/posts" method="post">
  <label for="post_title">Titel:</label><br />
  <input id="post_title" name="post[title]" type="text" value="" />
  <br />

  <label for="post_body">Inhoud:</label><br />
  <textarea id="post_body" name="post[body]" rows="5"></textarea>
  <br />

  <label for="post_body">Auteur:</label><br />
  <input id="post_author" name="post[author]" type="text" value="" />
  <br />

  <input type="submit" value="Create Post" />

</form>

{% endhighlight %}

Als je kijkt in `<form>` dan zie je staan `action="/posts"`. Dit betekent dat de inhoud van alles wat er in `<form>` staat opgestuurd wordt naar de route `/posts`. Deze route moet nog gemaakt worden, nu niet met `get` maar `post`:

{% highlight ruby %}

post "/posts" do
  @post = Post.new(params[:post])
  @post.save
  redirect "/"
end

{% endhighlight %}

Zoals je eerder hebt gezien, maak je een nieuwe post aan met `Post.new`. Daar geef je met `params[:post]` alles aan mee wat je in het formulier eerder had ingevuld. Met `@post.save` sla je de nieuwe post op in de database. Als alles gelukt is, stuur je de browser weer door naar je homepagina met `redirect '/'`.

###Read

Nu heb je op de homepagina een lijst met de posts en de inhoud van die posts. Maar je kunt nog niet klikken op de posts. Dit is het 'Read'-gedeelte: je maakt een losse pagina waarop je één post tegelijk kunt lezen.

De route die je hiervoor maakt is misschien niet erg verrassend. Je gaat naar `.../posts/` met daarachter de id van de post die je zoekt. Met `Post.get(id)` haal je vervolgens de goede post uit de database. Dan ziet je route er zo uit:

{% highlight ruby %}

get '/posts/:id' do
  @post = Post.get(params[:id])
  erb :post
end

{% endhighlight %}

Nu nog de view, maar dat is redelijk simpel. Eigenlijk is het niet veel anders dan je homepagina, maar waar je daar door alle posts gaat met een `@posts.each` pak je nu maar één post. Dan krijg je iets als dit:

{% highlight erb %}

<article class="type-system-geometric">

<h1><%= @post.title %></h1>

<p class="date"><%= @post.created_at %></p>
<p><%= @post.body %>
</p>

<hr>
<p class="author"><%= @post.author %></p>

</article>

{% endhighlight %}

Let op: op de homepagina krijg je de variabele `@posts` binnen. Daar ga je doorheen op zo'n manier:

{% highlight ruby %}

@posts.each do |post|
  #Doe iets met post
end

{% endhighlight %}

Dan kun je dus overal `post.title` en dergelijke gebruiken. Nu (in de 'Read') krijg je maar één post binnen, als variabele `@post`. Vergeet dus niet de `@` als je de code van de homepagina kopieert.

De opmaak mag je natuurlijk helemaal zelf weten; dit is een voorbeeld. Zolang je maar de titel, datum, auteur en inhoud van de post weergeeft. Als je op de homepagina de inhoud van de posts hebt ingekort, let dan op dat je dat hier niet doet; je hebt nu immers de ruimte.
