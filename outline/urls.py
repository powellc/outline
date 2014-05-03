from django.conf import settings
from django.conf.urls import patterns, include, url
from django.views.generic import TemplateView

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'replan.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    (r'^weeks/', include('weeks.urls')),
    (r'^clients/', include('clients.urls')),
    (r'^accounts/', include('allauth.urls')),
    (r'^', include('teammates.urls')),
    url("^$", 
        TemplateView.as_view(template_name='homepage.html'), 
        name="homepage")
)

if settings.DEBUG:
    import debug_toolbar
    urlpatterns += patterns('',
        url(r'^__debug__/', include(debug_toolbar.urls)),
    )
