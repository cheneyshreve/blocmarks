class UserMailer < ApplicationMailer
  default from: "shedevsnow@gmail.com"
  layout 'mailer'

  def new_record_notification(record)
    @record = record
    mail to: "cheney.shreve@gmail.com", subject: "Email for mailgun sent from Blocmarks!"
  end

end
