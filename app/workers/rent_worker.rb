require 'sidekiq-scheduler'

class RentWorker
  include Sidekiq::Worker

  def perform
    Rent.find_each do |rent|
      RentMailer.rent_period_end(rent.id).deliver_later if rent.expired?
    end
  end
end
