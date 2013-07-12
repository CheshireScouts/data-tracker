module ControllerHelper

  def mock_user(stubs={})
    @mock_user ||= double(User, stubs).as_null_object
  end

  def sign_in
    request.env['warden'] = double(Warden, :authenticate => mock_user, :authenticate! => mock_user)
  end

end