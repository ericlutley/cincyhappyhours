Given(/^a bar named "(.*?)"$/) do |name|
  @place = FactoryGirl.create :place, :name => name
end

Given(/^the bar has "(.*?)" from (\d+:\d+) until (\d+:\d+)$/) do |details, start_time, end_time|
  @place.specials.create :details => details, :starts_at => start_time, :ends_at => end_time
end

When(/^I go to the bar's page$/) do
  visit place_path(@place)
end
