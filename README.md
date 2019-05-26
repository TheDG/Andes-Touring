[![RoR](https://img.shields.io/badge/RoR-6.0.0.rc1-blue.svg)]()
[![ruby](https://img.shields.io/badge/ruby-2.6.3-blue.svg)]()

# README

#### Development setup

* `touch .env` on root folder
* `bundle install`
* `yarn`
* `rake db:setup`

#### Development tips

* Fix rubocop offences automatically: `rubocop -a`
* Fix eslint offences automatically: `yarn eslint-fix`

#### Run tests

* `rake linters`
* `rake tests`

#### Mount application
* `rails s
* Open `localhost:3000` with any browser
