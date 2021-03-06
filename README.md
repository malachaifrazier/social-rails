[![Heroku](http://heroku-badge.herokuapp.com/?app=social-rails-demo&style=flat)](https://social-rails-demo.herokuapp.com)
[ ![Codeship Status for malachaifrazier/social-rails](https://app.codeship.com/projects/5b3f69b0-bcf0-0134-71bb-4ec7667e0bdc/status?branch=master)](https://app.codeship.com/projects/195946)
[![Code Climate](https://codeclimate.com/github/malachaifrazier/social-rails/badges/gpa.svg)](https://codeclimate.com/github/malachaifrazier/social-rails)
[![Issue Count](https://codeclimate.com/github/malachaifrazier/social-rails/badges/issue_count.svg)](https://codeclimate.com/github/malachaifrazier/social-rails)

Do you want to see it in action? Here is a working version deployed to heroku [http://social-railsapp.herokuapp.com](http://social-railsapp.herokuapp.com)

## social-rails
Forked from the awesome [socify](https://github.com/sudharti/socify).
social-rails is an open source social networking platform written in Ruby on Rails. Here is the blog post that started this project: [How to build a social network using Rails](https://medium.com/@sudharshanmuralidharaniyer/eb31da569233).

### Some of what are we using:
* [Ruby on Rails](https://github.com/rails/rails)
* [Bootstrap](https://github.com/twbs/bootstrap-sass)
* [Devise](https://github.com/plataformatec/devise)
* [Public Activity](https://github.com/chaps-io/public_activity)
* [Pry Rails](https://github.com/rweng/pry-rails)
* [Rspec Rails](https://github.com/rspec/rspec-rails)
* [PostgreSQL](https://rubygems.org/gems/pg/versions/0.18.4)


### Getting started:

To set it up on your local machine here is what you need to do. Install Ruby & Rails. Clone this repo using the following command:

```
git clone https://github.com/malachaifrazier/social-rails
cd social-rails
```
Then resolve dependencies using bundler:

```
bundle install
```

Run Migrations:

```
bundle exec rake db:setup --trace
```

Run Specs:

```
bundle exec rspec
```

Run Rails locally:

```
bundle exec rails s
```

### Populate Mock data
To test the app with mock data by running the following rake task:

```
bundle exec rake fill:data --trace
```

This will create records with values from faker & populator gems. Also here are the test user credentials:

* email: test@social-rails.com
* password: password

### Screenshots
![index](https://cloud.githubusercontent.com/assets/1825853/8845551/daa4d51c-30e5-11e5-8d65-171a06fa31e2.png)
![home](https://cloud.githubusercontent.com/assets/1825853/8845431/b5a5de74-30e4-11e5-8a80-00ebc59c2804.png)
![profile](https://cloud.githubusercontent.com/assets/1825853/8845432/b5a61718-30e4-11e5-8b1f-ecd401404c31.png)
![post](https://cloud.githubusercontent.com/assets/1825853/8845433/b5a5fe86-30e4-11e5-9ebf-312e00153768.png)
![find_friends](https://cloud.githubusercontent.com/assets/1825853/8845434/b5a657d2-30e4-11e5-807d-1045e754b02d.png)


### Pull Requests

* Fork this repo
* Make changes to code & cover your changes with test coverage!
* Send Pull Request

### Issues
If you find any issue with the app please do raise an issue here https://github.com/malachaifrazier/social-rails/issues

### License
This project is Licensed under the [GNU GPL V2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html). See  [LICENSE](https://github.com/sudharti/social-rails/blob/master/LICENSE) for more info.
