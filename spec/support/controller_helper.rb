module ControllerHelper

  def mock_user(stubs={})
    @mock_user ||= double(User, stubs).as_null_object
  end

  def sign_in
    request.env['warden'] = double(Warden, :authenticate => mock_user, :authenticate! => mock_user)
  end

  def build_attributes(*args)
    FactoryGirl.build(*args).attributes.delete_if do |k, v| 
      ["id", "created_at", "updated_at", "ancestry"].member?(k)
    end
  end

end