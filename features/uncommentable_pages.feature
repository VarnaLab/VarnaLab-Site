Feature: Uncommentable pages
  In order to prevent commenting on certain pages
  As a admin
  I want to have uncommentable pages

  Scenario: Mark page as uncommentable
    Given a page "About us" exists
    When I start editing the "About us" page
    And I uncheck "Can have comments?"
    And I submit the page
    Then "About us" page should not be commentable

  Scenario: Trying to comment on uncommentable page
    Given a page "About us" exists
    And this page is uncommentable
    When I go to the "About us" page
    Then I should not be able to comment on this page




