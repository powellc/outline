FROM ubuntu:14.04
MAINTAINER Colin Powell "colin.powell@gmail.com"
RUN apt-get -qq update
RUN apt-get install -y python-dev python-setuptools git
RUN easy_install pip
RUN pip install virtualenv
RUN pip install uwsgi
RUN virtualenv --no-site-packages /opt/ve/outline
ADD . /opt/apps/outline
ADD etc/gunicorn.conf /opt/gunicorn_outline.conf
ADD etc/run.sh /usr/local/bin/run_outline
RUN (cd /opt/apps/outline && git remote rm origin)
RUN (cd /opt/apps/outline && git remote add origin https://github.com/powellc/outline.git)
RUN (cd /opt/apps/outline && python setup.py install)
EXPOSE 30321
CMD ["/bin/sh", "-e", "/usr/local/bin/run_outline"]
