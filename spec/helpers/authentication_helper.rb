module AuthenticationHelper
  def login(user)
    request.headers.merge!(user.create_new_auth_token)
  end
end
