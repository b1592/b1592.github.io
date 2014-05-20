---
layout: default
title: Hoofdstuk 3
scrollspy: true
---

# Hoofdstuk 3 - Verder met de blog

Als je op dit punt bent aangekomen, kan je blog twee van de vier basisfuncties: Create en Read. In dit hoofdstuk gaan we de blog afmaken, zodat je hem - als je dat zou willen - zo online kunt zetten. Daarvoor maken we de functionaliteit af met Update en Destroy en timmeren we de blog dicht met een loginsysteem.

## De laatste twee - Update en Destroy

Je kunt vast al raden wat deze twee functies moeten doen. Op dit moment kun je het belangrijkste al doen, namelijk nieuwe posts schrijven. Maar wat gebeurt er als een een typfout maakt bij het schrijven van een post? Of als je nog iets wilt toevoegen? En misschien ben je wel zo ontevreden dat je een post helemaal weg wilt gooien. Deze mogelijkheden gaan we vandaag inbouwen.

### Update

Met Update verander je een bestaande post. Dit lijkt heel erg op een nieuwe post maken, maar nu sla je het op in een bestaande post.

Zoals altijd beginnen we bij de route in `application.rb`. In feite bestaat de Update uit twee routes:

* Een `get`: hiermee ga je naar een pagina waar je de inhoud van de post kunt typen
* Een `post`: hiermee verstuur je de inhoud, waarna het opgeslagen wordt in de database

Begin bij de `get`. Misschien heb je al een idee hoe deze er uit gaat zien:

{% highlight ruby %}
get '/posts/:id/edit' do
  @post = Post.get(params[:id])
  erb :editpost
end
{% endhighlight %}

Deze lijkt heel erg op de Read. Met `Post.get(id)` haal je de post met een bepaalde 'id' uit de database en vervolgens geef je deze post door aan de view `editpost`. Je mag het andere namen geven als je wilt, maar let op dat je consequent bent!

Nu moet er dus ook een view komen `editpost.erb`. Het mooie is dat je deze voor een groot gedeelte kunt kopiëren uit `post.erb` (de Read). Dan heb je zoiets als dit:

{% highlight html+erb %}

<h2>Verander post</h2>

<form action="/posts" method="post">

<label for="post_title">Titel:</label>
<br />
<input id="post_title" name="post[title]" type="text" value="" />
<br />

<label for="post_body">Inhoud:</label>
<br />
<textarea id="post_body" name="post[body]" rows="5"></textarea>
<br />

<label for="post_body">Auteur:</label>
<br />
<input id="post_author" name="post[author]" type="text" value="" />
<br />

<input type="submit" value="Create Post" />

</form>

{% endhighlight %}

Maar als je nu naar deze pagina zou gaan, krijg je allemaal lege velden. Het is natuurlijk handig als het als ingevuld is met de post zoals die nu is. Dit kan: je hebt immers in je route een `@post` meegestuurd. Deze kun je gebruiken. Wil je bijvoorbeeld ergens de titel van de post plakken, dan zet je `<%= @post.title %>` in de view.

De twee kleine tekstvelden (Titel en Auteur) hebben een eigenschap `value`. Alles wat je daar in zet, staat ingevuld als je de pagina laad. Bij het grote tekstveld moet je het tussen de `<textarea></textarea>`-tags zetten.

Let goed op wat je waar zet; dan krijg je iets dat hierop lijkt:

{% highlight html+erb %}

<h2>Aanpassen post</h2>

<form action="/posts/<%= @post.id %>" method="post">

<label for="post_title">Titel:</label>
<br />
<input id="post_title" name="post[title]" type="text" value="<%= @post.title %>" />
<br />

<label for="post_body">Inhoud:</label>
<br />
<textarea id="post_body" name="post[body]" rows="5">
  <%= @post.body %>
</textarea>
<br />

<label for="post_body">Auteur:</label>
<br />
<input id="post_author" name="post[author]" type="text" value="<%= @post.author %>" />
<br />

<input type="submit" value="Verander Post" />

</form>

{% endhighlight %}

Laten we meteen maar even een link maken, zodat je op deze pagina kunt komen. In `home.erb` kun je deze link onder elke post (dus net boven de `</article>`-tag) zetten:

{% highlight html+erb %}

<% @posts.each do |post| %>
  <article>

  ...

  <a href="/posts/<%= post.id %>/edit">Verander deze post</a>

  </article>
<% end %>

{% endhighlight %}

Probeer het maar eens. Kijk eens goed of je snapt waar de link naartoe gaat. Dit zou hetzelfde moeten zijn als de route die je net hebt gemaakt.

Er gebeurt nu niets als je op de knop drukt. Dat komt omdat de route nog niet bestaat, dus laten we deze gaan maken. Zoals bij alle formulieren hiervoor staat er bovenaan `<form ... method="post">`. Dat betekent dat het formulier zoekt naar een `post` route.

>   Je kunt de routes noemen zoals je wilt. Je hebt net de `get` route gemaakt naar 
>   
>       get '/posts/:id/edit'
>   
>   dus zou je de post route waarnaar je verstuurt net zo kunnen maken: 
>   
>       post '/posts/:id/edit'
>       
>   Maar het kan korter: denk eens logisch na wat een `post '/posts/:id'` zou moeten doen.  

Zo zou je route er ongeveer uit moeten zien:

{% highlight ruby %}

post '/posts/:id' do
  @post = Post.get(params[:id])
  @post.attributes = params[:post]
  @post.save
  redirect '/'
end

{% endhighlight %}

### Destroy

Nu ben je er bijna; alleen het weggooien van posts kan nog niet. Laten we dat gelijk even toevoegen. Ook hier heb je zowel een `get` als een `post` route nodig. Met de `get` ga je naar een pagina die om bevestiging vraagt - je wilt immers niet per ongeluk een hele post weggooien - en met de `post` gooi je je post definief weg.

Eerst de `get`:

{% highlight ruby %}

get '/posts/:id/delete' do
  @post = Post.get(params[:id])
  erb :deletepost
end

{% endhighlight %}

Niets nieuws hier, dus we gaan door naar de view. Zoals je uit mijn route kunt afleiden heb ik deze `deletepost.erb` genoemd. De inhoud mag je zelf weten, maar er moet in ieder geval een `<form>` zijn met een knop die naar de `post` route gaat. Bijvoorbeeld:

{% highlight html+erb %}

<h2>Verwijder post</h2>

<form action="/posts/<%= @post.id %>/delete" method="post">
<label for="post_title">
Weet je zeker dat je deze post wilt verwijderen?
</label>
<br />

<input type="submit" value="Verwijder Post" /> 
<a href='/'>Annuleren</a>

</form>

{% endhighlight %}

De link met 'Annuleren' is handig om toe te voegen. Deze gaat simpelweg terug naar de homepagina.

Zoals je ziet ga je met dit formulier naar de route `post 'posts/:id/delete'`. Deze kunnen we maken en dat is niet al te ingewikkeld. Je gooit een post weg met

{% highlight ruby %}

@post.destroy

{% endhighlight %}

Bedenk nu zelf hoe je de route gaat maken. Het is netjes om de gebruiker door te sturen naar de homepagina nadat de post is verwijderd - dit doe je met `redirect '/'`.

### Op een rijtje

Alle vier de functies zijn nu gebouwd, maar misschien ben je het overzicht nu een beetje kwijt. Daarom nog even alle routes met bijbehorende views op een rijtje:

- Create
  + `get '/posts/new'` => `nieuwepost.erb`
  + `post '/posts'` => terug naar home
- Read
  + `get '/posts/:id'` => `post.erb`
- Update
  + `get '/posts/:id/edit'` => `editpost.erb`
  + `post '/posts/:id'` => terug naar home
- Destroy
  + `get '/posts/:id/delete'` => `deletepost.erb`
  + `post '/posts/:id/delete'` => terug naar home

Voor de duidelijkheid: je mag dit ook anders doen, zolang het logisch aanvoelt en jij snapt wat er gebeurt. De routes hierboven zijn zoals wij het zouden doen. Als je zoekt naar voorbeelden op internet kom je waarschijnlijk ook dit soort routes tegen. Je ziet dan vaak wel, naast `get` en `post`, ook methodes als `put` en `delete`. Bijvoorbeeld:

{% highlight ruby %}

delete '/posts/:id'

{% endhighlight %}

Vergelijk dit met onze route:

{% highlight ruby %}

post '/posts/:id/delete'

{% endhighlight %}

Dit is een trucje om in je routes duidelijk te maken wat er gaat gebeuren. Achter de schermen is dit niet anders dan een `post` en je hoeft het dus niet te gebruiken. Je hebt ook een aantal extra dingen nodig voordat je dit kunt gebruiken - dit laten we in deze cursus buiten beschouwing, maar zoek het vooral op als je het interessant vindt!

Dat is het: je hebt nu een volledig werkende blog. Je zou hem bijna online kunnen zetten, maar er is nog een ding dat in de weg staat. Zoals je blog nu is, kan elke bezoeker pagina's maken, veranderen en weggooien. Dan is het dus in feite niet meer *jouw* blog! Dit gaan we oplossen met een login-systeem.

## Inloggen

Iedereen kan nu posts toevoegen en verwijderen. Niet handig. Daar gaan we wat aan doen.

Laten we beginnen met een loginpagina.

{% highlight ruby %}
get '/login' do
  erb :login
end
{% endhighlight %}

En in de view:

{% highlight html %}
<form action="/login" method="post">
  <label for="username">Gebruikersnaam:</label><br />
  <input id="username" name="username" type="text" value="" />
  <br />

  <label for="password">Wachtwoord:</label><br />
  <input id="password" name="password" type="password" value="" />
  <br />
  
  <input type="submit" value="Log in" />

</form>
{% endhighlight %}

Let op `type="password"` in de input voor het wachtwoord.

Het formulier op de loginpagina stuurt post request naar `/login`. Verzin een gebruikersnaam en wachtwoord en kijk of ze juist zijn ingevuld:

{% highlight ruby %}
post '/login' do
  if params[:username] == 'pietje' &&
    params[:password] == 'password'
    # Log de gebruiker in
  end

  redirect '/' 
end 
{% endhighlight %} 

De browser moet onthouden dat er een gebruiker is ingelogd. Deze informatie komt niet van de server, maar moet in een sessie of *cookie* worden opgeslagen. Typ boven alle routes het volgende:

{% highlight ruby %}
enable :sessions
{% endhighlight %}

Er is nu een `session`-hash beschikbaar, die je vanuit elke request kunt veranderen of uitlezen. We kunnen dit doen:

{% highlight ruby %}
post '/login' do
  if params[:username] == 'pietje' &&
    params[:password] == 'password'
    session[:logged_in] = true
  end

  redirect '/'
end
{% endhighlight %}

In `home.erb` zorgen we ervoor dat alleen een ingelogd persoon nieuwe posts kan maken.

{% highlight erb %}
<% if session[:logged_in] %>
  <a href="/posts/new">Nieuwe post</a>
<% end %>
{% endhighlight %}

Op dezelfde manier kun je de links voor destroy en edit verhullen voor bezoekers van je site.

Hebben we alles goed dichtgetimmerd? Het antwoord is nee. Een bezoeker kan `/posts/new` intypen en een nieuwe post maken. We moeten ook in `application.rb` kijken of een bezoeker wel is ingelogd, voordat we `erb :nieuwepost` terug geven.

