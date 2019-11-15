require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: '/Users/flatironschool/Desktop/Ruby, coding/Taylor_wiktionary/db/development.db')
require_all '/Users/flatironschool/Desktop/Ruby, coding/Taylor_wiktionary/lib'
# require 'db/dictionary.json'
ActiveRecord::Base.logger = nil
