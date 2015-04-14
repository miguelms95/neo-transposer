{% extends "base.tpl" %}

{% block page_class %}voice-wizard{% endblock %}

{% block content %}

	<h1>{% trans %}Step 2: time to sing!{% endtrans %}</h1>

	<p>{% trans %}Now I will propose you to sing the chorus of a song in a certain tone. Take your guitar and try to sing it in that tone.{% endtrans %}</p>

	<p>{% trans %}If it is too low for you, click on “No, it's too low”. If you were able to sing it, click on “Yes”. Then, I will transpose the song so it will be a bit lower, and you should try again. We will keep repeating the exercise until you can't sing lower{% endtrans %}</p>

	<p>{% trans %}Try to do your best to sing with your lowest possible voice, since this test tries to find the limits of your voice.{% endtrans %}</p>

	<form method="post" action="{{ app.request.getRequestUri }}" class="margintop">
		<p class="center"><button type="submit" value="sent" class="btn-neutral bigbutton">{% trans %}Understood{% endtrans %}</button></p>
	</form>

{% endblock %}