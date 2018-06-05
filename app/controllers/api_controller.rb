class ApiController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!
  before_action :set_locale

  def serialize_errors(model_instance)
    render json: { errors: model_instance.errors }, status: :unprocessable_entity
  end

  def set_locale
    I18n.locale = current_user.try(:locale) || I18n.default_locale
  end
end
