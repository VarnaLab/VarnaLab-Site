Feature: Comments Pages
  In order to be able to communicate with the site audience
  As an admin
  I want to be able read, manage and reply to comments

  Scenario: Hiding comments
    Given a visitor have posted a comment "This is B******t"
    When I go to the admin comments page
    And I hide the comment
    Then the comment should be hidden

  Scenario: Restoring hidden comments
    Given a visitor have posted a comment "I like this"
    And the comment was hidden
    When I go to the hidden admin comments page
    And I show the comment
    Then the comment should be visible

  Scenario: Reviewing new comments
    Given a visitor have posted a comment "I like this"
    And another visitor have posted a comment "This is B******t"
    When I go to the admin comments page
    And I approve the comment "I like this"
    And I hide the comment "This is B******t"
    Then "I like this" comment should be visible
    And "This is B******t" comment should be hidden
    And there should be no unreviewed comments

  Scenario: Browsing page comments
    Given a page "Big news" exists
    And a visitor comments on it with "This is great news"
    And I am on the admin pages page
    When I follow "Big news"
    And I follow "Visible comments - 1"
    Then I should see "This is great news"


