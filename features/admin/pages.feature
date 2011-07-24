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
    Given a page "About us" exits
    When I start creating a subpage of "About us"
    And I submit the following page:
      | Name    | Contacts |
      | Content | This is  |
   Then we should have "Contacts" page as a subpage of "About us"

  Scenario: Editing a page
    Given a page "About us" exits
    When I start editing the "About us" page
    And I submit the following page:
      | Content | This is ... |
    Then we should have the following page:
      | Name    | About us    |
      | Content | This is ... |

  Scenario: Deleting a page
    Given a page "About us" exits
    When I delete the "About us" page
    Then we should have no pages