# README

This README would normally document whatever steps are necessary to get the
application up and running.

### Requirements:

* Docker

### Installation:

* `docker-compose build`

### Running Locally

This process may take several minutes the first time
* `docker-compose up`

* Modify the hosts file, in order to create your test domain, for this, please add a line like this one
`127.0.0.1  ui.ts`
then save.

* (Optional) If you want to use a different domain, please go to `config/environments` and modify the line of code `config.ui_domain = 'http://ui.ts'` using the domain you want to use

* When this is done, you can open a web browser and type
[ui.ts](http://ui.ts)

* (Optional) If you want to prepopulate the DB please open a different shell tab and run the following command
`docker-compose run app bundle exec rake db:seed` 

### Information

This project is using several technologies:

* Docker
* Ruby on Rails 5.2
* Angular 5
* MongoDB 3.2
* Bootstrap for styles

The UI folder can be found in the path `ui/`