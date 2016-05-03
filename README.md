# Students Register

This is a app to help you register all your students. It has a CRUD for student, course and enrollment(classroom)

This project uses:
 -  The 2.3.0 Ruby version.
 -  The last version of Rails(4.2.6) - I used the last version for security reasons, patches and updates
 -  Postgresql for database  

### Installing dependencies

You can install ruby with [RVM](https://rvm.io/rvm/install) and then install the correct version of Ruby:

        $ rvm install ruby-2.3.0

Install dependencies using bundler like above:

        $ bundle install

In case you don't have bundler:

        $ gem bundler install

To install the dependencies for poltergeist gem, [click here](https://github.com/teampoltergeist/poltergeist)

To install the Postgresql, [click here](https://nandovieira.com.br/configurando-ruby-rails-mysql-postgresql-git-no-ubuntu)

### Setup Database

To setup Postgresql database, run:

        $ rake db:setup

#### Automated tests with RSpec

You can run all tests using:

        $ rspec
