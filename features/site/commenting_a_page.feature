Feature: Commenting a page
  In order to have communication between the site users and owners
  As a user
  I want to be able to comment on pages

  Scenario: Commenting on a page
    Given a page "Big news" exists
    When I leave "Great news" comment on "Big news" page
    Then "Big news" page should have one comment
    And I should see "Great news" comment

  Scenario: Try to submit invalid comment
    Given a page "Big news" exists
    When I try to leave blank comment on "Big news" page
    Then I should see error messages
    And "Big news" page should have no comments