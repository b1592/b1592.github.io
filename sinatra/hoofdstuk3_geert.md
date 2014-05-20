---
layout: default
scrollspy: true
---

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

<!-- {% highlight ruby %}
get 'posts/new' do
  if session[:logged_in] == false
    redirect '/'
  end
  erb :nieuwepost
end
{% endhighlight %}

Er zijn veel meer routes die gewone bezoekers niet mogen zien, maar we willen niet vijf keer hetzelfde typen. Je kunt een functie `requires_login` maken:

{% highlight ruby %}
def requires_login
  if session[:logged_in] == false
    redirect '/'
  end
end 
{% endhighlight %}

In mooi Ruby kan dat zelfs zo:

{% highlight ruby %}
def requires_login
  unless session[:logged_in]
    redirect '/'
  end
end 
{% endhighlight %}

Of zelfs:

{% highlight ruby %}
def requires_login
  redirect '/' unless session[:logged_in]
end 
{% endhighlight %}

In alle routes die een login vereisen, doe je dan dit:

{% highlight ruby %}
get 'posts/new' do
  requires_login
  erb :nieuwepost
end
{% endhighlight %}

Tenslotte maken we een logout link.

{% highlight ruby %}
get '/logout' do
  session[:logged_in] = false
  redirect '/'
end
{% endhighlight %}

Zorg er in `application.erb` voor dat er een link naar login staat als de bezoeker niet is ingelogd, en naar logout als de bezoeker wel is ingelogd.
 -->



