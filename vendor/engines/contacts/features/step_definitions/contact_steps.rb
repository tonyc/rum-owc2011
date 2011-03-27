Given /^I have no contacts$/ do
  Contact.delete_all
end

Given /^I (only )?have contacts titled "?([^\"]*)"?$/ do |only, titles|
  Contact.delete_all if only
  titles.split(', ').each do |title|
    Contact.create(:last_name => title)
  end
end

Then /^I should have ([0-9]+) contacts?$/ do |count|
  Contact.count.should == count.to_i
end
