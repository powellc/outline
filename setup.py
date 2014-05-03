from setuptools import setup, find_packages
from setuptools.command.test import test as TestCommand
import sys

version = __import__('outline').__version__

install_requires = [
    'setuptools',
    'south==0.8.2',
    'Django==1.6.4',
    'django-configurations==0.8',
    'dj-database-url==0.3.0',
    'pylibmc==1.3.0',
    'boto==2.9.5',
    'django-storages==1.1.8',
    'Pillow==2.0.0',
    'django-cache-url==0.8.0',
    'werkzeug==0.9.4',
    'gunicorn==0.17.4',
    'easy-thumbnails==1.2',
    'django-debug-toolbar==1.1',
    'django-extensions==1.3.4',
    'django-braces==1.4.0',
    'django-allauth==0.16.1',
    'django-floppyforms==1.1.1',
    'django-zurb-foundation==5.1.1',
    'django-custom-user==0.4',
]


class Tox(TestCommand):
    def finalize_options(self):
        TestCommand.finalize_options(self)
        self.test_args = []
        self.test_suite = True

    def run_tests(self):
        #import here, cause outside the eggs aren't loaded
        import tox
        errno = tox.cmdline(self.test_args)
        sys.exit(errno)

setup(
    name="outline",
    version=version,
    url='http://github.com/powellc/outline',
    license='BSD',
    platforms=['OS Independent'],
    description="An outline for django applications.",
    author="Colin Powell",
    author_email='colin.powell@gmail.com',
    packages=find_packages(),
    install_requires=install_requires,
    include_package_data=True,
    zip_safe=False,
    tests_require=['tox'],
    cmdclass={'test': Tox},
    classifiers=[
        'Development Status :: 4 - Beta',
        'Framework :: Django',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: BSD License',
        'Operating System :: OS Independent',
        'Programming Language :: Python',
        'Topic :: Internet :: WWW/HTTP',
        'Topic :: Internet :: WWW/HTTP :: Dynamic Content',
    ],
    package_dir={
        'outline': 'outline',
        'outline/templates': 'outline/templates',
    },
    entry_points={
        'console_scripts': [
            'outline = outline.manage_outline:main',
        ],
    },
)
