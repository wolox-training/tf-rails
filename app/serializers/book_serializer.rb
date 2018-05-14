class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :image, :publisher, :year, :genre, :created_at, :updated_at

  def index
    @books = Book.all
    render json: @books, each_serializer: BookSerializer
  end

  def show
    @book = Book.find(params[:id])
    render json: @book, serializer: BookSerializer
  end
end
