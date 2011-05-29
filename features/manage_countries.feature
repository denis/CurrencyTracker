Feature: Manage countries
  In order to manage his travel itinerary
  As an user of application
  Mr. Smart wants to manage the countries he has visited.

  Background:
    Given I am a new, authenticated user

  Scenario: List Countries
    Given the following countries exist:
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
    Given I am on a country page
    When I press "Visit"
    Then I should see "Status: Visited"

  Scenario: Visit multiple countries from the list
    Given the following countries exist:
      |name|code|
      |CountryOne|c1|
      |CountryTwo|c2|
      |CountryThree|c3|
      |CountryFour|c4|
      |CountryFive|c5|
    And I am on the countries page
    When I check "country_codes_c1"
    When I check "country_codes_c3"
    And I check "country_codes_c5"
    And press "Visit"
    Then I should see the following table:
      |Name|Code|Status|
      |CountryOne|c1|Visited|
      |CountryTwo|c2|Not Visited|
      |CountryThree|c3|Visited|
      |CountryFour|c4|Not Visited|
      |CountryFive|c5|Visited|
