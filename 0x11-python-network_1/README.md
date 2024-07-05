HOWTO Fetch Internet Resources Using The urllib Package
Author:
Michael Foord

Introduction
Related Articles

You may also find useful the following article on fetching web resources with Python:

Basic Authentication

A tutorial on Basic Authentication, with examples in Python.

urllib.request is a Python module for fetching URLs (Uniform Resource Locators). It offers a very simple interface, in the form of the urlopen function. This is capable of fetching URLs using a variety of different protocols. It also offers a slightly more complex interface for handling common situations - like basic authentication, cookies, proxies and so on. These are provided by objects called handlers and openers.

urllib.request supports fetching URLs for many “URL schemes” (identified by the string before the ":" in URL - for example "ftp" is the URL scheme of "ftp://python.org/") using their associated network protocols (e.g. FTP, HTTP). This tutorial focuses on the most common case, HTTP.

For straightforward situations urlopen is very easy to use. But as soon as you encounter errors or non-trivial cases when opening HTTP URLs, you will need some understanding of the HyperText Transfer Protocol. The most comprehensive and authoritative reference to HTTP is RFC 2616. This is a technical document and not intended to be easy to read. This HOWTO aims to illustrate using urllib, with enough detail about HTTP to help you through. It is not intended to replace the urllib.request docs, but is supplementary to them.

Fetching URLs
The simplest way to use urllib.request is as follows:

import urllib.request
with urllib.request.urlopen('http://python.org/') as response:
   html = response.read()
If you wish to retrieve a resource via URL and store it in a temporary location, you can do so via the shutil.copyfileobj() and tempfile.NamedTemporaryFile() functions:

import shutil
import tempfile
import urllib.request

with urllib.request.urlopen('http://python.org/') as response:
    with tempfile.NamedTemporaryFile(delete=False) as tmp_file:
        shutil.copyfileobj(response, tmp_file)

with open(tmp_file.name) as html:
    pass
Many uses of urllib will be that simple (note that instead of an ‘http:’ URL we could have used a URL starting with ‘ftp:’, ‘file:’, etc.). However, it’s the purpose of this tutorial to explain the more complicated cases, concentrating on HTTP.
