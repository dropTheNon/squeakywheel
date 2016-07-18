class UserMailer < ApplicationMailer
  default from: 'squeakywheel@home.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def send_mail_on_complaint_creation(complaint)
    @complaint = Complaint.last
    mail(to: 'ivarr5@gmail.com', subject: 'Complaint Created')
  end

  def password_reset(user)
    @user = user
    mail(to: user.email, subject: 'Password Reset')
  end
end
