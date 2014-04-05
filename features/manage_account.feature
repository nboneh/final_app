Feature: Manage a user account with different controls

    As an existing user 
    I should be able to alter my account to change my password my quotes
    my interests, my pictures, and my friendships 

    Background: users have been added to database 

        Given the following users exist:
            | first_name     | last_name | email        | password     |
            |  User          | one       | testing1@test.com      | password     |
            |  User          | two       | testing2@test.com      | password     |
            |  User          | three     | testing3@test.com      | password     |
            |  User          | four      | testing4@test.com      | password     |
            |  User          | five      | testing5@test.com      | password     |
            |  User          | six       | testing6@test.com      | password     |
            |  User          | seven     | testing7@test.com      | password     |
            |  User          | eight     | testing8@test.com      | password     |
            |  User          | nine      | testing9@test.com      | password     |
            |  User          | ten       | testing10@test.com     | password     |

        And I am logged in as User one
        And I am on the newsfeed page

    Scenario: Changing my password
        When I follow "Profile Preferences"
        And I follow "Change password" 
        Then I should be on "change password page"
        And I should see "enter current password"
        And I should see "enter new password" 
        And I should see "reenter new password"
