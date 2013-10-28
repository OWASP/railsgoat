## Getting Started ##
#### With Ruby, Rubygems, Git, and Bundler installed ####

	git clone https://github.com/OWASP/railsgoat.git

	cd railsgoat

	rvm use 2.0.0@railsgoat --create # https://rvm.io/

	bundle

	rake db:setup

	rails s

	open http://0.0.0.0:3000

	Start hacking!!!

### Running Capybara Tests ###

RailsGoat now includes a set of _failing_ Capybara RSpecs, each one indicating a separate vulnerability exists
in the application.

To run them, though, you'll first need to [install PhantomJS](https://github.com/jonleighton/poltergeist#installing-phantomjs),
which is required by the Poltergeist Capybara driver. Then just rake:

  rake training

NOTE: As vulnerabilities are fixed in the application, these specs won't change from to passing but to _pending_.

### Developer Note ###

As changes are made to the application, the Capybara RSpecs can be used to verify the vulnerabilities
in the application are still intact. To use them in this way, and have them _pass_ instead of fail,
set the `RAILSGOAT_MAINTAINER` environment variable.

<p/>
Conversion to the OWASP Top 10, 2013 is under way. 

You can view progress within the top-10-2013 branch.

    git fetch origin
    git checkout top-10-2013
Then proceed with browsing the site as normal :thumbsup:
<hr/>

### Build Info ###

[![Code Climate](https://codeclimate.com/github/OWASP/railsgoat.png)](https://codeclimate.com/github/OWASP/railsgoat)

[![Build Status](https://travis-ci.org/OWASP/railsgoat.png?branch=master)](https://travis-ci.org/OWASP/railsgoat)

### License Stuff ###

The MIT License (MIT)

Copyright (c) 2013  The Open Web Application Security Project

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

<hr/>
