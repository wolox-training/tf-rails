class RentsController < ApiController
  before_action :authenticate_user!

  include Wor::Paginate

  def create
    @rent = Rent.new(rent_create_params)
    if @rent.save
      render json: @rent, each_serializer: RentSerializer
    else
      serializeError(@rent)
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
end
