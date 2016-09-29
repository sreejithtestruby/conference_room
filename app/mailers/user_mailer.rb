class UserMailer < ActionMailer::Base
  default from: 'sreejithtestruby@gmail.com'
  # UserMailer.welcome_email(user)
  
  # UserMailer.delay.welcome_email(user) ######SideKiq Method####
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/'
    mail(to: @user.email, subject:"Welcome To Room Booking")
  end

end
