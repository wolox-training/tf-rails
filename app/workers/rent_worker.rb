class RentWorker
  include Sidekiq::Worker

  def perform(rent_id)
    @rent = Rent.find(rent_id)
    RentMailer.rent_period_end(rent_id).deliver_later if !@rent.nil? && @rent.to >= Time.zone.today
  end
end
