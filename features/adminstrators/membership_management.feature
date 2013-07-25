Feature: Memberships Management
	In order to report on memberships made
	an administrator
	must be able to manage the memberships stored in the application

	Scenario: An administrator creates a new membership
		Given I am signed in as a user with administrator rights
		And at least one year record exists
		And at least one organisation record exists
		And at least one membership type record exists
		And at least one scout type record exists
		When I visit the new membership page
		And I enter the details for a new membership
		And I click the create membership button
		Then I should see a successful creation message
		And I should see the new membership

	Scenario: An administrator deletes a membership
		Given I am signed in as a user with administrator rights
		And there is an membership I wish to delete
		When I visit the memberships admin page
		And I click the destroy button for the record I wish to delete
		Then I should see the memberships admin page
		And I should not see the membership that I deleted

	Scenario: An administrator changes the details for a membership
		Given I am signed in as a user with administrator rights
		And there is an membership I wish to change
		When I visit the memberships admin page
		And I click the edit button for the record I wish to change
		And I enter the new details for the membership
		And I click the update membership button
		Then I should see a successful update message
		And I should see the updated membership