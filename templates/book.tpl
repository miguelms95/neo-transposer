{% extends "base.tpl" %}

{% block page_class %}page-book{% endblock %}

{% block content %}
<h1>{% trans %}Songs of the Neocatechumenal Way{% endtrans %}</h1>
<h2>
	{% if app.user.isLoggedIn %}
	<span class="change-book"><a class="small-button" href="{{ path('user_book', {'_locale':app.locale}) }}">{% trans %}Other languages{% endtrans %}</a></span>
	{% endif %}

	{{ current_book.lang_name }}
	<small class="book-details">({{ current_book.details }})</small>
</h2>

{% if not app.user.isLoggedIn %}
	{% import "login.tpl" as login %}

	<div class="teaser">
		<div class="inside">
			<div class="more-inside">
				<p>{% trans %}Log-in now to transpose automatically the chords of the songs of the Neocatechumenal Way.{% endtrans %}</p>
				{{ login.login_form('', app.request.getRequestUri) }}
			</div>
		</div>
	</div>

{% endif %}

{% if app.locale == 'es' and app.user.isLoggedIn %}
<aside class="tip">
	<h3>Aviso sobre el libro de cantos</h3>
	<p>Los títulos y acordes de los cantos a continuación están tomados de
	la 20ª edición del Resucitó, editado en Madrid en 2014. Te sugiero
	encarecidamente que uses la <strong>edición oficial</strong> del libro de cantos,
	y no otras ediciones “piratas”, que pueden contener errores o diferencias en letras y acordes.
	</p>
</aside>
{% endif %}

<ul class="song-index">
{% for song in songs %}
	<li>
		{{ song.page|default('&#248;')|raw }}
		· <a href="{{ path('transpose_song', {"id_song":song.slug}) }}">{{ song.title }}</a>
		{% if song.worked == '1' %}
		<span class="green" title="{% trans %}You have reported the proposed transposition as valid{% endtrans %}">&#10004;</span>
		{% endif %}
	</li>
{% endfor %}
</ul>

{% endblock %}