class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  verifies :from, :to, presence: true
end
