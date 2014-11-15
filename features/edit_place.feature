@omniauth @javascript
Feature: Edit place
  In order to make the listings more useful
  As someone in Cincinnati
  I want to edit an existing place on the website

  Scenario: Edit place
    Given I am signed in as an admin
    And a bar named "Via Vite"
    When I go to the bar's page
    And I click on "Add Special"
    And I select "Tuesday" for "Start day"
    And I select "Thursday" for "End day"
    And I fill in "1/2 off cocktails" for "Details"
    And I click on "Create Special"
    Then I should see "Via Vite"
    And I should see "Tuesday through Thursday"
    And I should see "3:00 to 6:00"
    And I should see "1/2 off cocktails"
