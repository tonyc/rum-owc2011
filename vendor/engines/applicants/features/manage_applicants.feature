@applicants
Feature: Applicants
  In order to have applicants on my website
  As an administrator
  I want to manage applicants

  Background:
    Given I am a logged in refinery user
    And I have no applicants

  @applicants-list @list
  Scenario: Applicants List
   Given I have applicants titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of applicants
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @applicants-valid @valid
  Scenario: Create Valid Applicant
    When I go to the list of applicants
    And I follow "Add New Applicant"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 applicant

  @applicants-invalid @invalid
  Scenario: Create Invalid Applicant (without name)
    When I go to the list of applicants
    And I follow "Add New Applicant"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 applicants

  @applicants-edit @edit
  Scenario: Edit Existing Applicant
    Given I have applicants titled "A name"
    When I go to the list of applicants
    And I follow "Edit this applicant" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of applicants
    And I should not see "A name"

  @applicants-duplicate @duplicate
  Scenario: Create Duplicate Applicant
    Given I only have applicants titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of applicants
    And I follow "Add New Applicant"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 applicants

  @applicants-delete @delete
  Scenario: Delete Applicant
    Given I only have applicants titled UniqueTitleOne
    When I go to the list of applicants
    And I follow "Remove this applicant forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 applicants
 