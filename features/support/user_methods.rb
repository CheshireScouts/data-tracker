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