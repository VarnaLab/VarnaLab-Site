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

