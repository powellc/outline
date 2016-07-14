from django.conf import settings
from django.conf.urls import include, url
from django.views.generic import TemplateView

from django.contrib import admin
admin.autodiscover()

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^accounts/', include('allauth.urls')),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url("^$",
        TemplateView.as_view(template_name='homepage.html'),
        name="homepage")
]

if settings.DEBUG:
    import debug_toolbar
    urlpatterns.append(
        url(r'^__debug__/', include(debug_toolbar.urls)),
    )
