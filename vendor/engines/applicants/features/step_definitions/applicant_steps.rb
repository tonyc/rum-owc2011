Given /^I have no applicants$/ do
  Applicant.delete_all
end

Given /^I (only )?have applicants titled "?([^\"]*)"?$/ do |only, titles|
  Applicant.delete_all if only
  titles.split(', ').each do |title|
    Applicant.create(:name => title)
  end
end

Then /^I should have ([0-9]+) applicants?$/ do |count|
  Applicant.count.should == count.to_i
end
