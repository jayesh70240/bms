class UserMailer < ApplicationMailer
    default from: 'booking@bookmyshow.in.com'

  def booking_confirmation(user, booking)
    @user = user
    @booking = booking
    @movie = booking.movie

    mail(to: @user.email, subject: 'Booking Confirmation')
  end
end
