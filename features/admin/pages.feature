Feature: Managing Pages
  In order to be able to present useful content to the site users
  As an admin
  I want to be able to create, update and delete pages

  Scenario: Creating a page
    When I create a page:
      | Name    | About Us   |
      | Content | We are ... |
    Then we should have the following page:
      | Name    | About Us   |
      | Content | We are ... |

  Scenario: Try to create a blank page
    When I try to create a blank page
    Then I should see error messages

  Scenario: Editing a page
    Given a page "About us" exits
    When I update the "About us" page with:
      | Content | This is ... |
    Then we should have the following page:
      | Name    | About us    |
      | Content | This is ... |

  Scenario: Deleting a page
    Given a page "About us" exits
    When I delete the "About us" page
    Then we should have no pages

  Scenario: Creating a sub page
    Given a page "About us" exits
    When I start creating a subpage of "About us"
    And I submit a the following page:
      | Name    | Contacts |
      | Content | This is  |
   Then we should have "Contacts" page as a subpage of "About us"
