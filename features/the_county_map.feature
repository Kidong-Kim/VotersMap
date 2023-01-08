Feature: Display county map

Background: Home page
  Given all data  
  And I am on the home page
  Then I should see "National Map"

Scenario: County 
  When I click on the state "KS"
  Then I should see "Counties in Kansas"
  When I click on the county "Barton County"
  Then I should see "Laura Kelly"
  And I should see "David Toland"
