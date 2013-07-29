
When /^I click the account details menu item$/ do
	visit edit_user_registration_url
end

When /^I change my account details$/ do
	fill_in "user_name", with: "newname"
	fill_in "user_current_password", with: @visitor[:password]
	click_button "Update"
end

Then /^I should see the administration menu$/ do
  page.should have_link "Admin"
end

Then /^The administration menu should include an item to manage (.*)$/ do |menu_item|
	menu_item = menu_item.tr(" ", "_")
	menu_items = {
		users: users_url,
		organisations: organisations_url,
		organisation_types: organisation_types_url,
		membership_records: memberships_url,
		scout_types: scout_types_url,
		membership_types: membership_types_url,
		award_records: awards_url,
		award_types: award_types_url,
		years: years_url,
		census_formats: census_formats_url,
		census_table_formats: census_table_formats_url
	}
	click_link(menu_item)
	current_url.should eq(menu_items[menu_item.to_sym])
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

