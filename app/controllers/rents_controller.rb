class RentsController < ApiController
  before_action :authenticate_user!
  before_action :set_locale

  include Wor::Paginate

  def create
    @rent = Rent.new(rent_create_params)
    if @rent.save
      render json: @rent, each_serializer: RentSerializer
    else
      serialize_errors(@rent)
    end
  end

  def index
    @rents = Rent.from(current_user)
    render_paginated @rents, each_serializer: RentSerializer
  end

  private

  def rent_create_params
    params.require(:rent).permit(:user_id, :book_id, :from, :to)
  end

  def set_locale
    I18n.locale = current_user.try(:locale) || I18n.default_locale
  end
end
