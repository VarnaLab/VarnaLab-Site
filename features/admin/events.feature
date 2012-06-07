Feature: Managing Events
  In order to be able to present events to the site users
  As an admin
  I want to be able to create, update and delete events

  Scenario: Creating an event
    When I start creating an event
    And I submit the following event:
      | Title         | Party   |
      | Date and Time | 22/02/2012|
      | Place         | Varnalab Пенчо Славейков 50|
      | Description   | Come with friend |
    Then we should have the following event:
      | Title         | Party   |
      | Date and Time | 22/02/2012|
      | Place         | Varnalab Пенчо Славейков 50|
      | Description   | Come with friend |

  Scenario: Try to create a blank event
    When I start creating an event
    And I submit a blank event
    Then I should see some error messages

  Scenario: Editing an event
    Given an event "Party" exists
    When I start editing the "Party" event
    And I submit the following event:
      | Date and Time | 22/07/2012|
      | Description   | Come with friend and beer |
    Then we should have the following event:
      | Title         | Party    |
      | Date and Time | 22/07/2012|
      | Place         | Varnalab Пенчо Славейков 50|
      | Description   | Come with friend and beer |

  Scenario: Deleting an event
    Given an event "Party" exists
    When I delete the "Party" event
    Then we should have no events

  Scenario: Browsing event 
    Given an event "Party" exists
    When I go to the "Party" admin event
    Then I am logged in as "asd@asd.asd" with password "asdasd"
    And I should be able to see the place of "Party"