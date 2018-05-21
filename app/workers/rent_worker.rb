require 'sidekiq-scheduler'

class RentWorker
  include Sidekiq::Worker

  def perform
    Rent.all do |rent|
      RentMailer.rent_period_end(rent.id).deliver_later if rent.to >= Time.zone.today
    end
  end
end
