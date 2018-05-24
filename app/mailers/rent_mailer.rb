class RentMailer < ApplicationMailer
  default from: Rails.application.secrets.mailer_user

  def rent_period_end(rent_id)
    @rent = Rent.find(rent_id)
    @user = User.find(@rent.user_id)
    mail to: @user.email, subject: t(:rent_expiration_title)
  end
end
