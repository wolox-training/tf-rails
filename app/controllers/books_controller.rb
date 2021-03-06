class BooksController < ApiController
  include Wor::Paginate
  before_action :authenticate_user!

  def index
    render_paginated Book, each_serializer: BookSerializer
  end

  def show
    @book = Book.find(params[:id])
    render json: @book, each_serializer: BookSerializer
  end
end
