Feature: User Registration
  As a user
  I want to register my account
  So that I can access the application

  Scenario: Successful Registration
    Given I am on the Registration Screen
    When I enter my first name as "<first_name>"
    And I enter my last name as "<last_name>"
    And I enter my mobile number as "<mobile_number>"
    And I enter my room number as "<room_number>"
    And I enter my email address as "<email>"
    And I enter my password as "<password>"
    And I tap on the Register button
    Then I should be redirected to the Login Screen

  Scenario: Registration with Missing Information
    Given I am on the Registration Screen
    When I leave the first name field empty
    And I leave the last name field empty
    And I leave the mobile number field empty
    And I leave the room number field empty
    And I enter an invalid email address
    And I enter my password as "<password>"
    And I tap on the Register button
    Then I should see an error message for the first name field
    And I should see an error message for the last name field
    And I should see an error message for the mobile number field
    And I should see an error message for the room number field
    And I should see an error message for the email field

  Scenario: Registration with Existing Email
    Given I am on the Registration Screen
    When I enter my first name as "<first_name>"
    And I enter my last name as "<last_name>"
    And I enter my mobile number as "<mobile_number>"
    And I enter my room number as "<room_number>"
    And I enter an existing email address
    And I enter my password as "<password>"
    And I tap on the Register button
    Then I should see an alert box with an error message

