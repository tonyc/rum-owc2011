require File.join(Rails.root.to_s, "test", "blueprints")
#Seed the DB
Fixtures.reset_cache
fixtures_folder = File.join(Rails.root.to_s, 'spec', 'fixtures')
fixtures = Dir[File.join(fixtures_folder, '*.yml')].map {|f| File.basename(f, '.yml') }
Fixtures.create_fixtures(fixtures_folder, fixtures)

Cucumber::Rails::World.use_transactional_fixtures = true
# How to clean your database when transactions are turned off. See
# http://github.com/bmabey/database_cleaner for more info.
if defined?(ActiveRecord::Base)
  begin
    require 'database_cleaner'
    DatabaseCleaner.strategy = :truncation
  rescue LoadError => ignore_if_database_cleaner_not_present
  end
end

Before do
  # ActiveRecord::Base.delete_sql("delete from recipients")
  # DatabaseCleaner.clean
end