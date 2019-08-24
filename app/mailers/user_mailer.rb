class UserMailer < ApplicationMailer
  def reset_password(command, id)
    @token = command.result
    @id = id
    mail(to: command.email, subject: 'Password Reset')
  end
end
