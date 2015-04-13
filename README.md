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
