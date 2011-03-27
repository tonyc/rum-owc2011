Feature: Home Navigation
  In order to manage recipient campaigns
  admins
  want to manage the list of recipients
 
  Scenario: Viewing campaign page
    Given an active campaign named "Billy"
    When I go to the campaigns page
    Then I should see "Billy"
    When I go to the payments page
    Then I should see "Billy"

  Scenario: Inactive participants do not appear on the campaign page
    Given an inactive campaign named "Jones"
    When I go to the campaigns page
    Then I should not see "Jones"
    When I go to the payments page
    Then I should not see "Jones"
    
    
