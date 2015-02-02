{% extends "base.tpl" %}

{% block page_class %}user-settings{% endblock %}

{% block content %}

	<h1>{% trans with {'%software%': '<span class="software-name">' ~ app.neoconfig.software_name ~ '</span>'} %}Welcome to %software%{% endtrans %}</h1>

	<form method="get" action="{{ path('set_user_data') }}">
		<p>{% trans %}This software analyses the songs and your voice, giving you the perfect transposition for each song, according to your voice. But to do so, first I need to know your voice.{% endtrans %}</p>

		<h3>{% trans %}Which is the lowest note that you can sing? And the highest one?{% endtrans %}</h3>

		<p class="voice-selector">
			<span class="field">
				{% trans %}Lowest:{% endtrans %}
				<select name="lowest_note">
				{% for note in accoustic_scale %}
					<option value="{{ note }}1"{% if app.user.lowest_note == note ~ 1 %} selected="selected"{% endif %}>{{ note|notation(current_notation) }}</option>
				{% endfor %}
				</select>
			</span>

			<span class="field">
				{% trans %}Highest:{% endtrans %}
				<select name="highest_note">
{% for note in accoustic_scale %}
					<option value="{{ note }}1"{% if app.user.highest_note == note ~ '1' %} selected="selected"'{% endif %}>{{ note|notation(current_notation) }}</option>
{% endfor %}

{% for i in 2..3 %}
					{# Cambiar el trans de octave por transChoice
						{% transchoice count %}
						    {0} There are no apples|{1} There is one apple|]1,Inf] There are %count% apples
						{% endtranschoice %}
					#}
					<optgroup label="+{{ i - 1 }} {{ 'octave'|trans }}{{ (i > 1) ? 's' }}">
	{% for note in accoustic_scale %}
						<option value="{{ note }}{{ i }}"{% if app.user.highest_note == note ~ i %} selected="selected"{% endif %}>{{ note|notation(current_notation) }}</option>
	{% endfor %}
					</optgroup>
{% endfor %}
				</select>
			</span>
		</p>

		<a name="book"></a>
		<h3>{% trans %}Which songbook do you want to transpose?{% endtrans %}</h3>

		<select name="book">
		{% for id, book in app.books %}
			<option value="{{ id }}"{% if default_book == book.locale %} selected="selected"{% endif %}>{{ book.lang_name }} ({{ book.details}})</option>
		{% endfor %}
		</select>

		<p class="center margintop">
			<button type="submit" value="sent" class="bigbutton">{% trans %}We are ready!{% endtrans %}</button>
		</p>
	</form>
{% endblock %}