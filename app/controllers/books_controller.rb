class BooksController < ApiController
  include Wor::Paginate

  def index
    render_paginated Book, each_serializer: BookSerializer
  end

  def show
    @book = Book.find(params[:id])
    render json: @book, each_serializer: BookSerializer
  end
end
