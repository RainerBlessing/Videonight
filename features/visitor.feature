Feature: Visitor
  In order to view the site
  As a visitor
  I want to be able to access the site

  Scenario: Page root
    Given I am a visitor
    When I enter the site's url
    Then I want to see the root page
