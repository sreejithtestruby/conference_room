class MailerWorker
  include Sidekiq::Worker

  def perform_async(user)
  	UserMailer.welcome_email(user).deliver
  end
end