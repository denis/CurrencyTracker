Feature: Manage countries
  In order to manage his travel itinerary
  As an user of application
  Mr. Smart wants to manage the countries he has visited.
  
  Scenario: List Countries
    Given I am a new, authenticated user
    And the following countries exist:
      |name|code|
      |CountryOne|c1|
      |CountryTwo|c2|
      |CountryThree|c3|
      |CountryFour|c4|
      |CountryFive|c5|
    And "CountryFour" is visited
    And "CountryFive" is visited
    And I am on the countries page
    Then I should see the following table:
      |Name|Code|Status|
      |CountryOne|c1|Not Visited|
      |CountryTwo|c2|Not Visited|
      |CountryThree|c3|Not Visited|
      |CountryFour|c4|Visited|
      |CountryFive|c5|Visited|

  Scenario: Visit Country
    Given I am a new, authenticated user
    And I am on a country page
    When I press "Visit"
    Then I should see "Status: Visited"