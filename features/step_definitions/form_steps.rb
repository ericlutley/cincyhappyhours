When(/^I fill in "(.*?)" for "(.*?)"$/) do |text, input|
  fill_in input, :with => text
end

When(/^I select "(.*?)" for "(.*?)"$/) do |option, input|
  select option, from: input
end
