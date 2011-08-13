Feature: Browsing pages
  In order to find out what is happening with VarnaLab
  As a user
  I want to be able to browse and read pages

  Scenario: Reading a page
    Given a page "Contacts" with "We are..." content exists
    And I am on the root page
    When I follow "Contacts"
    Then I should see "Contacts"
    And I should see "We are.."

  Scenario: Hidden pages
    Given a hidden page "Top Secret" exists
    When I go to the "Top Secret" page
    Then I should not find this page
    And I should not see "Top Secret"

  Scenario: Browsing sub-pages
    Given "About us > Contacts" page hierarchy exists
    And I am on the root page
    When I follow "About us"
    And I follow "Contacts"
    Then I should be on the "Contacts" page

