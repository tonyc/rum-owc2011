Prerequisites
=============

* rvm (http://rvm.beginrescueend.com/)
* homebrew (https://github.com/mxcl/homebrew)
* postgresql (installed from brew: <tt>brew install postgresql<tt>)
* Make sure postgres is running. Follow the instructions after you install postgresql, or use this handy alias for starting/stopping postgres:

<pre>
alias startpostgres='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/log/pg.log start'
alias stoppostgres='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/log/pg.log stop'
</pre>

Create the postgresql user and databases
========================================

<pre>
$ createuser owc
Shall the new role be a superuser? (y/n) n
Shall the new role be allowed to create databases? (y/n) y
Shall the new role be allowed to create more new roles? (y/n) n

$ createdb -U owc owc_development
$ createdb -U owc owc_test
</pre>

* <code>cp config/database.yml.postgresql config/database.yml</code>
* Edit this file, leave the password field blank and change "user" to "owc"

Gems/etc
========

* Make sure you have a separate gemset created, and make sure bundler and rake are included. This can be either directly in the gemset, or in your "global" gemset
* <code>bundle install</code>
* <code>rake db:migrate</code>
* <code>rake db:seed</code> (optional) 

At this point you should be able to do "rails server" from the project directory and run.
