require 'sidekiq-scheduler'

class RentWorker
  include Sidekiq::Worker

  def perform
    Rent.find_each do |rent|
      RentMailer.rent_period_end(rent.id).deliver_later if rent.expired? && !rent.expir_email_sent
    end
  end
end
