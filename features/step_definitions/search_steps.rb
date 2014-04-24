Given(/^the current time is (\d+):(\d+)$/) do |hour, minute|
  t = Time.zone.local(2014, 3, 14, hour, minute, 0)
  Timecop.travel t
end

When(/^I go to the homepage$/) do
  visit root_path
end

When(/^I choose "(.*?)"$/) do |option|
  check option
end

When(/^I click on "(.*?)"$/) do |target|
  click_on target
end

Then(/^I should see (\d+) places?$/) do |count|
  page.should have_css ".place", :count => count
end

Then(/^the first place should be "(.*?)"$/) do |name|
  first(".place").should have_content(name)
end

Then(/^I (should|should not) see "(.*?)"$/) do |modifier, text|
  page.send modifier.sub(" ", "_"), have_content(text)
end
