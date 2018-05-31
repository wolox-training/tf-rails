class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user, :book, :from, :to, presence: true

  attr_accessor :expir_email_sent

  @expir_email_sent = false

  def self.from(user)
    where(user: user)
  end

  def to=(new_date)
    @expired = false unless new_date < Time.zone.today
    super(new_date)
  end

  def expired?
    @expired = to < Time.zone.today if @expired.nil?
    @expired
  end
end
