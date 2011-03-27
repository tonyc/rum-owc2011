Given /^I have no campaigns$/ do
  Campaign.delete_all
end

Given /^I (only )?have campaigns titled "?([^\"]*)"?$/ do |only, titles|
  Campaign.delete_all if only
  titles.split(', ').each do |title|
    Campaign.create(:name => title)
  end
end

Then /^I should have ([0-9]+) campaigns?$/ do |count|
  Campaign.count.should == count.to_i
end
