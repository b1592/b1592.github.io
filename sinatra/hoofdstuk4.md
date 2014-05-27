---
layout: default
title: Hoofdstuk 4
scrollspy: true
---

# Hoofdstuk 4: Versiebeheer en comments

In dit hoofdstuk gaan we comments toevoegen aan onze blog. Maar eerst gaan we onze bestanden (eindelijk) onder versiebeheer zetten. 

## Versiebeheer met Git

### Wat is Git?

Git is versiebeheersoftware. Hiermee kun je elke wijziging die je maakt (een *commit*) opslaan. Zo kun je later (als je bijvoorbeeld een fout hebt gemaakt) terug naar een eerder snapshot van je bestandsmap. Versiebeheer is essentieel voor elke programmeur &mdash; helemaal als je met anderen samenwerkt.

### GitHub-account

[Github](https://github.com/) is een site waar je online bestandsmappen kunt delen. Alles staat onder versiebeheer met Git (zodat iedereen alle versies van elkaars software kan zien.) GitHub is de grootste site waar programmeurs samen aan projecten werken.

[Maak een account](https://github.com/).

Gelukt? [Installeer Git](https://help.github.com/articles/set-up-git#platform-windows).

### Inleiding in Git

Doe deze uitstekende tutorial: [Try Git](https://try.github.io/levels/1/challenges/1).

Nu zetten we de map `blog` onder versiebeheer. `cd` naar de juiste map en typ

{% highlight bash %}
$ git init
Initialized empty Git repository in [weggelaten]/blog/.git/
{% endhighlight %}

Voeg alle bestanden toe aan de *staging area* (vergeet de punt niet):

{% highlight bash %}
$ git add .
{% endhighlight %}

Commit de veranderingen (in dit geval de hele map):

{% highlight bash %}
$ git commit -m "Alle bestanden onder versiebeheer."
[weggelaten]
create mode 100644 application.rb
create mode 100644 views/contact.erb
create mode 100644 views/deletepost.erb
[weggelaten]
{% endhighlight %}

Nu gaan we de map op GitHub zetten.

[Maak een nieuwe repository (bestandsmap) aan](https://github.com/new). Geef de repository een naam en verander niets aan de standaardopties (Public en geen README).

Klik op `HTTP` en typ de twee regels in onder &ldquo;Push an existing repository from the command line.&rdquo;

### Samenvatting

Met de commando's `git add`, `git commit` en `git push` kun je voorlopig genoeg. Elke keer als je een verandering hebt gemaakt, doe je `git add .` en `git commit -m "een bericht met wat je hebt veranderd"`. Als je de bestanden op GitHub wilt gooien doe je `git push`.

## Comments in de database

Comments moeten in een aparte tabel worden opgeslagen in de database. We moeten dus een nieuw model maken in DataMapper.

### Het model

{% highlight ruby %}
class Comment
  include DataMapper::Resource
  property :id, Serial
  property :body, Text
  property :author, String
  property :created_at, DateTime
  property :rating, Integer
end
{% endhighlight %}

### Relationele database

We moeten nog iets toevoegen. Comments horen namelijk *bij een bepaalde post*. Door een kolom `post_id` toe te voegen aan de comments, weten we bij welke post elke comment hoort. Een comment met `post_id` van 1 hoort bij de post met een `id` van 1, die je kunt vinden met `Post.get(1)`.

![one-to-many](/public/images/has_many.png)

We kunnen `property :post_id, Integer` toevoegen aan het model voor een comment. Maar dankzij DataMapper kan het handiger. In het postmodel:

{% highlight ruby %}
class Post
  # [weggelaten]

  has n, :comments
end
{% endhighlight %}

En in het commentmodel:

{% highlight ruby %}
class Comment
  # [weggelaten]

  belongs_to :post
end
{% endhighlight %}

Door `has n, :comments` en `belongs_to :post` snapt DataMapper precies wat we bedoelen: een post heeft meerdere comments en een comment hoort bij één post. Er komt nu automatisch een kolom `post_id` in de tabel voor de comments, en DataMapper voegt nog wat handige functies toe, zoals `post.comments`, waarmee je alle comments die bij een bepaalde post horen kunt opvragen.

Een database die op deze manier gestructureerd is noem je *relationeel*, want er bestaan relaties tussen de verschillende modellen. De relatie van posts en comments heet *one-to-many*. Kijk [hier](http://datamapper.org/docs/associations.html) voor de documentatie van DataMapper over relationele modellen.

### Comments aan posts toevoegen

Ga naar `irb` en typ `load "application.rb".`

{% highlight ruby %}
# Laad de post met een id van 5.
post = Post.get(5)

# Laat alle comments zien die bij deze post horen.
post.comments
# => []

# Maak een nieuwe comment aan.
comment = Comment.new(author: "Jan", body: "Mooi verhaal")
# => #<Comment @id=nil @body="Mooi verhaal" @author="Jan" @created_at=nil @rating=nil @post_id=nil>

# DataMapper weigert de comment op te slaan, want
# hij hoort nog niet bij een post.
comment.save
# => false

# Voeg de comment toe aan de post. De post_id wordt ingevuld!
post.comments.push(comment)
# => [#<Comment @id=nil @body="Mooi verhaal" @author="Jan" @created_at=nil @rating=nil @post_id=5>]

# Save de comment. DataMapper protesteert niet.
# Nu worden ook de velden id en created_at ingevuld.
comment.save
# => true
{% endhighlight %}

We hebben nu een comment toegevoegd aan de post met een id van 5. Het had ook in één keer gekund:

{% highlight ruby %}
post = Post.get(5)
post.comments.create({
  author: "Jan",
  body: "Mooi verhaal"
})
{% endhighlight %}


## Opdrachten

### Create, Read, Update, Destroy: Comments

Net als op posts moeten we ook op comments alle acties van CRUD (Create, Read, Update, Destroy) kunnen uitvoeren. Hier hebben jullie alle kennis voor in huis.

### Rating voor comments
Het kan leuk zijn als bezoekers comments een rating kunnen geven. Dan kun je de comments per post sorteren op rating:

{% highlight ruby %}
post.comments.all(order: [:rating.desc])
{% endhighlight %}

En als je de slechtste comments bovenaan wilt hebben (*ascending*):

{% highlight ruby %}
post.comments.all(order: [:rating.asc])
{% endhighlight %}

Of natuurlijk:

{% highlight ruby %}
post.comments.all(order: [:rating.desc]).reverse
{% endhighlight %}