<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
{% for url in urls %}
   <url>
      <loc>{{ url.loc }}</loc>
      <priority>{{ url.priority }}</priority>
      <changefreq>{{ url.changefreq }}</changefreq>
      <lastmod>{{ url.lastmod }}</lastmod>
   </url>
{% endfor %}
</urlset>