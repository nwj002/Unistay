Feature: Add Hostel
  As a user
  I want to add a hostel with its name, address, capacity, and an image
  So that I can manage and display hostels effectively

  Scenario: Successful hostel addition
    Given I am on the add hostel screen
    When I enter a valid hostel name
    And I enter a valid hostel address
    And I enter a valid hostel capacity
    And I select an image
    And I tap the "Save" button
    Then I should see a success message

  Scenario: Hostel addition with missing data
    Given I am on the add hostel screen
    When I enter a missing hostel name
    And I enter a valid hostel address
    And I enter a valid hostel capacity
    And I select an image
    And I tap the "Save" button
    Then I should see an error message indicating missing data
