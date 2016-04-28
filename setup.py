try:
    from setuptools import setup, find_packages
except ImportError:
    from distutils.core import setup
import io
from os import path

here = path.abspath(path.dirname(__file__))

# Get the long description from the relevant file
with io.open(path.join(here, 'README.md'), encoding = 'utf-8') as f:
    long_description = f.read()

install_requires = [
    'nbconvert>=4.0.0',
    'traitlets>=4.0.0'
]

setup(
    name = 'jupy2wp',
    version = '1.0.0',
    description = 'Command line tool to create a draft post on a wordpress site from a Jupyter notebook.',
    long_description = long_description,
    url = 'https://github.com/pybonacci/jupy2wp',

    # Author details
    author = 'Kikocorreoso',
    author_email = '',

    # Choose your license
    license = 'MIT',

    # See https://pypi.python.org/pypi?%3Aaction=list_classifiers
    classifiers = [
        'Topic :: Text Processing :: Markup :: HTML',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.3',
        'Programming Language :: Python :: 3.4',
        'Programming Language :: Python :: Implementation :: PyPy',
    ],

    # What does your project relate to?
    keywords='wordpress ipython jupyter notebook',
    packages = find_packages(),
    package_data = {'': ['*.tpl']},
    install_requires = install_requires,
)
