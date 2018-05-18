class RentsController < ApplicationController
  include Wor::Paginate

  def create
    @rent = Rent.create(rent_create_params)
    render json: @rent, each_serializer: RentSerializer
  end

  def index
    render_paginated Rent, each_serializer: RentSerializer
  end

  private

  def rent_create_params
    params.require(:rent).permit(:user_id, :book_id, :from, :to)
  end
end
