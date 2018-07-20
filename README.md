## Blocmarks
Blocmarks is an social bookmarking application that allows users to create and edit public bookmarks, search other user's bookmarks, and manage their own. Additional features include the ability to populate new topics, bookmarks, and user accounts via email, however, this functionality is currently only enabled for verified users while I develop a custom domain for the app. Please contact me if you would like to be added as a verified user.  

Visit the live version on [Heroku](https://fierce-peak-50187.herokuapp.com/).
Or check out this demo
![alt text](https://raw.githubusercontent.com/cheneyshreve/blocmarks/master/app/assets/images/bookmarks_demo.gif)

## Setup & Configuration
Languages and frameworks
- Ruby 2.5
- Rails 5.1.5

Databases:
- SQLite(Test, Development)
- PostgreSQL(Production)

Gems and other resources:
- gem 'devise' for user authentication
- gem 'pundit' for authorization
- Heroku's mailgun add-on for email confirmation and API

Local configuration:
- clone the repository

```
$ bundle install
$ rake db:create
$ rake db:migrate
$ rails server
```
navigate to localhost:3000
