@omniauth @javascript
Feature: Add place
  In order to make the listings more useful
  As someone in Cincinnati
  I want to add a new place to the website

  Scenario: Add place
    Given I am signed in as an admin
    When I go to the homepage
    And I click on "Add a place"
    And I fill in "Via Vite" for "Name"
    And I fill in "520 Vine St, Cincinnati, OH" for "Address"
    And I click on "Create Place"
    And I click on "Add Special"
    And I select "Tuesday" for "Start day"
    And I select "Thursday" for "End day"
    And I fill in "1/2 off cocktails" for "Details"
    And I click on "Create Special"
    Then I should see "Via Vite"
    And I should see "Tuesday through Thursday"
    And I should see "3:00 to 6:00"
    And I should see "1/2 off cocktails"
