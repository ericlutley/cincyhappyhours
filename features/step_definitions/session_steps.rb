Given(/^I am signed in as an admin$/) do
  @user = FactoryGirl.create :admin
  visit "/auth/facebook"
end
