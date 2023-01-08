
Feature: search for movies by director

  As a movie buff
  So that I can find movies with my favorite director
  I want to include and search on director information in movies I enter

Background: representatives in database

 
Scenario: if rep exists
  Given I am on the search page 
  And I fill in "address" with "California"
  And I press "Search"
  Then I should see "Joseph R. Biden"

Scenario: login
  Given I am on the login page
  And I press "Sign in with Google"
  Then I should see "National Map"
  Given I am on the profile page
Scenario: county check
  Given I am on the California page

Scenario: check click
  Given I am on the home page

Scenario: news
  Given I am on the search page 
  And I fill in "address" with "California"
  And I press "Search"
  Then I should see "News Articles"
Scenario: news
  Given I am on the search page 
  And I fill in "address" with "Alameda County"
  And I press "Search"
  Then I should see "News Articles"
 

Scenario: events
  Given I am on the events page
  And I follow "Add New Event"
  Given I am on the events2 page

Scenario: events
  Given I am on the events page
  And I follow "Reset Filters"

Scenario:
  Given I am on the search page 
  And I fill in "address" with "California"
  And I press "Search"
  And I click view for "Joseph R. Biden"
  Then I should see "Table of News Items for Joseph R. Biden"
  And I follow "Add News Article"