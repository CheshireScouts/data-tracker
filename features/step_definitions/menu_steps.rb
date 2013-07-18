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

Then /^The administration menu should include an option to manage (.*)$/ do |menu_item|
	menu_item = menu_item.tr(" ", "_")
	menu_items = {
		users: users_path,
		organisations: organisations_path,
		organisation_types: organisation_types_path,
		membership_records: memberships_path,
		scout_types: scout_types_path,
		membership_types: membership_types_path,
		award_records: awards_path,
		award_types: award_types_path,
		years: years_path,
		census_formats: census_formats_path,
		census_table_formats: census_table_formats_path
	}
	page.should have_link menu_item, href: menu_items[menu_item.to_sym]
end

Then /^I should not see the administration menu$/ do
  page.should_not have_link "Admin"
end

Then /^I should see a menu item to show my account details$/ do
  page.should have_link "My Account", href: edit_user_registration_path
end

Then /^I should see a menu item to access the reports$/ do
	page.should have_link "Reports"
end

Then /^I should see an account updated message$/ do
	page.should have_content "You updated your account successfully"
end

