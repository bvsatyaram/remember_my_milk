Feature: Tasks
  In order remeber things
  As a organized person
  I want to save tasks to do

  @javascript
  Scenario: Add a Task
    Given I am logged in
    And I am in home page
    Then I should see "My Tasks"
    When I enter "Remember Milk" in task input
    And I press "Add Task"
    Then I should see "Remember Milk" in tasks list
    When I go to home page
    Then I should see "Remember Milk"
    And I should not see "Plan for the date"
    When I enter "Plan for the date" in task input
    And I press "Add Task"
    Then I should see "Plan for the date" in tasks list
