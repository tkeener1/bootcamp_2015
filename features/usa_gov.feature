Feature: USA.gov

  Background:
    Given I am on the USA.gov home page


  Scenario: Card 5 Search section exists
    Then I see a search field
    And the field value is "Search the Government..."
    And the search button label is "Search"

  Scenario: Card 5.1 Enter Search
    When I submit a search "health"
    Then I see "at least 1" search result(s)


<<<<<<< HEAD
  Scenario: Card 5.2 Max Answers per page is 20
=======
  Scenario: Card 5.2 Max answers per page is 20
>>>>>>> card9
    When I submit a search "healthy"
    Then I see "20" search result(s)

  Scenario: Card 5.3 Character boundary (50 Max)
    When I submit a search "When I test to see if it accepts fifty 1 characters53"
    Then my text is truncated at 50 characters


  Scenario: Card 5.4  Alphanumeric are accepted
    When I submit a search "401k"
    Then I see "at least 1" search result(s)

  Scenario: Card 5.5 Special characters are accepted
    When I submit a search "?<>',?[]}{=-)/\|(*&^%$#`~{}"
    Then I see "at least 1" search result(s)

  Scenario: Card 5.6 No results provides helpful message
    When I submit a search "adfaefad&^%$#`~{}"
    Then "Sorry, no results found for 'adfaefad&^%$#`~{}'. Try entering fewer or broader query terms." is displayed


<<<<<<< HEAD
  Scenario Outline: Testing for search functionality acceptance
=======
  Scenario Outline: Testing Search Field Alphanumeric and Special Character Acceptance
>>>>>>> card9
    When I submit a search "<search>"
    Then I see "<see>" search result(s)

  Examples:  Passes
    | search                      | see        |
    | health                      | at least 1 |
    | 401k                        | at least 1 |
    | ?<>',?[]}{=-)/\|(*&^%$#`~{} | at least 1 |
    | healthy                     | 20         |


<<<<<<< HEAD
  Scenario Outline:Fail Testing for search functionality acceptance
  #Given I am on the USA.gov site   (in hook)
    When I submit a search "<search>"
    Then I see "<see>" search result(s)

  Examples:  Fails
    | search                      | see       |
    | health                      | a least 1 |
    | 401k                        | t least 1 |
    | ?<>',?[]}{=-)/\|(*&^%$#`~{} | at least  |
    | healthy                     | 2         |


=======
  Scenario Outline: Fail Testing Search Field Alphanumeric and Special Character Acceptance
    When I submit a search "<search>"
    Then I see "<see>" search result(s)
>>>>>>> card9

  Examples:
    | search                      | see         |
    | health                      | least 1     |
    |                             | at least 1  |
    | ?<>',?[]}{=-)/\|(*&^%$#`~{} | at least 21 |
    | healthy                     | 21          |















