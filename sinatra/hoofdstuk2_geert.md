---
layout: default
title: Hoofdstuk 2
scrollspy: true
---

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