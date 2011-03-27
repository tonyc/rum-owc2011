@campaigns
Feature: Campaigns
  In order to have campaigns on my website
  As an administrator
  I want to manage campaigns

  Background:
    Given I am a logged in refinery user
    And I have no campaigns

  @campaigns-list @list
  Scenario: Campaigns List
   Given I have campaigns titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of campaigns
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @campaigns-valid @valid
  Scenario: Create Valid Campaign
    When I go to the list of campaigns
    And I follow "Add New Campaign"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 campaign

  @campaigns-invalid @invalid
  Scenario: Create Invalid Campaign (without name)
    When I go to the list of campaigns
    And I follow "Add New Campaign"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 campaigns

  @campaigns-edit @edit
  Scenario: Edit Existing Campaign
    Given I have campaigns titled "A name"
    When I go to the list of campaigns
    And I follow "Edit this campaign" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of campaigns
    And I should not see "A name"

  @campaigns-duplicate @duplicate
  Scenario: Create Duplicate Campaign
    Given I only have campaigns titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of campaigns
    And I follow "Add New Campaign"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 campaigns

  @campaigns-delete @delete
  Scenario: Delete Campaign
    Given I only have campaigns titled UniqueTitleOne
    When I go to the list of campaigns
    And I follow "Remove this campaign forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 campaigns
 