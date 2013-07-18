When /^I click the account details menu item$/ do
	visit edit_user_registration_path
end

When /^I change my account details$/ do
	fill_in "user_name", with: "newname"
	fill_in "user_current_password", with: @visitor[:password]
	click_button "Update"
end

Then /^I should see the administration menu$/ do
  page.should have_link "Admin"
end

Then /^I should not see the administration menu$/ do
  page.should_not have_link "Admin"
end

Then /^I should see a menu item to show my account details$/ do
  page.should have_link "My Account", edit_user_registration_path
end

Then /^I should see an account updated message$/ do
	page.should have_content "You updated your account successfully"
end