class ApiController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!

  def serialize_errors(model_instance)
    render json: { errors: model_instance.errors }
  end
end
