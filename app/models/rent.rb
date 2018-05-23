class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user, :book, :from, :to, presence: true

  def self.from(user)
    where(user: user)
  end
end
