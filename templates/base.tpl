<!doctype html>
<html class="no-js" lang="{{ app.locale }}">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>{{ page_title }}</title>
	<link rel="stylesheet" href="{{ app.request.basepath }}/static/{% if app.debug %}style{% else %}{{ app.neoconfig.css_cache }}{% endif %}.css" type="text/css" />
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
	<link rel="apple-touch-icon" href="favicon.ico">

	<meta property="og:url" content="{{ app.absoluteUriWithoutQuery }}">
	<meta property="og:title" content="{{ page_title }}">
	<meta property="og:description" content="{{ meta_description|default('Neo-Transposer automatically transposes the songs of the Neocatechumenal Way for you, so they fit your voice perfectly.'|trans) }}">
	<meta property="og:site_name" content="{{ app.neoconfig.software_name }}">
	<meta property="og:type" content="website">
	<meta property="og:image" content="{{ app.absoluteBasePath }}/static/img/mkt-{{ app.locale}}.200.jpg">

	<meta name="description" content="{{ meta_description|default('Neo-Transposer automatically transposes the songs of the Neocatechumenal Way for you, so they fit your voice perfectly.'|trans) }}" />
	{% if meta_canonical %}<link rel="canonical" href="{{ meta_canonical }}" />{% endif %}

	{% if not app.debug -%}
	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	  ga('create', '{{ app.neoconfig.analytics_id }}', 'auto');
	  ga('set','anonymizeIp', true);
	  {% if app.user.isLoggedIn -%}
	  ga('set', '&uid', '{{ app.user.id_user }}');
	  ga('set', 'dimension2', '{{ app.user.lowest_note }}');
	  ga('set', 'dimension3', '{{ app.user.highest_note }}');
	  {%- endif %}

	  ga('send', 'pageview');
	</script>
	{%- endif %}
</head>

<body class="lang-{{ app.locale }} {% block page_class %}{% endblock %}">

	{% if load_social_buttons -%}
	<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>
	{%- endif %}

	<div class="wrapper">

		<nav class="header">
			<div class="inside" itemscope itemtype="http://schema.org/Product">

				{% if current_book -%}
					<h2>
						<a itemprop="name" href="{{ path('book_' ~ (current_book ? current_book.id_book: app.user.id_book)) }}">{{ app.neoconfig.software_name }}</a>
					</h2>
				{%- else -%}
					{% if current_route == 'login' -%}
					<h1 itemprop="name">
						{{ app.neoconfig.software_name }}
						<small>{{ page_title }}</small>
					</h1>
					{% else -%}
					<h2 itemprop="name">{{ app.neoconfig.software_name }}</h2>
					{%- endif %}
				{%- endif %}

				<div itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating" class="hidden">
					Rated <span itemprop="ratingValue">4.5</span>/5 based on <span itemprop="reviewCount">28</span> reviews
				</div>

				{% block header_extra %}{% endblock %}

				{% if app.user.isLoggedIn and current_route != 'login' -%}
				<span class="user">
					<a href="{{ path('login', {_locale: app.locale}) }}">{% trans %}Log-out{% endtrans %}</a>
				</span>
				{%- endif %}

				{#· {{ app.user.lowest_note }}
				· {{ app.user.highest_note }}#}

			</div>
		</nav>

		<section class="main">

		{% if notifications.error %}
			{% for notification in notifications.error %}
			<div class="notification error">{{ notification }}</div>
			{% endfor %}
		{% endif %}
		{% if notifications.success %}
			{% for notification in notifications.success %}
			<div class="notification success">{{ notification }}</div>
			{% endfor %}
		{% endif %}

		{% block content %}{% endblock %}
		</section>

		<div class="push"></div>
	</div>

	<footer>
		<p>{% trans %}Developed in Tanzania.{% endtrans %} <a href="javascript:void(0)" onclick="go()">{%trans %}Contact{% endtrans %}</a></p>
	</footer>

	{% macro loadJsFramework() -%}
	<script src="{{ app.request.basepath }}/static/zepto.min.js"></script>
	{%- endmacro %}

	<script>
	//Un sencillo y comprensible método anti correo basura
	function go() {
		var s="el señor es mi pastor, nada me falta. En prados de fresca hierba...",
		 p=[14,4,8,17],p2=[13,25,14,34,37,56,46,29],n=parseInt(1-1);
		function join(ps){var r="";for(i in ps){r += s.substr(ps[i]-1,1);}return r;}
		alert(join(p)+n+n+String.fromCharCode(Math.pow(2,6))+'g'+join(p2));
	}
	</script>

	{% if load_social_buttons -%}
	<script src="https://apis.google.com/js/platform.js" async defer>
	  {lang: '{{ app.locale }}'}
	</script>
	{%- endif %}

</body>
</html>