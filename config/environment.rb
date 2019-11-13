require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all '/Users/flatironschool/Desktop/Ruby, coding/ruby-project-guidelines-seattle-web-102819/lib'
# require 'db/dictionary.json'
