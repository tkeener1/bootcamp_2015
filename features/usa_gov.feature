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


  Scenario: Card 5.2 Max Answers per page is 20
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


  Scenario Outline: Testing for search functionality acceptance
    When I submit a search "<search>"
    Then I see "<see>" search result(s)

  Examples:  Passes
    | search                      | see        |
    | health                      | at least 1 |
    | 401k                        | at least 1 |
    | ?<>',?[]}{=-)/\|(*&^%$#`~{} | at least 1 |
    | healthy                     | 20         |


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



#| adfaefad&^%$#`~{}           | Sorry, no results found for 'adfaefad&^%$#`~{}'. Try entering fewer or broader query terms. |



# Scenario Outline: Submit a Search Outline
#    Given I am on the USA.gov site
#    When I submit a search "<search>"
#    Then "<search>" search is displayed
#
#  Examples:
#    | search                                                |
#    | health                                                |
#    | healthy                                               |
#    | When I test to see if it accepts fifty 1 characters53 |
#    | 401k                                                  |
#    | ?<>',?[]}{=-)/\|(*&^%$#`~{}                           |
#    | adfaefad&^%$#`~{}                                     |



#    acceptance criteria
#
#
#
#    acceptance criteria
#    given i am on the page
#    then i see the search field associated with the search
#    when i type text into the search field then i see the text i type
#
#
#    When
#    And I type text into the search field
#    When i enter text over 50 characters
#    Then my text is truncated at 50 characters
#
#    When I enter a query with alpha number and special characters
#    And I submit a search
#    Then the search will execute
#
#    When i enter a query that will return a query with more than 20 results
#    Then i will have a page that returns 20 results
#
#   What happens when no results r returned**********************!*!**!*!*!*!*!*!
#   Then I see an indication of no results were found
#         /^result/
#   text field value, for character


















