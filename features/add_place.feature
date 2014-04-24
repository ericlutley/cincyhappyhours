@omniauth
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
    Then I should see "Via Vite"
