Feature: Comments Pages
  In order to be able to communicate with the site audience
  As an admin
  I want to be able read, manage and reply to comments

  Scenario: Hiding comments
    Given a visitor have posted a comment "I like this"
    When I go to the admin comments page
    And I hide the comment
    Then the comment should be hidden

  Scenario: Restoring hidden comments
    Given a visitor have posted a comment "I like this"
    And the comment was hidden
    When I go to the admin comments page
    And I show the comment
    Then the comment should be visible


