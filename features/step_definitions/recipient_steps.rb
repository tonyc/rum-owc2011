Given /^an (active|inactive) campaign named "(.*)"$/ do |status,name|
  Campaign.make!(:name => name, :active => (status == "active"))
end
