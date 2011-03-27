@contacts
Feature: Contacts
  In order to have contacts on my website
  As an administrator
  I want to manage contacts

  Background:
    Given I am a logged in refinery user
    And I have no contacts

  @contacts-list @list
  Scenario: Contacts List
   Given I have contacts titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of contacts
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @contacts-valid @valid
  Scenario: Create Valid Contact
    When I go to the list of contacts
    And I follow "Add New Contact"
    And I fill in "Last Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 contact

  @contacts-invalid @invalid
  Scenario: Create Invalid Contact (without last_name)
    When I go to the list of contacts
    And I follow "Add New Contact"
    And I press "Save"
    Then I should see "Last Name can't be blank"
    And I should have 0 contacts

  @contacts-edit @edit
  Scenario: Edit Existing Contact
    Given I have contacts titled "A last_name"
    When I go to the list of contacts
    And I follow "Edit this contact" within ".actions"
    Then I fill in "Last Name" with "A different last_name"
    And I press "Save"
    Then I should see "'A different last_name' was successfully updated."
    And I should be on the list of contacts
    And I should not see "A last_name"

  @contacts-duplicate @duplicate
  Scenario: Create Duplicate Contact
    Given I only have contacts titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of contacts
    And I follow "Add New Contact"
    And I fill in "Last Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 contacts

  @contacts-delete @delete
  Scenario: Delete Contact
    Given I only have contacts titled UniqueTitleOne
    When I go to the list of contacts
    And I follow "Remove this contact forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 contacts
 