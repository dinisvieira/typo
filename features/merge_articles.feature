Feature: Merge Articles
  As an administrator
  In order to joint article of two different articles content of the same topic
  I want to be able to merge two articles

  Background: Setup the blog, and insert two articles
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles are published:
      | title            | body_and_extended    | excerpt     |
      | first article    | 1º Corpo             | 1º sumario  |
      | second article   | 2º Corpo             | 2º sumário  |
    And I am on the first article edit page


  Scenario: I should see the merge articles form in the article edit page
    Then I should see the merge article's form

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I submit the merge article's form with second article id
    And I am on the first article show page
    Then I should see "1º Corpo"
    And I should see "2º Corpo"




