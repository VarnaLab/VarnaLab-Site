Feature: Managing Pages
  In order to be able to present useful content to the site users
  As an admin
  I want to be able to create, update and delete pages

  Scenario: Creating a page
    When I start creating a page
    And I submit the following page:
      | Name    | About Us   |
      | Content | We are ... |
    Then we should have the following page:
      | Name    | About Us   |
      | Content | We are ... |

  Scenario: Try to create a blank page
    When I start creating a page
    And I submit a blank page
    Then I should see error messages

  Scenario: Creating a sub page
    Given a page "About us" exists
    When I start creating a subpage of "About us"
    And I submit the following page:
      | Name    | Contacts |
      | Content | This is  |
   Then we should have "Contacts" page as a subpage of "About us"

  Scenario: Editing a page
    Given a page "About us" exists
    When I start editing the "About us" page
    And I submit the following page:
      | Content | This is ... |
    Then we should have the following page:
      | Name    | About us    |
      | Content | This is ... |

  Scenario: Deleting a page
    Given a page "About us" exists
    When I delete the "About us" page
    Then we should have no pages

  Scenario: Browsing sub-pages
    Given "Menu > About us > Contact" page hierarchy exists
    And I am on the admin pages page
    When I follow "Menu"
    And I follow "About us"
    Then I should see "Contact"
    And I should be able to edit and add subpages to "About us"
    But I should not be able to see the content of "About us"

  Scenario: Browsing page without subpages
    Given a page "About Us" exists
    When I go to the "About Us" admin page
    Then I should be able to see the content of "About Us"

  Scenario: Toggling page visibility
    Given a page "About us" exists
    When I mark the "About us" page as invisible
    Then the "About us" page should be invisible