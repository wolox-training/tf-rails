class ApiController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!

  def serializeError(modelInstance)
    render json: { errors: modelInstance.errors }
  end
end
