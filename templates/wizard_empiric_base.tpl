{% extends "base.tpl" %}

{% block page_class %}wizard-empiric{% endblock %}

{% block content %}

	<h1>{% block title %}{% endblock %}</h1>

	<div class="test-area">

		<p class="instructions">{% block instructions %}{% endblock %}</p>

		<div class="pre-song">
			<h5>{{ song_title}}</h5>
			<strong class="capo blink">{{ song_capo }}</strong>
			<br><br>
			{{ song|raw }}
		</div>

		<form class="answer" method="post" action="{{ app.request.getRequestUri }}" id="form-answer">
			<h3>{% trans %}Could you sing it?{% endtrans %}</h3>

			{% block answer_buttons %}{% endblock %}
		</form>
	</div>

	{% block messages %}{% endblock %}

	{% import 'base.tpl' as self %}
	{{ self.loadJsFramework() }}

	{% block js %}{% endblock %}

{% endblock %}