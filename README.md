# GS Basic App Generator #

This Generator is a simple project just to get you started with a rails project with some basic customizations that I like.

## Run ##
Just type `rails new app_name -m app_template.rb --skip-test-unit -d mysql` and it will create a rails app for you with my preferences.


## Basic Usage ##
The **app_template.rb** is the app generator that this project is based. Open it, read it and change whatever you want from the templated and make them your preferences.

## What I have included ##

- Rspec, Factory Girl, Capybara, pry, letter opener, database_cleaner, bullet and all the gems that I like for testing and a basic configuration from spec_helper.rb
- simplecov (simplecov is running automatically after guard, it creates a coverage folder with information about your coverage testing)
- rails best practices, just type `rails_best_practices -f html .` and open from the root folder the html that has been generated to inform you about better coding practices
- Two rake tasks that I have borrowed from GS CMS, one for testing unused images and the other for finding big files in a git repo.
- Some nicer html error pages (404, 422, 500)