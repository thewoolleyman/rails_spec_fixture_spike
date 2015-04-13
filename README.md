# README

* This app was generated with `rails new --skip-test-unit rails_spec_fixture_spike`,
  only changes prior to initial commit were additions to .gitignore from
  https://github.com/github/gitignore/blob/master/Rails.gitignore and changing
  this readme to Markdown.

# Additional Changes

## Install Rspec

* Add `rspec-rails` to gemfile
* `bin/rails generate rspec:install`

## Generate User model and write fixtures spec

* `bin/rails generate model user name:string`
* `bin/rake db:create:all`
* `bin/rake db:migrate`
* `bin/rake db:test:prepare`
* Add spec for user:

```
  it 'has a fixture with a name' do
    user = users(:one)
    expect(user.name).to eq('MyString')
  end
```

* Enable all fixtures in `rails_helper` rspec block: `config.global_fixtures = :all`
* Ensure spec passes: `bin/rake`

## Override Fixtures Path in development (and all other) environment

* in `application.rb`

```
require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"

ENV['FIXTURES_PATH'] = "#{::Rails.root}/spec/fixtures"
```

* Load fixtures in development env: `bin/rake db:fixtures:load`
* Verify they are loaded in the development database:

```
$ bin/rails c
2.0.0-p195 :001 > User.first
  User Load (0.5ms)  SELECT  "users".* FROM "users"  ORDER BY "users"."id" ASC LIMIT 1
 => #<User id: 298486374, name: "MyString", created_at: "2015-04-13 07:08:05", updated_at: "2015-04-13 07:08:05">
```
