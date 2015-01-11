{% extends "base.tpl" %}

{% block meta_description %}Songs of the Neocatechumenal Way in {{ current_book.lang_name }}. Neo-Transposer automatically transposes the chords of the Way, so that they really fit your voice.{% endblock %}

{% block page_class %}page-book{% endblock %}

{% block body_attributes %}onload="document.getElementById('email').focus()"{% endblock %}

{% block content %}
<h1>
	{% if neoglobals.user.isLoggedIn %}
	<span class="change-book"><a class="small-button" href="{{ path('user_settings') }}#book">Change book</a></span>
	{% endif %}

	{{ current_book.lang_name }}
	<small class="book-details">({{ current_book.details }})</small>
</h1>

{% if not neoglobals.user.isLoggedIn %}
	{% import "login.tpl" as login %}

	<div class="teaser-book">
		<div class="inside">
			<div class="more-inside">
				{{ login.login_form() }}
				<p>Log-in now to transpose automatically the chords of the songs of the Neocatechumenal Way.</p>
			</div>
		</div>
	</div>

{% endif %}

<ul class="song-index">
{% for song in songs %}
	<li>
		{{ song.page }}
		· <a href="{{ path('transpose_song', {"id_song":song.slug}) }}">{{ song.title }}</a>
	</li>
{% endfor %}
</ul>
{% endblock %}