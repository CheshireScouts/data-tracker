Given /^there is (a|an) (.*) I wish to (.*)$/ do |article, class_name, action|
	class_name = class_name.tr(" ", "_")
	if class_name == 'organisation'
		root_organisation = FactoryGirl.create(:organisation)
		@test_instance = FactoryGirl.create(:organisation, parent: root_organisation)
	else
		@test_instance = FactoryGirl.create(class_name)
	end
end

Given /^at least one (.*) record exists$/ do |class_name|
	class_name = class_name.tr(" ", "_")
		FactoryGirl.create(class_name)
end

When /^I visit the new (.*) page$/ do |class_name|
	class_name = class_name.tr(" ", "_")
	visit "/#{class_name}s/new"
end

When /^I visit the (.*) admin page$/ do |class_name|
	class_name = class_name.tr(" ", "_")
	visit "/#{class_name}"
end

When /^I click the (create|update) (.*) button$/ do |action, class_name|
	click_button "#{action.capitalize} #{class_name.capitalize}"
end

When /^I click the (.*) button for the record I wish to (.*)$/ do |button_name, action|
	within "tr##{@test_instance.id}" do
		click_link button_name.capitalize
	end
end

When /^I enter the details for a new award$/ do
	year = Year.first
	organisation = Organisation.first
	award_type = AwardType.first
	scout_type = ScoutType.first
	select year[:name], from: 'award_year_id'
	select organisation[:name], from: 'award_organisation_id'
	select award_type[:name], from: 'award_award_type_id'
	select scout_type[:name], from: 'award_scout_type_id'
	fill_in 'award_award_count', with: '5'
end

When /^I enter the new details for the award$/ do
	fill_in 'award_award_count', with: '12'
end

When /^I enter the details for a new award type$/ do
	award_type = FactoryGirl.attributes_for(:award_type)
	fill_in "award_type_code", with: award_type[:code]
	fill_in "award_type_name", with: award_type[:name]
end

When /^I enter the new details for the award type$/ do
	fill_in "award_type_code", with: "NEWCODE"
	fill_in "award_type_name", with: "New Name"
end

When /^I enter the details for a new census format$/ do
	census_format = FactoryGirl.attributes_for(:census_format)
	fill_in "census_format_name", with: census_format[:name]
	fill_in "census_format_table_xpath", with: census_format[:table_xpath]
end

When /^I enter the new details for the census format$/ do
	fill_in "census_format_name", with: "New Name"
	fill_in "census_format_table_xpath", with: "New Xpath"
end

When /^I enter the details for a new census table format$/ do
	census_format = CensusFormat.first
	scout_type = ScoutType.first
	membership_type = MembershipType.first
	select census_format[:name], from: 'census_table_format_census_format_id'
	select scout_type[:name], from: 'census_table_format_scout_type_id'
	select membership_type[:name], from: 'census_table_format_membership_type_id'
	fill_in 'census_table_format_column', with: '5'
	fill_in 'census_table_format_row', with: '10'
end

When /^I enter the new details for the census table format$/ do
	fill_in 'census_table_format_column', with: '8'
	fill_in 'census_table_format_row', with: '12'
end

When /^I enter the details for a new membership$/ do
	year = Year.first
	organisation = Organisation.first
	membership_type = MembershipType.first
	scout_type = ScoutType.first
	select year[:name], from: 'membership_year_id'
	select organisation[:name], from: 'membership_organisation_id'
	select membership_type[:name], from: 'membership_membership_type_id'
	select scout_type[:name], from: 'membership_scout_type_id'
	fill_in 'membership_head_count', with: '5'
end

When /^I enter the new details for the membership$/ do
	fill_in 'membership_head_count', with: '12'
end

When /^I enter the details for a new membership type$/ do
	membership_type = FactoryGirl.attributes_for(:membership_type)
	fill_in "membership_type_code", with: membership_type[:code]
	fill_in "membership_type_name", with: membership_type[:name]
end

When /^I enter the new details for the membership type$/ do
	fill_in "membership_type_code", with: "NEWCODE"
	fill_in "membership_type_name", with: "New Name"
end

When /^I enter the details for a new organisation$/ do
	parent = Organisation.first
	organisation_type = OrganisationType.first
	select parent[:name], from: 'organisation_parent_id'
	select organisation_type[:name], from: 'organisation_organisation_type_id'
	fill_in 'organisation_name', with: 'Test organisation'
	fill_in 'organisation_registration_no', with: '12345'
	fill_in 'organisation_census_url_no', with: '12345'
	choose 'organisation_status_o'
end

When /^I enter the new details for the organisation$/ do
	fill_in 'organisation_name', with: 'Updated name'
end

When /^I enter the details for a new organisation type$/ do
	organisation_type = FactoryGirl.attributes_for(:organisation_type)
	fill_in "organisation_type_code", with: organisation_type[:code]
	fill_in "organisation_type_name", with: organisation_type[:name]
end

When /^I enter the new details for the organisation type$/ do
	fill_in "organisation_type_code", with: "NEWCODE"
	fill_in "organisation_type_name", with: "New Name"
end

When /^I enter the details for a new scout type$/ do
	scout_type = FactoryGirl.attributes_for(:scout_type)
	fill_in "scout_type_code", with: scout_type[:code]
	fill_in "scout_type_name", with: scout_type[:name]
end

When /^I enter the new details for the scout type$/ do
	fill_in "scout_type_code", with: "NEWCODE"
	fill_in "scout_type_name", with: "New Name"
end

When /^I enter the details for a new year$/ do
	year = FactoryGirl.attributes_for(:year)
	census_format = CensusFormat.first
	fill_in "year_name", with: year[:name]
	select census_format[:name], from: 'year_group_census_format_id'
	select census_format[:name], from: 'year_district_census_format_id'
	select census_format[:name], from: 'year_county_census_format_id'
end

When /^I enter the new details for the year$/ do
	fill_in "year_name", with: "New Name"
end

Then /^I should see a successful creation message$/ do
	page.should have_content "was successfully created."
end

Then /^I should see a successful update message$/ do
	page.should have_content "was successfully updated."
end

Then /^I should see the (new|updated) (.*)$/ do |status, class_name|
	page.should have_content "#{class_name.capitalize}"
end

Then /^I should see the (.*) admin page$/ do |class_name|
	page.should have_content(class_name.capitalize)
end

Then /^I should not see the (.*) that I deleted$/ do |class_name|
	page.should_not have_css("tr##{@test_instance.id}")
end