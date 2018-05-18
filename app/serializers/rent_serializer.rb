class RentSerializer < ActiveModel::Serializer
  attributes :id, :from, :to
  belongs_to :book, serializer: BookSerializer
  belongs_to :user
end
