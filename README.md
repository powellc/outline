Django Outline
==============
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/powellc/outline?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![Build
Status](https://travis-ci.org/powellc/outline.svg?branch=master)](https://travis-ci.org/powellc/outline)

In the spirit of [playdoh](https://github.com/mozilla/playdoh), this project
aims to provide a base Django app full of best-practices and pre-installed
applications.

It also includes a rudimentary makefile that helps get things started and
also plays nice with setuptools. That means you can actually use the 
standard python setup method of installation, giving you a command line
tool to run the server.

All production settings should be handled via the environment, which
means you can leave the app installed in your python library and just
use the cli tool. More exmaples of this to follow.

Start your engines, err projects!
---------------------------------

Your first order of business is to rename some things. Unless your project
is also called outline, you'll likely want to rename things. The easiest way
to get started is:

make name="<myproject_name>" rename

That should do all the important replacements. The final step will be removing
the .git folder and initializing your own repository and lastly tweaking the
setup.py file, else you're likely to give me credit for your project and to 
provide a pretty terribly confusing description to PyPI if your project ever
lands there.

Easy bootstrapping!
-------------------

Powered by the ubiquitous Makefile ... this should be pretty easy:

1. make install
2. make run
3. open your browser to: http://127.0.0.1:45000


Libraries, libraries, libraries!
-----------------------------

Of course, we could provide a vagrant file and a provisoner and all 
that jazz. But I'd rather provide a make file for installing everything
into a venv and let you muck about with libraries. Those of you on
Linux shouldn't have too much trouble installing the requisite development
libraries below. The names are for debian-based distros, but they 
exist for all major distros. 

On Mac it may be a little tricker. Homebrew will get you quite far, but
first you have to install the bloated XCode and the CLI tools.

The libraries are:

  * libmemcached-dev
  * libfreetype6-dev
  * libjpeg-dev

