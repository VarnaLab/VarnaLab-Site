Feature: Commenting a page
  In order to have communication between the site users and owners
  As a user
  I want to be able to comment on pages

  Scenario: Commenting on a page
    Given a page "Big news" exists
    When I leave "Great news" comment on "Big news" page
    Then "Big news" page should have one comment
    And I should see "Great news" comment





