Feature: BankSimple Sign-in
  As a user with bad credentials
  I want to try to log in to Simple
  So that I can check if the login feature fails correctly 

Scenario: Sign in to Simple with bad credentials
    Given I am on the Simple sign in page
    When I sign in with username "tomservo"
    And I sign in with password "pumaMan2"
    Then I should see the message "Your username and passphrase"
