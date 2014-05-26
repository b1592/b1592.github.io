---
layout: default
title: Hoofdstuk 4
scrollspy: true
---

# Hoofdstuk 4: Comments

In dit hoofdstuk gaan we comments toevoegen aan onze blog. 

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

**Plaatje**

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


## De opdracht

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