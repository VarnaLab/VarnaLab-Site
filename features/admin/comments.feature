Feature: Comments Pages
  In order to be able to communicate with the site audience
  As an admin
  I want to be able read, manage and reply to comments

  Scenario: Hiding comments
    Given a page "Big news" exists
    And a visitor comments on "Big news" with "That's good"
    When I go to the admin comments page
    And I hide the "That's good" comment
    Then "That's good" comment should be hidden



