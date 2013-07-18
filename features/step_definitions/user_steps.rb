# Given
Given "I do not exist as a registered user" do
  create_visitor
  delete_user
end

Given "I exist as a registered user" do
  create_user
end

# When
When /^I sign in$/ do
  sign_in
end

When /^I sign in with an incorrect password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

When /^I sign in with an incorrect email address$/ do
  @visitor = @visitor.merge(:email => "wrongpass")
  sign_in
end

# Then
Then "I should see an invalid credentials message" do
  page.should have_content "Invalid email or password."
end
      
Then "I should see a successful sign in message" do
  page.should have_content "Signed in successfully."
end

Then "I should be signed in" do
  page.should have_content "Logout"
  page.should_not have_content "Login"
end

Then "I should not be signed in" do
  page.should have_content "Login"
  page.should_not have_content "Logout"
end
