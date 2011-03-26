Given /^I have no payments$/ do
  Payment.delete_all
end

Given /^I (only )?have payments titled "?([^\"]*)"?$/ do |only, titles|
  Payment.delete_all if only
  titles.split(', ').each do |title|
    Payment.create(:transaction_id => title)
  end
end

Then /^I should have ([0-9]+) payments?$/ do |count|
  Payment.count.should == count.to_i
end
