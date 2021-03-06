Feature: Allow valid users to login with the correct password

As a user so that I can use the full functionality of the site I want to be
able to login with a valid account and password

Background: users have been added to database 

  Given the following users exist:
  | first_name     | last_name | email          | password | password_confirmation | id |
  |  User          | one       | testing1@test.com      | password | password |  1 |
  |  User          | two       | testing2@test.com      | password | password |  2 |
  |  User          | three     | testing3@test.com      | password | password |  3 |
  |  User          | four      | testing4@test.com      | password | password |  4 |
  |  User          | five      | testing5@test.com      | password | password |  5 |
  |  User          | six       | testing6@test.com      | password | password |  6 |
  |  User          | seven     | testing7@test.com      | password | password |  7 |
  |  User          | eight     | testing8@test.com      | password | password |  8 |
  |  User          | nine      | testing9@test.com      | password | password |  9 |
  |  User          | ten       | testing10@test.com     | password | password | 10 |
  
  And the following friendships exist:
  | sender_id | receiver_id | status |
  | 1      | 2        | accepted |
  And I am logged in as "User one" with password "password"

Scenario: Create Post on wall
  When I fill in the following:
    | content | Hello! |
  And I press "Submit"
  Then I should see "Hello!"
  When I fill in the following:
     | content | Hello2! |
  And I press "Submit"
  Then I should see "Hello2!" before "Hello!"
  When I log out 
  And I log in as "User two" with password "password"
  Then I should see "Hello2!" before "Hello!"
  When I log out
  And I log in as "User three" with password "password"
  Then I should not see "Hello!"
  And I should not see "Hello2!"

Scenario: Posting on friend's profile
  When I go to User two's profile 
  And I fill in the following:
        | content | Hello! |
  And I press "Submit"
  Then I should see "Hello!"

Scenario: Not being able to post on a nonfriend profile
  When I go to User three's profile
  Then I should not see "Post Here"


  
