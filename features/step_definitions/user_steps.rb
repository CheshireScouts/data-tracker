def create_visitor
  @visitor ||= FactoryGirl.attributes_for(:user)
end

def find_user
  @user ||= User.where(:email => @visitor[:email]).first
end

def delete_user
  find_user
  @user.destroy unless @user.nil?
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, @visitor)
end

def sign_in
  visit new_user_session_path
  fill_in "Email", with: @visitor[:email]
  fill_in "Password", with: @visitor[:password]
  click_button "Sign in"
end

# Given
Given "I do not exist as a registered user" do
  create_visitor
  delete_user
end

Given "I exist as a registered user" do
  create_user
end

# When
When "I sign in" do
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
