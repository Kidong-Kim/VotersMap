Feature: Clicking profile pages 

  As a student studying political representative, 
  I want to access profiles of the representatives. 

Scenario: Clicking profile from Representatives Search
  Given I am on the representatives page
  When I fill in "address" with "Park County"
  And I press "Search"
  Then I should see "Jared Polis"
  When I click profile for "Jared Polis"
  Then I should see "Jared Polis"
  And I should see "ocd-division/country:us/state:co"
  Then I should see "Governor of Colorado"
  And I should see "200 East Colfax Avenue"
  Then I should see "Denver"
  And I should see "CO"
  Then I should see "80203"
  And I should see "Democratic Party"
  Then I should see "Photo"

Scenario: Clicking profile from Representatives Search
  Given I am on the representatives page
  When I fill in "address" with "Nebraska"
