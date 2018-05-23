class RentMailer < ApplicationMailer
  default from: 'no-reply@training.wolox.com.ar'

  def rent_period_end(rent_id)
    @rent = Rent.find(rent_id)
    @user = User.find(@rent.user_id)
    mail to: @user.email, subject: 'Your rent expired today'
  end
end
