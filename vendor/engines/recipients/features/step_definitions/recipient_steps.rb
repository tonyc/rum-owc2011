Given /^I have no recipients$/ do
  Recipient.delete_all
end

Given /^I (only )?have recipients titled "?([^\"]*)"?$/ do |only, titles|
  Recipient.delete_all if only
  titles.split(', ').each do |title|
    Recipient.create(:name => title)
  end
end

Then /^I should have ([0-9]+) recipients?$/ do |count|
  Recipient.count.should == count.to_i
end
