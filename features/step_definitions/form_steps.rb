When(/^I fill in "(.*?)" for "(.*?)"$/) do |text, input|
  fill_in input, :with => text
end
