class UserMailer < ApplicationMailer
  default from: "shedevsnow@gmail.com"
  layout 'mailer'

  def welcome_email
    @user = params[:user]
    @url  = 'https://fierce-peak-50187.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def new_record_notification(record)
    @record = record
    mail to: "shedevsnow@gmail.com", subject: "Email for mailgun sent from Blocmarks!"
  end

end
