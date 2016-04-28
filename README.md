jupy2wp
=======

Publish a Jupyter notebook on a wordpress site using xmlrpc.

This tool, formerly known as [ipy2wp](https://github.com/Pybonacci/ipy2wp), 
allows you to publish a Jupyter notebook from the command line or from the notebook 
itself on a wordpress site using xmlrpc.

Installation
============

Download the repo

    cd jupy2wp
    pip install .

Usage
=====

There are two ways to use this tool:

From the command line
---------------------

    python -m jupy2wp.jupy2wp [options]

You have the following options:

* --xmlrpc-url: The url to xmlrpc.php on your site
* --user: The user who will publish the post
* --password: The password of the user who will publish the post
* --nb: the path to the Jupyter notebook
* --title: The title of the post
* --categories: The categories for the post (the categories should be defined previously in the blog)
* --tags: tags for the post
* --template: The template to be used. If no template is provided then the basic Jupyter notebook html template is used. [See the templates section for more info](https://github.com/Pybonacci/jupy2wp#templates).

A complete example would be:

    python -m jupy2wp --xmlrpc-url http://pybonacci.org/xmlrpc.php --user kiko --password 1_2_oh_my_god!!! --nb 'dummy.ipynb' --title 'The best post ever' --categories articles tutorials --tags strawberry lucy jupyter --template basicx

* It works on Jupyter 4.0+  and Python 2.7+ and 3.3+*

Notebook inline images
======================

If there are inline images in your notebook, them will be converted and uploaded to your wordpress blog ('wp-content/uploads') and the html code will be changed to link to the uploaded images.

Result
======

The result will be a draft on your wordpress site. Please, check the draft before you publish the post as some advanced functionality could not be solved satisfactorily. If you find something wrong, please, open an issue.

Templates
=========

Right now you can choose between the **basic** and the **basicx** templates. 

* The **basic** template is that used by nbconvert.
* The **basicx** template is similar to the **basic** template but it eliminates the input and output prompt numbers, most of the css classes and injects some css code to highlight the code cells as in the notebook.

If you want to provide new templates just send a PR or open an issue describing your needs.

License
=======

MIT, do whatever you want with it.
