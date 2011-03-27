Given /^an (active|inactive) recipient named "(.*)"$/ do |status,name|
  Recipient.make!(:name => name, :active => (status == "active"))
end
