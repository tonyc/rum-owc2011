@recipients @wip
Feature: Recipients
  In order to have recipients on my website
  As an administrator
  I want to manage recipients

  Background:
    Given I am a logged in refinery user
    And I have no recipients

  @recipients-list @list
  Scenario: Recipients List
   Given I have recipients titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of recipients
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @recipients-valid @valid
  Scenario: Create Valid Recipient
    When I go to the list of recipients
    And I follow "Add New Recipient"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 recipient

  @recipients-invalid @invalid
  Scenario: Create Invalid Recipient (without name)
    When I go to the list of recipients
    And I follow "Add New Recipient"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 recipients

  @recipients-edit @edit
  Scenario: Edit Existing Recipient
    Given I have recipients titled "A name"
    When I go to the list of recipients
    And I follow "Edit this recipient" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of recipients
    And I should not see "A name"

  @recipients-duplicate @duplicate
  Scenario: Create Duplicate Recipient
    Given I only have recipients titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of recipients
    And I follow "Add New Recipient"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 recipients

  @recipients-delete @delete
  Scenario: Delete Recipient
    Given I only have recipients titled UniqueTitleOne
    When I go to the list of recipients
    And I follow "Remove this recipient forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 recipients
 