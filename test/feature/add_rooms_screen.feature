Feature: Add Rooms
  As a user
  I want to add rooms with their names and capacity
  So that I can manage and track available rooms

  Scenario: Successful room addition
    Given I am on the add rooms screen
    When I enter a valid room name
    And I enter a valid room capacity
    And I tap the "Add Room" button
    Then I should see a success message

  Scenario: Room addition with missing room name
    Given I am on the add rooms screen
    When I enter a missing room name
    And I enter a valid room capacity
    And I tap the "Add Room" button
    Then I should see an error message indicating a missing room name

  Scenario: Room addition with missing room capacity
    Given I am on the add rooms screen
    When I enter a valid room name
    And I enter a missing room capacity
    And I tap the "Add Room" button
    Then I should see an error message indicating a missing room capacity
