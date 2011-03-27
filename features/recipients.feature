Feature: Home Navigation
  In order to manage recipients
  admins
  want to manage the list of recipients
 
  Scenario: Viewing recipient page
    Given an active recipient named "Billy"
    When I go to the recipients page
    Then I should see "Billy"
    When I go to the payments page
    Then I should see "Billy"

  Scenario: Inactive participants do not appear on the recipient page
    Given an inactive recipient named "Jones"
    When I go to the recipients page
    Then I should not see "Jones"
    When I go to the payments page
    Then I should not see "Jones"
    
    
