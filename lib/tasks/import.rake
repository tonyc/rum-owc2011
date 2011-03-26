require 'rake'
require 'csv'
require 'contact_import'

desc 'import contact library'
task "m4i:import_contacts", :loc do |t,args|
  loc = args[:loc]
  raise "Must supply path to CSV file as :loc argument" unless args[:loc]
  importer = ContactImporter.new
  added_contacts = importer.import(loc)
  puts "Imported #{added_contacts.size} contacts"
end  
task "m4i:import_contacts" => :environment
