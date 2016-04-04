Increment Blog
==============

## Overview

This is platform for my own Blog

Based on Cenobith Starter Kit (https://github.com/Cenobith/starterkit)
Deployed as my blog - http://amikhaylin.herokuapp.com/

Features:

* Pages - shows dynamic menu items to custom pages
* Widgets - shows HTML or images or images with links

## Database creation

Change database name in database.yml and run: rake db:create db.migrate

## Configuration

* Change application name (config.title) in config/application.rb 
* Change logo pictures (logo.png, logo_small.png) in app/assets/images
* Set 'gmail_username' and 'gmail_password' environment variables for deliver comment notifications over Gmail

Sign up for new users is disabled. For enable it uncomment 'registerable' in app/models/user.rb 




