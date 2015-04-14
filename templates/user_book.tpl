{% extends "base.tpl" %}

{% block page_class %}page-user-book{% endblock %}

{% block content %}

<h1>{% trans %}Choose language{% endtrans %}</h1>

<ul class="books">
{% for id, book in app.books %}
	<li><a href="{{ path('set_user_data', {book: id}) }}">
		{{ book.lang_name }}
		<small>({{ book.details}})</small>
	</a></li>
{% endfor %}
</ul>

{% if app.locale == 'en' %}
<aside class="tip">
	<h3>Looking for the songs in English?</h3>
	<p>Sorry, the songs of the Way in English are not available in
	Neo-Transposer at this moment, although might be added in the future.
	In the meanwhile, you can check the Spanish ones, but since also the melody
	changes for some English songs I can't assure that Neo-Transposer will work
	fine.</p>
</aside>
{% endif %}

{% endblock %}