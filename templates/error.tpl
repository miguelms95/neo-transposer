{% extends "base.tpl" %}

{% block page_class %}error-page{% endblock %}

{% block content %}

	<h1>{{ error_title }}</h1>

	<p>{{ error_description }}</p>
	
{% endblock %}