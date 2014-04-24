@javascript
Feature: Search
  In order to get a good deal on drinks
  As someone in Cincinnati
  I want to see all the happy hours that are currently happening

  Scenario: One current happy hour
    Given a bar named "Nicholson's exists"
    And the bar has "$3 draughts" from 15:00 until 19:00
    And the current time is 17:30
    When I go to the homepage
    And I choose "Open now"
    Then I should see 1 place
    And the first place should be "Nicholson's"

  Scenario: I only see the specials that are currently available
    Given a bar named "Nicholson's exists"
    And the bar has "$3 draughts" from 15:00 until 19:00
    And the bar has "1/2 off appetizers" from 21:00 until 00:00
    And the current time is 17:30
    When I go to the homepage
    And I choose "Open now"
    Then I should see 1 place
    And the first place should be "Nicholson's"
    And I should see "$3 draughts"
    And I should not see "1/2 off appetizers"
