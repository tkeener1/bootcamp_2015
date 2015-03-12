Feature: USA.gov
  Acceptance Criteria:
  The user to navigate to a new savings bond calculator on the treasury site-
  from the usa.gov home page

  The new link on the usa.gov site will be on the 'Savings and Investing' page

  The link at the treasury site will be on the individual 'Tools' page


  Background:
    Given I am on the USA.gov home page


  Scenario: Card 5 Search section exists
    Then I see a search field
    And the field value is "Search the Government..."
    And the search button label is "Search"

  Scenario: Card 5.1 Enter Search
    When I submit a search "health"
    Then I see "at least 1" search result(s)

  Scenario: Card 5.2 Max answers per page is 20
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


  Scenario Outline: Testing Search Field Alphanumeric and Special Character Acceptance

    When I submit a search "<search>"
    Then I see "<see>" search result(s)

  Examples:  Passes
    | search                      | see        |
    | health                      | at least 1 |
    | 401k                        | at least 1 |
    | ?<>',?[]}{=-)/\|(*&^%$#`~{} | at least 1 |
    | healthy                     | 20         |


  Scenario Outline: Fail Testing Search Field Alphanumeric and Special Character Acceptance
    When I submit a search "<search>"
    Then I see "<see>" search result(s)

  Examples:
    | search                      | see         |
    | health                      | least 1     |
    |                             | at least 1  |
    | ?<>',?[]}{=-)/\|(*&^%$#`~{} | at least 21 |
    | healthy                     | 21          |


# Card10*********************************************************

  Scenario: Verify the contents section exists
    Then I see a contents section
    And the box title contains the text "Content"
    And there is a link for each page section

#Card11 **************************************************************

  Scenario: navigate to Savings Bonds Calculator from home page
    And I click the "Unclaimed Money, Taxes, and Credit Reports" link
    And I click the "Saving and Investing" link
    And I click the "Savings Bonds Online" link
    And I click the "Savings Bonds Calculator" link
    Then I am on the "Savings Bond" page