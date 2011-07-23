Feature: Managing Pages
  In order to be able to present useful content to the site users
  As an admin
  I want to be able to create, update and delete pages

  Scenario: Creating a page
    When I create a page:
      | Title   | About Us   |
      | Content | We are ... |
    Then we should have the following page:
      | Title   | About Us   |
      | Content | We are ... |

  Scenario: Editing a page
    Given a page "About us" exits
    When I update the "About us" page with:
      | Content | This is ... |
    Then we should have the following page:
      | Title   | About us    |
      | Content | This is ... |
