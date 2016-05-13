install:
	virtualenv -p /usr/bin/python3 venv
	venv/bin/python setup.py install
	venv/bin/python manage.py migrate --noinput


deps:
	sudo apt-get install libtiff5-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python-tk 
	npm install bower
	

deps_mac:
	brew install libtiff libjpeg webp little-cms2


test:
	rm -rf .tox
	detox

clean:
	rm -rf venv

run:
	venv/bin/python manage.py runserver_plus 0.0.0.0:45000

rename:
	find . -maxdepth 1 -type f \( ! -iname "Makefile" \) -print0 | xargs -0 sed -i '' 's/outline/$(name)/g'
	find outline -maxdepth 1 -type f -print0 | xargs -0 sed -i '' 's/outline/$(name)/g'
	mv outline/manage_outline.py outline/manage_$(name).py
	mv outline $(name)
	echo "Great, you're all set! Well, you'll probably want to adjust the setup file by hand a bit."

tag-release:
	sed -i "/__version__/c\__version__ = '$(v)'" outline/__init__.py
	git add outline/__init__.py && git commit -m "Automated version bump to $(v)" && git push
	git tag -a release/$(v) -m "Automated release of $(v) via Makefile" && git push origin --tags

package:
	rm -rf build
	python setup.py clean
	python setup.py build sdist bdist_wheel

distribute:
	twine upload -s dist/outline-$(v)*

release:
	$(MAKE) tag-release
	$(MAKE) package
	$(MAKE) distribute
